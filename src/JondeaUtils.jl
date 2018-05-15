__precompile__()

module JondeaUtils

export real_cols_to_complex, 
       flatten,
       diffhankelh1,
       diffbesselj,
       print_with_bash_colour

using SpecialFunctions

include("special_functions.jl")
include("array.jl")
include("io.jl")

end # module
