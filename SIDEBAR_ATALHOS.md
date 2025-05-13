# Atalhos para Sidebars (Edgy.nvim)

## Atalhos Globais

| Atalho       | Ação                           |
|--------------|--------------------------------|
| `<leader>ue` | Alternar visibilidade sidebars |
| `<leader>uE` | Selecionar janela do sidebar   |
| `<leader>o`  | Alternar Outline               |

## Navegação nas Sidebars

| Atalho | Ação                     |
|--------|--------------------------|
| `q`    | Fechar janela atual      |
| `<c-q>`| Esconder janela atual    |
| `Q`    | Fechar sidebar inteira   |
| `]w`   | Próxima janela visível   |
| `[w`   | Janela visível anterior  |

## Redimensionamento

| Atalho     | Ação                      |
|------------|---------------------------|
| `<c-w>>`   | Aumentar largura          |
| `<c-w><`   | Diminuir largura          |
| `<c-w>+`   | Aumentar altura           |
| `<c-w>-`   | Diminuir altura           |
| `<c-w>=`   | Equalizar tamanhos        |

## Terminal

| Atalho        | Ação                       |
|---------------|----------------------------|
| `<leader>tt`  | Abrir terminal flutuante   |
| `<leader>th`  | Abrir terminal horizontal  |
| `<leader>tv`  | Abrir terminal vertical    |
| `<c-\>`       | Alternar terminal          |

## Diagnósticos (Trouble)

| Atalho        | Ação                          |
|---------------|-------------------------------|
| `<leader>xx`  | Diagnósticos do documento     |
| `<leader>xX`  | Diagnósticos do workspace     |
| `<leader>xL`  | Lista de localização          |
| `<leader>xQ`  | Lista de quickfix             |
| `gR`          | Referências LSP               |

## Explorador de Arquivos & Outline

A sidebar esquerda contém uma visão integrada:
- **Explorer**: Navegação de arquivos do projeto
- **Outline**: Estrutura do código do arquivo atual

### Atalhos do Explorer (Neo-tree)

| Atalho       | Ação                           |
|--------------|--------------------------------|
| `<leader>ue` | Mostrar/esconder o Explorer    |
| `<leader>uE` | Selecionar a janela do sidebar |
| `o`          | Alternar visualização do Outline |

### Atalhos do Outline (Aerial)

| Atalho       | Ação                           |
|--------------|--------------------------------|
| `<leader>o`  | Alternar Outline               |
| `[y`         | Item anterior                  |
| `]y`         | Próximo item                   |
| `[Y`         | Item pai anterior              |
| `]Y`         | Próximo item pai               |

O Outline é aberto automaticamente quando o Explorer é aberto e exibe a estrutura do código do arquivo atual, facilitando a navegação por funções, classes, métodos e outras estruturas importantes. 