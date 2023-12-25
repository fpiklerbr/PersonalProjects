FROM registry.stadiumgoods.com/data/deploy-setup/data-dbt-base:0.2

# Set environment variables and working directory
ENV DBT_DIR /source
WORKDIR $DBT_DIR
ENV DBT_PROFILES_DIR $DBT_DIR/config

ARG ARG_DEFAULT_TARGET='bq_prod'
ENV DBT_DEFAULT_TARGET $ARG_DEFAULT_TARGET

# copy dbt code
COPY ./dbt/data_warehouse/ .

# pull dbt dependencies
RUN dbt deps

# build static pages
ARG DOCS_GENERATE_EXCLUDE="tag:finance_snapshots tag:x3_legacy tag:meta_dbt"
RUN dbt docs generate \
    --exclude ${DOCS_GENERATE_EXCLUDE}
    
RUN cp -r /source/target/* /var/www/html/
