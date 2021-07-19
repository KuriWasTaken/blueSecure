local addComments = require("Modules.Comments")

local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
-- encoding
function enc(data)
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

local options = {
    Minify = false;
    StringEnc = false;
    comments = false;
}

local ballzNuts = io.open("script.lua", "r")
local scriptContent = ballzNuts:read("*a")
ballzNuts:close()

--Gather all . syntaxes
local newScript = ""
local current = ""
local currentNum = ""
local nigeria = {}
local nigeriaTwo = {}
local nigeriaThree = {}
local isTo = false
local firstLine = true

scriptContent:gsub(".", function(c)
    if c == "." then
        table.insert(nigeria, current)
        current = ""
    elseif c == "=" then
        table.insert(nigeria, current)
        isTo = true
        current = ""
    else
        if isTo == false then
            current = current .. c
        else
            current = current .. c
        end
    end
end)
if isTo then
    table.insert(nigeriaTwo, current)
end
local count = 1
for i,v in pairs(nigeria) do
    count = count +1
    if firstLine then
        --newScript = newScript .. "(({...})[1])[1]='" .. tostring(v) .. "';\n"
        firstLine = false
    else
        if nigeria[#nigeria] == tostring(v) then
            local s = "(({...})[1])[" .. count-2 .. "]['" .. v .. "']=(({...})[1])[" .. #nigeria+1 .. "]; \n" 
            newScript = newScript .. s:gsub(" ", "")
        else
            newScript = newScript .. "(({...})[1])[" .. count-1 .. "]=" .. "(({...})[1])[" .. count -2 .. "]['" .. v .. "']; \n"
        end
    end
end

for i,v in pairs(nigeriaTwo) do
    newScript = "(({...})[1])[" .. #nigeria +1 .. "]=" .. v .. "; \n".. newScript
    --newScript = newScript .. "(({...})[1])[" .. #nigeria +1 .. "]=" --Hell even i don't know what the fuck is going on here
end

if options["StringEnc"] then
    local strings = {}
    for q,string in newScript:gmatch('(["])(.-)%1') do
        table.insert(strings, string)
    end
    for i,v in pairs(strings) do
        newScript = newScript:gsub('"' .. v .. '"', "dec('" .. enc(v) .. "')")
    end
    string = {}
    for q,string in newScript:gmatch("(['])(.-)%1") do
        table.insert(strings, string)
    end
    for i,v in pairs(strings) do
        newScript = newScript:gsub("'" .. v .. "'", "dec('" .. enc(v) .. "')")
    end
end
if options["comments"] then
    newScript = addComments(newScript)
end
newScript = [[
return(function(...)
loadstring("\108\111\99\97\108\32\98\61\39\65\66\67\68\69\70\71\72\73\74\75\76\77\78\79\80\81\82\83\84\85\86\87\88\89\90\97\98\99\100\101\102\103\104\105\106\107\108\109\110\111\112\113\114\115\116\117\118\119\120\121\122\48\49\50\51\52\53\54\55\56\57\43\47\39\10\102\117\110\99\116\105\111\110\32\100\101\99\40\100\97\116\97\41\10\32\32\32\32\100\97\116\97\32\61\32\115\116\114\105\110\103\46\103\115\117\98\40\100\97\116\97\44\32\39\91\94\39\46\46\98\46\46\39\61\93\39\44\32\39\39\41\10\32\32\32\32\114\101\116\117\114\110\32\40\100\97\116\97\58\103\115\117\98\40\39\46\39\44\32\102\117\110\99\116\105\111\110\40\120\41\10\32\32\32\32\32\32\32\32\105\102\32\40\120\32\61\61\32\39\61\39\41\32\116\104\101\110\32\114\101\116\117\114\110\32\39\39\32\101\110\100\10\32\32\32\32\32\32\32\32\108\111\99\97\108\32\114\44\102\61\39\39\44\40\98\58\102\105\110\100\40\120\41\45\49\41\10\32\32\32\32\32\32\32\32\102\111\114\32\105\61\54\44\49\44\45\49\32\100\111\32\114\61\114\46\46\40\102\37\50\94\105\45\102\37\50\94\40\105\45\49\41\62\48\32\97\110\100\32\39\49\39\32\111\114\32\39\48\39\41\32\101\110\100\10\32\32\32\32\32\32\32\32\114\101\116\117\114\110\32\114\59\10\32\32\32\32\101\110\100\41\58\103\115\117\98\40\39\37\100\37\100\37\100\63\37\100\63\37\100\63\37\100\63\37\100\63\37\100\63\39\44\32\102\117\110\99\116\105\111\110\40\120\41\10\32\32\32\32\32\32\32\32\105\102\32\40\35\120\32\126\61\32\56\41\32\116\104\101\110\32\114\101\116\117\114\110\32\39\39\32\101\110\100\10\32\32\32\32\32\32\32\32\108\111\99\97\108\32\99\61\48\10\32\32\32\32\32\32\32\32\102\111\114\32\105\61\49\44\56\32\100\111\32\99\61\99\43\40\120\58\115\117\98\40\105\44\105\41\61\61\39\49\39\32\97\110\100\32\50\94\40\56\45\105\41\32\111\114\32\48\41\32\101\110\100\10\32\32\32\32\32\32\32\32\32\32\32\32\114\101\116\117\114\110\32\115\116\114\105\110\103\46\99\104\97\114\40\99\41\10\32\32\32\32\101\110\100\41\41\10\101\110\100\10")();
if getgenv().ProtectedByBlueSecure == true then 
(({...})[1])[1]=(({...})[2])()[dec('Z2FtZQ==')]; 
]] .. newScript .. "end end)({},getfenv,table.remove) "

if options["Minify"] then
    newScript = newScript:gsub("\n", " ")
    newScript = [[
--Protected by a shitty obfuscator(bluesecure 1.0)

getgenv().ProtectedByBlueSecure = true

]] .. newScript
else
newScript = [[
--Protected by a shitty obfuscator(bluesecure 1.0)

getgenv().ProtectedByBlueSecure = true

]] .. newScript
end

ballzNuts = io.open("output.lua", "w")
ballzNuts:write(newScript)
