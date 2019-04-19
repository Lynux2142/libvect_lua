#!/usr/bin/lua5.3

function fibo_rec(n)
	if (n == 0) then return (0) end
	if (n == 1) then return (1) end
	return (fibo(n - 1) + fibo(n - 2))
end

function fibo(n)
	if (n == 0 or n == 1) then return (n) end
	n1 = 0
	n2 = 1
	for i = 1, n do
		tmp = n1 + n2
		n1 = n2
		n2 = tmp
	end
	return (n1)
end

io.write('Entrez une valeur positive: ')
n = tonumber(io.read())
if (n == nil or n < 0) then os.exit(1) end
print(fibo(n))
print(fibo_rec(n))
