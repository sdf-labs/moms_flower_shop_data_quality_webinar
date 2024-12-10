

use MOMS_FLOWER_SHOP.ANALYTICS;
create or replace view MOMS_FLOWER_SHOP.ANALYTICS.DIM_MARKETING_CAMPAIGNS as (SELECT 
    -- marketing campaigns dimensions
    m.campaign_id,
    m.campaign_name,
    -- metrics
    i.total_num_installs,
    m.total_campaign_spent / 
        NULLIF(i.total_num_installs, 0) AS avg_customer_acquisition_cost,
    m.campaign_duration / 
        NULLIF(i.total_num_installs, 0) AS install_duration_ratio,
    CASE 
        WHEN m.total_campaign_spent > 1000 THEN TRUE
        ELSE FALSE
    END AS is_high_value_campaign
FROM MOMS_FLOWER_SHOP.STAGING.MARKETING_CAMPAIGNS m
    LEFT OUTER JOIN MOMS_FLOWER_SHOP.STAGING.STG_INSTALLS_PER_CAMPAIGN i
    ON (m.campaign_id = i.campaign_id)
ORDER BY total_num_installs DESC NULLS LAST);

