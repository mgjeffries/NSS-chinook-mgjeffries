-- 1. non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

SELECT c.FirstName || ' ' || c.LastName as FullName,
c.CustomerId,
c.Country
FROM Customer c
WHERE country != "USA";

-- 2.brazil_customers.sql: Provide a query only showing the Customers from Brazil.

SELECT c.FirstName || ' ' || c.LastName as FullName
FROM Customer c
WHERE country = "Brazil";

-- 3.brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT c.FirstName || ' ' || c.LastName as FullName,
i.InvoiceId,
i.InvoiceDate,
i.BillingCountry
FROM Invoice i
    JOIN Customer c 
    ON i.CustomerId = c.CustomerId
WHERE country = "Brazil";

-- 4 sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.

SELECT * 
FROM Employee
WHERE Title LIKE '%Sales Support Agent%';

-- 5 unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.

SELECT DISTINCT BillingCountry
FROM Invoice;

-- 6 sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT e.FirstName || ' ' || e.LastName as EmployeeFullName,
i.*
FROM Invoice i
    JOIN Customer c
ON i.CustomerId = c.CustomerId
    JOIN Employee e
ON c.SupportRepId = e.EmployeeId;

-- 7 invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT e.FirstName || ' ' || e.LastName as EmployeeFullName,
c.FirstName || ' ' || c.LastName as CustomerFullName,
i.Total,
c.Country
FROM Invoice i
    JOIN Customer c
ON i.CustomerId = c.CustomerId
    JOIN Employee e
ON c.SupportRepId = e.EmployeeId;


-- 8 total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?

select COUNT(InvoiceDate) 
from Invoice
where "2009-00-00 00:00:00" <= InvoiceDate < "2012-00-00 00:00:00";

-- 9 total_sales_{year}.sql: What are the respective total sales for each of those years?

SELECT SUM(Total)
FROM Invoice
GROUP BY STRFTIME('%Y', InvoiceDate);


-- 10 invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

SELECT COUNT(InvoiceId)
FROM InvoiceLine
Where InvoiceId = 37;

-- 11 line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY

Select i.InvoiceId, 
    il.* --COUNT(il.InvoiceLineId)
FROM Invoice i
JOIN InvoiceLine il
    ON i.InvoiceId = il.InvoiceId
GROUP BY i.InvoiceId

-- 12 line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.

-- 13 line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.

-- 14 country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY

-- 15 playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

-- 16 tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

-- 17 invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.

-- 18 sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.

-- 19 top_2009_agent.sql: Which sales agent made the most in sales in 2009?
-- Hint: Use the MAX function on a subquery.

-- 20 top_agent.sql: Which sales agent made the most in sales over all?

-- 21 sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.

-- 22 sales_per_country.sql: Provide a query that shows the total sales per country.

-- 23 top_country.sql: Which country's customers spent the most?

-- 24 top_2013_track.sql: Provide a query that shows the most purchased track of 2013.

-- 25 top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.

-- 26 top_3_artists.sql: Provide a query that shows the top 3 best selling artists.

-- 27 top_media_type.sql: Provide a query that shows the most purchased Media Type.
