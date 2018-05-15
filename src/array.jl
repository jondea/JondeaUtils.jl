# Collection of utility functions for dealing with arrays

"""
Convert a matrix of real values into complex values by treating alternating
columns as real and imaginary parts
"""
function real_cols_to_complex(mat::Matrix{T}) where {T}
    ncols = size(mat,2)
    out = Matrix{Complex{T}}(size(mat,1), div(ncols,2))
    for col in 1:div(ncols,2)
        out[:,col] .= mat[:,2col-1] .+ mat[:,2col]*im
    end
    return out
end

"Turns vector of vectors into vector by concatenating them together"
function flatten(arr::Vector{Vector{T}}) where {T}
    flattened_arr = Vector{T}(0)
    for i = 1:length(arr)
        append!(flattened_arr, arr[i])
    end
    return flattened_arr
end

"Turns n-dim array into vector"
flatten(a::AbstractArray) = reshape(a, :)
