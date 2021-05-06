using PyPlot

function f(n, x, y)
    sum = 0
    for i = 1:n
        sum += (1-2*x[i])^2 * (1-2*y[i])^2
    end
    9*sum/n
end

a = 8
n = 13
x = [rem(i/n, 1) for i in 0:n-1]
y = [rem(a*i/n, 1) for i in 0:n-1]
println(f(n, x, y))

subplot(111, aspect="equal")
plot(x, y, "r.")
show()
