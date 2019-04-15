#!/usr/bin/lua5.3

require 'vector3'

v1 = vecdef(1, 2, 3)
v2 = vecdef(3, 2, 1)

v = v1 + v2
v:disp()
v = v1 - v2
v:disp()
v = v1 * v2
v:disp()
v = v1 / v2
v:disp()

test = vecdef(42, 0, 0)
test:disp()
test:normalize()
test:disp()
test:rev()
test:disp()
