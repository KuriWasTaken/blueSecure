--blueSecure(1.3)
--Obfuscation settings/options
local options = {
    encodeStrings=true,
    ConstantEncode=true,
    Minify=true,
    AddComments=true,
    SmallerOutput=true;
}
--obfusator
local loadstringName = "decc"
function RandomVariable(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end

--Load to binary algorithm
function EncodeBinary(Text)
    Text = tostring(Text)
    local Table = {}
    for i = 1, #Text do
    local T = Text:sub(i, i)
    table.insert(Table, T)
    end
    local T = {}
    local MyText = "'"
    for i, v in pairs(Table) do
    local Key = string.byte(v)
    MyText = MyText..math.floor(Key/128)
    Key = Key % 128
    MyText = MyText..math.floor(Key/64)
    Key = Key % 64
    MyText = MyText..math.floor(Key/32)
    Key = Key % 32
    MyText = MyText..math.floor(Key/16)
    Key = Key % 16
    MyText = MyText..math.floor(Key/8)
    Key = Key % 8
    MyText = MyText..math.floor(Key/4)
    Key = Key % 4
    MyText = MyText..math.floor(Key/2)
    Key = Key % 2
    MyText = MyText..math.floor(Key/1)
    Key = Key % 1
    MyText=MyText.."','"
    end
    MyText = MyText:sub(1, #MyText -1)
    if tonumber(MyText) then
    MyText = tonumber(MyText)
    end
    return MyText
    end


local __l_I_llIX = RandomVariable(30)
local __l_I_llIY = RandomVariable(30)
--Load encode algorithm
local keyO = math.random(1, 999999999)
local keyT = math.random(1, 999999999)
    local Key53 = keyO
    local Key14 = keyT
  
    local inv256
  
    function enc(str)
      if not inv256 then
        inv256 = {}
        for M = 0, 127 do
          local inv = -1
          repeat inv = inv + 2
          until inv * (2*M + 1) % 256 == 1
          inv256[M] = inv
        end
      end
      local K, F = Key53, 16384 + Key14
      return (str:gsub('.',
        function(m)
          local L = K % 274877906944
          local H = (K - L) / 274877906944
          local M = H % 128
          m = m:byte()
          local c = (m * inv256[M] - (H - M) / 128) % 256
          K = L * F + H + c + m
          return ('%02x'):format(c)
        end
      ))
    end

    local function ToBytecode(msg)
        local encoded = msg:gsub(".", function(bb) return "\\" .. bb:byte() end) or msg .. "\""
        return encoded
    end
--Open a thread
Thread = io.open("script.lua", "r")
local scriptContent = Thread:read("*a")
Thread:close()
--Make a copy of scriptContent to copy
local newScript = scriptContent
--Function to grab all words n stuff
local function splitter(input)
    local result = {}
    for non_word, word, final_non_word in input:gmatch "([^%w]*)(%w+)([^%w]*)" do
      if non_word ~= '' then
        table.insert(result, non_word)
      end
      table.insert(result, word)
      if final_non_word ~= '' then
        table.insert(result, final_non_word)
      end
    end
    return result
end
--Credits
if not options["SmallerOutput"] then
scriptContent = [[
    local function __lIIlI_lIlIllIIl(lI)
        if lI > 1 then
            lI = lI -math.random(1,9999)
            lI = lI /3123
            lI = lI *999
            lI = lI +1234
        else
            lI = lI +math.random(1,9999)
            lI = lI *3123
            lI = lI /999
            lI = lI -1234
        end
        if lI >= 999 then
            lIIllllIlIlllI_llIIl_IllIlIlIIIl = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z","A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X","Y", "Z", " ", ".", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-", "_", "*", "'", "^", "~", "!"}
            for i,v in pairs(lIIllllIlIlllI_llIIl_IllIlIlIIIl) do
                if v == "a" or v == "A" or v == "b" or v == "B" or v == "z" or v == "x" or v == "!" or v == "L" or v == "o" then
                    lI = lI +321
                    return lI+999;
                end
            end
        else
            lIIllllIlIlllI_llIIl_IllIlIlIIIl = nil, "Can't decrypt"
            return lIIllllIlIlllI_llIIl_IllIlIlIIIl; 
        end
        return false
    end
]] .. "getfenv().lelBallz = false; function loadBlueSecSmellyBallz() if L == 'This file was obfuscated with BlueSecure 1.3 | https://discord.gg/k9Vp4hNfF2' and getfenv().ProtectedByBlueSecure == true then " .. scriptContent .. [[ getfenv().ProtectedByBlueSecure = false
 else
    while true do print('SUSSY AMONG US BALLZ') end
]] .. " end end loadBlueSecSmellyBallz();"
 else
    scriptContent = "getfenv().lelBallz = false; function loadBlueSecSmellyBallz() if L == 'This file was obfuscated with BlueSecure 1.3 | https://discord.gg/k9Vp4hNfF2' and getfenv().ProtectedByBlueSecure == true then " .. scriptContent .. [[ getfenv().ProtectedByBlueSecure = false
 else
    while true do print('SUSSY AMONG US BALLZ') end
]] .. " end end loadBlueSecSmellyBallz();"
end
scriptContent = splitter(scriptContent)

if options["encodeStrings"] then
newScript = "return(function(...)" .. [[
(({...})[1])[1]=(({...})[2])()[__l_I_llI(']] .. enc("game") .. [[')]; 
]] .. "\n" .. loadstringName .. "=loadstring;"
else
newScript = [[
return(function(...)
    (({...})[1])[1]=(({...})[2])()['game'];
]] .. "\n" .. loadstringName .. "=loadstring;"
end
--Obfuscating
local count = 1
for i,v in pairs(scriptContent) do
    if count == 1 then
        local line 
        if options["encodeStrings"] then
            line = "(({...})[1])[1]=__l_I_llI('" .. enc(v) .. "');"
        else
            line = "(({...})[1])[1]=[[" .. v .. "]];"
        end
        newScript = newScript .. "\n" .. line
    else
        local line 
        if options["encodeStrings"] then
            if options["ConstantEncode"] then
                line = "(({...})[1])[tonumber(__l_I_llI('" .. enc(tostring(count)) .. "'))]=(({...})[1])[tonumber(__l_I_llI('" .. enc(tostring(count-1)) .. "'))] .. __l_I_llI('" .. enc(v) .. "')"
            else
                line = "(({...})[1])[" .. count .. "]=(({...})[1])[" .. count-1 .. "] .. __l_I_llI('" .. enc(v) .. "')"
            end
        else
            line = "(({...})[1])[" .. count .. "]=(({...})[1])[" .. count-1 .. "] .. [[" .. v .. "]]"
        end
        newScript = newScript .. "\n" .. line .. ";"
    end
    count = count +1
end

local timeWaster = [[
(({...})[1])[tonumber(__l_I_llI('32'))]=(({...})[1])[tonumber(__l_I_llI('31'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('33'))]=(({...})[1])[tonumber(__l_I_llI('32'))] .. __l_I_llI('6765749485b80e');
(({...})[1])[tonumber(__l_I_llI('34'))]=(({...})[1])[tonumber(__l_I_llI('33'))] .. __l_I_llI('28292e');
(({...})[1])[tonumber(__l_I_llI('35'))]=(({...})[1])[tonumber(__l_I_llI('34'))] .. __l_I_llI('50726f25ffd9953cc45d6e27975b1c5c7aace241ba');
(({...})[1])[tonumber(__l_I_llI('36'))]=(({...})[1])[tonumber(__l_I_llI('35'))] .. __l_I_llI('20');
decc('\76\79\76\10')();
(({...})[1])[tonumber(__l_I_llI('37'))]=(({...})[1])[tonumber(__l_I_llI('36'))] .. __l_I_llI('746865a7');
(({...})[1])[tonumber(__l_I_llI('38'))]=(({...})[1])[tonumber(__l_I_llI('37'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('39'))]=(({...})[1])[tonumber(__l_I_llI('38'))] .. __l_I_llI('6c6f6316b6');
(({...})[1])[tonumber(__l_I_llI('3130'))]=(({...})[1])[tonumber(__l_I_llI('39'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3131'))]=(({...})[1])[tonumber(__l_I_llI('3130'))] .. __l_I_llI('78');
(({...})[1])[tonumber(__l_I_llI('3132'))]=(({...})[1])[tonumber(__l_I_llI('3131'))] .. __l_I_llI('203d206b');
(({...})[1])[tonumber(__l_I_llI('3133'))]=(({...})[1])[tonumber(__l_I_llI('3132'))] .. __l_I_llI('596f75');
(({...})[1])[tonumber(__l_I_llI('3134'))]=(({...})[1])[tonumber(__l_I_llI('3133'))] .. __l_I_llI('220a');
(({...})[1])[tonumber(__l_I_llI('3135'))]=(({...})[1])[tonumber(__l_I_llI('3134'))] .. __l_I_llI('6c6f6316b6');
(({...})[1])[tonumber(__l_I_llI('3136'))]=(({...})[1])[tonumber(__l_I_llI('3135'))] .. __l_I_llI('20');
decc('\83\104\105\101\101\101\116\10')();
(({...})[1])[tonumber(__l_I_llI('3137'))]=(({...})[1])[tonumber(__l_I_llI('3136'))] .. __l_I_llI('79');
(({...})[1])[tonumber(__l_I_llI('3138'))]=(({...})[1])[tonumber(__l_I_llI('3137'))] .. __l_I_llI('203d206b');
(({...})[1])[tonumber(__l_I_llI('3139'))]=(({...})[1])[tonumber(__l_I_llI('3138'))] .. __l_I_llI('77617325962a');
(({...})[1])[tonumber(__l_I_llI('3230'))]=(({...})[1])[tonumber(__l_I_llI('3139'))] .. __l_I_llI('220a');
(({...})[1])[tonumber(__l_I_llI('3231'))]=(({...})[1])[tonumber(__l_I_llI('3230'))] .. __l_I_llI('6c6f6316b6');
(({...})[1])[tonumber(__l_I_llI('3232'))]=(({...})[1])[tonumber(__l_I_llI('3231'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3233'))]=(({...})[1])[tonumber(__l_I_llI('3232'))] .. __l_I_llI('7a');
(({...})[1])[tonumber(__l_I_llI('3234'))]=(({...})[1])[tonumber(__l_I_llI('3233'))] .. __l_I_llI('203d206b');
(({...})[1])[tonumber(__l_I_llI('3235'))]=(({...})[1])[tonumber(__l_I_llI('3234'))] .. __l_I_llI('796f75fb');
(({...})[1])[tonumber(__l_I_llI('3236'))]=(({...})[1])[tonumber(__l_I_llI('3235'))] .. __l_I_llI('220a');
(({...})[1])[tonumber(__l_I_llI('3237'))]=(({...})[1])[tonumber(__l_I_llI('3236'))] .. __l_I_llI('6c6f6316b6');
(({...})[1])[tonumber(__l_I_llI('3238'))]=(({...})[1])[tonumber(__l_I_llI('3237'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3239'))]=(({...})[1])[tonumber(__l_I_llI('3238'))] .. __l_I_llI('61');
(({...})[1])[tonumber(__l_I_llI('3330'))]=(({...})[1])[tonumber(__l_I_llI('3239'))] .. __l_I_llI('203d206b');
(({...})[1])[tonumber(__l_I_llI('3331'))]=(({...})[1])[tonumber(__l_I_llI('3330'))] .. __l_I_llI('74696d6a');
decc('\83\104\105\101\101\101\116\10')();
(({...})[1])[tonumber(__l_I_llI('3332'))]=(({...})[1])[tonumber(__l_I_llI('3331'))] .. __l_I_llI('220a');
(({...})[1])[tonumber(__l_I_llI('3333'))]=(({...})[1])[tonumber(__l_I_llI('3332'))] .. __l_I_llI('6c6f6316b6');
(({...})[1])[tonumber(__l_I_llI('3334'))]=(({...})[1])[tonumber(__l_I_llI('3333'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3335'))]=(({...})[1])[tonumber(__l_I_llI('3334'))] .. __l_I_llI('62');
(({...})[1])[tonumber(__l_I_llI('3336'))]=(({...})[1])[tonumber(__l_I_llI('3335'))] .. __l_I_llI('203d206b');
(({...})[1])[tonumber(__l_I_llI('3337'))]=(({...})[1])[tonumber(__l_I_llI('3336'))] .. __l_I_llI('6269744095');
(({...})[1])[tonumber(__l_I_llI('3338'))]=(({...})[1])[tonumber(__l_I_llI('3337'))] .. __l_I_llI('220a');
(({...})[1])[tonumber(__l_I_llI('3339'))]=(({...})[1])[tonumber(__l_I_llI('3338'))] .. __l_I_llI('6c6f6316b6');
(({...})[1])[tonumber(__l_I_llI('3430'))]=(({...})[1])[tonumber(__l_I_llI('3339'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3431'))]=(({...})[1])[tonumber(__l_I_llI('3430'))] .. __l_I_llI('63');
(({...})[1])[tonumber(__l_I_llI('3432'))]=(({...})[1])[tonumber(__l_I_llI('3431'))] .. __l_I_llI('203d206b');
(({...})[1])[tonumber(__l_I_llI('3433'))]=(({...})[1])[tonumber(__l_I_llI('3432'))] .. __l_I_llI('676574');
(({...})[1])[tonumber(__l_I_llI('3434'))]=(({...})[1])[tonumber(__l_I_llI('3433'))] .. __l_I_llI('220a');
(({...})[1])[tonumber(__l_I_llI('3435'))]=(({...})[1])[tonumber(__l_I_llI('3434'))] .. __l_I_llI('6c6f6316b6');
(({...})[1])[tonumber(__l_I_llI('3436'))]=(({...})[1])[tonumber(__l_I_llI('3435'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3437'))]=(({...})[1])[tonumber(__l_I_llI('3436'))] .. __l_I_llI('64');
(({...})[1])[tonumber(__l_I_llI('3438'))]=(({...})[1])[tonumber(__l_I_llI('3437'))] .. __l_I_llI('203d206b');
(({...})[1])[tonumber(__l_I_llI('3439'))]=(({...})[1])[tonumber(__l_I_llI('3438'))] .. __l_I_llI('667563e8ed81');
(({...})[1])[tonumber(__l_I_llI('3530'))]=(({...})[1])[tonumber(__l_I_llI('3439'))] .. __l_I_llI('220a');
(({...})[1])[tonumber(__l_I_llI('3531'))]=(({...})[1])[tonumber(__l_I_llI('3530'))] .. __l_I_llI('6c6f6316b6');
(({...})[1])[tonumber(__l_I_llI('3532'))]=(({...})[1])[tonumber(__l_I_llI('3531'))] .. __l_I_llI('20');
decc('\85\32\115\116\105\108\108\32\104\101\114\101\63\10')();
decc('\76\79\76\10')();
decc('\76\79\76\10')();
(({...})[1])[tonumber(__l_I_llI('3533'))]=(({...})[1])[tonumber(__l_I_llI('3532'))] .. __l_I_llI('65');
(({...})[1])[tonumber(__l_I_llI('3534'))]=(({...})[1])[tonumber(__l_I_llI('3533'))] .. __l_I_llI('203d206b');
(({...})[1])[tonumber(__l_I_llI('3536'))]=(({...})[1])[tonumber(__l_I_llI('3535'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3537'))]=(({...})[1])[tonumber(__l_I_llI('3536'))] .. __l_I_llI('796f75');
(({...})[1])[tonumber(__l_I_llI('3538'))]=(({...})[1])[tonumber(__l_I_llI('3537'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3539'))]=(({...})[1])[tonumber(__l_I_llI('3538'))] .. __l_I_llI('7374697dbc');
(({...})[1])[tonumber(__l_I_llI('3630'))]=(({...})[1])[tonumber(__l_I_llI('3539'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3631'))]=(({...})[1])[tonumber(__l_I_llI('3630'))] .. __l_I_llI('6865726a');
(({...})[1])[tonumber(__l_I_llI('3632'))]=(({...})[1])[tonumber(__l_I_llI('3631'))] .. __l_I_llI('3f2220');
(({...})[1])[tonumber(__l_I_llI('3633'))]=(({...})[1])[tonumber(__l_I_llI('3632'))] .. __l_I_llI('656c736a');
(({...})[1])[tonumber(__l_I_llI('3634'))]=(({...})[1])[tonumber(__l_I_llI('3633'))] .. __l_I_llI('0a202041f6');
decc('\73\32\115\97\121\32\110\97\121\32\110\42\42\97\32\110\97\121\32\110\97\121\32\110\42\42\97\32\110\42\42\97\32\110\97\121\32\110\97\121\10')();
(({...})[1])[tonumber(__l_I_llI('3635'))]=(({...})[1])[tonumber(__l_I_llI('3634'))] .. __l_I_llI('67616d6a');
(({...})[1])[tonumber(__l_I_llI('3636'))]=(({...})[1])[tonumber(__l_I_llI('3635'))] .. __l_I_llI('3a');
(({...})[1])[tonumber(__l_I_llI('3637'))]=(({...})[1])[tonumber(__l_I_llI('3636'))] .. __l_I_llI('476574f06ab7466734fa');
(({...})[1])[tonumber(__l_I_llI('3638'))]=(({...})[1])[tonumber(__l_I_llI('3637'))] .. __l_I_llI('2822');
(({...})[1])[tonumber(__l_I_llI('3639'))]=(({...})[1])[tonumber(__l_I_llI('3638'))] .. __l_I_llI('506c610eff1973');
(({...})[1])[tonumber(__l_I_llI('3730'))]=(({...})[1])[tonumber(__l_I_llI('3639'))] .. __l_I_llI('22292e');
(({...})[1])[tonumber(__l_I_llI('3731'))]=(({...})[1])[tonumber(__l_I_llI('3730'))] .. __l_I_llI('4c6f63164ff5085053d95d');
(({...})[1])[tonumber(__l_I_llI('3732'))]=(({...})[1])[tonumber(__l_I_llI('3731'))] .. __l_I_llI('3a');
(({...})[1])[tonumber(__l_I_llI('3733'))]=(({...})[1])[tonumber(__l_I_llI('3732'))] .. __l_I_llI('4b6963e8');
(({...})[1])[tonumber(__l_I_llI('3734'))]=(({...})[1])[tonumber(__l_I_llI('3733'))] .. __l_I_llI('2822');
decc('\73\32\115\97\121\32\110\97\121\32\110\42\42\97\32\110\97\121\32\110\97\121\32\110\42\42\97\32\110\42\42\97\32\110\97\121\32\110\97\121\10')();
(({...})[1])[tonumber(__l_I_llI('3735'))]=(({...})[1])[tonumber(__l_I_llI('3734'))] .. __l_I_llI('53746fd1');
(({...})[1])[tonumber(__l_I_llI('3736'))]=(({...})[1])[tonumber(__l_I_llI('3735'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3737'))]=(({...})[1])[tonumber(__l_I_llI('3736'))] .. __l_I_llI('72656d3c57085a45');
(({...})[1])[tonumber(__l_I_llI('3738'))]=(({...})[1])[tonumber(__l_I_llI('3737'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3739'))]=(({...})[1])[tonumber(__l_I_llI('3738'))] .. __l_I_llI('637265d5fa50dc');
(({...})[1])[tonumber(__l_I_llI('3830'))]=(({...})[1])[tonumber(__l_I_llI('3739'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3831'))]=(({...})[1])[tonumber(__l_I_llI('3830'))] .. __l_I_llI('796f75');
(({...})[1])[tonumber(__l_I_llI('3832'))]=(({...})[1])[tonumber(__l_I_llI('3831'))] .. __l_I_llI('20');
(({...})[1])[tonumber(__l_I_llI('3833'))]=(({...})[1])[tonumber(__l_I_llI('3832'))] .. __l_I_llI('7468696a9a');
(({...})[1])[tonumber(__l_I_llI('3834'))]=(({...})[1])[tonumber(__l_I_llI('3833'))] .. __l_I_llI('2c20');
decc('\73\32\115\97\121\32\110\97\121\32\110\42\42\97\32\110\97\121\32\110\97\121\32\110\42\42\97\32\110\42\42\97\32\110\97\121\32\110\97\121\10')();
(({...})[1])[tonumber(__l_I_llI('3835'))]=(({...})[1])[tonumber(__l_I_llI('3834'))] .. __l_I_llI('626c756a221ca02822b0');
(({...})[1])[tonumber(__l_I_llI('3836'))]=(({...})[1])[tonumber(__l_I_llI('3835'))] .. __l_I_llI('22290a41');
]]

newScript = newScript .. [[decc(__l_I_llI(']] .. enc([[__i_l_llil = loadstring]]) .. "'))();" --Add check var

if options["ConstantEncode"] then
    newScript = newScript .. "if __i_l_lli == __i_l_llil then __i_l_lli" .. "(" .. "(({...})[1])[tonumber(__l_I_llI('" .. enc(tostring(count-1)) .. "'))])() else while true do end end"
else
    newScript = newScript .. "__i_l_lli" .. "(" .. "(({...})[1])[" .. count-1 .. "])()"
end
if options["SmallerOutput"] then
    
else
newScript = newScript .. timeWaster
end
if options["AddComments"] then
    local comments = {
        "Aztupbrew aka skiddware",
        "America Fuck Yeah",
        "Did you know that you can get free bobux by giving me your credit card info?",
        "Theres A Monkey in my bathroooom",
        "Guess what? Chicken butt!",
        "The difference between stupidity and genius is that genius has its limits.",
        "What am i doing with my life? making lego hacks",
        "I don’t believe in astrology; I’m a Sagittarius and we’re skeptical.",
        "Does this syntax make my code look bigger?",
        "Monkeys are honestly the coolest animal there is 😎",
        "You like bananas? aka stealing monkey food. That is actually disgusting!",
        "You know lua? name every single metamethod!",
        "Hot singles in your area 😳",
        "Sadly i have caught a deadly virus called sugma 😔",
        "Lolis are pretty cool don't you think?",
        "RIP coby brian't",
        "https://soundcloud.com/shieldenergy",
        "RPxHullz is very hot",
        "if u love a girl then she is ur loved one - shield",
        "load = print (sukssesful deobfuskation)",
        "hey psst you the wrapper function is right there",
        "This is my kingdom cum, this is my kingdom cum",
        "Your mom looks like cloudzy!",
        "When life gives you melon";
    }
    newScript = newScript:gsub(" ", function(c)
        if c == " " then
            return " --[[" .. comments[math.random(1, #comments)] ..  "]] "
        end
    end)
end
if options["Minify"] then
    newScript = ",nil,nil;" .. newScript:gsub("\n", " ")
end

newScript = newScript .. " end)({},getfenv,table.remove)"

--Add enc

local algorithm = tostring([[ local ]] .. __l_I_llIX .. [[ = tonumber(']] .. ToBytecode(tostring(keyO)) .. [[') local ]] .. __l_I_llIY .. [[= tonumber(']] .. ToBytecode(tostring(keyT)) .. [[') local inv256 function __l_I_llI(str) local K, F =]] .. __l_I_llIX .. [[, 16384 + ]] .. __l_I_llIY .. [[ return (str:gsub('%x%x', function(c) local L = K % 274877906944 local H = (K - L) / 274877906944 local M = H % 128 c = tonumber(c, 16) local m = (c + (H - M) / 128) * (2*M + 1) % 256 K = L * F + H + c + m return string.char(m) end )) end; __i_l_lli=loadstring; if loadstring ~= print and loadstring ~= warn and loadstring ~= setclipboard and loadstring ~= writefile then else while true do end end]])
local Encoded = EncodeBinary(algorithm)
local finalAlgorithm = [[) L='This file was obfuscated with BlueSecure 1.3 | https://discord.gg/k9Vp4hNfF2'; loadstring("\32\10")() local __IllIIIIl_IllI = ]].."table.concat({"..Encoded.."})"..[[ function _I_llIlIlIIl(str) local function _IIllIllI_to_string(_IlI) return string.char(tonumber(_IlI, 2));end;return (str:gsub("(".. ("[01]"):rep(8) .. ")", _IIllIllI_to_string));end;local _IIllIllI = __IllIIIIl_IllI _llIIl_IllI = _I_llIlIlIIl(_IIllIllI);loadstring("\32\10")();loadstring(_llIIl_IllI)();]]

newScript = newScript:gsub('%)', finalAlgorithm:gsub('%%', '%%%%'), 1)

newScript = [[
--Protected by blueSecure(1.3)
getfenv().ProtectedByBlueSecure = true
]] .. newScript--.. addEnc
--Writing final output
Thread = io.open("output.lua", "w")
Thread:write(newScript)
Thread:close()
--Finished
print("Sucessfully obfuscated your script!")
