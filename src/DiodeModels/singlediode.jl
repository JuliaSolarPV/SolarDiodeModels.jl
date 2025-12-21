"""Single diode models."""

"""
    $(TYPEDSIGNATURES)

Single diode model.

Simplified circuit model:
```
                 +       
  ┌──────┬─────┬──R_s── +
  │      │     │         
- │    + │   + │         
 I_L   diode  R_sh       
  │      │     │         
  │      │     │         
  └──────┴─────┴─────── -
```

Where:
- `I_L`: Light-generated current source
- `R_s`: Series resistance
- `R_sh`: Shunt (parallel) resistance
- `Diode`: PN junction diode
- `pos`, `neg`: Positive and negative terminal outputs
"""
@component function SingleDiode(; name)

    pars = @parameters begin
        R_sh_val = 1000.0, [unit = u"Ω", description = "Shunt resistance"]
        R_ser_val = 0.01, [unit = u"Ω", description = "Series resistance"]
        n = 1.2, [description = "Diode ideality factor"]
        I_s_val = 1e-10, [unit = u"A", description = "Diode saturation current"]
    end

    systems = @named begin
        R_sh = Resistor(R = R_sh_val)
        R_s = Resistor(R = R_ser_val)
        I_L = Current()
        diode = Diode(n = n, Is = I_s_val, T_dep = true)

        # positive and negative output pins
        pos = Pin()
        neg = Pin()

        # heat port for temperature
        heatport = HeatPort()
    end

    eqs = [
        # diode anode (+) side connections
        connect(I_L.n, diode.p)
        connect(I_L.n, R_sh.p)
        connect(I_L.n, R_s.p)

        # diode cathode (-) side connections
        connect(diode.n, R_sh.n)
        connect(I_L.p, R_s.n)

        # positive (+) output
        connect(R_s.n, pos)

        # negative (-) output
        connect(R_sh.n, neg)
        connect(diode.n, neg)

        # temperature connection
        connect(diode.port, heatport)
    ]

    System(eqs, t, [], pars; name, systems)
end