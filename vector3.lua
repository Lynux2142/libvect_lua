#!/usr/bin/lua5.3

function vecdef(x, y, z)
	local v = {
		x = x or 0,
		y = y or 0,
		z = z or 0
	}

	function v:norm()
		return (math.sqrt(math.pow(self.x, 2) + math.pow(self.y, 2) + math.pow(self.z, 2)))
	end

	function v:rev()
		self.x = -self.x
		self.y = -self.y
		self.z = -self.z
	end

	function v:normalize()
		self.x = self.x / self:norm()
		self.y = self.y / self:norm()
		self.z = self.z / self:norm()
	end

	function v:disp()
		print("[ " .. self.x .. " ; " .. self.y .. " ; " .. self.z .. " ]")
	end

	function v:copy()
		local v = vecdef()
		v.x = self.x
		v.y = self.y
		v.z = self.z
		return v
	end

	setmetatable(v, mt)
	return v
end

function vecadd(v1, v2)
	local v = vecdef()
	v.x = v1.x + v2.x
	v.y = v1.y + v2.y
	v.z = v1.z + v2.z
	return v
end

function vecsub(v1, v2)
	local v = vecdef()
	v.x = v1.x - v2.x
	v.y = v1.y - v2.y
	v.z = v1.z - v2.z
	return v
end

function vecscale(v1, v2)
	local v = vecdef()
	v.x = v1.x * v2.x
	v.y = v1.y * v2.y
	v.z = v1.z * v2.z
	return v
end

function vecdiv(v1, v2)
	local v = vecdef()
	v.x = v1.x / v2.x
	v.y = v1.y / v2.y
	v.z = v1.z / v2.z
	return v
end

function vec_dotproduct(v1, v2)
	local v = vecscale(v1, v2)
	return (v.x + v.y + v.z)
end

function vec_crossproduct(v1, v2)
	local v = vecdef()
	v.x = v1.y * v2.z - v1.z * v2.y
	v.y = v1.z * v2.x - v1.x * v2.z
	v.z = v1.x * v2.y - v1.y * v2.x
	return v
end

function vecangle(v1, v2)
	return (math.deg(math.acos(vec_dotproduct(v1, v2)) / (v1:norm() * v2:norm())))
end

function vecrotx(v1, angle)
	local v = vecdef()
	v.x = v1.x
	v.y = v1.y * math.cos(angle) - v1.z * math.sin(angle)
	v.z = v1.y * math.sin(angle) + v1.z * math.cos(angle)
	return v
end

function vecroty(v1, angle)
	local v = vecdef()
	v.x = v1.x * math.cos(angle) + v1.z * math.sin(angle)
	v.y = v1.y
	v.z = -v1.x * math.sin(angle) + v1.z * math.cos(angle)
	return v
end

function vecrotz(v1, angle)
	local v = vecdef()
	v.x = v1.x * math.cos(angle) - v1.y * math.sin(angle)
	v.y = v1.x * math.sin(angle) + v1.y * math.cos(angle)
	v.z = v1.z
	return v
end

function vecrot(v1, xangle, yangle, zangle)
	v = vecrotx(v1, xangle)
	v = vecroty(v, yangle)
	v = vecrotz(v, zangle)
	return v
end

mt = {}
mt.__add = vecadd
mt.__sub = vecsub
mt.__div = vecdiv
mt.__mul = vecscale
