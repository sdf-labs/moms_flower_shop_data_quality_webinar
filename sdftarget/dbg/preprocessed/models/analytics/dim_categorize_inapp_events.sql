SELECT
    EVENT_ID,
    CASE
        WHEN PLATFORM = 'iOS'
            THEN CASE
                WHEN EVENT_NAME = 'place_order'
                    THEN CASE
                        WHEN CAMPAIGN_ID IS NOT NULL
                            THEN 'iOS_Order_With_Campaign'
                        ELSE 'iOS_Order_No_Campaign'
                    END
                WHEN EVENT_NAME = 'add_to_cart'
                    THEN CASE
                        WHEN CAMPAIGN_ID IS NOT NULL
                            THEN 'iOS_Cart_With_Campaign'
                        ELSE 'iOS_Cart_No_Campaign'
                    END
                ELSE 'iOS_Other'
            END
        WHEN PLATFORM = 'Android'
            THEN CASE
                WHEN EVENT_NAME = 'place_order'
                    THEN CASE
                        WHEN CAMPAIGN_ID IS NOT NULL
                            THEN 'Android_Order_With_Campaign'
                        ELSE 'Android_Order_No_Campaign'
                    END
                WHEN EVENT_NAME = 'add_to_cart'
                    THEN CASE
                        WHEN CAMPAIGN_ID IS NOT NULL
                            THEN 'Android_Cart_With_Campaign'
                        ELSE 'Android_Cart_No_Campaign'
                    END
                ELSE 'Android_Other'
            END
    END AS EVENT_CATEGORY
FROM MOMS_FLOWER_SHOP.RAW.RAW_INAPP_EVENTS