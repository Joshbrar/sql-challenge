-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.3-beta1
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
--CREATE DATABASE new_database;
-- ddl-end --


-- object: public.department_tbl | type: TABLE --
-- DROP TABLE IF EXISTS public.department_tbl CASCADE;
CREATE TABLE public.department_tbl (
	dept_id char(4) NOT NULL,
	dept_name varchar(60) NOT NULL,
	CONSTRAINT department_tbl_pk PRIMARY KEY (dept_id)

);
-- ddl-end --
ALTER TABLE public.department_tbl OWNER TO postgres;
-- ddl-end --

-- object: public.job_titles_tbl | type: TABLE --
-- DROP TABLE IF EXISTS public.job_titles_tbl CASCADE;
CREATE TABLE public.job_titles_tbl (
	title_id char(5) NOT NULL,
	title_name varchar(60) NOT NULL,
	CONSTRAINT job_titles_tbl_pk PRIMARY KEY (title_id)

);
-- ddl-end --
ALTER TABLE public.job_titles_tbl OWNER TO postgres;
-- ddl-end --

-- object: public.employees_tbl | type: TABLE --
-- DROP TABLE IF EXISTS public.employees_tbl CASCADE;
CREATE TABLE public.employees_tbl (
	emp_no integer NOT NULL,
	title_id char(5) NOT NULL,
	birth_dt date NOT NULL,
	f_name varchar(60) NOT NULL,
	l_name varchar(60) NOT NULL,
	sex char(1) NOT NULL,
	hire_dt date NOT NULL,
	CONSTRAINT employees_tbl_pk PRIMARY KEY (emp_no)

);
-- ddl-end --
ALTER TABLE public.employees_tbl OWNER TO postgres;
-- ddl-end --

-- object: public.emp_salary_tbl | type: TABLE --
-- DROP TABLE IF EXISTS public.emp_salary_tbl CASCADE;
CREATE TABLE public.emp_salary_tbl (
	salary_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 START WITH 1 ),
	emp_no integer NOT NULL,
	amount numeric(10,2) NOT NULL,
	CONSTRAINT em_salary_tbl_pk PRIMARY KEY (salary_id)

);
-- ddl-end --
ALTER TABLE public.emp_salary_tbl OWNER TO postgres;
-- ddl-end --

-- object: public.dept_manager_tbl | type: TABLE --
-- DROP TABLE IF EXISTS public.dept_manager_tbl CASCADE;
CREATE TABLE public.dept_manager_tbl (
	mgr_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	dept_id char(4) NOT NULL,
	emp_no integer NOT NULL,
	CONSTRAINT dept_manager_tbl_pk PRIMARY KEY (mgr_id)

);
-- ddl-end --
ALTER TABLE public.dept_manager_tbl OWNER TO postgres;
-- ddl-end --

-- object: public.dept_employees_tbl | type: TABLE --
-- DROP TABLE IF EXISTS public.dept_employees_tbl CASCADE;
CREATE TABLE public.dept_employees_tbl (
	"ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	emp_no integer NOT NULL,
	dept_id char(4) NOT NULL,
	CONSTRAINT dept_employees_tbl_pk PRIMARY KEY ("ID")

);
-- ddl-end --
ALTER TABLE public.dept_employees_tbl OWNER TO postgres;
-- ddl-end --

-- object: "FK_title_id_employees_tbl" | type: CONSTRAINT --
-- ALTER TABLE public.employees_tbl DROP CONSTRAINT IF EXISTS "FK_title_id_employees_tbl" CASCADE;
ALTER TABLE public.employees_tbl ADD CONSTRAINT "FK_title_id_employees_tbl" FOREIGN KEY (title_id)
REFERENCES public.job_titles_tbl (title_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_emp_id_emp_salary_tbl" | type: CONSTRAINT --
-- ALTER TABLE public.emp_salary_tbl DROP CONSTRAINT IF EXISTS "FK_emp_id_emp_salary_tbl" CASCADE;
ALTER TABLE public.emp_salary_tbl ADD CONSTRAINT "FK_emp_id_emp_salary_tbl" FOREIGN KEY (emp_no)
REFERENCES public.employees_tbl (emp_no) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_dept_id_dept_manamger_tbl" | type: CONSTRAINT --
-- ALTER TABLE public.dept_manager_tbl DROP CONSTRAINT IF EXISTS "FK_dept_id_dept_manamger_tbl" CASCADE;
ALTER TABLE public.dept_manager_tbl ADD CONSTRAINT "FK_dept_id_dept_manamger_tbl" FOREIGN KEY (dept_id)
REFERENCES public.department_tbl (dept_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_emp_no_dept_mamanger_tbl" | type: CONSTRAINT --
-- ALTER TABLE public.dept_manager_tbl DROP CONSTRAINT IF EXISTS "FK_emp_no_dept_mamanger_tbl" CASCADE;
ALTER TABLE public.dept_manager_tbl ADD CONSTRAINT "FK_emp_no_dept_mamanger_tbl" FOREIGN KEY (emp_no)
REFERENCES public.employees_tbl (emp_no) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_emp_no_dept_employees_tbl" | type: CONSTRAINT --
-- ALTER TABLE public.dept_employees_tbl DROP CONSTRAINT IF EXISTS "FK_emp_no_dept_employees_tbl" CASCADE;
ALTER TABLE public.dept_employees_tbl ADD CONSTRAINT "FK_emp_no_dept_employees_tbl" FOREIGN KEY (emp_no)
REFERENCES public.employees_tbl (emp_no) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_dept_id_dept_employees" | type: CONSTRAINT --
-- ALTER TABLE public.dept_employees_tbl DROP CONSTRAINT IF EXISTS "FK_dept_id_dept_employees" CASCADE;
ALTER TABLE public.dept_employees_tbl ADD CONSTRAINT "FK_dept_id_dept_employees" FOREIGN KEY (dept_id)
REFERENCES public.department_tbl (dept_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


