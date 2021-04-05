territories <-
  data.frame(
    territory_id = c(
      "2408102",
      "5208707",
      "2927408",
      "5002704",
      "4205407",
      "1721000",
      "3304557",
      "2507507",
      "2211001",
      "1400100",
      "2704302",
      "1302603"
    ),
    territory_name = c(
      "Natal",
      "Goiânia",
      "Salvador",
      "Campo Grande",
      "Florianópolis",
      "Palmas",
      "Rio de Janeiro",
      "João Pessoa",
      "Teresina",
      "Boa Vista",
      "Maceió",
      "Manaus"
    ),
    territory_state = c(
      "RN",
      "GO",
      "BA",
      "MS",
      "SC",
      "TO",
      "RJ",
      "PB",
      "PI",
      "RR",
      "AL",
      "AM"
    )
  )

# acrescentanto base ao pacote
usethis::use_data(territories, overwrite = TRUE)
