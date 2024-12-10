

use MOMS_FLOWER_SHOP.STAGING;
create or replace view MOMS_FLOWER_SHOP.STAGING.COMPLETE_MAILING_LIST as (SELECT
    c.full_name AS customer_name,
    c.email AS customer_email,
    a.full_address AS customer_address,
    a.city AS customer_city,
    a.state AS customer_state
FROM MOMS_FLOWER_SHOP.STAGING.CUSTOMERS c
LEFT JOIN MOMS_FLOWER_SHOP.PUB.RAW_ADDRESSES a
    ON c.address_id = a.address_id
WHERE c.email IS NOT NULL
ORDER BY c.full_name);

