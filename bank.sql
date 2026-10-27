create database bank;
use bank;

-- Count total rows
select count(*) from bank.indian_banking_transactions;

-- View first 10 rows
select * from bank.indian_banking_transactions limit 10;

-- Check table structure
desc bank.indian_banking_transactions;

-- Check unique values in categorical columns
select distinct account_type from bank.indian_banking_transactions;

select distinct transaction_type from bank.indian_banking_transactions;

select distinct transaction_direction from bank.indian_banking_transactions;

select distinct transaction_status from bank.indian_banking_transactions;

select distinct channel from bank.indian_banking_transactions;

select distinct loan_type from bank.indian_banking_transactions;

select distinct kyc_status from bank.indian_banking_transactions;

select distinct merchant_category from bank.indian_banking_transactions;

select distinct state from bank.indian_banking_transactions
order by state;

-- Check date range
select min(transaction_date) as first_date, max(transaction_date) as last_date 
from bank.indian_banking_transactions ;

-- Check missing transaction times
select count(*) as total_rows, sum(transaction_time is null) as  null_times
from bank.indian_banking_transactions;

-- Check missing dates
select count(*) as total_rows, sum(transaction_date is null) as null_dates 
from bank.indian_banking_transactions ;

-- Test date conversion
select transaction_date, str_to_date(transaction_date,'%y-%m-%d') as converted_date
from bank.indian_banking_transactions 
limit 10;

-- Test date format
select str_to_date('2019-01-01', '%Y-%m-%d') as test_date;

-- Check date string length
select transaction_date, length(transaction_date) as date_length 
from bank.indian_banking_transactions 
limit 5;

-- Compare text and date values
select transaction_date, 
transaction_date='2019-01-01' as matches_text,
cast(transaction_date as date) as cast_date
from bank.indian_banking_transactions
limit 5;

-- Count invalid dates
select count(*) as individual_dates
from bank.indian_banking_transactions
where transaction_date is not null
and cast(transaction_date as date) is null;

-- Check duplicate transaction IDs
select transaction_id, count(*) as accurate_count
from bank.indian_banking_transactions 
group by transaction_id
having count(*) > 1;

-- Check missing or invalid transaction IDs
select count(*) as total_rows , 
sum(transaction_id is null) as null_transaction_id,
sum(trim(transaction_id)='')as empty_transaction_id,
sum(trim(transaction_id)='_') as hyphen_transaction_id
from bank.indian_banking_transactions;

-- *Transaction Performance by Type
select transaction_type,
count(transaction_id) as transaction_occured ,
sum(transaction_amount) as total_transaction_amount 
from bank.indian_banking_transactions 
group by transaction_type;

-- *Transaction Status Analysis
select transaction_status,
count(transaction_id) as count_transaction
from bank.indian_banking_transactions
group by transaction_status;

-- *Monthly Transaction Trends
select date_format(transaction_date,'%y-%m') as transaction_month,
sum(transaction_amount)
from bank.indian_banking_transactions
group by date_format(transaction_date,'%y-%m');

-- *State-wise Transaction Analysis
select state , sum(transaction_amount) as total_transaction_amount
from bank.indian_banking_transactions
group by state 
order by total_transaction_amount desc;

-- *High-Value Customers Count
select count(*) as high_value_customer_count
from(
select customer_id 
from bank.indian_banking_transactions
group by customer_id 
having sum(transaction_amount) >100000) as high_value_customers;


-- *High-Value Customers_Id
select customer_id , sum(transaction_amount) as total_transaction_amount
from bank.indian_banking_transactions
group by customer_id 
having total_transaction_amount >100000;

--  *Fraud Analysis
select count(is_fraud) as total_number_of_fraudulent_transactions
from bank.indian_banking_transactions
where is_fraud = 1 ;
--  4,873 fraudulent transactions out of 550,000 total transactions, which is approximately 0.89%.

-- *Fraud by Transaction Type
select transaction_type , count(is_fraud) as total_number_of_fraudulent_transactions
from bank.indian_banking_transactions
where is_fraud = 1 
group by transaction_type
order by total_number_of_fraudulent_transactions desc;

--  Transaction Success Rate
select transaction_type, count(transaction_id) as total_transactions ,  sum(
case
	when transaction_status ='Success' then 1
    else 0
end) as  successful_transactions
from bank.indian_banking_transactions
group by transaction_type;

-- Calculate the success rate separately for each transaction type
select transaction_type, round(
    sum(case 
		when transaction_status = 'Success' then 1 
        else 0 
	end) * 100.0 / count(transaction_id),
    2
) as success_rate_percentage 

from bank.indian_banking_transactions
group by transaction_type;