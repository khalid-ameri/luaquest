require("data")

function describe_location()
    local room = rooms[player.location]
    print("\n" .. room.desc)
    if room.enemy then
        print("Enemy spotted: " .. room.enemy.name)
    end
    if room.item then
        print("Item here: " .. room.item.name)
    end
    print("Exits: " .. table.concat(table.keys(room.exits), ", "))
end

function move(direction)
    local room = rooms[player.location]
    if room.exits[direction] then
        player.location = room.exits[direction]
        describe_location()
    else
        print("Can't go that way.")
    end
end

function pickup()
    local room = rooms[player.location]
    if room.item then
        table.insert(player.inventory, room.item)
        print("Picked up: " .. room.item.name)
        room.item = nil
    else
        print("Nothing to pick up here.")
    end
end

function fight()
    local room = rooms[player.location]
    if room.enemy then
        local enemy = room.enemy
        print("Fighting " .. enemy.name .. "!")
        while enemy.hp > 0 and player.hp > 0 do
            enemy.hp = enemy.hp - 5 -- fixed player attack
            print("Hit! " .. enemy.name .. " HP: " .. enemy.hp)
            if enemy.hp <= 0 then
                print(enemy.name .. " defeated!")
                room.enemy = nil
                break
            end
            player.hp = player.hp - enemy.attack
            print("Ouch! Player HP: " .. player.hp)
            if player.hp <= 0 then
                print("You died! Game Over.")
                os.exit()
            end
        end
    else
        print("No enemy here.")
    end
end
