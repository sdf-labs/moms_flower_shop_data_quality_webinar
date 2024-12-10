# Mom's Flower Shop - Snowflake

## Workspace for SDF Labs Webinar - Shift Data Quality Left with SDF in CI/CD

## Setup Instructions

1. Configure a Snowflake credential called `default` with permissions to create and read tables
   - Follow the getting started guide [here](https://docs.sdf.com/integrations/snowflake/getting-started)

2. Upload seed data to Snowflake:

   ```bash
   sdf run -environment seed_remote
   ```

Now you're ready to test out all your SDF commands locally!

To setup the SDF Github Action located in `.github/workflows/pr.data_quality.yml`, you'll need to configure the following secrets in your Github repository:

- Required secrets:
  - `SNOWFLAKE_USERNAME`
  - `SNOWFLAKE_ACCOUNT`
  - `SNOWFLAKE_PASSWORD`, or `SNOWFLAKE_PRIVATE_KEY_PEM`
  - Optional secrets:
    - `SNOWFLAKE_WAREHOUSE`
    - `SNOWFLAKE_ROLE`

For more information on how to setup the SDF Github Action, please refer to the [SDF Action](https://github.com/sdf-labs/sdf-action) documentation.

## To view the examples covered in the webinar, please view the following branches

- compile_error_example: [compile_error_example](https://github.com/sdf-labs/moms_flower_shop_data_quality_webinar/tree/compile_error_example)
- lint_examples: [lint_examples](https://github.com/sdf-labs/moms_flower_shop_data_quality_webinar/tree/lint_examples)
- check_examples: [check_examples](https://github.com/sdf-labs/moms_flower_shop_data_quality_webinar/tree/check_examples)
