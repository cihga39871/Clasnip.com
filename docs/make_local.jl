#!julia --color=yes
push!(LOAD_PATH,"../src/")

using Documenter

makedocs(
    sitename="Clasnip Documentation",
    pages = [
        "Home" => "index.md",
        "Manual" => "manual.md",
        "Change Log" => "changelog.md"
    ]
)
