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
-- Resultado: Apenas as colunas ref_year e co2_pc serão exibidas para o país 'Brazil'.


-- Exercício 5: Selecione todos os dados da tabela population onde a população total seja maior que 1 bilhão.
SELECT country, ref_year, tot_pop
FROM population
WHERE tot_pop > 1000000000;
-- Resultado: Todos os dados da tabela population onde a população total seja maior que 1 bilhão serão exibidos.


-- Exercício 6: Selecione todos os dados da tabela population onde a população total seja igual e diferente a NULL.
SELECT *
FROM population
WHERE tot_pop = NULL;

SELECT *
FROM population
WHERE tot_pop != NULL;
-- Resultado: Os operadores = (igual) e != (diferente) não funcionam com campos nulos.


-- Exercício 7: Selecione todos os dados da tabela population onde a população total seja nula.
SELECT *
FROM population
WHERE tot_pop IS NULL;
-- Resultado: Todos os dados da tabela population onde a população total seja nula serão exibidos.


-- Exercício 8: Selecione todos os dados da tabela population onde a população total não seja nula.
SELECT *
FROM population
WHERE tot_pop IS NOT NULL;
-- Resultado: Todos os dados da tabela population onde a população total não seja nula serão exibidos.


-- Exercício 9: Selecione todos os dados da tabela child_mortality onde o total de mortes esteja entre 570 e 630.
SELECT country, ref_year, tot_deaths
FROM child_mortality
WHERE tot_deaths BETWEEN 570 AND 630;
-- Resultado: Todos os dados da tabela child_mortality onde o total de mortes esteja entre 570 e 630 serão exibidos.


-- Exercício 10: Selecione todos os dados da tabela petrobras onde a data esteja entre '2020-02-20' e '2020-03-20'.
SELECT `date`, open, high, low, close, `adj close`, volume
FROM petrobras
WHERE `date` BETWEEN '2020-02-20' AND '2020-03-20';
-- Resultado: Todos os dados da tabela petrobras onde a data esteja entre '2020-02-20' e '2020-03-20' serão exibidos.
-- Observação: As colunas 'date' e 'adj close' foram colocadas entre aspas invertidas (`) para evitar conflitos com palavras reservadas do SQL.


-- Exercício 11: Selecione todos os dados da tabela co2_emissions_pc onde o ano de referência seja 2020 e as emissões de CO2 por capital sejam maiores que 20.0.
SELECT country, co2_pc
FROM co2_emissions_pc
WHERE ref_year = 2020
 AND co2_pc > 20.0;
-- Resultado: Todos os dados da tabela co2_emissions_pc onde o ano de referência seja 2020 e as emissões de CO2 por capital sejam maiores que 20.0 serão exibidos.


