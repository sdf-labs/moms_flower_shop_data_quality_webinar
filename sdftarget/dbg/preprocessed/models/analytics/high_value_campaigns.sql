WITH campaign_metrics AS (
    SELECT
        campaign_id,
        campaign_name,
        is_high_value_campaign,
        total_num_installs,
        avg_customer_acquisition_cost,
        install_duration_ratio
    FROM dim_marketing_campaigns
    WHERE is_high_value_campaign = TRUE AND total_num_installs > 0
)
SELECT
    cm.campaign_id,
    cm.campaign_name,
    cm.is_high_value_campaign,
    cm.total_num_installs,
    ROUND(cm.avg_customer_acquisition_cost, 2) AS avg_cost_per_install,
    CASE
        WHEN cm.install_duration_ratio < 1
            THEN 'Fast Converting'
        WHEN cm.install_duration_ratio < 2
            THEN 'Average'
        ELSE 'Slow Converting'
    END AS conversion_speed
FROM campaign_metrics cm
WHERE cm.avg_customer_acquisition_cost < (
    SELECT
        AVG(avg_customer_acquisition_cost)
    FROM dim_marketing_campaigns
)
ORDER BY cm.total_num_installs DESC NULLS LAST