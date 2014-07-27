module FixedPoint

import Base: convert, promote_rule, show, showcompact, isinteger, abs,
             zero, one, typemin, typemax, realmin, realmax, eps, sizeof, reinterpret,
             trunc, round, floor, ceil, itrunc, iround, ifloor, iceil, bswap,
             div, fld, rem, mod, mod1, rem1, fld1, min, max,
             start, next, done

abstract AbstractFixed <: Real
abstract  Fixed <: AbstractFixed
abstract Ufixed <: AbstractFixed  # unsigned variant

export
    AbstractFixed,
    Fixed,
    UFixed,
    Fixed32,
    Ufixed8,
    Ufixed10,
    Ufixed12,
    Ufixed14,
    Ufixed16,
    # literal constructor constants
    uf8,
    uf10,
    uf12,
    uf14,
    uf16

reinterpret(x::AbstractFixed) = x.i

include("fixed32.jl")
include("ufixed.jl")

for T in tuple(Fixed32, UF...)
    R = rawtype(T)
    @eval begin
        reinterpret(::Type{$R}, x::$T) = x.i
    end
end

end # module
