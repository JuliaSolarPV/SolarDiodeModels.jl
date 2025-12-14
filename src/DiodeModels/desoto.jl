"""
    DeSoto

A struct representing the DeSoto diode model.

# Fields
$(TYPEDFIELDS)

# Constructor
- `DeSoto()`: Creates a new instance of the DeSoto diode model.

"""
struct DeSoto <: DiodeModel end

function (d::DeSoto)(; kwargs...)
    print("DeSoto diode model component called with kwargs: ", kwargs, "\n")
end