"""Unit tests for SolarDiodeModels.jl."""

using SolarDiodeModels: SingleDiode
using ModelingToolkit: @named, ODESystem

@testset "SingleDiode constructor" begin
    @named diode = SingleDiode()
    @test diode isa ODESystem
end