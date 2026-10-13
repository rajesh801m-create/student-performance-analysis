import pandas as pd

df = pd.read_csv("student_data.csv")

print(df.head())


## BASIC ANALYSIS

import pandas as pd

df = pd.read_csv("student_data.csv")

print("Dataset Shape:", df.shape)
print("\nColumn Names:")
print(df.columns)

print("\nBasic Information:")
print(df.info())

print("\nStatistics:")
print(df.describe())


# Subject-wise Average Marks
print("\nSubject-wise Average:")
print(df[["maths", "science", "english"]].mean())

# Top 5 Students
df["average_marks"] = df[["maths", "science", "english"]].mean(axis=1)

print("\nTop 5 Students:")
print(
    df[["name", "department", "average_marks"]]
    .sort_values("average_marks", ascending=False)
    .head(5)
)

# Department-wise Average
print("\nDepartment-wise Average:")
print(
    df.groupby("department")["average_marks"]
    .mean()
    .sort_values(ascending=False)
)

# Highest Attendance
print("\nHighest Attendance:")
print(
    df[["name", "department", "attendance"]]
    .sort_values("attendance", ascending=False)
    .head(5)
)