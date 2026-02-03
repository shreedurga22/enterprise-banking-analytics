import pandas as pd
from sqlalchemy import create_engine

# Read CSV
df = pd.read_csv("transaction.csv")
df.columns = df.columns.str.strip()

# MySQL connection
engine = create_engine(
    "mysql+mysqlconnector://root:root@127.0.0.1:3306/banking_analytics"
)

# Load into staging table
df.to_sql(
    name="staging_transactions",
    con=engine,
    if_exists="replace",
    index=False,
    chunksize=10000
)

print("Data loaded successfully")
