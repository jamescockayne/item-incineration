-- create an item for ash - for now based on wood and not placable
local item = table.deepcopy(data.raw["item"]["plastic-bar"])
item.name = "ash"
item.icons = {
    {
        icon = item.icon,
        tint = {r=0.2, g=0.2, b=0.2, a=1}
    }
}


data:extend{item}