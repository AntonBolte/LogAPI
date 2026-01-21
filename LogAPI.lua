--Spaff's LogAPI version 0.1


local logPath = "Logs/log.txt"

function Time()
    return "[UTC:" .. textutils.formatTime(os.time(utc)) .. "]"
end

function SetLogPath(path)
logPath = path
end

function Comment(message)
    term.setTextColor(colors.white)
    local content = Time() .. "[COMMENT]" .. message
    local file = fs.open(logPath, "w")
    file.writeLine(content)
    file.close()
    print(content)
end

function Info(message)
    term.setTextColor(colors.blue)
    local content = Time() .. "[INFO]" .. message
    local file = fs.open(logPath, "w")
    file.writeLine(content)
    file.close()
    print(content)
end

function Warn(message)
    term.setTextColor(colors.yellow)
    local content = Time() .. "[WARN]" .. message
    local file = fs.open(logPath, "w")
    file.writeLine(content)
    file.close()
    print(content)
end

function Error(message)
    term.setTextColor(colors.red)
    local content = Time() .. "[ERROR]" .. message
    local file = fs.open(logPath, "w")
    file.writeLine(content)
    file.close()
    print(content)
end

return {
    SetLogPath = SetLogPath,
    Comment = Comment,
    Info = Info,
    Warn = Warn,
    Error = Error
}