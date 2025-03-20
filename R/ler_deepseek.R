a <- JurisMiner::listar_arquivos(diretorio)

colunas <- c("resumo", "assuntos", "artigo_mci", "requerente", "requerido",
             "pessoa_requerente", "pessoa_requerido", "direito_violado", "indenizacao_dano_moral",
             "indenizacao_dano_material", "merito")

ds <- JurisMiner::gpt_ler(a, colunas = colunas)


saveRDS(ds,"data/deepseek.rds")
