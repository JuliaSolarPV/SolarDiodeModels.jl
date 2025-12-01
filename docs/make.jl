using SolarDiodeModels
using Documenter
using DocStringExtensions
using DocumenterCitations

DocMeta.setdocmeta!(
    SolarDiodeModels,
    :DocTestSetup,
    :(using SolarDiodeModels;
    using Dates;
    obs = Observer(37.7749, -122.4194, 100.0);
    dt = DateTime(2023, 6, 21, 12, 0, 0));
    recursive = true,
)

# Setup bibliography
bib = CitationBibliography(joinpath(@__DIR__, "src", "refs.bib"), style = :alpha)

page_rename = Dict("developer.md" => "Developer docs") # Without the numbers
numbered_pages = [
    file for file in readdir(joinpath(@__DIR__, "src")) if
    file != "index.md" && splitext(file)[2] == ".md"
]

makedocs(;
    modules = [SolarDiodeModels],
    authors = "Stefan de Lange",
    repo = Documenter.Remotes.GitHub("JuliaSolarPV", "SolarDiodeModels.jl"),
    sitename = "SolarDiodeModels.jl",
    format = Documenter.HTML(;
        canonical = "https://juliasolarpv.github.io/SolarDiodeModels/stable/",
        size_threshold = 2^20, # 1 MB
    ),
    plugins = [bib],
    pages = [
        "index.md",
        "Guides" => [
            "guides/getting-started.md",
            "guides/plotting.md",
            "guides/parallel.md",
            "guides/modelingtoolkit.md",
            "guides/new-algorithm.md",
        ],
        "reference.md",
        "positioning.md",
        "refraction.md",
        "deltat.md",
        "literature.md",
        "contributing.md",
    ],
)

deploydocs(;
    repo = "github.com/JuliaSolarPV/SolarDiodeModels.jl",
    versions = ["stable" => "v^", "v#.#"], # Restrict to minor releases
    push_preview = true,
)
