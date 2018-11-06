# Collection of utilities for special functions (Bessel/Hankel)

"Derivative of Hankel function of first kind, with respect to argument (z)"
function diffhankelh1(n,z)
    if n!=0
        0.5*(hankelh1(-1 + n, z) - hankelh1(1 + n, z))
    else
        - hankelh1(1, z)
    end
end

"Derivative of Bessel function of first kind, with respect to argument (z)"
function diffbesselj(n,z)
    if n!=0
        0.5*(besselj(-1 + n, z) - besselj(1 + n, z))
    else
        - besselj(1, z)
    end
end

fresnels(z::T) where T = T((1+im)//4*(erf((1+im)//2*sqrt(T(π))*z) - im*erf((1-im)//2*sqrt(T(π))*z) ))

fresnelc(z::T) where T = T((1-im)//4*(erf((1+im)//2*sqrt(T(π))*z) + im*erf((1-im)//2*sqrt(T(π))*z) ))
