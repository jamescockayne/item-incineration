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
entity.crafting_categories = {"incineration"}
entity.minable = {
    mining_time = 1,
    result = "incin-item",
}
entity.energy_usage = "1800kW"
entity.energy_source = {
    type = "electric",
    emissions_per_minute = 10,
    usage_priority = "secondary-input"
}


data:extend{item, entity}
