module MechGlueModelingToolkit
import Unitfu
import Unitfu: AbstractQuantity
import ModelingToolkit
import ModelingToolkit: Num, Symbolic
import Base
import Base.*

Base.:*(x::Union{Num,Symbolic},y::T) where T<: AbstractQuantity = x * y

end
