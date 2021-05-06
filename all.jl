using CSV, DataFrames

function f(a, n)
    sum = 0
    for i = 1:n
        sum += (1-2*rem(i/n, 1))^2 * (1-2*rem(a*i/n, 1))^2
    end
    9*sum/n
end


n = 13 


arr = Float64[]
par = Int64[]
dot = Int64[]

for i = 1:n
    for j = 1:i
        push!(dot, fill(i,i))
        push!(par, a)
        push!(arr, f(a, i))
    end
end
ab = DataFrame(dots=dot,
               a = par,
               data = arr)
CSV.write("all.csv", ab) 

