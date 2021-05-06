using PyPlot

function f(n, x, y)
    sum = 0
    for i = 1:n
        sum += 1/(1+x[i]*y[i])
    end
    (12*sum)/(pi^2 * n)
end

a = 388
n = 1001
x = [rem(i/n, 1) for i in 0:n-1]
y = [rem(a*i/n, 1) for i in 0:n-1]
println(f(n, x, y))

subplot(111, aspect="equal")
plot(x, y, "r.")
show()
