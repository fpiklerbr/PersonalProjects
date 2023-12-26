from google.cloud import secretmanager
import os

def get_secret_value(project_id, secret_id):
    """
    Retrieve a secret value from Google Secret Manager.

    Args:
    project_id (str): Google Cloud project ID.
    secret_id (str): ID of the secret to retrieve.

    Returns:
    str: The secret value.
    """
    try:
        # Create the Secret Manager client
        secret_client = secretmanager.SecretManagerServiceClient()

        # Format the resource name of the secret
        resource_name = f"projects/{project_id}/secrets/{secret_id}/versions/latest"

        # Access the secret version
        response = secret_client.access_secret_version(request={"name": resource_name})
        return response.payload.data.decode("UTF-8")
    except Exception as e:
        print(f"Error retrieving secret: {e}")
        return None