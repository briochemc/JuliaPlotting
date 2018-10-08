using Pkg
Pkg.activate(".")

using PyPlot, PyCall
clf()

#plots = 1:16
plots = 1:9

for l in plots
    n = rand(1:500)
    y = sort(rand(n), rev=true)
    #plt = semilogy(y, color=ColorMap("tab20c")(l-1))
    col = mycolor(l)
    plt = semilogy(y, color=col)
end
xlabel("function calls")
ylabel("cost")

title("My nice looking figure")
legend(("plot $l" for l in plots))

using Match
function mycolor(l)
    cmap = ColorMap("tab20c")
    @match l begin
        1 => cmap(0)
        2 => cmap(1)
        3 => cmap(2)
        4 => cmap(4)
        5 => cmap(5)
        6 => cmap(6)
        7 => cmap(8)
        8 => cmap(9)
        9 => cmap(10)
        _ => cmap(19)
    end
end

display(plt)
savefig("test.eps")
savefig("test.pdf")
savefig("test.png")
savefig("test.svg")