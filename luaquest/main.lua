require("game")
require("data")

print("Welcome to LuaQuest! Type 'help' for commands.")
describe_location()

while true do
    io.write("\n> ")
    local input = io.read()
    if input == "help" then
        print("Commands: move <direction>, pickup, fight, inventory, quit")
    elseif input:match("^move") then
        local dir = input:match("^move%s+(%w+)")
        if dir then move(dir) end
    elseif input == "pickup" then
        pickup()
    elseif input == "fight" then
        fight()
    elseif input == "inventory" then
        if #player.inventory == 0 then
            print("Inventory empty.")
        else
            print("Inventory:")
            for _, item in ipairs(player.inventory) do
                print("- " .. item.name)
            end
        end
    elseif input == "quit" then
        print("Goodbye!")
        break
    else
        print("Unknown command.")
    end
end
