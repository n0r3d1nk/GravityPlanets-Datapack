

# Gravity Glass

scoreboard players set @a[scores={SpyGlass=1..},nbt={SelectedItem:{id:"minecraft:spyglass",tag:{GravityGlass:2.0f}}}] TargetGravGlass 7
scoreboard players set @a[scores={SpyGlass=1..},nbt={SelectedItem:{id:"minecraft:spyglass",tag:{GravityGlass:1.0f}}}] TargetGravGlass 7
clear @a[scores={SpyGlass=1..},nbt={SelectedItem:{id:"minecraft:spyglass",tag:{GravityGlass:1.0f}}}] minecraft:spyglass{GravityGlass:1.0f} 1
scoreboard players set @a[scores={SpyGlass=1..}] SpyGlass 0 
# Tag items for floor crafting
tag @e[type=minecraft:item,nbt={Item: {id: "minecraft:chorus_flower", Count: 1b}}] add GS_ChorusFlower
tag @e[type=minecraft:item,nbt={Item: {id: "minecraft:netherite_ingot", Count: 1b}}] add GS_NetheriteIngot
tag @e[type=minecraft:item,nbt={Item: {id: "minecraft:spyglass", Count: 1b}}] add GS_SpyGlass
tag @e[type=minecraft:item,nbt={Item: {id: "minecraft:spyglass", Count: 1b, tag:{GravityGlass:1.0f}}}] add GS_FragileGlass
tag @e[type=minecraft:item,nbt={Item: {id: "minecraft:spyglass", Count: 1b, tag:{GravityGlass:2.0f}}}] add GS_UltimateGlass
tag @e[tag=GS_FragileGlass] remove GS_SpyGlass
tag @e[tag=GS_UltimateGlass] remove GS_SpyGlass
# Craft Fragile Glass
execute as @e[type=minecraft:item,tag=GS_ChorusFlower] at @s if entity @e[type=minecraft:item,tag=GS_SpyGlass,distance=..1] run tag @s add Craft_FragileGlass
execute as @e[type=minecraft:item,tag=Craft_FragileGlass] at @s run function gravstar:give_fragileglass
execute as @e[type=minecraft:item,tag=Craft_FragileGlass] at @s run kill @e[type=minecraft:item,tag=GS_SpyGlass,distance=..1,limit=1]
kill @e[type=minecraft:item,tag=Craft_FragileGlass]
# Craft Ultimate Glass
execute as @e[type=minecraft:item,tag=GS_NetheriteIngot] at @s if entity @e[type=minecraft:item,tag=GS_FragileGlass,distance=..1] run tag @s add Craft_UltimateGlass
execute as @e[type=minecraft:item,tag=Craft_UltimateGlass] at @s run function gravstar:give_ultimateglass
execute as @e[type=minecraft:item,tag=Craft_UltimateGlass] at @s run kill @e[type=minecraft:item,tag=GS_FragileGlass,distance=..1,limit=1]
kill @e[type=minecraft:item,tag=Craft_UltimateGlass]


# Magic Feather

effect give @a[nbt={Inventory:[{id:"minecraft:feather",tag:{MagicFeather:1.0f}}]}] minecraft:jump_boost 1 255 true
# More floor crafting
tag @e[type=minecraft:item,nbt={Item: {id: "minecraft:chorus_flower", Count: 1b}}] add GS_ChorusFlower
tag @e[type=minecraft:item,nbt={Item: {id: "minecraft:feather", Count: 1b}}] add GS_Feather
tag @e[type=minecraft:item,nbt={Item: {id: "minecraft:feather", Count: 1b}}] add GS_Feather
execute as @e[type=minecraft:item,tag=GS_ChorusFlower] at @s if entity @e[type=minecraft:item,tag=GS_Feather,distance=..1] run tag @s add Craft_MagicFeather
execute as @e[type=minecraft:item,tag=Craft_MagicFeather] at @s run function gravstar:give_magicfeather
execute as @e[type=minecraft:item,tag=Craft_MagicFeather] at @s run kill @e[type=minecraft:item,tag=GS_Feather,distance=..1,limit=1]
kill @e[type=minecraft:item,tag=Craft_MagicFeather]


# Timed Randomizer

scoreboard players add @a GravTimerTick 1
scoreboard players remove @a[scores={GravTimerEnable=1..,GravTimerTick=20..}] GravTimer 1
scoreboard players set @a[scores={GravTimerEnable=1..,GravTimer=..0}] TargetGravRand 6
scoreboard players set @a[scores={GravTimerEnable=1..,GravTimer=..0}] GravTimer 300
scoreboard players set @a[scores={GravTimerEnable=1..},nbt={Health:0.0f}] GravTimer 60


# Gravity Walls
function internalstar:loop_walls


# Planets
function internalstar:loop_planets


# Final operation: actually assign player gravity
function internalstar:loop_gravfinal