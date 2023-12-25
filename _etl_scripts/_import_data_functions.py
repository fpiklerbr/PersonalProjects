from google.cloud import secretmanager
import os

# Path to your service account key file
service_account_path = "PersonalProjects/dbt/data_warehouse/config/bq_service_account.json"

# Setting the environment variable for authentication
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = service_account_path

# Create the Secret Manager client
secret_client = secretmanager.SecretManagerServiceClient()

# Your project ID and secret ID
project_id = "933623807635"
secret_id = "ftp_secrets"

# Access the secret version
resource_name = f"projects/{project_id}/secrets/{secret_id}/versions/latest"
response = secret_client.access_secret_version(request={"name": resource_name})
secret_value = response.payload.data.decode("UTF-8")

# Print the secret value
print("Secret Value:", secret_value)
