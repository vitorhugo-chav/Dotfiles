if status is-interactive
    # Desativa a mensagem de boas-vindas padrão do Fish
    set fish_greeting

    # --- INICIALIZAÇÕES DE FERRAMENTAS ---
    # Inicia o Oh-My-Posh com o tema Tokyo Night
    oh-my-posh init fish --config ~/.config/oh-my-posh/tokyonight.omp.json | source
    
    # Inicia o zoxide
    zoxide init fish | source
    pokemon-colorscripts -r --no-title > /tmp/pokemon_logo
    fastfetch --config ~/.config/fastfetch/minimal-pokemon.jsonc --logo /tmp/pokemon_logo --logo-type file-raw

    # --- ALIASES GERAIS ---
    # SSH via Kitty (copia configs de terminal)
    #alias ssh="kitten ssh"
    
    # Navegação (Zoxide)
    alias cd="z"

    # Listagem de Arquivos (Eza)
    alias ls="eza --icons"
    alias ll="eza -la --icons --git"
    alias lt="eza --tree --icons"       # Corrigido de 'alisa' para 'alias'
    alias lta="eza -a --tree --icons"

    # Leitura de Arquivos (Bat)
    alias cat="bat"
    
    alias mdb="mariadb -u devuser -p"

    # --- VARIÁVEIS DE AMBIENTE ---
    # Tema do Bat (lembre-se de ter baixado o tema como falamos antes)
    set -gx BAT_THEME "tokyonight_moon"

    # --- FZF (BUSCADOR FUZZY) ---
    # Usa 'fd' para buscar arquivos (mais rápido e ignora .git)
    set -gx FZF_DEFAULT_COMMAND "fd --type f"

    # Cores do FZF combinando com Tokyo Night
    set -gx FZF_DEFAULT_OPTS "\
    --height 40% --layout=reverse --border \
    --color=bg+:#2d3f76,bg:#1e2030,spinner:#ff966c,hl:#ff757f \
    --color=fg:#c8d3f5,header:#ff966c,info:#82aaff,pointer:#ff757f \
    --color=marker:#ff007c,fg+:#c8d3f5,prompt:#c099ff,hl+:#ff757f"

    # Bindings do plugin fzf.fish (Ctrl+F arquivos, Ctrl+R histórico, Ctrl+Alt+S git)
    # Se der erro aqui, é porque faltou instalar o plugin: fisher install patrickf1/fzf.fish
    fzf_configure_bindings --directory=\cf --git_status=\e\cs --history=\cr
end
