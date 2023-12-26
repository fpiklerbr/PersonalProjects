import random
import pandas as pd
from faker import Faker
from google.cloud import bigquery
from pandas_gbq import to_gbq

# Constants
MIN_ROWS = 20
MAX_ROWS = 30
MIN_DISCOUNT = 0.05
MAX_DISCOUNT = 0.2
MIN_STORE_ID = 1
MAX_STORE_ID = 10
REFUND_PROBABILITY = 0.1
MIN_SHIPPING = 5
MAX_SHIPPING = 15
MIN_VENDOR_ID = 1
MAX_VENDOR_ID = 30
MIN_CUSTOMER_ID = 1
MAX_CUSTOMER_ID = 200
PRICE_VARIATION = 0.15
MIN_COST_REDUCTION = 0.17  # 17% lower
MAX_COST_REDUCTION = 0.30  # 30% lower

def get_latest_transaction_id(client):
    try:
        query = f"""
        SELECT MAX(transaction_id) as max_id 
        FROM `pktech-409212.sources.transactions`
        """
        query_job = client.query(query)
        results = query_job.result()
        for row in results:
            return row.max_id if row.max_id is not None else 0
    except Exception as e:
        print(f"Error in get_latest_transaction_id: {e}")
        return 0

def get_product_info(client):
    try:
        query = f"""
        SELECT sku, product_size
        FROM `pktech-409212.sources.product_details`
        """
        query_job = client.query(query)
        return [(row.sku, row.product_size) for row in query_job.result()]
    except Exception as e:
        print(f"Error in get_product_info: {e}")
        return []

def get_avg_prices(client):
    try:
        query = """
        SELECT id, avg_price
        FROM `pktech-409212.sources.product_details`
        """
        query_job = client.query(query)
        return {row.id: row.avg_price for row in query_job.result()}
    except Exception as e:
        print(f"Error in get_avg_prices: {e}")
        return {}

def generate_fake_data(client):
    fake = Faker()
    latest_id = get_latest_transaction_id(client)
    avg_prices = get_avg_prices(client)
    num_rows = random.randint(MIN_ROWS, MAX_ROWS)
    data = []

    for _ in range(num_rows):
        product_id = random.randint(1, 500)
        base_price = avg_prices.get(product_id, 100)  # Fallback to 100 if no avg price
        price_variation = random.uniform(-PRICE_VARIATION, PRICE_VARIATION)
        price = round(base_price * (1 + price_variation), 2)
        cost_reduction = random.uniform(MIN_COST_REDUCTION, MAX_COST_REDUCTION)
        cost = round(price * (1 - cost_reduction), 2)  # Cost is 17% to 30% lower than price
        discount = round(random.uniform(MIN_DISCOUNT, MAX_DISCOUNT), 2)
        transaction_datetime = fake.date_time_between(start_date='now', end_date='+1d')
        storeID = random.randint(MIN_STORE_ID, MAX_STORE_ID)
        transaction_type = "refund" if random.random() < REFUND_PROBABILITY else "sale"
        shipping = round(random.uniform(MIN_SHIPPING, MAX_SHIPPING), 2) if transaction_type == "sale" else 0
        vendor_id = random.randint(MIN_VENDOR_ID, MAX_VENDOR_ID)
        customer_id = random.randint(MIN_CUSTOMER_ID, MAX_CUSTOMER_ID)

        data.append({
            "transaction_id": latest_id + 1,
            "product_id": product_id,
            "price": price,
            "cost": cost,
            "discount": discount,
            "transaction_datetime": transaction_datetime,
            "storeID": storeID,
            "transaction_type": transaction_type,
            "shipping": shipping,
            "vendor_id": vendor_id,
            "customer_id": customer_id
        })
        latest_id += 1

    return pd.DataFrame(data)


def append_to_bigquery(dataframe):
    try:
        table_name = f"pktech-409212.sources.transactions"
        to_gbq(dataframe, table_name, if_exists='append')
    except Exception as e:
        print(f"Error in append_to_bigquery: {e}")

def main():
    client = bigquery.Client()

    fake_data = generate_fake_data(client)
    append_to_bigquery(fake_data)

if __name__ == "__main__":
    main()
