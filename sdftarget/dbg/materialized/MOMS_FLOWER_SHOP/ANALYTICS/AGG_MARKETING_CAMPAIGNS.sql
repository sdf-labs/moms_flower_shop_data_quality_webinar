

use MOMS_FLOWER_SHOP.ANALYTICS;
create or replace view MOMS_FLOWER_SHOP.ANALYTICS.AGG_MARKETING_CAMPAIGNS as (WITH Filtered_InAppEvents AS (
    SELECT
        CUSTOMER_ID,
        EVENT_ID,
        CAMPAIGN_ID
    FROM MOMS_FLOWER_SHOP.STAGING.INAPP_EVENTS
    WHERE CAST(CAMPAIGN_ID AS BIGINT) IN (
    SELECT
        CAMPAIGN_ID
    FROM MOMS_FLOWER_SHOP.STAGING.MARKETING_CAMPAIGNS
    WHERE CAMPAIGN_TYPE IN ('instagram_ads', 'facebook_ads'))
)
SELECT
    CUSTOMER_ID,
    COUNT(EVENT_ID) AS EVENT_COUNT
FROM Filtered_InAppEvents
GROUP BY CUSTOMER_ID);

