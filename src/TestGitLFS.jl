
using Plots

peaks(x,y) = @. 3(1 - x)^2 * exp(-x^2 - (y + 1)^2) - 10(x / 5 - x^3 - y^5) * exp(-x^2 - y^2) - exp(-(x+1)^2 - y^2) / 3

function savemysimpleplot(;nx=1000, ny=1000, nx2=100, saveit=false)
    x = range(-3, 3, length=nx)
    y = range(-2.5, 2.5, length=ny)
    z = peaks(x, y')
    plt = contourf(x, y, z)

    x2 = range(-3, 3, length=nx2)
    scatter!(plt, x2, sin.(x2), zcolor=maximum(abs.(z)) * cos.(x2))

    saveit && savefig("fig/test2.svg")

    return plt
end

savemysimpleplot(saveit=true)


