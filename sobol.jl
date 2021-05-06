using PyPlot
using Sobol

function f(n, x, y)
    sum = 0
    for i = 1:n
        sum += (1-2*x[i])^2 * (1-2*y[i])^2
    end
    9*sum/n
end

n = 1

s = SobolSeq(2)
p = reduce(hcat, next!(s) for i = 1:n)'
println(f(n, p[:,1], p[:,2]))
subplot(111, aspect="equal")
plot(p[:,1], p[:,2], "r.")
show()
