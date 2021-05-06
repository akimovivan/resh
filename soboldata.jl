using Sobol
using CSV, DataFrames

function f(n, x, y)
    sum = 0
    for i = 1:n
        sum += (1-2*x[i])^2 * (1-2*y[i])^2
    end
    9*sum/n
end

n = 4000

s = SobolSeq(2)

arr = Float64[]

for j = 1:n
    p = reduce(hcat, next!(s) for i = 1:j)'
    push!(arr, f(j, p[:,1], p[:,2]))
end
ab = DataFrame(dots=collect(1:n),
               data = arr)
CSV.write("sobol.csv", ab) 

