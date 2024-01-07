import requests
import pandas as pd
import io
from google.cloud import bigquery
import datetime
from pandas_gbq import to_gbq

# Set up the parameters for the API request
entrypoint = 'https://sdw-wsrest.ecb.europa.eu/service/' 
resource = 'data' 
flowRef = 'EXR'            
key = 'D.USD.EUR.SP00.A' 

# BigQuery client
client = bigquery.Client()

# BigQuery query
query = """
SELECT MIN(DATE(transaction_datetime)) as min_date 
FROM `pktech-409212.sources.transactions`
"""
query_job = client.query(query)
result = query_job.result()
min_date = list(result)[0].min_date  # Extracting the minimum date

# Current date
today = datetime.date.today().isoformat()

# Setting parameters for API request
parameters = {
    'startPeriod': min_date,
    'endPeriod': today,
    'dataflow': 'ECB/EAI',
    'dimensionAtObservation': 'AllDimensions'
}

# Make the request
request_url = entrypoint + resource + '/' + flowRef + '/' + key
response = requests.get(request_url, params=parameters, headers={'Accept': 'text/csv'})

# Check if the response is successful
if response.ok:
    df = pd.read_csv(io.StringIO(response.text))

    # Process the DataFrame
    ts = df.filter(['TIME_PERIOD', 'CURRENCY', 'OBS_VALUE'], axis=1)

    # Send the DataFrame to BigQuery
    table_id = 'pktech-409212.sources.daily_exchange_rates'
    to_gbq(ts, table_id, project_id='pktech-409212', if_exists='append')

    print("Data sent to BigQuery table.")
else:
    print("Failed to retrieve data:", response.status_code)
