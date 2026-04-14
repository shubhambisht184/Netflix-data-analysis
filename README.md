🎬 Netflix Data Analysis using SQL
1️⃣ Project Overview

This project performs in-depth exploratory data analysis on the Netflix dataset using PostgreSQL. The objective is to extract structured, business-relevant insights from semi-structured content metadata using optimized and scalable SQL queries.

The focus is on analytical depth, data transformation, and production-style query writing rather than basic data retrieval.

2️⃣ Dataset Overview

The dataset contains structured metadata for Netflix Movies and TV Shows, including:

Content Type (Movie / TV Show)
Title, Director, Cast
Country of Production
Date Added & Release Year
Rating & Duration
Genres
Description

It includes multi-valued categorical fields and inconsistent date formats, reflecting real-world data challenges.

3️⃣ Technical Implementation
Data Preparation
Normalized multi-value columns using STRING_TO_ARRAY and UNNEST
Standardized date formats with conditional parsing
Handled NULL values and missing attributes
Implemented keyword-based classification using CASE logic
Advanced SQL Concepts Applied
Aggregations & Grouped Analysis
Window Functions (RANK() with PARTITION BY)
Common Table Expressions (CTEs)
Subqueries & Derived Tables
String Manipulation Functions
Date Transformations & Interval Filtering
Conditional Categorization
Analytical Modules
Content distribution (Movies vs TV Shows)
Rating dominance by content type
Top content-producing countries
Genre distribution modeling
Director & Actor frequency analysis
India-specific release trend analysis
Keyword-driven content classification
4️⃣ Results & Key Insights
Identified dominant content type patterns
Extracted rating trends across content categories
Quantified top contributing countries
Analyzed actor participation in Indian productions
Measured year-over-year content growth
Classified content for moderation-style insights
5️⃣ Business & Analytical Impact

This project demonstrates the ability to:

Transform raw datasets into structured analytical insights
Handle semi-structured relational data efficiently
Apply advanced SQL techniques in practical scenarios
Design scalable, production-style queries
Generate business-focused analytical outputs

It reflects strong database fundamentals, analytical reasoning, and industry-aligned SQL expertise.

🙋‍♂️ Author

Shubham Bisht
🎓 B.Tech – Computer Science Engineering
🏫 Inderprastha Engineering College
📍 India

📧 Email: shubhambisht184184@gmail.com

🔗 LinkedIn: https://www.linkedin.com/in/shubham-bisht-7b4b4533
