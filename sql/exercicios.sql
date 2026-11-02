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


--Exerício 12: Indique se há linhas com valores nulos no campo gdp_pc na tabela gdp_pc.
SELECT *
FROM gdp_pc
WHERE gdp_pc is null;
-- Resultado: Se houver linhas com valores nulos no campo gdp_pc, elas serão exibidas. Caso contrário, nenhum resultado será retornado.


-- Exercício 13: Na tabela child_mortality, indique se há linhas com valores nulos no campo tot_deaths.
SELECT *
FROM child_mortality
WHERE tot_deaths is null;
-- Resultado: Se houver linhas com valores nulos no campo tot_deaths, elas serão exibidas. Caso contrário, nenhum resultado será retornado.


-- Exercício 14: Segundo o Ministério da Saúde, as taxas de mortalidade infantil (TMI) são classificadas em altas (50 ou mais), médias (20-49) e baixas (menos de 20). Utilizando a tabela child_mortality e o campo tot_deaths, encontre todos os países que alcançaram taxas de mortalidade baixas com uma variação de 5%, ou seja, com valor de 20±5%. Indique em que ano o Brasil atingiu essa TMI.
SELECT *
FROM child_mortality
WHERE tot_deaths BETWEEN 19 AND 21
AND country = 'Brazil';
-- Resultado: Todos os dados da tabela child_mortality onde o país seja 'Brazil' e a taxa de mortalidade infantil esteja entre 19 e 21 serão exibidos, indicando o ano em que o Brasil atingiu essa TMI.


-- Exercício 15: Utilizando a tabela life_expectancy e o campo tot_years, indique qual a expectativa de vida do brasileiro nos anos de 2019 a 2023. Liste os valores, observe o que ocorreu e comente as prováveis causas.
SELECT *
FROM life_expectancy
WHERE ref_year BETWEEN '2019' AND '2023'
AND country = 'Brazil';
-- Resultado: A expectativa de vida em 2019 era de 75,8 anos. Em 2020, caiu para 74,5 anos e, em 2021, para 73,2 anos. Em 2022, houve uma recuperação, alcançando 73,9 anos, e em 2023, subiu para 76,7 anos. Essa redução na expectativa de vida durante o período foi, provavelmente, causada pelo aumento de óbitos decorrentes da pandemia de covid-19.

--Exercício 16: Utilizando a tabela population, selecione os países cuja população ultrapassou 200 milhões de habitantes em 2023. Use notação científica para representar a população na consulta e indique a população de cada país selecionado nos resultados.
SELECT *
FROM population
WHERE tot_pop > 0.2e9
AND ref_year = 2023;
-- Resultado: Todos os países cuja população ultrapassou 200 milhões de habitantes em 2023 serão exibidos, juntamente com a população de cada país selecionado nos resultados.

-- Exercício 17: Utilizando a tabela co2_emissions_pc, indique as emissões de CO2 no Brasil, na China e nos Estados Unidos, de 2019 a 2021. Compartilhe as suas observações sobre a pesquisa.
SELECT *
FROM co2_emissions_pc
WHERE ref_year BETWEEN 	2019 AND 2021
AND country IN ('Brazil', 'China', 'USA');
-- Resultado: As emissões de CO2 no Brasil, na China e nos Estados Unidos, de 2019 a 2021 serão exibidas. Observações: A China apresentou as maiores emissões de CO2 entre os três países, seguida pelos Estados Unidos e pelo Brasil. A variação das emissões ao longo dos anos pode estar relacionada a fatores econômicos, políticas ambientais e eventos globais, como a pandemia de COVID-19, que impactou a produção industrial e o consumo de energia.


-- Exercício 18: Utilizando a tabela country e o operador IN, selecione os países europeus de renda média baixa. Use a classificação Gapminder de 8 regiões geográficas (campo eight_regions com valor europe_east e europe_west), para verificar os países, e a classificação de 4 faixas de renda do Banco Mundial (campo wb4income com o valor Lower middle income), para verificar a renda. Indique se todos os países são do leste europeu.
SELECT country, eight_regions, wb4income
FROM country
WHERE eight_regions IN ('europe_west', 'europe_east')
AND wb4income = 'Lower middle income';
-- Resultado: Todos os países europeus de renda média baixa serão exibidos, juntamente com suas respectivas regiões geográficas e faixas de renda.


-- Exercício 19: Utilizando a tabela country, selecione os países do continente asiático segundo a classificação de oito regiões (coluna eight_regions). Além da coluna country, traga as colunas eight_regions e wb_regions para comparação.
SELECT country, eight_regions, wb_regions
FROM country
WHERE eight_regions LIKE '%asia%';
-- Resultado: Todos os países do continente asiático serão exibidos, juntamente com suas respectivas regiões geográficas e regiões do Banco Mundial para comparação.


-- Exercício 20: Pesquise os países das Américas, segundo a classificação do Banco Mundial (coluna wb_regions), utilizando o operador LIKE.
SELECT country, wb_regions
FROM country
WHERE wb_regions LIKE '%america%';
-- Resultado: Todos os países das Américas serão exibidos, juntamente com suas respectivas regiões do Banco Mundial.