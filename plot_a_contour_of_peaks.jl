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
levels = collect(-4:0.25:4)
vmin = minimum(levels)
vmax = maximum(levels)

using Plots
pyplot() # Set the backend to PyPlot
plt = contourf(x, y, peaks, levels = levels, clim = (vmin, vmax))
display(plt)
savefig(plt, "test.eps")
savefig(plt, "test.png")
savefig(plt, "test.svg")
savefig(plt, "test.html")