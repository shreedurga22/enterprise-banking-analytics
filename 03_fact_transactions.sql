CREATE TABLE fact_transactions AS
SELECT
    account_no,
    STR_TO_DATE(txn_date, '%d-%b-%y') AS txn_date,
    STR_TO_DATE(value_date, '%d-%b-%y') AS value_date,
    CAST(withdrawal_amt AS DECIMAL(12,2)) AS withdrawal_amt,
    CAST(deposit_amt AS DECIMAL(12,2)) AS deposit_amt,
    CAST(balance_amt AS DECIMAL(12,2)) AS balance_amt,
    CASE
        WHEN CAST(withdrawal_amt AS DECIMAL(12,2)) > 0 THEN 'DEBIT'
        WHEN CAST(deposit_amt AS DECIMAL(12,2)) > 0 THEN 'CREDIT'
        ELSE 'OTHER'
    END AS txn_type
FROM staging_transactions;
