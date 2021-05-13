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
    arr = [1, 1]
    for i = 3:n
       push!(arr, arr[i-1] + arr[i-2]) 
   end
   arr
end
n = 22
fiboarr = fibo(n)


arrs = Float64[]
arr = Float64[]
par = Int64[]

for i = 2:n
    push!(par, fiboarr[i-1])
    push!(arr, f(fiboarr[i-1], fiboarr[i]))
end
#=ab = DataFrame(dots=fiboarr[3:n],
               a = par,
               data = arr)
CSV.write("17711.csv", ab) 
=#

s = SobolSeq(2)
popfirst!(fiboarr)
for j in fiboarr
    p = reduce(hcat, next!(s) for i = 1:j)'
    push!(arrs, f(j, p[:,1], p[:,2]))
end
ab = DataFrame(dots=fiboarr,
               data1 = arr,
              data2 = arrs)
CSV.write("17711s.csv", ab) 

