-- Exercício 1: Selecione todos os dados da tabela co2_emissions_pc.
SELECT * 
FROM co2_emissions_pc;
-- Resultado: Todos os dados da tabela co2_emissions_pc serão exibidos.


-- Exercício 2: Selecione apenas as colunas co2_pc e country da tabela co2_emissions_pc.
SELECT co2_pc, country
FROM co2_emissions_pc;
-- Resultado: Apenas as colunas co2_pc e country serão exibidas.


-- Exercício 3: Selecione todos os dados da tabela co2_emissions_pc onde o país seja 'Brazil'.
SELECT *
FROM co2_emissions_pc
WHERE country = 'Brazil';
-- Resultado: Todos os dados da tabela co2_emissions_pc onde o país seja 'Brazil' serão exibidos.


-- Exercício 4: Selecione apenas as colunas ref_year e co2_pc da tabela co2_emissions_pc onde o país seja 'Brazil'.
SELECT ref_year, co2_pc
FROM co2_emissions_pc
WHERE country = 'Brazil';
-- Resultado: Apenas as col'unas ref_year e co2_pc serão exibidas para o país 'Brazil'.

-- Exercício 5: Selecione todos os dados da tabela population onde a população total seja maior que 1 bilhão.
SELECT country, ref_year, tot_pop
FROM population
WHERE tot_pop > 1000000000;
-- Resultado: Todos os dados da tabela population onde a população total seja maior que 1 bilhão serão exibidos.