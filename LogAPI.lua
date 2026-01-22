--Spaff's LogAPI version 0.1


local logPath = "/Logs/"

function Time()
    return "[UTC:" .. textutils.formatTime(os.time("utc")) .. "]"
end

function Install(URL, path)
    if not path then
        return {status = "error",
                reason = "no path given"}
    end
    local content = http.get(URL)
    local file = fs.open(path, "w+")
    file.write(content.readAll())
    file.close()
end

function SetLogPath(path)
logPath = path
end

function Comment(message, logName)
    term.setTextColor(colors.white)
    local content = Time() .. "[COMMENT]" .. message
    if logName then
    local file = fs.open(logPath .. logName .. "Logs.txt", "w")
    file.writeLine(content)
    file.close()
    end
    print(content)
end

function Info(message, logName)
    term.setTextColor(colors.blue)
    local content = Time() .. "[INFO]" .. message
    if logName then
    local file = fs.open(logPath .. logName .. "Logs.txt", "w")
    file.writeLine(content)
    file.close()
    end
    print(content)
end

function Warn(message, logName)
    term.setTextColor(colors.yellow)
    local content = Time() .. "[WARN]" .. message
    if logName then
    local file = fs.open(logPath .. logName .. "Logs.txt", "w")
    file.writeLine(content)
    file.close()
    end
    print(content)
end

function Error(message, logName)
    term.setTextColor(colors.red)
    local content = Time() .. "[ERROR]" .. message
    if logName then
    local file = fs.open(logPath .. logName .. "Logs.txt", "w")
    file.writeLine(content)
    file.close()
    end
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