# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Install tini
RUN apt-get update && apt-get install -y tini && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt /app/requirements.txt

# Create a virtual environment within the container
RUN python -m venv /app/venv
RUN python -m pip install --upgrade pip
# Activate the virtual environment and install the Python dependencies
RUN . /app/venv/bin/activate && pip install --no-cache-dir -r requirements.txt

# Copy the dbt and _etl_scripts directories into the container
COPY ./dbt /dbt
COPY ./_etl_scripts /_etl_scripts

# Set environment variables to ensure commands run inside the virtual environment
ENV PATH="/app/venv/bin:$PATH"
ENV DBT_PROFILES_DIR=/dbt/data_warehouse/config

# entrypoint
ENTRYPOINT [ "/usr/bin/tini", "--" ]

# command
CMD [ "/bin/bash" ]
