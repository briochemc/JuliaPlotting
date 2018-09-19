using Pkg
Pkg.activate(".")

function peaks(x, y)
    z = 3 * (1 - x)^2 * exp(-x^2 - (y + 1)^2)
    z += -10 * (x / 5 - x^3 - y^5) * exp(-x^2 - y^2)
    z += -1/3 * exp(-(x+1)^2 - y^2)
    return z
end

x = range(-3, stop = 3, length = 100)
y = range(-2, stop = 2, length = 80)
levels = collect(-1:0.2:1)

using Plots
# using PyPlot
# using Plotly, ORCA
plt = contourf(x, y, peaks; levels = levels)
savefig(plt, "test.eps")