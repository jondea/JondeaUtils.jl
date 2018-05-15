using JondeaUtils
using Base.Test

@test flatten([[1,2],[3,4]]) == [1,2,3,4]
@test flatten([[1.0,2.0],[3.0,4.0]]) == [1.0,2.0,3.0,4.0]

@test flatten([1 3; 2 4]) == [1,2,3,4]
@test flatten([1.0 3.0; 2.0 4.0]) == [1.0,2.0,3.0,4.0]

@test real_cols_to_complex([1 2;3 4]) == reshape([1+2im, 3+4im],2,1)

finite_diff(f,x,ε) = (f(x+ε) - f(x))/ε
@test diffhankelh1(0,2.0+1.0im) ≈ finite_diff(z->hankelh1(0,z),2.0+1.0im,1.0e-8im) atol=1.0e-6
@test diffbesselj(0,2.0+1.0im) ≈ finite_diff(z->besselj(0,z),2.0+1.0im,1.0e-8im) atol=1.0e-6

print_with_bash_colour("This should be red\n",255,0,0)
print_with_bash_colour("This should be green\n",0,255,0)
print_with_bash_colour("This should be blue\n",0,0,255)
print_with_bash_colour("This should be white and bold\n",255,255,255; bold=true)
println("This should be unbold and your normal terminal colour")
println("")
@test true 
