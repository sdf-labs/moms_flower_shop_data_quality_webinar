

use MOMS_FLOWER_SHOP.STAGING;
create or replace view MOMS_FLOWER_SHOP.STAGING.CUSTOMERS as (SELECT
    c.id AS customer_id,
    c.first_name,
    c.last_name,
    c.first_name || ' ' || c.last_name AS full_name,
    c.email,
    c.gender,
    
    -- Marketing info
    i.campaign_id,
    i.campaign_name,
    i.campaign_type,
    
    -- Address info
    c.address_id,
    a.full_address,
    a.state
FROM MOMS_FLOWER_SHOP.PUB.RAW_CUSTOMERS c
LEFT OUTER JOIN MOMS_FLOWER_SHOP.STAGING.APP_INSTALLS_V2 i
    ON (c.id = i.customer_id)
LEFT OUTER JOIN MOMS_FLOWER_SHOP.PUB.RAW_ADDRESSES a
    ON (c.address_id = a.address_id));

