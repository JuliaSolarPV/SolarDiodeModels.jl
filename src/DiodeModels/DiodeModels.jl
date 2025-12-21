module DiodeModels

using DocStringExtensions: TYPEDSIGNATURES, TYPEDFIELDS
using ModelingToolkitStandardLibrary.Electrical: Resistor, Diode, Current, Pin
using ModelingToolkitStandardLibrary.Thermal: HeatPort
using ModelingToolkit: t_nounits as t, @variables, @parameters, @named, @component
using ModelingToolkit: connect, System
using DynamicQuantities

abstract type DiodeModel end

include("desoto.jl")
include("pvsyst.jl")
include("singlediode.jl")

export DiodeModel, DeSoto, PVsyst

end # module