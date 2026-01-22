local rawFileURL = "https://raw.githubusercontent.com/AntonBolte/LogAPI/refs/heads/master/LogAPI.lua"
print("Downloading LogAPI...")
local response = http.get(rawFileURL)
local file = fs.open("APIs/LogAPI.lua", "w")
file.write(response.readAll())
file.close()
print("LogAPI downloaded successfully.")

response.close()