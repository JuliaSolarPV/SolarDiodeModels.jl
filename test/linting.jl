using SolarDiodeModels
using Test

using Aqua: Aqua
using JET: JET

@testset "Aqua tests" begin
    @info "...with Aqua.jl"
    Aqua.test_all(SolarDiodeModels)
end

if VERSION > v"1.11" # JET v0.10 requires Julia v1.12
    @testset "JET tests" begin
        @info "...with JET.jl"
        JET.test_package(SolarDiodeModels; target_modules = (SolarDiodeModels,))
    end
end
