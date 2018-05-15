
"""
Print to STDOUT with specific colour, with option for bold. Will not necessarily
work on all terminals.
"""
function print_with_bash_colour(t, r, g, b; bold=false)
    if bold print("\e[1m") end
    print("\e[38;2;$r;$g;$b;249m",t,"\033[0m")
    if bold print("\e[0m") end
end
