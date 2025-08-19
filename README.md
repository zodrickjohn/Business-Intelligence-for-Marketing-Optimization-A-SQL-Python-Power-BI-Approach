# Marketing Performance Analysis for an E-commerce Business

## 📋 Overview

[cite_start]This project presents a comprehensive marketing analysis for an online retail business, "ABC," aimed at addressing challenges of declining customer engagement and conversion rates. By leveraging a tech stack of **SQL**, **Python**, and **Power BI**, this analysis transforms raw transactional and engagement data into a strategic business intelligence dashboard that provides actionable insights for marketing optimization.

---

## 🎯 Problem Statement

[cite_start]The marketing team at ABC faced several key challenges[cite: 6]:
* [cite_start]**Reduced Customer Engagement**: A noticeable decline in customer interactions with marketing content.
* [cite_start]**Decreased Conversion Rates**: Fewer website visitors were completing purchases.
* [cite_start]**Low ROI on Marketing Spend**: Significant investments in marketing campaigns were not delivering the expected returns.

[cite_start]The primary goal was to analyze multi-source data to understand performance drivers, identify areas for improvement, and provide data-driven recommendations to enhance marketing effectiveness.

---

## 🛠️ Technology Stack

* **Database Management**: `Microsoft SQL Server`
* **Data Cleaning & Transformation**: `T-SQL`
* **Sentiment Analysis**: `Python` (Pandas, NLTK - VADER)
* **Data Visualization & Dashboarding**: `Microsoft Power BI`

---

## 📂 Project Workflow

The project followed a structured data analysis workflow:

1.  **Data Restoration and Cleaning (SQL)**
    * Restored the initial database from a `.bak` file into SQL Server.
    * [cite_start]Executed T-SQL scripts to perform critical data cleaning tasks: handled duplicates, normalized text fields (e.g., 'Socialmedia' to 'Social Media'), standardized date formats, and parsed combined columns into separate `Views` and `Clicks` fields.
2.  **Sentiment Analysis (Python)**
    * [cite_start]Extracted customer review data from the SQL database using a Python script.
    * [cite_start]Utilized the **NLTK (VADER)** library to perform sentiment analysis on raw review text, calculating a compound sentiment score for each review.
    * [cite_start]Developed a custom function to categorize reviews into nuanced sentiment categories (`Positive`, `Negative`, `Mixed Positive`, `Mixed Negative`, `Neutral`) based on both the sentiment score and the customer's star rating.
    * [cite_start]Exported the enriched data to a new CSV file (`fact_customer_reviews_with_sentiment.csv`) for use in Power BI.
3.  **Dashboarding and Visualization (Power BI)**
    * Imported all cleaned and processed data tables into Power BI.
    * Developed a multi-page interactive dashboard to visualize KPIs and trends related to:
        * **Conversion Rates**: Overall, by month, and by product.
        * **Customer Engagement**: Views, clicks, and likes over time and by content type.
        * **Customer Feedback**: Average ratings and sentiment distribution.
    * [cite_start]The final dashboard provides a holistic view of marketing performance, enabling stakeholders to drill down into specific areas of interest.

---

## 📊 Key Insights & Recommendations

The analysis uncovered three core areas for improvement:

1.  [cite_start]**Decreased Conversion Rates**: The overall conversion rate is **9.57%**, with significant seasonal fluctuations.
    * [cite_start]**Insight**: January is the peak month (**17.31%**) driven by winter sports, while October is the lowest (**6.15%**). [cite_start]Products like Hockey Stick (**15.46%**) and Ski Boots (**14.61%**) are top performers.
    * [cite_start]**Recommendation**: Focus marketing on high-performing products and launch targeted seasonal campaigns to capitalize on these trends[cite: 101, 102].
2.  [cite_start]**Reduced Customer Engagement**: Social media views show a consistent decline throughout the year, from a peak of ~1.0M in January/February.
    * [cite_start]**Insight**: Clicks and Likes are disproportionately low compared to views, indicating a lack of engaging content or weak calls-to-action.
    * [cite_start]**Recommendation**: Experiment with more interactive content formats and optimize the content strategy based on what performs best in different seasons (e.g., Video in Q1).
3.  [cite_start]**Below-Target Customer Feedback**: The average customer rating is **3.69**, just below the target of 4.0.
    * [cite_start]**Insight**: While most feedback is positive (840 reviews), there is a significant volume of **Negative (226)** and **Mixed-Negative (196)** reviews.
    * [cite_start]**Recommendation**: Implement a feedback loop to systematically analyze and address common issues raised in negative and mixed reviews to improve customer satisfaction.

---

## 🚀 Dashboard Preview & Presentation

Below are screenshots of the final Power BI dashboard.

**Overview Dashboard**

**Conversion Details**

You can view the full business case and final presentation here:
* [Marketing Analytics Business Case](https://docs.google.com/presentation/d/1_YOUR_FILE_ID/edit?usp=sharing)
* [Final Project Presentation](https://docs.google.com/presentation/d/1_YOUR_FILE_ID/edit?usp=sharing)

*(Note: Please replace `1_YOUR_FILE_ID` with the actual shareable link IDs from Google Drive.)*

---

## ⚙️ How to Use This Repository

1.  **Database Setup**:
    * Restore the `MarketAnalysis.bak` file to a SQL Server instance.
    * Run the `market analysis project.sql` script to clean the data.
2.  **Sentiment Analysis**:
    * Ensure you have Python and the required libraries (`pandas`, `pyodbc`, `nltk`) installed.
    * Update the database connection string in the `Marketing Analysis.ipynb` notebook.
    * Run the notebook to generate the `fact_customer_reviews_with_sentiment.csv` file.
3.  **Power BI**:
    * Open the `Market Analysis.pbix` file.
    * Refresh the data sources to connect to your local SQL server and the generated CSV file.
