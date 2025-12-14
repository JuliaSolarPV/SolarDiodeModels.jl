module DiodeModels

using DocStringExtensions: TYPEDSIGNATURES, TYPEDFIELDS
using ModelingToolkitStandardLibrary
using ModelingToolkit

abstract type DiodeModel end

include("desoto.jl")
include("pvsyst.jl")

export DiodeModel, DeSoto, PVsyst

end # module