import pandas as pd
import matplotlib.pyplot as plt
import os

# Output folder
output_folder = "output"
os.makedirs(output_folder, exist_ok=True)

# Load customer data
customers = pd.read_csv("data/customers.csv")

# City-wise customer count
city_customers = customers["City"].value_counts()

# Create chart
plt.figure(figsize=(10, 6))

plt.bar(city_customers.index, city_customers.values)

plt.title("City-wise Customer Count")
plt.xlabel("City")
plt.ylabel("Number of Customers")
plt.xticks(rotation=45)

plt.tight_layout()

# Save chart
plt.savefig(
    os.path.join(output_folder, "01_city_wise_customer_count.png"),
    dpi=300,
    bbox_inches="tight"
)

plt.show()
plt.close()