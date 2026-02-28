# Analytics dbt Project

This dbt project transforms raw employee data into aggregated analytics tables in Amazon Redshift.

## Project Structure

```
dbt/
├── dbt_project.yml          # Project configuration
├── models/
│   ├── staging/             # Data imports and minimal transformations
│   │   └── stg_employees.sql      # Prepare employee data from source
│   ├── marts/               # Business-ready aggregated tables
│   │   └── employees_by_gender.sql # Employee counts and salary insights by gender
│   └── sources.yml          # Source table definitions
├── tests/                   # Data quality tests
├── analysis/                # Exploratory analysis queries
├── macros/                  # Reusable SQL functions
└── README.md
```

## Setup Instructions

### Prerequisites

- Virtual environment with dbt installed: ✅ Done
- Redshift database and credentials
- Employee data already loaded in Redshift (raw.employees table)

### Configuration

1. **Update `~/.dbt/profiles.yml`** with your Redshift credentials:
   - Replace `YOUR_REDSHIFT_HOST`, `YOUR_USERNAME`, `YOUR_PASSWORD`, `YOUR_DATABASE`
   - Verify the port (default 5439), schema, and thread count

2. **Verify source data** exists in your Redshift:
   ```sql
   SELECT * FROM raw.employees LIMIT 5;
   ```

### Running dbt

```bash
# Navigate to the dbt project
cd /Users/cyphercon/migrate-loop/dbt

# Test connection to Redshift
dbt debug

# Run all models
dbt run

# Run and test
dbt run --select +employees_by_gender

# Test data quality
dbt test

# Generate documentation
dbt docs generate
dbt docs serve
```

## Important: Data Loading

**⚠️ dbt does NOT move data.** The employee data must be pre-loaded into Redshift:

- **Option 1**: Use AWS DMS (Database Migration Service) to replicate MySQL → Redshift
- **Option 2**: Use a third-party ETL tool (Stitch, Fivetran, Airbyte)
- **Option 3**: Custom Python/Node.js script that reads MySQL and writes to Redshift

Once employee data is in `raw.employees` in Redshift, dbt will:

1. Read from `raw.employees` (stg_employees model)
2. Aggregate by gender
3. Write results to `analytics_dev.employees_by_gender` (or your configured schema)

## Models

### `stg_employees` (Staging)

- **Source**: `raw.employees`
- **Purpose**: Clean and prepare employee data
- **Output**: `analytics_dev.stg_employees`

### `employees_by_gender` (Mart)

- **Source**: `stg_employees`
- **Purpose**: Aggregate employee metrics by gender
- **Metrics**: Count, avg/min/max salary, total salary, departments, hire date range
- **Output**: `analytics_dev.employees_by_gender`

## Next Steps

1. Configure profiles.yml with your Redshift credentials
2. Ensure employee data exists in `raw.employees` in Redshift
3. Run `dbt debug` to test the connection
4. Run `dbt run` to create the transformation tables
5. Query the results from `employees_by_gender` to see aggregated data
