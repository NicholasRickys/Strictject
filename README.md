# Strictject

A Lua OO library, made to copy the behavior of other OO implementations, like Haxe.

## Usage

Much like classic by rxi, Strictject is already an object when you require it.

``extend(strictject)`` will copy your selected class into a new table, so you can do modifications on it
it also gives it an super class, so you can call functions from said supercall

example:
```lua
local strictject = require"strictject"
local object = extend(strictject)

function object:sayhi()
	print "hello"

	self.__super.new(self, 69, 420)
end

local object1 = new(strictject, 0, 0)
local object2 = new(object, 0, 0)

print(object1.sayhi, object2.sayhi)
```

object1.sayhi will be nil, while object2.sayhi wont be nil, simple!

``new(strictject)`` creates a new instance of the class you want

keep in mind **you are not able to add, or change the type of variables that are defined after ``new`` is called**

example:

```lua
local object = new(strictject, 100, 100)

print(object.x)
```