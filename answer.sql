SELECT
    inv.investor_id,
    sec.sector_name,
    ROUND(
        (inv.no_of_shares * 100.0) / SUM(inv.no_of_shares) OVER (PARTITION BY inv.investor_id),
        2
    ) AS share_percentage
FROM investor_transactions inv
JOIN sectors sec
    ON inv.sector_id = sec.sector_id;
