function f(s, p, n)
    sum = 0
    for i = 1:n
        umn = 1
        for j = 1:s
            umn *= (1 - 2rem(p[j][i], 1))^2
        end
        sum += umn
    end
    3^s * sum / n
end

s = 4
n = 2129
a = [766,1281,1906]

p = [[i/n for i = 1:n],[i*a[1]/n for i = 1:n],[i*a[2]/n for i = 1:n],[i*a[3]/n for i = 1:n]]

println(f(s, p, n))




