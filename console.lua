-- Commands
local command = {
  --[[
  Webby Command API
  By: houseofkraft

  Usage:
  cmdname = {
    desc = "A short description of your command.", <required>
    cmd = "any CraftOS shell command" (optional, set to false if you don't want one),
    output = { (optional, set to false if you don't want an output)
      "This is an output",
      "that will be displayed in",
      "this console log. This setting is",
      "completely optional and you can set it to false if",
      "you don't want one."
    }
  }
  It's also recommended to add your command to the help and you MUST add it to the list table!
  ]]--
  list = {
    -- Make sure to put your command in the list!
    "help",
    "reboot",
    "shutdown",
    "exit"
  },
  reboot = {
    desc = "Reboot the computer.",
    cmd = "reboot",
    output = false
  },
  shutdown = {
    desc = "Shutdown the computer.",
    cmd = "shutdown",
    output = false
  },
  exit = {
    desc = "Exit the Webby Console and return to CraftOS."
    cmd = "exit",
    output = false
  },
  help = {
    desc = "Display the list of commands.",
    cmd = false,
    output = {
      -- It's also recommended to add your command to the help command!
      "=== Webby Console Help ===",
      "help - " .. command.help.desc,
      "reboot - " .. command.reboot.desc,
      "shutdown - " .. command.shutdown.desc,
      "exit - " .. command.exit.desc,
    }
  }
}

function tableFind(arr, text)
  local found = false
  for k,v in pairs(arr) do
    if v == text then
      found = true
    end
  end
  return found
end

function gui()
  local color = term.isColor() -- If the system supports color
  term.clear()
  term.setCursorPos(1,1)
  if color then
    term.setTextColor(colors.orange)
  else
    term.setTextColor(colors.gray)
  end
  print("Firmware: " .. os.version())
  print("Running Webby Console")
  print()
  if color then
    term.setTextColor(colors.green)
  else
    term.setTextColor(colors.lightGray)
  end
  write("> ")
  cmd = read()
  if tableFind(command.list, cmd) then
    if command[cmd]["output"] then
      if type(command[cmd]["output"]) == 'table' then
        for k,v in pairs(command[cmd]["output"]) do
          print(v)
        end
      end
    end
    if command[cmd]["cmd"] then
      if type(command[cmd]["cmd"]) == 'string' then
        -- Execute the command
        shell.run(command[cmd]["cmd"])
      end
    end
  end
end

function log(text)
  local log = textutils.formatTime(os.time()) .. " " .. log)
  if color then
    term.setTextColor(colors.green)
  else
    term.setTextColor(colors.lightGray)
  end
  write(text .. "\n")
end
