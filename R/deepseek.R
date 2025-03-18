#!/usr/bin/env Rscript

deepseek="sk-5bac0c1f50af4da783b924d8f8378799"

cjpg <- readRDS(here::here("data/mci_cjpg.rds"))

pergunta <- "Responda às seguintes perguntas:
Faça um resumo da decisão,
Quais os principais assuntos? separe-os por ponto e vírgula,
Quais os artigos do marco civil da internet mencionados,
Qual o nome do requerente,
Qual o nome do requerido,
O requerente é pessoa física ou jurídica? responda pf ou pj,
O requerido é pessoa física ou jurídica? responda pf ou pj,
Quais os direitos teriam sido violados, separe-os por ponto e vírgula,
Houve indenização por dano moral? responda sim ou não,
Houve indenização por dano material? responda sim ou não,
A decisão foi procededente, improcedente ou parcialmente procedente? responda procedente, improcedente ou parcialmente"

diretorio <- here::here("data-raw/mci/deepseek")

future::plan(future.callr::callr, workers = 10)

furrr::future_walk2(cjpg$julgado, cjpg$cd_doc, purrr::possibly(~{

  instrucao <- glue::glue("Considere o a decisão judicial a seguir, demarcada por três apóstrofes: ```{.x}```.
Você irá responder a uma série de perguntas a respeito dessa decisão e retornar um json
 estruturado com as seguintes chaves: resumo, assuntos, artigo_mci, requerente,requerido,
pessoa_requerente, pessoa_requerido, direito_violado,
indenizacao_dano_moral, indenizacao_dano_material e  merito.")

  chat <- ellmer::chat_deepseek(system_prompt = instrucao,
                                api_key = deepseek,
                                model="deepseek-chat")

  .y <- stringr::str_replace_all(.y,"-","_") |>
    paste0(".json")

  arquivo <- file.path(diretorio,.y)

  chat$chat(pergunta, echo= FALSE) |>
    write(arquivo)

}, NULL))
