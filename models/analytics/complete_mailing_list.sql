SELECT 
    c.full_name AS customer_name,
    c.email AS customer_email,
    a.full_address AS customer_address,
    a.city AS customer_city,
    a.state AS customer_state
FROM 
    moms_flower_shop.staging.customers c
LEFT JOIN 
    moms_flower_shop.raw.raw_addresses a 
ON 
    c.address_id = a.address_id
WHERE 
    c.email IS NOT NULL
ORDER BY 
    c.full_name