SELECT 
    event_id,
    customer_id,
    event_time,  
    event_name,
    event_value,
    additional_details,
    platform,
    campaign_id
FROM raw.raw_inapp_events