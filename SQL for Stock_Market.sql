-- Importing Data
LOAD DATA LOCAL INFILE 'C:/Users/lenovo/Desktop/SQL CSV/synthetic_stock_data.csv'
INTO TABLE stock_data
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
IGNORE 1 ROWS;

drop table stock_data;

-- Avg Trading Volume
select Ticker,concat(format(avg(volume)/1000000,3),' M') as Avg_Trading_Volume 
from stock_data
group by Ticker
order by Avg_Trading_Volume desc;

-- Most Volatile Stocks
select Ticker,round(avg(beta),4) as Most_Volatile_Stocks
from stock_data
group by Ticker
order by Most_Volatile_Stocks desc;

-- Stocks with Highest Dividend and Lowest Dividend
select Ticker,sum(`Dividend Amount`) as Stocks_Dividend
from stock_data
group by Ticker
order by Stocks_Dividend desc;

-- Highest and Lowest P/E Ratios
SELECT Ticker,
MAX(`PE Ratio`) AS `Highest PE Ratio`,
MIN(`PE Ratio`) AS `Lowest PE Ratio`
FROM stock_data
GROUP BY Ticker
ORDER BY `Highest PE Ratio` DESC;

-- Stocks with Highest Market Cap
select Ticker,
concat(round((sum(`Market Cap`)/1000000000000),2), ' T') as Market_Cap
from stock_data
group by Ticker;

-- Stocks Near 52 Week High & Low
select Ticker,
max(`52 Week High`),
min(`52 Week High`)
from stock_data
group by Ticker;

-- Stocks with Strong Buy Signals and stocks with Strong Selling Signal












