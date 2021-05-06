using PyPlot
using Sobol

function f(n, x, y)
    sum = 0
    for i = 1:n
        sum += 1/(1+x[i]*y[i])
    end
    (12*sum)/(pi^2  * n)
end

n = 1001
s = SobolSeq(2)
p = reduce(hcat, next!(s) for i = 1:n)'
println(f(n, p[:,1], p[:,2]))

subplot(111, aspect="equal")
plot(x, y, "r.")
show()
