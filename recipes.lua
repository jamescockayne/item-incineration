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


-- add new category for incenerating machine recipes
local incineration_recipe_category = {
    name = "incineration",
    type = "recipe-category"
}
data:extend{incineration_recipe_category}


function addIncinerationRecipesForPrototype(prototype, checkItems)
    for itemName, item in pairs(data.raw[prototype]) do 
        if not checkItems or data.raw["item"][itemName] then
            local new_recipe = {
                name = "incinerate_" .. itemName,
                type = "recipe",
                category = "incineration",
                enabled = true,
                ingredients = {
                    {itemName, 1}
                },
                icon = "__item-incineration__/fire-icon.png",
                icon_size = 512,
                result = "ash",
                energy_required = 2
            }
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
