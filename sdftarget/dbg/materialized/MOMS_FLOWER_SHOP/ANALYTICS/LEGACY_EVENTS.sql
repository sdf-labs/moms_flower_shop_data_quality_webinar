

use MOMS_FLOWER_SHOP.ANALYTICS;
create or replace view MOMS_FLOWER_SHOP.ANALYTICS.LEGACY_EVENTS as (SELECT
    event_id,
    customer_id,
    install_time,
    platform,
    campaign_name,
    campaign_type
FROM MOMS_FLOWER_SHOP.STAGING.APP_INSTALLS);

