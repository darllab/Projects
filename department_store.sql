-- CREATING TABLE using QUERY-- 

CREATE TABLE department_store_dataset (Vendedor VARCHAR(50),
Departamento VARCHAR(50), 
Faturamento_Realizada real, 								   
Objetivo_de_Faturamento real,
Margem_realizada real,
Objetivo_de_margem real,
Data VARCHAR(50));									   

-- COPY TABLE FROM file (csv file)--

COPY public.department_store_dataset FROM '/private/tmp/department_store_dataset.csv' WITH CSV HEADER;

-- START QUERY--

SELECT 
	vendedor,
	departamento,
	margem_realizada + objetivo_de_margem AS new_total_margin
FROM 
	public.department_store_dataset
WHERE
	departamento = 'Eletrônicos'
ORDER BY
	vendedor ASC
LIMIT
	200