-- Add foreign keys
ALTER TABLE orders_fact ADD CONSTRAINT fk_customers FOREIGN KEY ("Customer_ID") REFERENCES customers ("Customer_ID");
ALTER TABLE orders_fact ADD CONSTRAINT fk_products FOREIGN KEY ("Products_ID") REFERENCES products ("Products_ID");
ALTER TABLE orders_fact ADD CONSTRAINT fk_location FOREIGN KEY ("Location_ID") REFERENCES locations ("Location_ID");
ALTER TABLE orders_fact ADD CONSTRAINT fk_dates FOREIGN KEY ("Date_ID") REFERENCES dates ("Date_ID");
