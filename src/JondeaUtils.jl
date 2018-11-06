__precompile__()

module JondeaUtils

export real_cols_to_complex, 
       flatten,
       rel_abs_error,
       max_rel_abs_error,
       diffhankelh1,
       diffbesselj,
       fresnels,
       fresnelc,
       print_with_bash_colour,
       reds,
       greens,
       blues

import SpecialFunctions: hankelh1, besselj, erf
import Colors: RGB

include("special_functions.jl")
include("array.jl")
include("io.jl")
include("plot.jl")

end # module
