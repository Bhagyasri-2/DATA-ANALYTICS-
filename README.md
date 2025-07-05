# Excel Assignment: Advanced Excel Functions and Tools

This project showcases an Excel assignment demonstrating the application of key Excel functions and tools commonly used in data analysis and decision-making.

## 📁 Contents

- ✅ IF Condition
- 🔍 VLOOKUP, HLOOKUP, and LOOKUP Functions
- 📊 Scenario Manager
- 🧠 Solver Tool

---

## ✅ IF Condition

**Objective:**  
Use the `IF` function to apply logic-based decisions in data.

**Example Use Case:**  
Calculating pass/fail status based on student marks:
```excel
=IF(B2>=35, "Pass", "Fail")
🔍 Lookup Functions
🔹 VLOOKUP
Objective:
Search for a value vertically in a table.

Example:
Retrieve product price based on product name.

excel
Copy
Edit
=VLOOKUP("Product A", A2:C10, 2, FALSE)
🔹 HLOOKUP
Objective:
Search for a value horizontally across a row.

Example:

excel
Copy
Edit
=HLOOKUP("Q1", A1:D5, 2, FALSE)
🔹 LOOKUP
Objective:
Find a value either horizontally or vertically when exact match is not required.

Example:

excel
Copy
Edit
=LOOKUP(85, A2:A10, B2:B10)
📊 Scenario Manager
Objective:
Evaluate multiple financial or planning scenarios by changing input variables.

Example Use Cases:

Compare profit outcomes for different cost/sales price combinations

Create best-case, worst-case, and expected-case projections

Steps Used:

Defined changing cells (e.g., cost, price, quantity)

Added multiple scenarios using the Scenario Manager

Generated a summary report

🧠 Solver Tool
Objective:
Optimize a value based on constraints using Excel Solver.

Example Use Case:
Maximize profit by adjusting units produced within resource limits.

Steps Used:

Set the objective cell (e.g., total profit)

Selected changing variable cells (e.g., units of product A and B)

Added constraints (e.g., material limits, labor hours)

Ran Solver to find optimal solution

📎 How to Use
Open the Excel workbook provided in this repository.

Navigate to each worksheet demonstrating the respective function.

Modify input values to test various outcomes.

Use the Scenario Manager or Solver as guided in the instructions.

📌 Author
Bhagyasri Kothamasu
B.Tech – Computer Science (Data Science)
NRI Institute of Technology
