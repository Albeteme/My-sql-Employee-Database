CREATE TABLE "departments" (
  "dept_no" vachar PRIMARY KEY NOT NULL,
  "dept_name" varchar NOT NULL
);

CREATE TABLE "dept_emp" (
  "emp_no" INT PRIMARY KEY NOT NULL,
  "dept_no" varchar NOT NULL
);

CREATE TABLE "dept_manager" (
  "dept_no" varchar NOT NULL,
  "emp_no" INT PRIMARY KEY NOT NULL
);

CREATE TABLE "employees" (
  "emp_no" INT PRIMARY KEY NOT NULL,
  "title_id" varchar NOT NULL,
  "birth_date" date NOT NULL,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "sex" varchar NOT NULL,
  "hire_date" date NOT NULL
);

CREATE TABLE "salaries" (
  "emp_no" INT PRIMARY KEY NOT NULL,
  "salary" INT NOT NULL
);

CREATE TABLE "titles" (
  "title_id" varchar NOT NULL,
  "title" varchar NOT NULL
);

ALTER TABLE "dept_emp" ADD FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD FOREIGN KEY ("title_id") REFERENCES "employees" ("title_id");
