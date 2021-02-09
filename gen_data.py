import uuid
from faker import Faker
fake = Faker()

for _ in range(100):
    print(
        str(fake.date_time_between(start_date='-10y', end_date='now')) +
        ";" +
        "\"" +
        fake.firefox() +
        "\"" +
        ";" +
        fake.postcode() +
        ";" +
        fake.credit_card_provider() +
        ";" +
        fake.cryptocurrency_code() +
        ";" +
        str(fake.location_on_land()).replace("'", "").replace("(", "").replace(")", "").replace(", ", ";") +
        ";" +
        str(uuid.uuid4()) +
        ";" +
        str(fake.random_int()) +
        ";" +
        str(fake.random_int()) +
        ";" +
        str(fake.random_int()) +
        ";" +
        str(fake.random_int()) +
        ";" +
        str(fake.random_int())
    )
# datetime.datetime(2007, 2, 28, 11, 28, 16)
