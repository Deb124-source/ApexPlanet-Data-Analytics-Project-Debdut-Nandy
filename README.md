# ApexPlanet Data Analytics Internship

### End-to-End Data Analytics | Python • SQL • Power BI • Machine Learning • GitHub Actions

A comprehensive data analytics project completed as part of the **30-Day Data Analytics Internship at ApexPlanet**. This project explores retail transaction data through data cleaning, exploratory data analysis, SQL-based business analysis, dashboard development, predictive modelling, and automated reporting.

The project demonstrates an end-to-end analytics workflow, from raw transaction data to business insights and automated report generation.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Internship Tasks](#internship-tasks)
- [Technology Stack](#technology-stack)
- [Dataset](#dataset)
- [Repository Structure](#repository-structure)
- [Key Results](#key-results)
- [Automation Workflow](#automation-workflow)
- [Installation and Setup](#installation-and-setup)
- [Running the Project](#running-the-project)
- [Key Learnings](#key-learnings)
- [Future Improvements](#future-improvements)
- [Author](#author)
- [Acknowledgements](#acknowledgements)

---

## Project Overview

The objective of this project is to analyze retail transaction data and extract meaningful business insights using data analytics tools and techniques.

The project covers five major stages:

1. Data cleaning and exploratory data analysis.
2. SQL-based data analysis and business queries.
3. Interactive visualization and dashboard development.
4. Predictive modelling and model evaluation.
5. Final reporting and workflow automation.

Each stage contributes to a complete analytics workflow that combines analytical problem-solving, visualization, predictive techniques, and reproducible reporting.

## Internship Tasks

### Task 1: Data Cleaning and Exploratory Data Analysis

**Objective:** Prepare the retail transaction dataset for analysis and identify meaningful patterns.

**Work performed:**
- Inspected the dataset's structure and statistical properties.
- Examined missing values and duplicate records.
- Handled invalid transaction values.
- Investigated outliers using the Interquartile Range (IQR) method.
- Created a `SalesAmount` feature using quantity and unit price.
- Performed statistical analysis and exploratory visualization.
- Investigated product, country, customer, and monthly sales patterns.
- Identified key findings from the exploratory analysis.

**Tools:** Python, Pandas, NumPy, Matplotlib, Seaborn.

**Output:** Cleaned data, exploratory analysis, visualizations, and business findings.

### Task 2: SQL-Based Business Analysis

**Objective:** Apply SQL to investigate retail transactions and answer business questions.

**Work performed:**
- Wrote SQL queries for data retrieval and aggregation.
- Used filtering, grouping, sorting, and aggregate functions.
- Practised subqueries and Common Table Expressions (CTEs).
- Applied window functions to analytical problems.
- Created SQL views where appropriate.
- Addressed ten business questions.
- Integrated SQL queries with Python using SQLite and SQLAlchemy.
- Retrieved query results using `pandas.read_sql()`.

**Tools:** SQL, SQLite, SQLAlchemy, Python, Pandas.

**Output:** SQL queries, business analysis, and query results.

### Task 3: Data Visualization and Dashboarding

**Objective:** Present retail data and business findings through visual analysis.

**Work performed:**
- Developed Power BI visualizations.
- Created six visuals, including donut charts.
- Explored sales and transaction patterns.
- Organized analytical visuals to support business interpretation.
- Presented important metrics and findings in dashboard form.

**Tools:** Power BI.

**Output:** Interactive dashboard and visual representation of retail analytics.

### Task 4: Advanced Analytics and Predictive Modelling

**Objective:** Apply predictive modelling techniques and evaluate model performance.

**Work performed:**
- Prepared data for modelling.
- Developed a predictive analytics workflow.
- Evaluated model performance using standard regression metrics.
- Interpreted the model's predictive performance and limitations.

**Tools:** Python, Pandas, NumPy, Scikit-learn.

**Recorded evaluation results:**

| Evaluation Metric | Result |
|---|---:|
| Mean Absolute Error (MAE) | 6,333.93 |
| Root Mean Squared Error (RMSE) | 7,868.82 |
| R² Score | 0.5060 |

The recorded R² score indicates that the model explains approximately 50.6% of the variance in the evaluated target on the corresponding evaluation dataset.

The MAE and RMSE should be interpreted in the context of the prediction target and its units.

### Task 5: Final Reporting and Automation

**Objective:** Streamline the analytics workflow and generate reports programmatically.

**Work performed:**
- Developed a Python-based analytics automation script.
- Organized project dependencies using `requirements.txt`.
- Configured a GitHub Actions workflow.
- Automated execution of the reporting process.
- Generated an Excel analytics report.
- Organized final project documentation and deliverables.

**Tools:** Python, Pandas, Git, GitHub, GitHub Actions.

**Key output:** `retail_analytics_report.xlsx`

The automation workflow helps reduce repetitive execution steps and makes the reporting process easier to reproduce.

---

## Technology Stack

| Category | Technologies |
|---|---|
| Programming Language | Python |
| Data Manipulation | Pandas, NumPy |
| Data Visualization | Matplotlib, Seaborn |
| Database and Querying | SQL, SQLite |
| Database Integration | SQLAlchemy |
| Dashboarding | Power BI |
| Predictive Analytics | Scikit-learn |
| Development Environment | Jupyter Notebook, Google Colab |
| Version Control | Git, GitHub |
| Workflow Automation | GitHub Actions |
| Reporting | Excel, PDF |

*The list reflects the technologies used across the project. Remove any technology that is not represented in your actual deliverables.*

---

## Dataset

This project uses the **Online Retail** dataset from the UCI Machine Learning Repository.

The dataset contains transactions from a UK-based online retail business and includes information such as:

- Invoice number
- Product stock code
- Product description
- Quantity purchased
- Invoice date
- Unit price
- Customer identifier
- Country

The original dataset contains approximately 541,909 transaction records.

### Dataset Source

[UCI Machine Learning Repository — Online Retail Dataset](https://archive.ics.uci.edu/dataset/352/online+retail)

### Data Preparation

The data preparation process included:
- Identifying missing and duplicate records.
- Examining invalid quantities and unit prices.
- Preparing transaction data for exploratory analysis.
- Creating derived sales values.
- Producing cleaned data for subsequent analysis.

The cleaned dataset size may vary depending on the cleaning rules applied in each notebook or script.

---

## Repository Structure

The following structure describes the intended organization of the complete project. Actual filenames may differ depending on the files committed to the repository.

```text
ApexPlanet-Data-Analytics-Project-Debdut-Nandy/
│
├── .github/
│   └── workflows/
│       └── retail_automation.yml
│
├── data/
│   ├── README.md
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── Task_1_EDA.ipynb
│   ├── Task_2_SQL_Analysis.ipynb
│   └── Task_4_Advanced_Analytics.ipynb
│
├── sql/
│   └── Task_2_Queries.sql
│
├── dashboards/
│   ├── Task_3_PowerBI_Dashboard.pbix
│   └── README.md
│
├── scripts/
│   ├── sql_utils.py
│   └── retail_automation.py
│
├── outputs/
│   └── retail_analytics_report.xlsx
│
├── reports/
│   └── Final_Internship_Report.pdf
│
├── presentation/
│   └── Final_Internship_Presentation.pptx
│
├── requirements.txt
├── .gitignore
├── LICENSE
└── README.md
```

### Folder Guide

| Folder/File | Purpose |
|---|---|
| `.github/workflows/` | GitHub Actions automation configuration |
| `data/` | Dataset documentation and data files |
| `notebooks/` | Jupyter notebooks for analysis |
| `sql/` | SQL queries used in Task 2 |
| `dashboards/` | Power BI dashboard files |
| `scripts/` | Python utilities and automation scripts |
| `outputs/` | Generated analytics outputs |
| `reports/` | Final reports |
| `presentation/` | Internship presentation |
| `requirements.txt` | Python dependencies |
| `README.md` | Project documentation |

---

## Key Results

The project covers the following analytical and technical outcomes:

- Prepared retail transaction data for analysis.
- Explored product, customer, geographical, and temporal sales patterns.
- Developed SQL queries to answer business questions.
- Created Power BI visualizations for analytical reporting.
- Evaluated a predictive model using MAE, RMSE, and R².
- Implemented a Python-based reporting workflow.
- Configured GitHub Actions for automated execution.

### Model Performance

| Metric | Value |
|---|---:|
| MAE | 6,333.93 |
| RMSE | 7,868.82 |
| R² | 0.5060 |

These values represent the recorded model evaluation results. They should be interpreted alongside the target variable, data split, and modelling methodology documented in the corresponding notebook.

---

## Automation Workflow

The project includes GitHub Actions automation for running the configured analytics reporting script.

### Workflow Overview

1. A change is pushed to the configured GitHub branch.
2. GitHub Actions checks out the repository.
3. The workflow sets up the Python environment.
4. Required dependencies are installed.
5. The analytics automation script is executed.
6. The workflow generates the configured reports.
7. Generated artifacts can be uploaded for retrieval.

### Main Components

- **Workflow configuration:** `.github/workflows/retail_automation.yml`
- **Automation script:** `scripts/retail_automation.py`
- **Dependencies:** `requirements.txt`
- **Generated report:** `outputs/retail_analytics_report.xlsx`

The exact output and trigger behavior depend on the committed workflow configuration.

---

## Installation and Setup

### Prerequisites

- Python 3.10 or a compatible version supported by your dependencies.
- Git.
- Jupyter Notebook or Google Colab for notebook-based analysis.
- Power BI Desktop to open and interact with the `.pbix` file.

### 1. Clone the Repository

```bash
git clone https://github.com/Deb124-source/ApexPlanet-Data-Analytics-Project-Debdut-Nandy.git
```

### 2. Open the Project Directory

```bash
cd ApexPlanet-Data-Analytics-Project-Debdut-Nandy
```

### 3. Create a Virtual Environment

```bash
python -m venv .venv
```

Activate it on Windows:

```bash
.venv\Scripts\activate
```

On macOS or Linux:

```bash
source .venv/bin/activate
```

### 4. Install Dependencies

```bash
pip install -r requirements.txt
```

### 5. Prepare the Dataset

Download the Online Retail dataset from the UCI Machine Learning Repository and place it at the path expected by the notebook or script.

Check `data/README.md` for dataset instructions.

---

## Running the Project

### Exploratory Data Analysis

Open the Task 1 notebook:

```text
notebooks/Task_1_EDA.ipynb
```

Execute the notebook cells in order.

### SQL Analysis

Open the Task 2 notebook:

```text
notebooks/Task_2_SQL_Analysis.ipynb
```

The standalone SQL queries are located in:

```text
sql/Task_2_Queries.sql
```

### Power BI Dashboard

Open the `.pbix` file in the `dashboards/` directory using Power BI Desktop.

### Predictive Analytics

Open:

```text
notebooks/Task_4_Advanced_Analytics.ipynb
```

Execute the cells in order after preparing the required data.

### Automated Reporting

Run the automation script from the repository root:

```bash
python scripts/retail_automation.py
```

The generated report is expected at:

```text
outputs/retail_analytics_report.xlsx
```

Confirm the paths in the script if your local directory structure differs.

---

## Key Learnings

This internship project provided practical experience with:

- Data cleaning and preprocessing.
- Exploratory data analysis and feature engineering.
- SQL queries and business-oriented problem-solving.
- Data visualization and dashboard development.
- Predictive modelling and model evaluation.
- Python scripting and report generation.
- Git-based version control.
- GitHub Actions workflow automation.
- Organizing an end-to-end analytics project.

---

## Future Improvements

Potential improvements include:

- Adding more detailed sales and customer segmentation.
- Improving predictive performance through model comparison and feature engineering.
- Expanding dashboard interactivity and KPI coverage.
- Adding automated tests for data validation.
- Improving error handling and logging in reporting scripts.
- Publishing reproducible analytical reports with documented assumptions.

---

## Author

**Debdut Nandy**

B.Tech CSE — Artificial Intelligence and Machine Learning

- GitHub: [Deb124-source](https://github.com/Deb124-source)
- LinkedIn: [Debdut Nandy](https://www.linkedin.com/in/debdut-nandy-4b0a88321/)
- Portfolio: [debdutnandy.netlify.app](https://debdutnandy.netlify.app/)

---

## Acknowledgements

This project was completed as part of the **ApexPlanet Data Analytics Internship**.

Thanks to ApexPlanet for providing the opportunity to practise data analytics, visualization, predictive modelling, and workflow automation.

Dataset: [UCI Machine Learning Repository — Online Retail](https://archive.ics.uci.edu/dataset/352/online+retail)

---

**Project Status:** Internship project documentation and deliverables.

**Release:** v1.0.0
