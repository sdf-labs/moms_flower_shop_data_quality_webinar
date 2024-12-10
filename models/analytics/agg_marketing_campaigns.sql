SELECT CUSTOMER_ID, COUNT(EVENT_ID) AS EVENT_COUNT
FROM (
    SELECT CUSTOMER_ID, EVENT_ID, CAMPAIGN_ID
    FROM STAGING.INAPP_EVENTS
    WHERE CAST(CAMPAIGN_ID AS BIGINT) IN (
        SELECT CAMPAIGN_ID
        FROM MOMS_FLOWER_SHOP.STAGING.MARKETING_CAMPAIGNS
        WHERE CAMPAIGN_TYPE = 'instagram_ads' OR CAMPAIGN_TYPE = 'facebook_ads'
    )
) SUBQUERY
GROUP BY CUSTOMER_ID

-- -- Use a CTE to replace the subquery in the FROM clause
-- WITH Filtered_InAppEvents AS (
--     SELECT CUSTOMER_ID, EVENT_ID, CAMPAIGN_ID
--     FROM STAGING.INAPP_EVENTS
--     WHERE CAST(CAMPAIGN_ID AS BIGINT) IN (
--         SELECT CAMPAIGN_ID
--         FROM MOMS_FLOWER_SHOP.STAGING.MARKETING_CAMPAIGNS
--         WHERE CAMPAIGN_TYPE IN ('instagram_ads', 'facebook_ads')
--     )
-- )
-- SELECT CUSTOMER_ID, COUNT(EVENT_ID) AS EVENT_COUNT
-- FROM Filtered_InAppEvents
-- GROUP BY CUSTOMER_ID;