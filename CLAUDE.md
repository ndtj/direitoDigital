# CLAUDE.md

Guia para quem (humano ou IA) for trabalhar neste repositório.

## Visão geral

Material do curso **Direito Digital**: slides de aula em Quarto/revealjs, publicados via GitHub Pages a partir do branch `main` (sem workflow de CI — os arquivos `.html` já renderizados são commitados diretamente e servidos estaticamente em `https://ndtj.github.io/direitoDigital/slides/<arquivo>.html`).

O projeto também contém scripts de pesquisa em R (`R/`) e dados brutos de raspagem de decisões judiciais (`data-raw/`, `data/`, `mci/`) usados em outros trabalhos do autor — não relacionados aos slides de aula.

## Estrutura

- `slides/*.qmd` — fonte dos slides (Quarto Markdown, `format: revealjs`). Cada aula tem seu `.qmd`, `.html` renderizado e uma pasta `<arquivo>_files/` com os assets do revealjs.
- `slides/_metadata.yml` — metadados/tema compartilhados por todos os decks do diretório (ver "Slides" abaixo).
- `slides/arquivo/` — versões antigas de aulas (anos anteriores) que não são mais usadas em sala, mantidas para referência histórica. Não são re-renderizadas nem linkadas no README.
- `README.Rmd` — fonte do README (o `README.md` é gerado a partir dele; edite sempre o `.Rmd`).
- `R/` — scripts avulsos de pesquisa (raspagem/análise de decisões judiciais), fora do escopo dos slides.
- `documentos/` — material de apoio (ex.: resoluções da ANPD em PDF).

## Slides: convenções

- Todo deck ativo (fora de `slides/arquivo/`) herda de `slides/_metadata.yml`: idioma (`pt-BR`), tema revealjs, data (`date: today`, atualizada automaticamente a cada render), autor padrão e opções de exibição (numeração de slide, transição, toc, syntax highlight).
- Cada `.qmd` deve definir no seu próprio YAML apenas o que é específico daquele deck:
  - `title` / `subtitle` — obrigatórios.
  - `footer` — nome curto da aula/lei (ex.: `"LGPD — Lei nº 13.709/2018"`).
  - `author` — só se diferente do padrão em `_metadata.yml`.
  - CSS/estilo inline extra, se o deck precisar de algo além do tema compartilhado (evite introduzir uma paleta nova sem necessidade — o objetivo é manter os decks visualmente parecidos).
- Para renderizar localmente: `quarto render slides/<arquivo>.qmd`. Isso regenera o `.html` e a pasta `<arquivo>_files/` — **ambos devem ser commitados**, pois é o que o GitHub Pages publica (não há build automático).
- Ao adicionar uma nova aula, crie o `.qmd` em `slides/`, renderize, e adicione o link no `README.Rmd`.
- Antes de tratar um deck como "substituído" ou duplicado de outro, confirme qual está linkado no `README.Rmd` — esse é o critério de qual é a versão oficial.

## Commits

Convenção: **Conventional Commits, mensagens em português**, no imperativo/substantivo curto.

Tipos usados neste repositório:
- `feat:` — nova aula/slide ou funcionalidade nova.
- `fix:` — correção de erro (conteúdo errado, link quebrado, referência incorreta).
- `content:` — revisão ou atualização de conteúdo jurídico/factual em um slide já existente (sem ser um "bug").
- `docs:` — README, CLAUDE.md e outra documentação.
- `style:` — mudanças de tema/formatação/metadados visuais dos slides, sem alterar conteúdo.
- `chore:` — organização de arquivos, limpeza, remoção de artefatos órfãos, movimentação de decks legados.

Exemplos:
```
docs: atualiza README com aulas e materiais complementares
style: unifica metadados e tema dos slides principais
chore: move decks legados de LGPD/MCI para slides/arquivo/
content: atualiza referências desatualizadas em ia_e_direito.qmd
```

**Fluxo de trabalho**: cada tarefa lógica (uma mudança coesa e completa) vira um commit próprio, seguido de `git push` para `origin main` antes de passar para a próxima tarefa — não acumule várias tarefas não relacionadas em um único commit, e não deixe trabalho concluído sem *push*.

## Observações
- Evite o uso excessivo de negritos
- Evite o uso excessivo de travessão
