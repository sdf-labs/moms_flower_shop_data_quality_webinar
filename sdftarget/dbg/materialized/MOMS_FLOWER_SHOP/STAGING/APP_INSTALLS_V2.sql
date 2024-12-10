

use MOMS_FLOWER_SHOP.STAGING;
create or replace view MOMS_FLOWER_SHOP.STAGING.APP_INSTALLS_V2 as (SELECT DISTINCT
    -- install events data
    i.event_id,
    i.customer_id,
    i.event_time AS install_time,
    i.platform,
    
    -- marketing campaigns data - if doesn't exist than organic
    COALESCE(
        m.campaign_id,
        -1
    ) AS campaign_id,
    COALESCE(m.campaign_name, 'organic') AS campaign_name,
    COALESCE(m.c_name, 'organic') AS campaign_type
FROM MOMS_FLOWER_SHOP.STAGING.INAPP_EVENTS i
LEFT OUTER JOIN MOMS_FLOWER_SHOP.PUB.RAW_MARKETING_CAMPAIGN_EVENTS m
    ON (i.campaign_id = CAST(m.campaign_id AS STRING))
WHERE i.event_name = 'install');

