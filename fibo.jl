using CSV, DataFrames
using Sobol

function f(a, n)
    sum = 0
    for i = 1:n
        sum += (1-2*rem(i/n, 1))^2 * (1-2*rem(a*i/n, 1))^2
    end
    9*sum/n
end

function f(n, x, y)
    sum = 0
    for i = 1:n
        sum += (1-2*x[i])^2 * (1-2*y[i])^2
    end
    9*sum/n
end


function fibo(n)
    if n == 0
        return 0
    elseif n == 1 || n == 2
        return 1
    end
    fibo(n-1) + fibo(n-2)
end
n = 22
fiboarr = [fibo(i) for i = 2:n]


arr = Float64[]
par = Int64[]

#for i = 3:n
#    push!(par, fiboarr[i-1])
#    push!(arr, f(fiboarr[i-1], fiboarr[i]))
#end
#ab = DataFrame(dots=fiboarr[3:n],
#               a = par,
#               data = arr)
#CSV.write("17711.csv", ab) 

s = SobolSeq(2)

for j in fiboarr
    p = reduce(hcat, next!(s) for i = 1:j)'
    push!(arr, f(j, p[:,1], p[:,2]))
end
ab = DataFrame(dots=fiboarr,
               data = arr)
CSV.write("17711s.csv", ab) 

