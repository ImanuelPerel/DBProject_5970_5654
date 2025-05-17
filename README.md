# 🏋️‍♂️ Gym Management Database Project – Stage 1

Welcome to the **DBProject_5970_5654**, a PostgreSQL-based relational database system designed for managing a gym's internal operations. This includes tracking **customers**, **employees**, **services**, and **working shifts**.

This README summarizes **Stage 1** of the project:
- ✅ ERD and DSD design
- ✅ Table creation and insertion scripts
- ✅ Data generation using Python and Mockaroo
- ✅ Importing/exporting CSV data
- ✅ Database backup and restore

---

## 📌 Entity-Relationship Diagram (ERD)

![ERD Diagram](images/ERD.png)

---

## 📊 Data Structure Diagram (DSD)

![DSD Diagram](images/DSD.png)

---

## 🧪 Data Generation with Faker (Python)

We use `Faker` to create realistic personal data:

```python
from faker import Faker
import pandas as pd
import random

fake = Faker()
NUM_RECORDS = 400
person_data = []
used_emails = set()

for pid in range(1, NUM_RECORDS + 1):
    while True:
        email = fake.email()
        if email not in used_emails:
            used_emails.add(email)
            break
    person_data.append([
        pid,
        fake.first_name(),
        fake.last_name(),
        email,
        fake.address().replace('\n', ', '),
        fake.random_int(min=100000000, max=999999999),
        fake.date_of_birth(minimum_age=18, maximum_age=70)
    ])

person_df = pd.DataFrame(person_data, columns=[
    "pid", "first_name", "last_name", "email", "address", "phone", "birthday"
])

person_df.to_csv("person_data.csv", index=False)
```

---

## 🐍 Insert Data with Python (psycopg2)

```python
import psycopg2
import pandas as pd

conn = psycopg2.connect(
    dbname="your_db",
    user="your_user",
    password="your_pass",
    host="localhost"
)
cur = conn.cursor()

df = pd.read_csv("person_data.csv")

for _, row in df.iterrows():
    cur.execute("""
        INSERT INTO person (pid, first_name, last_name, email, address, phone, birthday)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """, tuple(row))

conn.commit()
cur.close()
conn.close()
```

---

## 🧪 Using [Mockaroo](https://mockaroo.com/) for Data Simulation

Mockaroo can be used to generate structured synthetic data:

![Mockaroo Example](images/Mockaroo.png)

---

## 🗂️ Import CSV to PostgreSQL (pgAdmin)

We use pgAdmin’s import tool to load data from `CSV`:

1.  Right-click on the target table (e.g., `employee`)
2.  Choose `Import/Export Data`
3.  Select the CSV file and encoding (usually UTF-8)
4.  Click **OK** to import

![Import CSV](images/importCSV.png)

---

## 🔒 Backup the Database (pgAdmin)

To create a backup:

1. Right-click on the database
2. Select **Backup**
3. Choose format (e.g., Tar)
4. Click **Backup**

![Backup](images/CreateBackup.png)

---

## ♻️ Restore from Backup

To restore a saved backup:

1. Right-click database → **Restore**
2. Choose your `.tar` file
3. Select format and encoding
4. Click **Restore**

![Restore](images/UseBackup.png)

---

## ✅ Project Files

| File | Description |
|------|-------------|
| `createTables.sql` | Table creation scripts |
| `insertTables.sql` | Insert sample data |
| `dropTables.sql` | Remove all tables |
| `person_data.csv` | Example data generated with Faker |
| `README.md` | Project documentation |

---

## 🚀 Next Steps

> In **Stage 2**, we will:
- Build queries and stored procedures
- Create **views**
- Implement PL/pgSQL logic
- Design a frontend interface

Stay tuned! ⭐

---

**Made with ❤️ by Group 5970_5654**
