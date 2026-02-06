-- Basic unit test in Lua (run with `lua test_game.lua`)

require("game")
require("data")

-- Test move
player.location = "start"
move("north")
assert(player.location == "cave", "Move north failed")

-- Test pickup
player.location = "river"
pickup()
assert(#player.inventory == 1 and player.inventory[1].name == "Shiny Sword", "Pickup failed")

print("All tests passed ✅")
