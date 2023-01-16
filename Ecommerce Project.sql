/*Business model Customer to Customer (C2C) allows customers to do business with each other. 
This model is growing fast with e-commerce platforms where sellers may be required to pay some amount and buyer can buy it without paying anything. 
E-Commerce website brings the seller and buyer to the same platform. 

Analyzing the user's database will lead to understanding the business perspective. 
Behaviour of the users can be traced in terms of business with exploration of the user’s database. */

-- Project_1-


Create new schema as ecommerce*/

CREATE DATABASE ecommerce;
SHOW databases;

-- Import .csv file users_data into MySQL
--             (right click on ecommerce schema -> Table Data import Wizard -> Give path of the file ->
--              Next -> choose options : Create a new table , select delete if exist -> next -> next)

-- Ans- Succesfully data uploaded.

--  Run SQL command to see the structure of table.
-- Ans-
Use ecommerce;
DESC project_1; # Describing the structure of Table Question 3

/* 
Selecting the fist 100 rows of the database*/
Select * From project_1 LIMIT 100;

 /*
 Selecting the count of country and language in the database*/
select count(distinct country) as Distinct_Country,count(distinct language ) as Distinct_language 
from project_1;

/*
Checking whether male  user are having more follower or female user*/
select gender,sum(socialNbFollowers) Gender_wise_Followers 
from project_1 group by gender;

#
#Total count of user using Profile Pid
Select count(type) as User_having_profile_pic  
from project_1 where hasProfilePicture="True";

#Count of User Using Application for Ecommerce Purchase
Select count(type) as User_using_App From project_1 Where hasAnyApp="True";

#Count of User using Android App for ecommerce Purchase
Select count(type) as user_using_Android_App from project_1 where hasAndroidApp="True";

#Count of User using Ios App for Ecoomerce Purchase
select count(type) as user_using_Ios_App from project_1 where hasIosApp="True";


 --  Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers. 
--            (Hint: consider only those users having at least 1 product bought.)
-- Ans-
Select country,count(productsBought) as Number_of_Buyers from project_1  where productsBought>=1 
group by country 
order by count(country) desc;

-- Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers. 
--            (Hint: consider only those users having at least 1 product sold.)
-- Ans-
Select country,count(productsSold) as Number_of_sellers from project_1  
where productsSold>=1 
group by country 
order by Number_of_sellers asc;

--  Display name of top 10 countries having maximum products pass rate.
-- Ans-
select country,max(productsPassRate) ProductsPassRate from project_1 
group by country 
order by ProductsPassRate DESC
limit 10;

-- Calculate the number of users on an ecommerce platform for different language choices.
-- Ans-
select language,count(type) as Count_of_Lang_user 
from project_1 
group by language;

--  Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform.
--              (Hint: use UNION to answer this question.)
-- Ans- 
select 'Female choice' as " ",'count' as " " union 
select 'Produts_Liked',count(socialProductsLiked) From project_1
where socialProductsLiked>=1 And gender="F"  union
select "Products_wishlisted",count(productsWished) from project_1
where productsWished>=1 and gender="F";

/* Check the choice of male users about being seller or buyer. 
(Hint: use UNION to solve this question.)
 Ans*/
select "Male_Choices" " ","Count" " " union
select  "Seller",count(productsSold) from project_1
where productssold>=1 and gender="M" union
select "Buyer",count(productsBought) from project_1
where productsBought>=1 and gender="M";

-- Question-14 Which country is having maximum number of buyers?
-- Ans- According to the result france has maximum no of buyers.
select country,count(productsBought) as Total_Buyers from project_1
group by country
order by Total_Buyers DESC; 

--  List the name of 10 countries having zero number of sellers.
-- Ans-
select country,productssold as Total_Sold from project_1 
where productssold=0 
group by country limit 10;

--  Display record of top 110 users who have used ecommerce platform recently.
-- Ans-
select identifierHash,country,gender,daysSinceLastLogin
from project_1
order by daysSinceLastLogin asc limit 110;

-- Calculate the number of female users those who have not logged in since last 100 days.
-- Ans-
select gender,count(type) as not_LoggedIn from project_1
where daysSinceLastLogin>=100 and gender="F";

--Display the number of female users of each country at ecommerce platform.
-- Ans-
select country,gender,count(type) as Female_User from project_1
where gender="F" group by country;

--  Display the number of male users of each country at ecommerce platform.
-- Ans-
select country,gender,count(type) as Male_User from project_1
where gender="M" group by country;

/*Calculate the average number of products sold and bought on ecommerce platform 
 by male users for each country-
 Ans*/
 select country,gender,avg(productsSold) as Avg_Product_sold,avg(productsBought) as Avg_product_Bought 
 from project_1
 where gender="M"
 group by country;














