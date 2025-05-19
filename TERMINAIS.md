# 🖥️ Guia de Terminais no Neovim

Este guia explica como usar terminais dentro do Neovim, tanto os integrados no LazyVim quanto os configurados com ToggleTerm.

## 🚀 Terminal Flutuante (ToggleTerm)

O terminal flutuante é uma janela que aparece no centro da tela, perfeito para comandos rápidos sem perder o contexto do código.

### Atalhos

| Atalho       | Ação                           |
|--------------|--------------------------------|
| `<leader>tt` | Abrir/fechar terminal flutuante |
| `<C-\>`      | Alternar visibilidade do terminal |

### Exemplo
```
┌───────────────────────────────────────────┐
│                                           │
│                                           │
│         ┌─────────────────────┐           │
│         │ Terminal flutuante  │           │
│         │ $ _                 │           │
│         │                     │           │
│         └─────────────────────┘           │
│                                           │
│                                           │
└───────────────────────────────────────────┘
```

## 🧩 Terminais Integrados do LazyVim

O LazyVim oferece atalhos padrão para terminais integrados:

| Atalho       | Ação                           |
|--------------|--------------------------------|
| `<leader>ft` | Terminal (Diretório do Projeto) |
| `<leader>fT` | Terminal (Diretório Atual)     |
| `<c-/>`      | Terminal (Diretório do Projeto) |

## ⌨️ Navegação no Terminal

Quando estiver dentro de um terminal:

| Atalho   | Ação                                |
|----------|-------------------------------------|
| `<Esc>`  | Sair do modo inserção (modo normal) |
| `<C-h>`  | Mover para janela à esquerda        |
| `<C-j>`  | Mover para janela abaixo            |
| `<C-k>`  | Mover para janela acima             |
| `<C-l>`  | Mover para janela à direita         |

## 💡 Dicas

1. **Modo Normal vs Inserção**: No terminal, você começa em modo de inserção. Pressione `<Esc>` para entrar no modo normal onde pode usar comandos do Vim.

2. **Copiar e Colar**: 
   - No modo normal, você pode selecionar texto com `v` e copiar com `y`
   - Cole no terminal com `p` (modo normal) ou `<C-r>"` (modo inserção)

3. **Executar Comandos**: 
   - Para executar comandos no diretório do projeto atual, use `<leader>ft`
   - Para executar no diretório exato onde você está, use `<leader>fT`

4. **Múltiplas Instâncias**: Você pode abrir múltiplos terminais simultâneos

5. **Tamanho do Terminal**: O terminal flutuante ocupa 80% da tela, ideal para visualização confortável

## 🔄 Comandos Úteis

```vim
" Abrir o terminal flutuante a qualquer momento
:ToggleTerm direction=float

" Fechar todos os terminais
:ToggleTermToggleAll
```

## 🛠️ Personalização

Se quiser modificar os terminais, edite o arquivo:
```
~/.config/nvim/lua/plugins/toggleterm.lua
```

Você pode ajustar o tamanho, aparência e comportamento do terminal flutuante conforme sua preferência.

---

*Nota: O prefixo `<leader>` geralmente é a tecla de espaço. Ex: `<leader>tt` = pressionar espaço, depois tt.* 