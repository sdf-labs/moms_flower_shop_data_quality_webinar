

use MOMS_FLOWER_SHOP.ANALYTICS;
create or replace view MOMS_FLOWER_SHOP.ANALYTICS.INSTALL_ATTRIBUTION_SUMMARY as (with install_summary as (
    select
        platform,
        campaign_type,
        campaign_name,
        count(distinct customer_id) as install_count,
        count(
            distinct case
                when campaign_id = -1
                    then customer_id
            end
        ) as organic_installs,
        count(
            distinct case
                when campaign_id != -1
                    then customer_id
            end
        ) as paid_installs
    from MOMS_FLOWER_SHOP.STAGING.APP_INSTALLS_V2
    group by 1, 2, 3
),
campaign_metrics as (
    select
        platform,
        campaign_type,
        campaign_name,
        install_count,
        organic_installs,
        paid_installs,
        round(100.0 * paid_installs / nullif(install_count, 0), 2) as paid_install_percentage,
        round(100.0 * organic_installs / nullif(install_count, 0), 2) as organic_install_percentage,
        dense_rank() over (partition by platform order by install_count desc) as campaign_rank
    from install_summary
)
select
    platform,
    campaign_type,
    campaign_name,
    install_count,
    organic_installs,
    paid_installs,
    paid_install_percentage,
    organic_install_percentage
from campaign_metrics
where campaign_rank <= 5 -- Show top 5 campaigns per platform
order by
    platform,
    install_count desc);

