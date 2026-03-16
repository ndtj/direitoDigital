library(tidyverse)

busca <- r"(mci OU "marco civil da internet")"

tjsp::tjsp_baixar_cjpg(busca,
                       diretorio = here::here("data-raw/mci/cjpg"))



cjpg <- tjsp::tjsp_ler_cjpg(diretorio = "data-raw/mci/cjpg")

cjpg <- cjpg |>
    filter(str_detect(classe, "^Procedimento.*Cível"))

cjpg <- cjpg |>
       mutate(basename = str_replace_all(cd_doc,"\\W+","_") |> paste0(".json"))


perguntas <- c("Faça um breve resumo da decisão",
               "Quais os principais tópicos ou conflitos tratados na decisão? separe-os por ponto e vírgula",
               "Quais os principais fundamentos da decisão? separe-os por ponto e vírgula",
               "Quais direitos teriam sido violados segundo o requerente? separe-os por ponto e vírgula",
               "Qual o nome do requerente",
               "O requerente é pf ou pj? responda apenas pf ou pj",
               "Qual o nome do requerido",
               "O requerido é pessoa jurídica ou pessoa física? responda apenas pj  ou pf",
               "O pedido foi procedente, improcedente ou parcialmente procedente? responda apenas procedente, improcedente ou parcial",
               "Se o pedido foi julgado procedente ou parcialmente procedente, em quais direitos o juíz baseou sua decisão? separe-os por ponto e vírgula")

colunas <- c("resumo","topicos","fundamentos","direitos_requerente","requerente","pessoa_requerente", "requerido","pessoa_requerido", "merito","direitos_procedencia")

purrr::walk2(cjpg$julgado, cjpg$basename, purrr::possibly(~{

  #Sys.sleep(1)
  arquivo <- file.path(here::here("data-raw/mci/gpt"),.y)

  JurisMiner::gpt_extrair(.x,
                             #instrucao = "Você é um estagiário de direito responsável por ler decisões judiciais do TJSP e extrair informações relevantes",
                             perguntas = perguntas,
                             chaves = colunas,

                             ) |>
    write(arquivo)

},NULL), .progress = TRUE)


a <- JurisMiner::listar_arquivos("data-raw/mci/gpt")

df <- JurisMiner::gpt_ler(a, colunas)
df <- df |>
   dplyr::mutate(cd_doc = stringr::str_extract(nome_arquivo, "\\w+"))

cjpg2 <- cjpg |>
   anti_join(df, by = c("basename"="nome_arquivo"))

