#!/usr/bin/lua5.3

function Contact()
	local this = {
		datas = {}
	}
	local infos = {
		'First Name',
		'Last Name',
		'Nickname',
		'Login',
		'Postal Address',
		'Email Address',
		'Phone Number',
		'Birthday Date',
		'Favorite Meal',
		'Underwear Color',
		'Darkest Secret'
	}
	function this:create()
		for i = 1, #infos do
			io.write(infos[i] .. ': ')
			str = io.read()
			if (str == '') then self.datas[i] = '/' else self.datas[i] = str end
		end
	end
	function this:printMe()
		for i = 1, #infos do
			print(infos[i] .. ': ' .. self.datas[i])
		end
	end
	this:create()
	return this
end

function ContactList()
	local list = {}
	local cmd = {
		'EXIT',
		'ADD',
		'SEARCH',
		'DEL'
	}

	local function printList()
	print('     index|First Name| Last Name|  Nickname')
	for key, contact in pairs(list) do
		io.write(string.rep(' ', 10 - #tostring(key)) .. key)
		for i = 1, 3 do
			str = contact.datas[i]
			str = string.rep(' ', 10 - #str) .. str
			if(#str > 10) then str = string.sub(str, 1, 9) .. '.' end
			io.write('|' .. str)
		end
		print()
	end
	print()
	end
	local function exit()
		print('bye bye')
		print()
		os.exit(0)
	end
	local function add()
		table.insert(list, Contact())
	end
	local function search()
		if (#list == 0) then
			print("You don't have friend")
		else
			printList()
			io.write('Contact index to display: ')
			index = tonumber(io.read())
			if (index == nil or index <= 0 or index > #list) then
				print('error: invalid index')
			else
				print()
				list[index]:printMe()
			end
		end
	end
	local function del()
		if (#list == 0) then
			print("You don't have friend")
		else
			printList()
			io.write('Contact index to delete: ')
			index = tonumber(io.read())
			if (index == nil or index <= 0 or index > #list) then
				print('error: invalid index')
			else
				table.remove(list, index)
			end
		end
	end

	local funct = {}
	funct['EXIT'] = exit
	funct['ADD'] = add
	funct['SEARCH'] = search
	funct['DEL'] = del

	print('Welcome to your contact list')
	print('Available commands [ADD - SEARCH - DEL - EXIT]')
	while true do
		io.write('Contact(' .. #list .. ')$> ')
		res = io.read()
		if funct[res] then
			funct[res]()
			print()
		else
			print('error: command not found')
			print()
			print('Available commands [ADD - SEARCH - DEL - EXIT]')
		end
	end
end

ContactList()
