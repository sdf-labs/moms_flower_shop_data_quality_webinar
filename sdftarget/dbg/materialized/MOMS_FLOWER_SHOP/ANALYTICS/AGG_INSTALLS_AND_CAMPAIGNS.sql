

use MOMS_FLOWER_SHOP.ANALYTICS;
create or replace view MOMS_FLOWER_SHOP.ANALYTICS.AGG_INSTALLS_AND_CAMPAIGNS as (SELECT
    -- install events data
    install_time,
    campaign_name,
    platform,
    COUNT(DISTINCT customer_id) AS distinct_installs
FROM MOMS_FLOWER_SHOP.STAGING.APP_INSTALLS_V2
GROUP BY 1, 2, 3);

