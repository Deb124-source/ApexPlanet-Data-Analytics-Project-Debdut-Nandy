
from pathlib import Path
import argparse
import pandas as pd
import numpy as np


def run_pipeline(input_file, output_dir):
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    # 1. Load raw data
    input_file = Path(input_file)

    if input_file.suffix.lower() in [".xlsx", ".xls"]:
        df = pd.read_excel(input_file)
    elif input_file.suffix.lower() == ".csv":
        df = pd.read_csv(input_file)
    else:
        raise ValueError("Input must be an Excel or CSV file.")

    print("Original shape:", df.shape)

    # 2. Clean the dataset
    df = df.dropna(subset=["Description"])
    df = df.drop_duplicates().copy()

    df["InvoiceNo"] = df["InvoiceNo"].astype(str)
    df["StockCode"] = df["StockCode"].astype(str)

    df["InvoiceDate"] = pd.to_datetime(
        df["InvoiceDate"], errors="coerce"
    )

    df["Quantity"] = pd.to_numeric(
        df["Quantity"], errors="coerce"
    )

    df["UnitPrice"] = pd.to_numeric(
        df["UnitPrice"], errors="coerce"
    )

    df = df.dropna(
        subset=["InvoiceDate", "Quantity", "UnitPrice"]
    )

    # Remove cancelled orders and invalid transactions
    df = df[
        (~df["InvoiceNo"].str.upper().str.startswith("C"))
        & (df["Quantity"] > 0)
        & (df["UnitPrice"] > 0)
    ].copy()

    df["SalesAmount"] = (
        df["Quantity"] * df["UnitPrice"]
    )

    # IQR-based outlier filtering
    q1 = df["SalesAmount"].quantile(0.25)
    q3 = df["SalesAmount"].quantile(0.75)
    iqr = q3 - q1

    lower_bound = q1 - 1.5 * iqr
    upper_bound = q3 + 1.5 * iqr

    df = df[
        df["SalesAmount"].between(
            lower_bound, upper_bound
        )
    ].copy()

    print("Cleaned shape:", df.shape)

    # 3. Save processed dataset
    df.to_csv(
        output_dir / "online_retail_cleaned.csv",
        index=False
    )

    # 4. Calculate KPIs
    known_customers = df["CustomerID"].dropna()

    kpis = pd.DataFrame({
        "Metric": [
            "Total Revenue",
            "Total Orders",
            "Units Sold",
            "Unique Customers",
            "Average Order Value"
        ],
        "Value": [
            df["SalesAmount"].sum(),
            df["InvoiceNo"].nunique(),
            df["Quantity"].sum(),
            known_customers.nunique(),
            (
                df["SalesAmount"].sum()
                / df["InvoiceNo"].nunique()
            )
        ]
    })

    # 5. Generate business summaries
    monthly_sales = (
        df.assign(
            Month=df["InvoiceDate"].dt.to_period("M")
        )
        .groupby("Month")["SalesAmount"]
        .sum()
        .reset_index()
    )

    monthly_sales["Month"] = (
        monthly_sales["Month"].astype(str)
    )

    top_products = (
        df.groupby("Description")["SalesAmount"]
        .sum()
        .nlargest(10)
        .reset_index()
    )

    country_sales = (
        df.groupby("Country")["SalesAmount"]
        .sum()
        .sort_values(ascending=False)
        .reset_index()
    )

    # 6. Export Excel report
    excel_path = output_dir / "retail_analytics_report.xlsx"

    with pd.ExcelWriter(
        excel_path,
        engine="openpyxl"
    ) as writer:
        kpis.to_excel(
            writer,
            sheet_name="KPIs",
            index=False
        )

        monthly_sales.to_excel(
            writer,
            sheet_name="Monthly Sales",
            index=False
        )

        top_products.to_excel(
            writer,
            sheet_name="Top Products",
            index=False
        )

        country_sales.to_excel(
            writer,
            sheet_name="Country Sales",
            index=False
        )

    print("Automation completed successfully!")
    print("Excel report:", excel_path)

    return kpis


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--input",
        required=True,
        help="Path to raw Excel or CSV dataset"
    )

    parser.add_argument(
        "--output",
        default="outputs",
        help="Output directory"
    )

    args = parser.parse_args()

    run_pipeline(args.input, args.output)
