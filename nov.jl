using CSV, DataFrames

function f(a, n)
    sum = 0
    for i = 1:n
        sum += (1-2*rem(i/n, 1))^2 * (1-2*rem(a*i/n, 1))^2
    end
    9*sum/n
end

function check(n)
    min = 100
    tmp = n + 1
    for a = 1:n
        x = f(a, n)
        if x < min
            min = x
            tmp = a
        end
    end
    return tmp
end


n = 1292
a = check(n)


println(n,"  ",  a, "   ", f(a, n))


