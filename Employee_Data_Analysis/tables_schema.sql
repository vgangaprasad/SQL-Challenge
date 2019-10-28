
CREATE TABLE public.employees
(
	emp_no integer NOT NULL,
	birth_date Date NOT NULL,
	first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    gender character varying(1),
	hire_date Date NOT NULL,
    CONSTRAINT emp_no_pkey PRIMARY KEY(emp_no)
)


CREATE TABLE public.departments
(
	dept_no character varying (10) NOT NULL,
	dept_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dept_no_pkey PRIMARY KEY(dept_no)
)


CREATE TABLE public.salaries
(
	emp_no INT NOT NULL,
	salary FLOAT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	CONSTRAINT emp_no_fkey FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID,
	UNIQUE (emp_no,salary)
)

CREATE TABLE public.titles
(
	emp_no INT NOT NULL,
	title character varying(50) COLLATE pg_catalog."default" NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	CONSTRAINT emp_no_titles_fkey FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID
)

CREATE TABLE public.dept_emp
(
	emp_no INT NOT NULL,
	dept_no character varying (10) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	CONSTRAINT dept_emp_empno_fkey FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID,
	CONSTRAINT dept_emp_deptno_fkey FOREIGN KEY (dept_no)
    REFERENCES public.departments (dept_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID,
	UNIQUE(emp_no,dept_no)
)


CREATE TABLE public.dept_manager
(
	dept_no character varying (10) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	CONSTRAINT dept_mgr_empno_fkey FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID,
	CONSTRAINT dept_mgr_deptno_fkey FOREIGN KEY (dept_no)
    REFERENCES public.departments (dept_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID,
	UNIQUE(emp_no,dept_no)
)