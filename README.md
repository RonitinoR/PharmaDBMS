# Healthcare Claims Data Warehouse – Dimensional Modeling Project

## 📌 Project Overview

This project demonstrates the end-to-end design and implementation of a dimensional data warehouse model using synthetic healthcare patient claims data.

The objective was to transform normalized transactional healthcare data into an analytics-optimized star schema to support enterprise reporting, KPI analysis, and business-driven SQL queries.

This project simulates real-world healthcare analytics scenarios involving claims, providers, patients, and financial metrics.

---

## 🎯 Business Objective

Healthcare organizations rely on structured claims data to monitor:

- Claims processing performance
- Financial reimbursement trends
- Denial rates
- Provider performance
- Operational efficiency metrics

The goal of this project was to:

1. Normalize raw healthcare claims data to Third Normal Form (3NF)
2. Design a dimensional model optimized for analytics
3. Implement referential integrity and key constraints
4. Write SQL queries to answer business reporting questions

---

## 🏗 Data Modeling Approach

### Step 1: Normalization (3NF)

The raw transactional dataset was normalized into 3NF to:

- Remove redundancy
- Ensure data integrity
- Establish proper entity separation
- Define primary and foreign key relationships

---

### Step 2: Star Schema Design

After normalization, a dimensional model was created.

#### ⭐ Fact Table

- **Fact_Claims**
  - Claim ID
  - Patient Key
  - Provider Key
  - Diagnosis Key
  - Procedure Key
  - Date Key
  - Claim Amount
  - Approved Amount
  - Denied Amount
  - Processing Time

#### 📊 Dimension Tables

- Dim_Patient
- Dim_Provider
- Dim_Diagnosis
- Dim_Procedure
- Dim_Date
- Dim_Payer (if applicable)

The star schema was designed to:

- Optimize analytical query performance
- Simplify reporting logic
- Enable KPI aggregation across multiple dimensions

---

## 🔐 Referential Integrity

Primary and foreign keys were defined for all tables.

Appropriate referential actions were assigned:

- CASCADE
- SET NULL
- RESTRICT

These decisions were made based on expected business use cases and reporting impact.

---

## 🧮 SQL Implementation

The project includes SQL scripts for:

- Table creation (DDL)
- Primary & foreign key constraints
- Data transformation logic
- Business query analysis

Example Business Questions Answered:

- What is the total claim amount by provider?
- What is the average processing time by diagnosis category?
- What percentage of claims were denied by payer?
- What are monthly reimbursement trends?

SQL queries were optimized to support aggregation-heavy analytical workloads.

---

## 🏥 Healthcare Context

The dataset simulates healthcare claims analytics use cases commonly found in:

- Revenue cycle management
- Insurance reimbursement analysis
- Operational healthcare reporting
- Quality and performance tracking

This modeling approach reflects how enterprise healthcare organizations structure claims data for BI tools such as Power BI or Amazon QuickSight.

---

## 🚀 Key Concepts Demonstrated

- Dimensional Modeling
- Star Schema Design
- Third Normal Form (3NF)
- Fact & Dimension Segregation
- Primary & Foreign Key Constraints
- Referential Integrity Rules
- SQL-Based Business Analytics
- Healthcare Claims Data Structuring

---

## 📂 Repository Structure

/sql
├─ schema_creation.sql
├─ fact_dimension_tables.sql
├─ business_queries.sql

/docs
├─ ERD_schema.pdf (image)
├─ Documentation.pdf

## 💡 Summary

This project demonstrates the ability to:

- Transform transactional healthcare data into an analytics-ready warehouse
- Design scalable dimensional models
- Implement robust SQL-based reporting structures
- Apply enterprise-level data modeling best practices

It reflects practical skills required in healthcare analytics, business intelligence development, and data engineering roles.

---

## 👤 Author

Ronit Hara Yandra  
Data Analytics & BI Professional  
Healthcare & Enterprise Reporting Focus
