# Zomato Sales Analysis

Use Zomato_Sales_Analysis;
Create Database Zomato_Sales_Analysis;
Select * from Country;
Select * from Currency;
Select * from Main;

# 1a. Find the Numbers of Resturants based on City.
Select City, Count(RestaurantID) from Main group by City;

# 1b. Find the Numbers of Resturants based on Country.
Select Countryname, Count(RestaurantID) from Main group by Countryname;

# 2a. Numbers of Resturants opening based on Year.
Select Distinct Year, Count(RestaurantID) from Main group by Year;

# 2b. Numbers of Resturants opening based on Quarter.
Select Distinct Quarter, Count(RestaurantID) from Main where Quarter is not null group by Quarter order by Quarter;

# 2c. Numbers of Resturants opening based on Month.
Select `Month Name`, Count(RestaurantID) as Restaurant_Count from `Main` group by `Month Name` order by `Month Name`;

# 3. Count of Resturants based on Average Ratings.
Select Average_Rating, Count(RestaurantID) as Restaurant_Count from Main group by Average_Rating order by Average_Rating;

# 4. Create buckets based on Average Price of reasonable size and find out how many resturants falls in each buckets.
Select Bucket_Price, Count(Distinct RestaurantID) AS Restaurant_Count from Main group by Bucket_Price order by Bucket_Price;

# 5. Percentage of Resturants based on "Has_Table_booking".
Select Has_Table_booking, Count(RestaurantID) as Restaurant_Count, 
(Count(RestaurantID) * 100.0 / (Select Count(*) from Main)) as Percentage 
from Main group by Has_Table_booking order by Has_Table_booking Desc;

# 6. Percentage of Resturants based on "Has_Online_delivery"
Select Has_Online_delivery, Count(RestaurantID) as Restaurant_Count, 
(Count(RestaurantID) * 100.0 / (Select Count(*) from Main)) as Percentage 
from Main group by Has_Online_delivery order by Has_Online_delivery Desc;

# 7. Based on Cusines, City, Ratings.
With Ranked_Cuisines as (Select City, Cuisines, Rating, Rank() Over 
(partition by City order by Rating desc) as Ranking from Main)
Select City, Cuisines, Rating
from Ranked_Cuisines where Ranking <= 10
order by City, Ranking;

