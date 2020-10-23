--Shen Han 100088024 Major Assignment 1

--Question 1 

select count (distinct ProductID) as "Number of distinct items"
from [Purchasing].[PurchaseOrderDetail];

--Question 2

select top 1 ProductID, sum (UnitPrice * (OrderQty)) as "Total Revenue"
from [Purchasing].[PurchaseOrderDetail]
GROUP BY ProductID
Order By 'Total revenue' desc;

--Question 3
 
select top 5 table1.ProductID, table2.[Name], sum (UnitPrice * (OrderQty)) as "Total Revenue"
from [Purchasing].[PurchaseOrderDetail] as table1, [Production].[Product] as table2
where table1.ProductID = table2.ProductID
GROUP BY table1.ProductID,table2.[Name]
Order By 'Total revenue' desc;

--Question 4
select count (productID)
from [Purchasing].[PurchaseOrderDetail]
where StockedQty >(select avg(StockedQty) from [Purchasing].[PurchaseOrderDetail]);

--Question 5
select ProductID, ModifiedDate
from [Sales].[SpecialOfferProduct]
where SpecialOfferID like '15';

--Question 6 
select Table1.ProductID,Table1.[Name], table2.PurchaseOrderDetailID
from[Production].[Product] as Table1, [Purchasing].[PurchaseOrderDetail] as Table2
where [Name] like '%seat Assembly%' and Table2.PurchaseOrderDetailID like null
Order by ProductID desc;

--The above query returns no results since it appears that all boxes in table 2 under purchase order detail ID has a 
--value in them.

--Question 7

-- group by year(orderdate) rather than just orderdate to somehow sum all sales in that particular year
select SalesPersonID, year(orderdate) as "Sales Year", count(SalesPersonID) as "Number of Sales"
from sales.SalesOrderHeader
where SalesPersonID is not null
group by SalesPersonID, year(OrderDate)
order by 'Sales Year' asc, 'Number of Sales' desc;


--Question 8
select top 5 ProductID, sum(StockedQty) as "Total"
from [Purchasing].[PurchaseOrderDetail]
group by ProductID
order by 'Total' desc;

--Question 9 
select distinct table1.ProductID, table1.StandardCost,  datepart (year, Table1.ModifiedDate), table2.ProductID, table2.StandardCost, table2.ModifiedDate
from[Production].[ProductCostHistory] as Table1,[Production].[Product] as Table2
where table1.ProductID = table2.ProductID

select distinct convert (varchar, table1.ModifiedDate, 111), table1.ProductID, table1.StandardCost, table2.ProductID, table2.StandardCost, convert( varchar, table2.ModifiedDate, 111)
from[Production].[ProductCostHistory] as Table1,[Production].[Product] as Table2
order by convert(varchar, table1.ModifiedDate,111) desc;
--where table1.ProductID = table2.ProductID

--Answer, Table 2, Production product is newer. 