
import sqlite3
import pandas as pd


def connect_database(db_path):
    """Create and return a SQLite database connection."""
    return sqlite3.connect(db_path)


def run_query(connection, query):
    """Execute a SQL query and return the result as a DataFrame."""
    return pd.read_sql_query(query, connection)


def get_table_info(connection, table_name):
    """Return information about the columns in a SQLite table."""
    query = f"PRAGMA table_info({table_name});"
    return pd.read_sql_query(query, connection)


if __name__ == "__main__":
    print("SQL utility module loaded successfully.")
