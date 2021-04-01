
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
para obter todo o texto desses diaŕios.

No pacote está disponível uma base contendo as informaçoes sobre os
municípios e seus respectivos IDs.

Este é o Wrapper em Python:
[querido-diario-api-wrapper](https://github.com/rennerocha/querido-diario-api-wrapper).

## Instalação

Para instalar a partir do endereço de um dos repositórios você precisa
ter o pacote {devtools} instalado

``` r
# Para instalar pacote devtools
install.packages("devtools")
#> Installing package into '/home/kate/R/x86_64-pc-linux-gnu-library/4.0'
#> (as 'lib' is unspecified)
# Para instalar a versão GitHub (dev)
devtools::install_github("katerine-dev/queridodiario")
#> Using github PAT from envvar GITHUB_PAT
#> Skipping install of 'queridodiario' from a github remote, the SHA1 (6b3c2351) has not changed since last install.
#>   Use `force = TRUE` to force installation
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

``` r
library(queridodiario)

# Retorna os diários entre  01/01/2020 and 31/01/2021 que contém as palavras 
# 'covid' e 'cloroquina' no território '2408102' (Natal-RN)

#get_gazettes(
 # c(
   # since = "2020-01-01",
   # until = "2021-01-31",
   # keywords = c("covid", "cloroquina"),
  # territory_id = "1302603",
   # offset = 0,
  #  size = 10
#  )
#)

# para visualizar a base 
#territories
```

## Requisitos

`{queridodiario}` requer uma versão do R superior ou igual a 3.4

## Licença

O `{queridodiario}` é licenciado sob os termos [MIT]().
