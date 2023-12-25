# Use an official Python runtime as a parent image
FROM python:3.9-slim

# run
RUN cd dbt/data_warehouse \
    && /bin/bash -c "conda run -n sg-data-py3 dbt deps" \
    && echo "source activate sg-data-py3" > ~/.bashrc \
    && find /apps/orchestration/ -type f -name "*.sh" -exec chmod +x {} \; \
    && find /apps/orchestration/dags/ -type f -name "*.sh" -exec chmod +x {} \;

# entrypoint
ENTRYPOINT [ "/usr/bin/tini", "--" ]

# command
CMD [ "/bin/bash" ]