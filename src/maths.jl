
"""
    angle(v::AbstractVector{<:Real}) -> Float

Angle the vector `v` makes with the x axis, throws error if vector is not of size 2
"""
function angle(v::AbstractVector{<:Real})
    if length(v)!=2 error("Vector must be of length 2") end
    atan(v[2],v[1])
end

angle(v::SVector{2, <:Real})  = atan(v[2],v[1])

"""
    sqrt(z, branchcutangle::Real=π) -> typeof(z)

Return \\sqrt{x}, analytically continued from real line with the branch cut from 0 in a straight line along `branchcutangle`
"""
function sqrt(z, branchcutangle::Real)

    if branchcutangle > 0
        if angle(z) > branchcutangle return -sqrt(z) end
    else
        if angle(z) < branchcutangle return -sqrt(z) end
    end

    return sqrt(z)
end

"""
    round(num::Real, base::Real) -> Real

Nearest multiple of `base` to `num`, result will be promoted to num and base
"""
round(num::Real, base::Real) = round(num/base)*base

"""
    ceil(num::Real, base::Real) -> Real

Smallest multiple of `base` greater than `num`, result will be promoted to num and base
"""
ceil(num::Real, base::Real) = ceil(num/base)*base

"""
    ceil(num::Real, base::Real) -> Real

Largest multiple of `base` smaller than `num`, result will be promoted to num and base
"""
floor(num::Real, base::Real) = floor(num/base)*base

