library(tidyverse)

busca <- r"("marco civil da internet")"

tjsp::tjsp_baixar_cjpg(busca,
                       paginas = 1:100,
                       diretorio = "data-raw/mci/cjpg")


cjpg <- tjsp::tjsp_ler_cjpg(diretorio = "data-raw/mci/cjpg")

cjpg <- cjpg |>
       mutate(basename = str_replace_all(cd_doc,"\\W+","_") |> paste0(".json"))

cjpg |>
   count(classe, sort = T) |>
  View()

perguntas <- c("Faça um breve resumo da decisão",
               "Quais os principais tópicos ou conflitos tratados na decisão? separe-os por ponto e vírgula",
               "Qual o nome do requerente",
               "Qual o nome do requerido",
               "O pedido foi procedente, improcedente ou parcialmente procedente? responda apenas provido, improvido ou parcial")

colunas <- c("resumo","topicos","requerente","requerido","merito")

purrr::walk2(cjpg$julgado[19:100], cjpg$basename[19:100], purrr::possibly(~{

  Sys.sleep(1)
  arquivo <- file.path(here::here("data-raw/mci/gpt"),.y)

  JurisMiner::gemini_extrair(.x,
                             instrucao = "Você é um estagiário de direito responsável por ler decisões judiciais do TJSP e extrair informações relevantes",
                             perguntas = perguntas,
                             colunas = colunas
                             ) |>
    write(arquivo)

},NULL))


a <- JurisMiner::listar_arquivos("data-raw/mci/gpt")

df <- JurisMiner::gpt_ler(a, colunas)

