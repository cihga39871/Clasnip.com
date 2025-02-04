using Documenter

makedocs(
    sitename="Clasnip Documentation",
    pages = [
        "Home" => "index.md",
        "Manual" => "manual.md",
        "Change Log" => "changelog.md"
    ]
)


deploydocs(
    repo = "github.com/cihga39871/Clasnip.com.git",
    devbranch = "main"
)
