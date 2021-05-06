using Sobol

function f(s, n, p)
    sum = 0
    for i = 1:n
        sum1 = 0
        for j = 1:s
            sum1 += (p[i,j])^2
        end
        sum += exp(-32*sum1)
    end
    sum / n
end

s = 2
n = 100000
sob = SobolSeq(s)
p = reduce(hcat, next!(sob) for i = 1:n)'
println(f(s, n, p))

