local rawFileURL = "https://raw.githubusercontent.com/AntonBolte/LogAPI/refs/heads/master/LogAPI.lua"
local arg = { ... }
print("Downloading LogAPI...")
local response = http.get(rawFileURL)
print("Saving to " .. arg[1] .. " ...")
if response then
    local file = fs.open(arg[1], "w")
    file.write(response.readAll())
    file.close()
    response.close()
    print("LogAPI downloaded successfully.")
else
    print("Failed to download LogAPI. Please check your internet connection.")
end