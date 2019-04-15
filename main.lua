#!/usr/bin/lua5.3

require 'vector3'

v1 = vecdef(42, 0, 0)
io.write("v1: ")
v1:disp()
v2 = vecdef(0, 21, 0)
io.write("v2: ")
v2:disp()

v = v1 + v2
io.write("v1 + v2 = ")
v:disp()

dp = vec_dotproduct(v1, v2)
print("dot product: " .. dp)

v1:normalize()
io.write("v1 normalized: ")
v1:disp()
v2:normalize()
io.write("v2 normalized: ")
v2:disp()

angle = vecangle(v1, v2)
print("angle between v1 and v2: " .. angle .. " degrees")

v = vec_crossproduct(v1, v2)
io.write("cross product: ")
v:disp()
