select * from dbo.products

-- query to categorize products based on their price range
select
ProductID,
ProductName,
Price,
case 
when price < 50 then 'Low'
when price between 50 and 200 then 'Medium'
else 'High'
end as [Price Category]
from dbo.products

-- query to join dim_customers with dim_geography to enrich data with geographic information
select 
c.customerid,
c.CustomerName,
c.email,
c.gender,
c.age,
g.country,
g.city
from dbo.customers as c left join dbo.geography g on c.geographyid = g.geographyid

-- query to clean whitespace issues in the ReviewText column
select 
ReviewID,
CustomerID,
ProductID,
ReviewDate,
Rating,
replace(reviewtext,'  ',' ') as ReviewText
from dbo.customer_reviews

-- query to clean and normalize the engagement_data_table
select
EngagementID,
ContentID,
CampaignID,
ProductID,
upper(replace(ContentType, 'Socialmedia','Social Media')) as ContentType,
left(ViewsClicksCombined,CHARINDEX('-',ViewsClicksCombined) - 1) as Views,
right(ViewsClicksCombined,len(ViewsClicksCombined) - CHARINDEX('-',ViewsClicksCombined)) as Clicks,
likes,
format(convert(date,EngagementDate),'dd.MM.yyyy') as EngagementDate
from dbo.engagement_data
where ContentType != 'Newsletter'

-- cte to identify and tag duplicate records
with cte as (
select 
journeyID,
customerID,
ProductID,
VisitDate,
Stage,
Action,
Duration,
row_number() over(partition by customerID, ProductID, VisitDate, Stage, Action order by JourneyID) as row_num
from dbo.customer_journey)
select *
from cte
where row_num > 1
order by JourneyID

-- outer query selects the final clean and standardized data
select 
journeyid,
customerid,
productid,
visitdate,
stage,
action,
coalesce(duration, avg_duration) as Duration
from(
	select
	journeyid,
	customerid,
	productid,
	visitdate,
	upper(stage) as Stage,
	action,
	duration,
	avg(duration) over (partition by visitDate) as avg_duration,
	row_number() over (partition by customerid, productid, visitdate, upper(stage), action
		order by journeyid) as row_num
from dbo.customer_journey) as subquery
where row_num = 1

