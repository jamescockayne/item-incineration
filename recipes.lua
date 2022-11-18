-- real ingredients
local ingredients = {
    {"advanced-circuit", 20},
    {"steel-plate", 40},
    {"stone-brick", 40}
}
local testIngredients = {
    {"iron-plate", 1},
    {"copper-plate", 1},
}
-- recipe for the actual incinerator
local recipe = table.deepcopy(data.raw["recipe"]["electric-furnace"]);
recipe.enabled = true;
recipe.name = "incin-recipe";
recipe.ingredients = testIngredients
recipe.result = "incin-item";


data:extend{recipe}

-- recipe that turns wood into iron plate
local incinerateWood = {
    name = "recycle-wood-to-plate",
    type = "recipe",
    category = "crafting",
    enabled = true,
    ingredients = {
        {"wood", 1}
    },
    icon = "__item-recycling__/icon.png",
    icon_size = 32,
    result = "wood",
    energy_required = 2
}
data:extend{incinerateWood} 



--local recipeCategory = table.deepcopy(data.raw["recipe-category"]["crafting"])
--recipeCategory.name = "incineration"

--data:extend{recipeCategory}