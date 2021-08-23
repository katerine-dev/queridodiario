
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Querido Diário API Wrapper

## Visão Geral

Esse pacote faz parte de um projeto chamado [Querido
Diário](https://queridodiario.ok.org.br/) da [Open Knowledge
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
install.packages("devtools")
# Para instalar a versão GitHub (dev)
devtools::install_github("katerine-dev/queridodiario")
```

## Exemplo

Algumas buscas que são possíveis de se fazer nesse momento: - Obter os
Diários Oficiais de um município dentro de um período determinado de
tempo e retornar o link para seus arquivos PDFs. Por exemplo, podemos
buscar todos os Diários Oficiais de Natal-RN no período de 01/01/2012
até 31/01/2021; - Obter todos os Diários Oficiais que contenham
determinadas palavras-chave. Por exemplo podemos buscar todos os Diários
Oficiais de Natal-RN que contenham as palavras “COVID” e
“hidroxicloroquina” em toda história ou em determinado período de tempo.

A busca por palavra-chave ainda é limitada e ainda não conseguimos
isolar partes dos Diários. Então a busca por palavras muito genéricas
pode retornar uma quantidade de resultados muito grande. Por exemplo, se
procurarmos por “prefeito”, é bem provável que todos os Diários
contenham essa palavra.

O pacote pode ser carregado usando:

``` r
library(queridodiario) # Carrega o pacote
```

``` r
# para visualizar a base 
dplyr::glimpse(territories)
#> Rows: 12
#> Columns: 3
#> $ territory_id    <chr> "2408102", "5208707", "2927408", "5002704", "4205407",…
#> $ territory_name  <chr> "Natal", "Goiânia", "Salvador", "Campo Grande", "Flori…
#> $ territory_state <chr> "RN", "GO", "BA", "MS", "SC", "TO", "RJ", "PB", "PI", …
```

Contendo:

| territory_id | territory_name | territory_state |
|:-------------|:---------------|:----------------|
| 2408102      | Natal          | RN              |
| 5208707      | Goiânia        | GO              |
| 2927408      | Salvador       | BA              |
| 5002704      | Campo Grande   | MS              |
| 4205407      | Florianópolis  | SC              |
| 1721000      | Palmas         | TO              |
| 3304557      | Rio de Janeiro | RJ              |
| 2507507      | João Pessoa    | PB              |
| 2211001      | Teresina       | PI              |
| 1400100      | Boa Vista      | RR              |
| 2704302      | Maceió         | AL              |
| 1302603      | Manaus         | AM              |

## Usando a função

``` r
# Retorna os diários entre  01/01/2020 e 31/01/2021 que contém as palavras 
# 'covid' e 'cloroquina' no território '2408102' (Manaus-AM)

get_gazettes(
  since = "2020-01-01",
  until = "2021-01-31",
  keywords = "covid",
  territory_id = "1302603",
  offset = 0,
  size = 1
)
#> $total_gazettes
#> [1] 209
#> 
#> $gazettes
#> $gazettes[[1]]
#> $gazettes[[1]]$territory_id
#> [1] "1302603"
#> 
#> $gazettes[[1]]$date
#> [1] "2021-01-29"
#> 
#> $gazettes[[1]]$url
#> [1] "https://querido-diario.nyc3.cdn.digitaloceanspaces.com/1302603/2021-01-29/9b508c7972d2c804ca776a8b0488d9ff34400244.pdf"
#> 
#> $gazettes[[1]]$territory_name
#> [1] "Manaus"
#> 
#> $gazettes[[1]]$state_code
#> [1] "AM"
#> 
#> $gazettes[[1]]$highlight_texts
#> $gazettes[[1]]$highlight_texts[[1]]
#> [1] "XII – locação de veículos; \n \nXIII – despesas com combustíveis; \n \nXIV – saldo contratual das obras públicas; \n \nXV – despesas decorrentes de combate à Covid"
#> 
#> 
#> $gazettes[[1]]$is_extra_edition
#> [1] FALSE
```

### Requisitos

`{queridodiario}` requer uma versão do R superior ou igual a 2.10.

### Licença

O `{queridodiario}` é licenciado sob os termos
[MIT](https://github.com/katerine-dev/queridodiario/blob/master/LICENSE.md).
