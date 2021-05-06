using PyPlot

a = 81
n = 193
x = [rem(i/n, 1) for i in 0:n-1]
y = [rem(a*i/n, 1) for i in 0:n-1]

subplot(111, aspect="equal")
plot(x, y, "r.")
show()

