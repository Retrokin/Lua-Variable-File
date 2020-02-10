local lvf=require "lvf"
function printTable(v,p)
	p=p or ""
	for k,v in pairs(v) do
		if type(v)=="table" then
			print(p .. tostring(k) .. "=" .. tostring(v) .. " {")
			printTable(v,p .. "  ")
			print(p .. "}")
		else print(p .. tostring(k) .. "=" .. tostring(v)) end
	end
end

function love.load()
	local file=io.open("D:/System Folders/Desktop/funstuff.txt","w")
	--local t={test={"hello",{"hello2"}},p="'stringtest'",pp='"blehtest"',ppp="'" .. string.char(34) .. "all the marbles",finaltest=15,onemore=true}
	local t={15,true}
	local s=lvf.encode(t)
	file:write(s)
	file:close()
	local r=lvf.decode(s)

	for k,v in pairs(r) do
		print(k)
	end
	printTable(r)
end