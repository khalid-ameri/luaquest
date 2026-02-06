-- Rooms
rooms = {
    start = {
        desc = "You are in a dark forest. Paths lead north and east.",
        exits = { north = "cave", east = "river" }
    },
    cave = {
        desc = "A spooky cave. You hear growling.",
        exits = { south = "start" },
        enemy = { name = "Goblin", hp = 10, attack = 2 }
    },
    river = {
        desc = "A wide river. You see a shiny sword on the shore.",
        exits = { west = "start" },
        item = { name = "Shiny Sword", damage = 5 }
    }
}

-- Player template
player = {
    location = "start",
    hp = 20,
    inventory = {}
}
