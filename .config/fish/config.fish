if status is-interactive
    # Disable the default Fish welcome message
    set fish_greeting

    # --- TOOL INITIALIZATIONS ---
    # Start Oh-My-Posh with the Tokyo Night theme
    oh-my-posh init fish --config ~/.config/oh-my-posh/tokyonight.omp.json | source
    
    # Start zoxide
    zoxide init fish | source
    pokemon-colorscripts -r --no-title > /tmp/pokemon_logo
    fastfetch --config ~/.config/fastfetch/minimal-pokemon.jsonc --logo /tmp/pokemon_logo --logo-type file-raw

    # --- GENERAL ALIASES ---
    # SSH via Kitty (copies terminal configs)
    #alias ssh="kitten ssh"
    
    # Navigation (Zoxide)
    alias cd="z"

    # File Listing (Eza)
    alias ls="eza --icons"
    alias ll="eza -la --icons --git"
    alias lt="eza --tree --icons"       # Corrected from 'alisa' to 'alias'
    alias lta="eza -a --tree --icons"

    # File Reading (Bat)
    alias cat="bat"
    
    alias mdb="mariadb -u devuser -p"

    # --- ENVIRONMENT VARIABLES ---
    # Bat theme (remember to have downloaded the theme as we discussed before)
    set -gx BAT_THEME "tokyonight_moon"

    # --- FZF (FUZZY FINDER) ---
    # Use 'fd' to find files (faster and ignores .git)
    set -gx FZF_DEFAULT_COMMAND "fd --type f"

    # FZF colors matching Tokyo Night
    set -gx FZF_DEFAULT_OPTS "\
    --height 40% --layout=reverse --border \
    --color=bg+:#2d3f76,bg:#1e2030,spinner:#ff966c,hl:#ff757f \
    --color=fg:#c8d3f5,header:#ff966c,info:#82aaff,pointer:#ff757f \
    --color=marker:#ff007c,fg+:#c8d3f5,prompt:#c099ff,hl+:#ff757f"

    # fzf.fish plugin bindings (Ctrl+F files, Ctrl+R history, Ctrl+Alt+S git)
    # If there's an error here, it's because the plugin is missing: fisher install patrickf1/fzf.fish
    fzf_configure_bindings --directory=\cf --git_status=\e\cs --history=\cr
end