using Sobol

function f(s, p, n)
    sum = 0
    for i = 1:n
        umn = 1
        for j = 1:s
            umn *= (1 - 2rem(p[i,j], 1))^2
        end
        sum += umn
    end
    3^s * sum / n
end

s = 6
n = 10007
sob = SobolSeq(s)
p = reduce(hcat, next!(sob) for i = 1:n)'
println(f(s, p, n))



            
