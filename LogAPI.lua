--Spaff's LogAPI version 0.1


local logPath = "/Logs/"

function Time()
    return "[UTC:" .. textutils.formatTime(os.time("utc")) .. "]"
end

function Install(URL, path)
    local content = http.get(URL)
    local file = fs.open(path, "w+")
    file.write(content)
    file.close()
end

function SetLogPath(path)
logPath = path
end

function Comment(message, logName)
    term.setTextColor(colors.white)
    local content = Time() .. "[COMMENT]" .. message
    local file = fs.open(logPath .. logName .. "Logs.txt", "w")
    file.writeLine(content)
    file.close()
    print(content)
end

function Info(message, logName)
    term.setTextColor(colors.blue)
    local content = Time() .. "[INFO]" .. message
    local file = fs.open(logPath .. logName .. "Logs.txt", "w")
    file.writeLine(content)
    file.close()
    print(content)
end

function Warn(message, logName)
    term.setTextColor(colors.yellow)
    local content = Time() .. "[WARN]" .. message
    local file = fs.open(logPath .. logName .. "Logs.txt", "w")
    file.writeLine(content)
    file.close()
    print(content)
end

function Error(message, logName)
    term.setTextColor(colors.red)
    local content = Time() .. "[ERROR]" .. message
    local file = fs.open(logPath .. logName .. "Logs.txt", "w")
    file.writeLine(content)
    file.close()
    print(content)
end

return {
    SetLogPath = SetLogPath,
    Comment = Comment,
    Info = Info,
    Warn = Warn,
    Error = Error,
    Install = Install
}