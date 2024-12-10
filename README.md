# Mom's Flower Shop - Snowflake

## Workspace for SDF Labs Webinar - Shift Data Quality Left with SDF in CI/CD

## Setup Instructions

1. Configure a Snowflake credential called `default` with permissions to create and read tables
   - Follow the getting started guide [here](https://docs.sdf.com/integrations/snowflake/getting-started)

2. Upload seed data to Snowflake:

   ```bash
   sdf run -environment seed_remote
   ```

3. Configure GitHub Actions Secrets
   - [SDF Action](https://github.com/sdf-labs/sdf-action)
   - Required secrets:
     - `SNOWFLAKE_USERNAME`
     - `SNOWFLAKE_ACCOUNT`
     - `SNOWFLAKE_PASSWORD`, or `SNOWFLAKE_PRIVATE_KEY_PEM`
   - Optional secrets:
     - `SNOWFLAKE_WAREHOUSE`
     - `SNOWFLAKE_ROLE`
