

use MOMS_FLOWER_SHOP.STAGING;
create or replace view MOMS_FLOWER_SHOP.STAGING.INAPP_EVENTS as (SELECT
    event_id,
    customer_id,
    event_time,
    event_name,
    event_value,
    additional_details,
    platform,
    campaign_id
FROM MOMS_FLOWER_SHOP.PUB.RAW_INAPP_EVENTS);

