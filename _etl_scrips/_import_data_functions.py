import boto3
from botocore.exceptions import ClientError

def initialize_aws_client():
    """
    Initialize AWS client for Systems Manager.
    """
    try:
        client = boto3.client('ssm')
        return client
    except ClientError as e:
        print(f"An error occurred: {e}")
        return None

def get_parameter(client, parameter_name, with_decryption=True):
    """
    Fetch a parameter from AWS Systems Manager Parameter Store.
    :param client: Boto3 client
    :param parameter_name: Name of the parameter
    :param with_decryption: Boolean to determine if the parameter is encrypted
    :return: Parameter value or None if not found or on error
    """
    try:
        response = client.get_parameter(Name=parameter_name, WithDecryption=with_decryption)
        return response['Parameter']['Value']
    except ClientError as e:
        print(f"Could not fetch parameter: {e}")
        return None
