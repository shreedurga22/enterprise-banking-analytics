UPDATE staging_transactions
SET
    withdrawal_amt = REPLACE(withdrawal_amt, ',', ''),
    deposit_amt    = REPLACE(deposit_amt, ',', ''),
    balance_amt    = REPLACE(balance_amt, ',', '');
