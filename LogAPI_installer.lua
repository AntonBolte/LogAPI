local fullPath = "https://raw.githubusercontent.com/AntonBolte/LogAPI/refs/heads/master/LogAPI.lua"
local args = {...}


print("LogAPI")
print("Installing full release version...")
    local request = http.get(fullPath)
    if not request then
        error("Failed to download LogAPI Full")
    end
    local file = fs.open(args[1] or "logAPI.lua", "w")
    file.write(request.readAll())
    file.close()
    request.close()
    print("LogAPI Full installed successfully!")
    return