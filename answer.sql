SELECT 
    inv.investor_id,
    sec.sector_name,
    ROUND(
        (CAST(inv.no_of_shares AS DECIMAL(10,2)) * 100.0) 
        / CAST(totals.total_shares AS DECIMAL(10,2)),
        2
    ) AS share_percentage
FROM investor_transactions inv
JOIN sectors sec
    ON inv.sector_id = sec.sector_id
JOIN (
    -- Total shares per investor
    SELECT investor_id, SUM(no_of_shares) AS total_shares
    FROM investor_transactions
    GROUP BY investor_id
) AS totals
    ON inv.investor_id = totals.investor_id
ORDER BY 
    inv.investor_id,
    share_percentage DESC;
