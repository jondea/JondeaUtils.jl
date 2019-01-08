
"Returns 1xN equally spaced reds going from light to dark for plotting"
function reds(N::Int)
    colors = N==1 ? [RGB(0.8,0.3,0.3)] : range(RGB(1.0,0.4,0.4),stop=RGB(0.6,0.2,0.2),length=N)
    return reshape(colors,1,:)
end

"Returns 1xN equally spaced greens going from light to dark for plotting"
function greens(N::Int)
    colors = N==1 ? [RGB(0.3,0.8,0.3)] : range(RGB(0.4,1.0,0.4),stop=RGB(0.2,0.6,0.2),length=N)
    return reshape(colors,1,:)
end

"Returns 1xN equally spaced blues going from light to dark for plotting"
function blues(N::Int)
    colors = N==1 ? [RGB(0.3,0.3,0.8)] : range(RGB(0.4,0.4,1.0),stop=RGB(0.2,0.2,0.6),length=N)
    return reshape(colors,1,:)
end