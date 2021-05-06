function f(n, x, y)
    sum = 0
    for i = 1:n
        sum1 = (x[i])^2 + (y[i])^2
        sum += exp(-32*sum1)
    end
    sum / n
end

a = 2342
n = 4000
x = [rem(i/n, 1) for i in 0:n-1]
y = [rem(a*i/n, 1) for i in 0:n-1]
println(f(n, x, y))

