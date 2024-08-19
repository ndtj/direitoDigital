
busca <- r"("A disciplina da proteção de dados pessoais tem como fundamentos")"
tjsp::tjsp_baixar_cjpg(busca, diretorio = "data-raw/cjpg")


cjpg <- tjsp::tjsp_ler_cjpg(diretorio = 'data-raw/cjpg')

perguntas <- c("Faça um breve resumo da decisão judicial",
               "Qual o contexto da menção ao artigo 2º da LGPD?"
)
colunas <- c("resumo","lgpd")
purrr::walk2(cjpg$julgado, cjpg$cd_doc, ~{

JurisMiner::gpt_extrair(x = .x,
                              perguntas = perguntas,
                              chaves= colunas,

                              modelo = "gpt-4o-mini") |>
    write(file.path("data-raw/gpt",paste0(.y,".json")))
})

a <- JurisMiner::listar_arquivos("data-raw/gpt")

df1 <- JurisMiner::gpt_ler(a, colunas = colunas)

df1 |>
     DT::datatable()


### LGPD geral

tjsp::tjsp_baixar_cjpg("lgpd", diretorio = "data-raw/cjpg_geral",
                       paginas = 1:10)

cjpg <- tjsp::tjsp_ler_cjpg(diretorio = 'data-raw/cjpg_geral')

cjpg <- cjpg |>
   dplyr::sample_frac()
perguntas <- c("Faça um breve resumo da decisão judicial",
               "Qual o contexto da menção à LGPD?"
)

colunas <- c("resumo","lgpd")

purrr::walk2(cjpg$julgado[1:10], cjpg$cd_doc[1:10], ~{

  JurisMiner::gpt_extrair(x = .x,
                          perguntas = perguntas,
                          chaves= colunas,

                          modelo = "gpt-4o-mini") |>
    write(file.path("data-raw/gpt_geral",paste0(.y,".json")))
})

a <- JurisMiner::listar_arquivos("data-raw/gpt_geral")

df2 <- JurisMiner::gpt_ler(a, colunas = colunas)



