#!/usr/bin/lua5.3

function per(n, i)
	if (#n == 1) then
		print('DONE (' .. i .. ' iterations)')
		os.exit(0)
	end
	tab = {}
	for i = 1, #n do
		tab[i] = tonumber(string.sub(n,i,i))
	end
	res = 1
	for k, v in pairs(tab) do
		res = res * v
	end
	print(res)
	i = i + 1
	per(tostring(res), i)
end

io.write('Entrez une valeur positive: ')
n = io.read()
if (tonumber(n) == nil or tonumber(n) < 0) then os.exit(1) end
i = 0
per(n, i)
