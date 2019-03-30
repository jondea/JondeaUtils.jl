__precompile__()

module JondeaUtils

export real_cols_to_complex, 
       flatten,
       rel_abs_error,
       max_rel_abs_error,
       offsetmap,
       diffhankelh1,
       diffbesselj,
       fresnels,
       fresnelc,
       reds,
       greens,
       blues,
       angle,
       round,
       ceil,
       floor

import OffsetArrays: OffsetArray
import SpecialFunctions: hankelh1, besselj, erf
import Colors: RGB
import StaticArrays: SVector

import Base.angle
import Base.round
import Base.ceil
import Base.floor

include("special_functions.jl")
include("array.jl")
include("plot.jl")
include("maths.jl")

end # module
