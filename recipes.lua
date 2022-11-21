-- recipe for the actual incinerator
local recipe = table.deepcopy(data.raw["recipe"]["electric-furnace"]);
recipe.enabled = true;
recipe.name = "incin-recipe";
recipe.ingredients = {
    {"advanced-circuit", 20},
    {"steel-plate", 40},
    {"stone-brick", 40}
}
recipe.result = "incin-item";
data:extend{recipe}


-- add new recipe category to hold incinerating machine recipes
data:extend{{
    name = "incineration",
    type = "recipe-category"
}}

-- add a useless item subgroup so that the game doesn't complain about no recipe results later
data:extend{{
    group = "effects",
    name = "produces-nothing",
    type = "item-subgroup"
}}

local produceNothing = settings.startup["item-incineration-true-incineration"].value
local quickIncinerate = settings.startup["item-incineration-quick-incineration"].value

-- add a recipe for every item by looping through every entry in a prototype table
-- 'checkItems' only exists because projectiles are weird
function addIncinerationRecipesForPrototype(prototype, checkItems)
    for itemName, item in pairs(data.raw[prototype]) do 
        if not checkItems or data.raw["item"][itemName] then
            local new_recipe = {
                name = "incinerate_" .. itemName,
                type = "recipe",
                category = "incineration",
                subgroup = "produces-nothing",
                enabled = true,
                ingredients = {
                    {itemName, 1}
                },
                icon = "__item-incineration__/fire-icon.png",
                icon_size = 512,
                energy_required = 10,
                hidden = true,
            }

            if produceNothing then 
                new_recipe.results = {}
            else 
                new_recipe.result = "ash"
            end

            if quickIncinerate then 
                new_recipe.energy_required = new_recipe.energy_required / 1000
            end
            
            data:extend{new_recipe}
        end
    end
end

addIncinerationRecipesForPrototype "item"
addIncinerationRecipesForPrototype "gun"
addIncinerationRecipesForPrototype "ammo"
addIncinerationRecipesForPrototype "repair-tool"
addIncinerationRecipesForPrototype "capsule"
addIncinerationRecipesForPrototype("projectile", true)


-- add a recipe so there's actually something to do with all the ash
local ash_to_landfill_recipe = table.deepcopy(data.raw["recipe"]["landfill"])
ash_to_landfill_recipe.name = "ash-to-landfill"
ash_to_landfill_recipe.category = "advanced-crafting"
ash_to_landfill_recipe.ingredients = {
    {"ash", 100}
}
ash_to_landfill_recipe.result = "landfill"
ash_to_landfill_recipe.enabled = true
data:extend{ash_to_landfill_recipe}
