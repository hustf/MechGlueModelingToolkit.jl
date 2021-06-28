using Test
using MechGlueModelingToolkit
import MechGlueModelingToolkit.Unitfu
using Unitfu:s, @u_str
using ModelingToolkit
using ModelingToolkit: Symbolic, Variable, Differential, @syms, @variables








t = Variable{typeof(1.0s)}(:t)()
x = Variable{u"kg"}(:x)(t)
y = Variable{u"kg"}(:y)(t)
D = Differential(t)

eq1 = x ~ y*t
eq2 = x*10u"s" ~ y*t

@test ModelingToolkit.instantiate(t) == 1u"s"
@test ModelingToolkit.instantiate(x) == 1u"kg"
@test ModelingToolkit.instantiate(y) == 1u"kg"

@test !ModelingToolkit.validate(eq1)
@test ModelingToolkit.validate(eq2)

eqs = [
        D(x) ~ y/t
        D(y) ~ (x*y)/(t*10u"kg")
]

sys = ODESystem(eqs,t,[x,y],[])
@test ModelingToolkit.validate(sys)










@testset "MechGlueModelingToolkit.jl" begin
    # Write your tests here.
end
