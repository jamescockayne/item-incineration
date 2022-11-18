-- create a new item for incinerator based on electric furnace
local item = table.deepcopy(data.raw["item"]["electric-furnace"]);
item.name = "incin-item";
item.icons = {
    {
        icon = item.icon,
        tint = {r=1, g=0.4, b=1, a=0.5}
    }
    
}
item.place_result = "incin-entity"

-- create an entity that is generated when the item is placed
local entity = table.deepcopy(data.raw["furnace"]["electric-furnace"]);
entity.name = "incin-entity";
entity.crafting_categories = {"crafting"}
entity.minable = {
    mining_time = 1,
    result = "incin-item",
}

data:extend{item, entity}
