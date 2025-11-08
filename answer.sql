SELECT
    inv.investor_id,
    sec.sector_name,
    ROUND(
        (inv.no_of_shares * 100.0) / total.total_shares,
        2
    ) AS share_percentage
FROM investor_transactions inv
JOIN sectors sec 
    ON inv.sector_id = sec.sector_id
JOIN (
    -- total shares per investor
    SELECT investor_id, SUM(no_of_shares) AS total_shares
    FROM investor_transactions
    GROUP BY investor_id
) total
    ON inv.investor_id = total.investor_id;
