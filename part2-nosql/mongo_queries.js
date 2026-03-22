// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    product_id: "E101",
    name: "Laptop",
    category: "Electronics",
    price: 55000,
    warranty_years: 2,
    specs: { brand: "HP", ram: "16GB", storage: "512GB SSD" }
  },
  {
    product_id: "C101",
    name: "T-Shirt",
    category: "Clothing",
    price: 1200,
    size: ["S","M","L"],
    material: "Cotton"
  },
  {
    product_id: "G101",
    name: "Milk",
    category: "Groceries",
    price: 60,
    expiry_date: new Date("2024-12-30"),
    nutrition: { calories: 150, protein: "8g" }
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { product_id: "E101" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });
