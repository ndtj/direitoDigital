
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Direito Digital

<!-- badges: start -->

<!-- badges: end -->

Curso de Direito Digital (DIR-MA3/DIR-MB3, PUC-SP), 2º semestre de 2026,
conforme o [Plano de
Ensino](documentos/Plano%20de%20Ensino%20-%20Direito%20Digital%20-%20DIR-MA3%20e%20DIR-MB3%20-%202026.2.pdf).

## Cronograma e slides

| Aula | Data | Conteúdo | Slide |
|----|----|----|----|
| 1 | 04/08 | Panorama geral do Direito Digital | [Constitucionalismo digital](https://ndtj.github.io/direitoDigital/slides/constitucionalismo_digital.html) |
| 2 | 11/08 | Marco Civil da Internet — Fundamentos, Princípios e Garantias | [slides](https://ndtj.github.io/direitoDigital/slides/mci1.html) |
| 3 | 18/08 | Marco Civil da Internet — Panorama geral | [slides](https://ndtj.github.io/direitoDigital/slides/mci3.html) |
| 4 | 25/08 | Marco Civil da Internet — Artigo 19 constitucional ou não? | [slides](https://ndtj.github.io/direitoDigital/slides/mci_2026_12.html) |
| 5 | 01/09 | LGPD — Princípios, Bases Legais e Fundamentos | [slides](https://ndtj.github.io/direitoDigital/slides/aula_lgpd.html) |
| 6 | 08/09 | LGPD — Anonimização e o limite da proteção | [slides](https://ndtj.github.io/direitoDigital/slides/aula_lgpd.html) |
| 7 | 15/09 | LGPD e Segurança Pública — Sistemas de reconhecimento facial | [ECA Digital (Lei Felca)](https://ndtj.github.io/direitoDigital/slides/felca.html) ⚠︎ |
| 8 | 22/09 | IA e Direito — Conceitos básicos + personalidade jurídica | [slides](https://ndtj.github.io/direitoDigital/slides/ia_e_direito.html) |
| 9 | 29/09 | IA e Direito — Regulamentações nacionais e internacionais | [slides](https://ndtj.github.io/direitoDigital/slides/ia_e_direito.html) |
| 10–11 | 06 e 13/10 | Seminário em grupo (apresentações) | — |
| 12 | 20/10 | Prova do 1º bimestre | — |
| 13 | 27/10 | Contratos eletrônicos — fundamentos, princípios, direitos e deveres | *em produção* |
| 14 | 03/11 | Prova do 2º bimestre | — |
| 15 | 10/11 | Neurodireitos e seus fundamentos | *em produção* |
| 16 | 17/11 | Direito Digital e Segurança Jurídica — Novas tecnologias | [Segurança cibernética](https://ndtj.github.io/direitoDigital/slides/ciber.html) |
| 17 | 24/11 | Crimes digitais e o ciberespaço | [slides](https://ndtj.github.io/direitoDigital/slides/crimes_digitais.html) |
| 18 | 08/12 | Exame (alunos abaixo da média) | — |

Aulas 5–6 e 8–9 reaproveitam o mesmo deck (`aula_lgpd.qmd` e
`ia_e_direito.qmd`, respectivamente), dividido em partes/módulos ao
longo de duas sessões.

⚠︎ Aula 7: `felca.qmd` foi mapeado para esta aula por tratar de
verificação de idade e biometria no contexto do ECA Digital — é o
encaixe mais próximo disponível, mas não cobre reconhecimento facial e
segurança pública como tema central; ajustar se o enfoque da aula for
outro.

Slides marcados como *em produção* ainda não têm deck correspondente e
são a próxima etapa de trabalho.

## Materiais complementares

Não fazem parte do cronograma de uma aula específica acima, mas ficam
disponíveis:

- [Marco Civil da Internet — comentários a
  dispositivos](https://ndtj.github.io/direitoDigital/slides/mci2.html)

- [Engenharia de prompt aplicada ao
  Direito](https://ndtj.github.io/direitoDigital/slides/prompt.html)
  ([tutorial em
  texto](https://ndtj.github.io/direitoDigital/slides/tutorial_prompt.html))

Versões anteriores das aulas de LGPD e Marco Civil da Internet ficam
arquivadas em [`slides/arquivo/`](slides/arquivo/), fora do conjunto de
slides em uso corrente.

## Como renderizar os slides

Os slides são escritos em [Quarto](https://quarto.org) (`.qmd`, formato
`revealjs`). Para renderizar localmente:

    quarto render slides/<arquivo>.qmd

O `.html` gerado e a pasta `slides/<arquivo>_files/` devem ser
commitados junto com o `.qmd` — não há build automático; o GitHub Pages
publica esses arquivos diretamente do branch `main`.
