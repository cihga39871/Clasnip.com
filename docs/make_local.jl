#!julia --color=yes
push!(LOAD_PATH,"../src/")

using Documenter

makedocs(
    sitename="Clasnip Documentation",
    pages = [
        "Clasnip Documentation" => "index.md",
        "Manual" => "manual.md",
        "Database Information" => "db_info.md",
        "Create a new Clasnip database" => "create_db.md",
        "Algorithm" => "algorithm.md",
        "Change Log" => "changelog.md"
    ]
)
