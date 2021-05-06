using PyPlot

function f(n, x, y)
    sum = 0
    for i = 1:n
        sum += (1-2*x[i])^2 * (1-2*y[i])^2
    end
    9*sum/n
end

n = 1024
x = rand(0.:eps(Float64):1., n)
y = rand(0.:eps(Float64):1., n)
println(x)
println(y)

println(f(n, x, y))

subplot(111, aspect="equal")
plot(x, y, "r.")
show()

