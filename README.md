# School Performance and Educational KPI Analysis

## Business Problem
Educational institutions manage vast ecosystems of student achievements, faculty allocations, and cross-campus logistics. This project focuses on designing an end-to-end data analytics and business intelligence pipeline to evaluate academic performance, attendance behavior, and assessment distributions across multiple campuses, departments, and academic terms. The goal is to track core Key Performance Indicators (KPIs) that assist academic directors and administrators in optimizing faculty workloads, evaluating course difficulty bands, identifying regional performance variances, and driving student retention strategies.

---

## Methodology
The project is built upon a standard data warehousing architecture divided into three fundamental processing phases:

### 1. Data Engineering & Preprocessing Pipeline (Python)
- **Source Files:** `school_dataset.xlsx` (incorporating sheets: `fact_student_assessments`, `dim_students`, `dim_teachers`, `dim_courses`, `dim_classes`, `dim_departments`, `dim_campuses`, `dim_terms`, and `dim_guardians`) and `Stu-Ref_with_reference.xlsx`.
- **Pipeline Implementation (`school.ipynb`):** Built an automated Python preprocessing script utilizing **Pandas** to enforce data integrity:
  - Standardized maximum score metrics to a uniform 100-point scale (`max_mark = 100`) across all historical testing records to allow equitable evaluation benchmarks[cite: 3].
  - Implemented conditional fallback validation string text for missing faculty emails (`teacher_email`) by dynamically concatenating normalized teacher names with their internal corporate codes[cite: 3].
  - Resolved structural integrity issues in student profile categories, mapping erratic entries into standardized categorical labels ('Male' and 'Female')[cite: 3].
  - Corrected localized telecommunication anomalies within student mobile records (`mobile_num`) by stripping trailing float artifacts and padding leading zeroes for fixed lengths[cite: 3].
  - Programmatically stripped leading and trailing text whitespaces across column boundaries and record attributes to prevent structural join errors[cite: 3].

### 2. Relational Database Modeling & Enterprise Views (SQL Server)
- **Database Architecture (`SQL-View.sql`):** Designed and deployed a robust SQL relational reporting view named `V_School` to consolidate the relational schema[cite: 4].
- **View Implementation:** The view handles comprehensive relational linkages using optimized `LEFT JOIN` operations, merging granular assessment facts with surrounding dimensions (Students, Classes, Courses, Teachers, Departments, Terms, and Campuses)[cite: 4].
- **Feature Engineering:** Programmatically engineered continuous performance metrics, computing individual score percentages `(score_points / max_mark) * 100`, alongside temporal markers such as admission years, term splits, and regional campus zone alignments[cite: 4].

### 3. KPI Framework & Decision Matrix (Microsoft Excel)
- **Framework Design (`KPISS.xlsx`):** Formulated an enterprise-level KPI matrix sheet matching database attributes to institutional questions. It systematically documents the operational logic, calculation parameters, target user stories, and strategic executive actions driven by each academic metric.

---

## Key Insights
- **Database Scale:** The analytical environment tracks an aggregate of 13,485 unique student assessment records[cite: 3], monitoring performance across 1,800 active registered learners and 145 distinct faculty members.
- **Global Academic Benchmarks:** The normalized overall average score achieved across all evaluation modules (Assignments, Midterms, Projects, and Finals) stands at **69.83%**[cite: 3].
- **Campus Performance Disparities:** The `Alex West` campus recorded the highest educational performance level with an overall score average of **70.35%**, followed closely by `6th October` at **70.15%**. Conversely, `Sheikh Zayed` registered the lowest institutional performance floor at **69.43%**.
- **Departmental Efficiency Levels:** Educational performance peaks within the `Arts` department, maintaining a top tier score average of **70.86%**, with `Business` following at **70.32%**. In contrast, the `Social Studies` department exhibits the lowest relative baseline with a score average of **69.00%**.

---

## Repository Structure
- `Data/`
  - `school_dataset.xlsx` (Primary relational excel database sheets)
  - `Stu-Ref_with_reference.xlsx` (Auxiliary demographic reference tables)
- `Scripts/`
  - `school.ipynb` (Automated data cleaning and local database staging script)[cite: 3]
  - `SQL-View.sql` (Production-ready relational view script for BI reporting layers)[cite: 4]
- `Documentation/`
  - `KPISS.xlsx` (KPI architectural logic and strategic decision-making matrix)

---
**Developed by:** Eng. Ibrahim Hassan Ibrahim Al-Maadawi
