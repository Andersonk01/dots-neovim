# 🚀 Neovim LazyVim Custom Configuration

Uma configuração personalizada do Neovim baseada em [LazyVim](https://github.com/LazyVim/LazyVim) com foco em melhorar a experiência de desenvolvimento através de um layout IDE moderno usando sidebars interativas.

## ✨ Principais Características

- 🧠 **IDE Layout Moderno**: Sidebars personalizáveis e integração entre File Explorer e Code Outline
- 🤖 **GitHub Copilot**: Integração completa com sugestão de código e chat
- 🚦 **LSP Completo**: Suporte ao Language Server Protocol para múltiplas linguagens
- 🌲 **Treesitter**: Syntax highlighting avançado e navegação de código
- 🔍 **Diagnósticos**: Visualização organizada de erros e avisos
- 🖼️ **Tema Tokyo Night**: Interface elegante e moderna

## 📋 Estrutura do Projeto

```
~/.config/nvim/
├── init.lua                 # Ponto de entrada da configuração
├── lazy-lock.json           # Versões fixadas dos plugins
├── SIDEBAR_ATALHOS.md       # Documentação dos atalhos de teclado
├── lua/
│   ├── config/              # Configurações principais
│   │   ├── lazy.lua         # Configuração do gerenciador de plugins
│   │   ├── options.lua      # Opções do Neovim
│   │   ├── keymaps.lua      # Atalhos de teclado personalizados
│   │   └── autocmds.lua     # Comandos automáticos
│   └── plugins/             # Configuração de plugins
│       ├── edgy.lua         # Configuração de sidebars
│       └── ...              # Outros plugins personalizados
```

## 🧩 Plugins Principais

Esta configuração inclui diversos plugins cuidadosamente selecionados:

- [**edgy.nvim**](https://github.com/folke/edgy.nvim): Gerenciamento de sidebars e painéis
- [**aerial.nvim**](https://github.com/stevearc/aerial.nvim): Visualização da estrutura do código
- [**neo-tree.nvim**](https://github.com/nvim-neo-tree/neo-tree.nvim): Explorador de arquivos moderno
- [**copilot.lua**](https://github.com/zbirenbaum/copilot.lua): Integração com GitHub Copilot
- [**trouble.nvim**](https://github.com/folke/trouble.nvim): Gerenciamento de diagnósticos LSP
- [**nvim-treesitter**](https://github.com/nvim-treesitter/nvim-treesitter): Suporte avançado de sintaxe
- [**mason.nvim**](https://github.com/williamboman/mason.nvim): Gerenciador de LSP, formatters e linters

## ⌨️ Layout e Organização das Sidebars

### Painel Esquerdo
- **Explorer & Outline**: Combinação de navegador de arquivos e visualização da estrutura do código

### Painel Direito
- **Git**: Status e alterações do Git
- **Buffers**: Lista de buffers abertos

### Painel Inferior
- **Terminal**: Terminal integrado
- **QuickFix**: Lista de problemas e resultados de busca
- **Help**: Janelas de ajuda

## 🔑 Atalhos de Teclado Principais

Consulte o arquivo [SIDEBAR_ATALHOS.md](./SIDEBAR_ATALHOS.md) para uma lista completa dos atalhos de teclado relacionados às sidebars.

### Atalhos Globais Essenciais
- `<leader>ue`: Alternar visibilidade das sidebars
- `<leader>uE`: Selecionar janela do sidebar
- `<leader>o`: Alternar visualização da estrutura do código (Outline)
- `<leader>tt`: Abrir terminal flutuante
- `<leader>xx`: Mostrar diagnósticos do documento atual

## 🛠️ Instalação

1. Faça backup da sua configuração atual do Neovim:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/neovim-config.git ~/.config/nvim
   ```

3. Inicie o Neovim:
   ```bash
   nvim
   ```

4. Os plugins serão instalados automaticamente na primeira execução.

## 📚 Personalização

- Edite arquivos em `lua/config/` para modificar opções básicas
- Adicione ou modifique plugins em `lua/plugins/`
- Crie novos arquivos de configuração para adicionar funcionalidades específicas

## ⚙️ Requisitos

- Neovim 0.9.0 ou superior
- Git
- Fonte com suporte a ícones (recomendado: Nerd Font)
- Node.js para o GitHub Copilot e alguns LSPs
- Ripgrep para busca de texto

## 🙏 Agradecimentos

- [LazyVim](https://github.com/LazyVim/LazyVim) pela excelente base de configuração
- [Folke](https://github.com/folke) por seus incríveis plugins (edgy.nvim, trouble.nvim, etc.)
- Todos os mantenedores dos plugins utilizados

---

📝 **Nota**: Esta configuração é um trabalho em progresso e pode ser personalizada de acordo com suas preferências.
