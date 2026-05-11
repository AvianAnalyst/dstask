# Nushell completions for dstask.
#
# Quick install:
#   dstask nushell-completion | save -f ~/.config/nushell/completions/dstask.nu
# Then in your config.nu (or any sourced file):
#   source ~/.config/nushell/completions/dstask.nu

def "nu-complete dstask" [context: string] {
    let raw = ($context | split row " " | where {|x| $x != ""})
    let args = (if ($context | str ends-with " ") {
        $raw | append ""
    } else {
        $raw
    })

    ^dstask _completions ...$args | lines | where {|x| $x != ""}
}

export extern "dstask" [
    ...args: string@"nu-complete dstask"
]
