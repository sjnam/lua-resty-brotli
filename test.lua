local brotli = require "lib.resty.brotli"

local txt = string.rep("ABCDEFGHIJ", 100000)

local compress, decompress = brotli.compress, brotli.decompress

local result = {}

for lvl=0,11 do
   local encoded, err = compress(txt, {quality = lvl})
   local decoded, err = decompress(encoded)
   assert(txt == decoded)
   result[#result+1] = #encoded
end

print("org size=", #txt, "\n\ncompressed")
print("level", "size", "\n------------")

for i, v in ipairs(result) do
   print(i-1, v)
end
