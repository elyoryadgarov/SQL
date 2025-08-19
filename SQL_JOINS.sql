/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select P.Name, C.Name 
from products as P
join categories as C
on P.categoryID=C.CategoryID;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select p.Name, p.Price, r.Rating
from products as p
join reviews as r
on p.ProductID=r.ProductID
where rating =5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select sum(s.Quantity) as Quantity, concat(e.FirstName, " ", e.LastName) as FullName
from sales as s
join employees as e
on s.EmployeeID=e.EmployeeID
group by FullName
order by Quantity desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name, c.Name 
from departments as d
inner join categories as c
on c.DepartmentID=d.DepartmentID
where c.name='Appliances' or c.name='Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.name,  sum(s.Quantity) as TotalCount, sum(s.quantity*s.PricePerUnit) as TotalValue
from sales as s
join products as p
on p.ProductID=s.ProductID
where p.name='Eagles: Hotel California'
group by p.Name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
-- ------------------------------------------ Extra - May be difficult
select p.name, r.Reviewer, r.Rating, r.Comment 
from products as p
join reviews as r
on r.ProductID=p.productID
where p.name='Visio TV'
order by r.Rating
limit 1;


/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.EmployeeID, CONCAT(e.FirstName, " ", e.LastName) as Name, p.name, s.Quantity
from employees as e
inner join sales as s
on s.EmployeeID=e.EmployeeID
join products as p
on p.ProductID=s.ProductID
order by EmployeeID
