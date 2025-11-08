-- ADD YOUR SQL QUERY HERE
SELECT inv.investor_id, sec.sector_name, 
  ROUND(inv.no_of_shares / SUM(inv.no_of_shares) OVER (PARTITION BY inv.sector_id)) *100, 2) 
  AS share_percentage FROM Investments inv JOIN Sectors sec ON inv.sector__id = sec.sec_id;


