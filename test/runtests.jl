using JondeaUtils
import Test: @test, @test_throws
import SpecialFunctions: hankelh1, besselj
import Colors: RGB
import OffsetArrays: OffsetArray
import StaticArrays: SVector

@test flatten([[1,2],[3,4]]) == [1,2,3,4]
@test flatten([[1.0,2.0],[3.0,4.0]]) == [1.0,2.0,3.0,4.0]

@test flatten([1 3; 2 4]) == [1,2,3,4]
@test flatten([1.0 3.0; 2.0 4.0]) == [1.0,2.0,3.0,4.0]

@test real_cols_to_complex([1 2;3 4]) == reshape([1+2im, 3+4im],2,1)

@test rel_abs_error(1.0+0.0im,1.0+0.1im) ≈ 0.1
@test max_rel_abs_error([1.0im,2.0im],[1.1im,2.4im]) ≈ 0.2

@test offsetmap(x->x^2, -2:2) == OffsetArray([4,1,0,1,4],-2:2)

finite_diff(f,x,ε) = (f(x+ε) - f(x))/ε
@test diffhankelh1(0,2.0+1.0im) ≈ finite_diff(z->hankelh1(0,z),2.0+1.0im,1.0e-8im) atol=1.0e-6
@test diffhankelh1(1,2.0+1.0im) ≈ finite_diff(z->hankelh1(1,z),2.0+1.0im,1.0e-8im) atol=1.0e-6
@test diffbesselj(0,2.0+1.0im) ≈ finite_diff(z->besselj(0,z),2.0+1.0im,1.0e-8im) atol=1.0e-6
@test diffbesselj(1,2.0+1.0im) ≈ finite_diff(z->besselj(1,z),2.0+1.0im,1.0e-8im) atol=1.0e-6

@test fresnels(1.0)::Float64 ≈ 0.4382591473903548
@test fresnelc(1.0)::Float64 ≈ 0.7798934003768228

@test fresnels(1.0f0)::Float32 ≈ 0.4382591f0
@test fresnelc(1.0f0)::Float32 ≈ 0.7798934f0

@test all(reds(3) .≈ [RGB(1.0,0.4,0.4) RGB(0.8,0.3,0.3) RGB(0.6,0.2,0.2)])
@test all(greens(3) .≈  [RGB(0.4,1.0,0.4) RGB(0.3,0.8,0.3) RGB(0.2,0.6,0.2)])
@test all(blues(3) .≈ [RGB(0.4,0.4,1.0) RGB(0.3,0.3,0.8) RGB(0.2,0.2,0.6)])

@test reds(1) == reshape([RGB(0.8,0.3,0.3)],1,1)
@test greens(1) == reshape([RGB(0.3,0.8,0.3)],1,1)
@test blues(1) == reshape([RGB(0.3,0.3,0.8)],1,1)

# Test some known values
@test angle([1,0]) ≈ 0
@test angle([1.0,1.0]) ≈ π/4
@test angle([0,1]) ≈ π/2
@test angle([-1,-1]) ≈ -3π/4

# Test using SVector type
@test angle(SVector(1,0)) ≈ 0
@test angle(SVector(1,1)) ≈ π/4
@test angle(SVector(0,1)) ≈ π/2
@test angle(SVector(-1,-1)) ≈ -3π/4

# Type stability
@test typeof(angle([0.9, -1.5]))     == Float64
@test typeof(angle([0.9f0, -1.5f0])) == Float32

# Test errors
@test_throws Exception angle([1])
@test_throws Exception angle([1,2,3])
@test_throws Exception angle(SVector(1))
@test_throws Exception angle(SVector(3))

# Branch cut at π should be same as built-in function
@test all(     sqrt.(exp.(im.*range(-π,stop=π,length=21)), π) 
           .== sqrt.(exp.(im.*range(-π,stop=π,length=21))))

# Hand picked examples where specific branches should be picked
@test sqrt.(-1.0+1.0im, π/2) == -sqrt(-1.0+1.0im)
@test sqrt.( 1.0+1.0im, π/2) ==  sqrt( 1.0+1.0im)

# Values along real line should always be the same
@test all(     sqrt.(range(0,stop=100,length=5), range(-π,stop=π,length=7)') 
           .== sqrt.(range(0,stop=100,length=5)))

# Test floor function
@test floor(11, 10) ≈ 10
@test floor(15, 10) ≈ 10
@test floor(19, 10) ≈ 10

# Test round function
@test round(11, 10) ≈ 10
@test round(15, 10) ≈ 20
@test round(19, 10) ≈ 20

# Test ceil function
@test ceil(11, 10) ≈ 20
@test ceil(15, 10) ≈ 20
@test ceil(19, 10) ≈ 20
