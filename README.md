
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Querido Diário API Wrapper

## Visão Geral

Esse pacote faz parte de um projeto chamado [Querido
Diário](https://querido-diario-site.netlify.app/) da [Open Knowledge
Brasil](https://www.ok.org.br/). A iniciativa tem como objetivo libertar
e centralizar as informações nos diários oficiais dos municípios, hoje
presas em PDFs obscuros de acesso complicado.

O Querido Diário fornece uma maneira simples de acessar à
[API](https://github.com/okfn-brasil/querido-diario-api) e fazer
consultas a ela. Diariamente estamos [coletando os
diários](https://github.com/okfn-brasil/querido-diario) e [processando
seu conteúdo](https://github.com/okfn-brasil/querido-diario-toolbox)
para obter todo o texto desses diários.

No pacote está disponível uma base contendo as informaçoes sobre os
municípios e seus respectivos IDs.

Este é o Wrapper em Python:
[querido-diario-api-wrapper](https://github.com/rennerocha/querido-diario-api-wrapper).

## Instalação

Para instalar a partir do endereço de um dos repositórios você precisa
ter o pacote {remotes} instalado

``` r
# Para instalar pacote remotes
install.packages("remotes")
# Para instalar a versão GitHub (dev)
remotes::install_github("katerine-dev/queridodiario")
```

## Exemplo

Algumas buscas que são possíveis de se fazer nesse momento: - Obter os
Diários Oficiais de um município dentro de um período determinado de
tempo e retornar o link para seus arquivos PDFs. Por exemplo, podemos
buscar todos os Diários Oficiais de Natal-RN no período de 01/01/2012
até 31/01/2021; - Obter todos os Diários Oficiais que contenham
determinadas palavras-chave. Por exemplo podemos buscar todos os Diários
Oficiais de Natal-RN que contenham as palavras “COVID” e
“hidroxicloroquina” em toda história ou em determinado período de
tempo.

A busca por palavra-chave ainda é limitada e ainda não conseguimos
isolar partes dos Diários. Então a busca por palavras muito genéricas
pode retornar uma quantidade de resultados muito grande. Por exemplo, se
procurarmos por “prefeito”, é bem provável que todos os Diários
contenham essa palavra.

O pacote pode ser carregado usando:

``` r
library(queridodiario) # Carrega o pacote
library(tidyverse)
```

``` r
# para visualizar a base 
glimpse(territories)
#> Rows: 12
#> Columns: 3
#> $ territory_id    <chr> "2408102", "5208707", "2927408", "5002704", "4205407",…
#> $ territory_name  <chr> "Natal", "Goiânia", "Salvador", "Campo Grande", "Flori…
#> $ territory_state <chr> "RN", "GO", "BA", "MS", "SC", "TO", "RJ", "PB", "PI", …
```

## Usando a função

``` r
# Retorna os diários entre  01/01/2020 e 31/01/2021 que contém as palavras 
# 'covid' e 'cloroquina' no território '2408102' (Natal-RN)

#get_gazettes(
  # since = "2020-01-01",
   # until = "2021-01-31",
  #  keywords = c("covid", "cloroquina"),
    #territory_id = "1302603",
  #  offset = 0,
   # size = 10
#)
```

## Requisitos

`{queridodiario}` requer uma versão do R superior ou igual a 3.4

## Licença

O `{queridodiario}` é licenciado sob os termos
[MIT](https://github.com/katerine-dev/queridodiario/blob/master/LICENSE.md).
