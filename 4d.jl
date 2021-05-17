using Sobol

f(s, p, n) = 3^s * sum(prod((1 - 2rem(p[i,j], 1))^2 for j = 1:s) for i = 1:n)/n

function make_p!(s, a, n)
    for j = 1:s
        for i = 1:n
            p[i,j] = i*a[j]/n
        end
    end
end

s = 4
n = 2129
a = [1, 766,1281,1906]

p = Array{Float64}(undef, n, s)
make_p!(s, a, n)
println(f(s, p, n))

sob = SobolSeq(s)
p = reduce(hcat, next!(sob) for i = 1:n)'
println(f(s, p, n))