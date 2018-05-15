
"Returns 1xN equally spaced reds going from light to dark for plotting"
reds(N::Int) = reshape(linspace(RGB(1.0,0.4,0.4),RGB(0.6,0.2,0.2),N),1,:)

"Returns 1xN equally spaced greens going from light to dark for plotting"
greens(N::Int) = reshape(linspace(RGB(0.4,1.0,0.4),RGB(0.2,0.6,0.2),N),1,:)

"Returns 1xN equally spaced blues going from light to dark for plotting"
blues(N::Int) = reshape(linspace(RGB(0.4,0.4,1.0),RGB(0.2,0.2,0.6),N),1,:)
