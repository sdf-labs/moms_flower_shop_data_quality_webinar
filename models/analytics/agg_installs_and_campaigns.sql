SELECT
    -- install events data
    install_time,
    campaign_name,
    platform,
    COUNT(DISTINCT customer_id) AS distinct_installs
FROM staging.app_installs_v2
GROUP BY 1, campaign_name, 3

-- change campaign_name to 2