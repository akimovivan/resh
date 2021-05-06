function f(n, x, y)
    sum = 0
    for i = 1:n
        sum += exp(-32*(x[i]^2 + y[i]^2)) + exp(-32*(x[i]^2 + (1-y[i])^2)) + exp(-32*((1-x[i])^2+y[i]^2)) + exp(-32((1-x[i])^2 + (1-y[i])^2))
    end
    sum / 4n
end

a = 2453
n = 4000
x = [rem(i/n, 1) for i in 0:n-1]
y = [rem(a*i/n, 1) for i in 0:n-1]
println(f(n, x, y))

