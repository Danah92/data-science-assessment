SELECT 
    inv.investor_id,
    sec.sector_name,
    ROUND(
        (inv.no_of_shares / SUM(inv.no_of_shares) OVER (PARTITION BY inv.sector_id)) * 100,
        2
    ) AS share_percentage
FROM investor_transactions inv
JOIN sectors sec 
ON inv.sector_id = sec.sector_id;-- ADD YOUR SQL QUERY HERE
