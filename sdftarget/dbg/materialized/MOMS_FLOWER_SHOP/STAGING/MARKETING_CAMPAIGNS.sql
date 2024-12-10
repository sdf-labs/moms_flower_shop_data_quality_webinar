

use MOMS_FLOWER_SHOP.STAGING;
create or replace view MOMS_FLOWER_SHOP.STAGING.MARKETING_CAMPAIGNS as (SELECT
    campaign_id,
    campaign_name,
    SUBSTR(c_name, 1, LENGTH(c_name) - 1) AS campaign_type,
    COUNT(event_time) AS campaign_duration,
    SUM(cost) AS total_campaign_spent,
    ARRAY_AGG(event_id) AS event_ids
FROM MOMS_FLOWER_SHOP.PUB.RAW_MARKETING_CAMPAIGN_EVENTS
GROUP BY campaign_id, campaign_name, campaign_type);

