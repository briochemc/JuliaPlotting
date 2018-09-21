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
z = [peaks(x, y) for y in y, x in x]
levels = collect(-4:0.25:4)

# Filled contour background
#using Plots
#pyplot() # Set the backend to PyPlot
using PyPlot, PyCall
clf()
plt = contourf(x, y, z,
               levels = levels,
               extend = :both)
xlabel("\$x\$")
ylabel("\$y\$")

# Colorbar
cbar = colorbar(plt)
cbar["set_label"]("\$\\varphi\$")

# Overlay random paths on top
xpath = rand(x,10)
ypath = rand(y,10)

plt = plot(xpath, ypath, color = "black", linestyle="-", marker="o", markersize=5, markeredgecolor = "black", markerfacecolor = "white", label="NewtonMethod")
xpath = rand(x/2,10)
ypath = rand(y/2,10)
plt = plot(xpath, ypath, color = "black", linestyle="-", marker="o", markersize=5, markeredgecolor = "black", markerfacecolor = "red", label="NewtonMethodTrustRegion")

title("My nice looking figure")
legend()

display(plt)
savefig("test.eps")
savefig("test.pdf")
savefig("test.png")
savefig("test.svg")