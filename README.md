# Task8
## 1. A report consisting of 1 page containing a detailed explanation and examples of Merge.
# MERGE in SQL

## Introduction

`MERGE` is a command in SQL that is used to combine more than one operation in a single query.
It can perform **INSERT**, **UPDATE**, and sometimes **DELETE** depending on whether matching data exists between two tables.

MERGE is useful when we want to compare data from one table with another table and make changes automatically.

## General Syntax

```sql
MERGE Target_Table AS T
USING Source_Table AS S
ON condition

WHEN MATCHED THEN
UPDATE ...

WHEN NOT MATCHED THEN
INSERT ...
```

### Explanation

* **Target Table:** the table that will be changed.
* **Source Table:** the table that contains new data.
* **WHEN MATCHED:** update existing records.
* **WHEN NOT MATCHED:** insert new records.

## Example

Suppose we have two tables:

### Employees

| ID | Name | Salary |
| -- | ---- | ------ |
| 1  | Ali  | 5000   |
| 2  | Sara | 7000   |

### NewEmployees

| ID | Name | Salary |
| -- | ---- | ------ |
| 1  | Ali  | 6000   |
| 3  | Omar | 4500   |

SQL query:

```sql
MERGE Employees AS T
USING NewEmployees AS S
ON T.ID = S.ID

WHEN MATCHED THEN
UPDATE SET T.Salary = S.Salary

WHEN NOT MATCHED THEN
INSERT (ID, Name, Salary)
VALUES (S.ID, S.Name, S.Salary);
```

### Result

* Ali's salary is updated from 5000 to 6000.
* Omar is added to the Employees table.
* Sara remains unchanged.

## Advantages of MERGE

* Combines multiple operations in one query.
* Makes code shorter.
* Helps keep tables updated.
  
## 2. Delete from Vs Truncate 

**DELETE**

* Deletes rows from a table.
* Can use `WHERE` to delete specific rows.
* Does not reset `IDENTITY`.

Example:

```sql
DELETE FROM Patients
WHERE Age > 30;
```

---

**TRUNCATE**

* Deletes all rows from a table.
* Cannot use `WHERE`.
* Resets `IDENTITY`.
* Faster than DELETE.

Example:

```sql
TRUNCATE TABLE Patients;
```

### Difference:

DELETE → remove selected rows

TRUNCATE → remove all rows quickly


