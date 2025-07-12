if status is-interactive
    # Starship custom prompt
    starship init fish | source

    # Custom colours
    cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end
end
# set -gx PATH $HOME/miniconda3/bin $PATH  # commented out by conda initialize


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/ramonavocado/miniconda3/bin/conda
    eval /home/ramonavocado/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/ramonavocado/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/ramonavocado/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/ramonavocado/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

