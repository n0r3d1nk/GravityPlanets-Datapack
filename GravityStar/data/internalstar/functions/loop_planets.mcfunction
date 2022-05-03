
# Create a planet: drop an emerald block (item) onto a diamond block (block)

tag @e[type=minecraft:item,nbt={Item: {id: "minecraft:chorus_flower", Count: 1b}}] add GS_ChorusFlower
execute as @e[type=minecraft:item,tag=GS_ChorusFlower] at @s if block ~ ~-0.5 ~ minecraft:redstone_lamp unless entity @e[type=armor_stand,tag=PlanetCore,distance=..2] run tag @s add PlanetCreateItem
execute as @e[type=minecraft:item,tag=PlanetCreateItem] at @s run summon minecraft:item_frame ~ ~ ~ {Tags:["PlanetAlign"]}
execute as @e[type=minecraft:item_frame,tag=PlanetAlign] at @s run summon minecraft:armor_stand ~ ~-1.5 ~ {Tags:["PlanetCoreInit"],NoGravity:1,Invulnerable:1,Invisible:1,Small:1,Marker:1b,CustomName:'"Planet"'}
kill @e[type=minecraft:item,tag=PlanetCreateItem]
kill @e[type=minecraft:item_frame,tag=PlanetAlign]
scoreboard players set @e[type=minecraft:armor_stand,tag=PlanetCoreInit] PlanetSize 0
execute as @e[type=minecraft:armor_stand,tag=PlanetCoreInit] at @s run scoreboard players set @p PlanetSizeDelta 10
tag @e[type=minecraft:armor_stand,tag=PlanetCoreInit] add PlanetCoreEdit
tag @e[type=minecraft:armor_stand,tag=PlanetCoreInit] add PlanetCore
tag @e[type=minecraft:armor_stand,tag=PlanetCoreInit] remove PlanetCoreInit


# Edit a planet after clicking buttons in the menu

tag @a[scores={PlanetSizeDelta=1..}] add PlayerPlanetSizer
tag @a[scores={PlanetSizeDelta=..-1}] add PlayerPlanetSizer
execute as @a[tag=PlayerPlanetSizer] at @s run scoreboard players operation @e[tag=PlanetCoreEdit,limit=1,sort=nearest] PlanetSize += @s PlanetSizeDelta
scoreboard players set @e[scores={PlanetSize=..-1}] PlanetSize 0
tag @a[tag=PlayerPlanetSizer] add PlayerPlanetMenu
tag @a[tag=PlayerPlanetSizer] remove PlayerPlanetSizer


# Display planet menu: drop a redstone block onto an planet's redstone_lamp

execute as @e[type=minecraft:item,tag=GS_ChorusFlower] at @s if block ~ ~-0.5 ~ minecraft:redstone_lamp if entity @e[type=armor_stand,tag=PlanetCore,distance=..1] unless entity @s[tag=PlanetEditItemFinished] run tag @s add PlanetEditItem
execute as @e[type=minecraft:item,tag=PlanetEditItem] run tag @e[tag=PlanetCoreEdit] remove PlanetCoreEdit
execute as @e[type=minecraft:item,tag=PlanetEditItem] at @s run tag @e[type=armor_stand,tag=PlanetCore,limit=1,sort=nearest] add PlanetCoreEdit
execute as @e[type=minecraft:item,tag=PlanetEditItem] run tag @p add PlayerPlanetMenu
execute as @e[type=minecraft:item,tag=PlanetEditItem] run scoreboard players reset @e PlanetSizeDelta
scoreboard players set @a[tag=PlayerPlanetMenu] PlanetSizeDelta 0

# MINECRAFTJSON.COM {"jformat":8,"jobject":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":"Edit Planet Radius: "},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":"run_command","click_event_value":"/scoreboard players remove @s PlanetSizeDelta 25","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":"[-25]"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":"run_command","click_event_value":"/scoreboard players remove @s PlanetSizeDelta 5","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":" [-5]"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":"run_command","click_event_value":"/scoreboard players remove @s PlanetSizeDelta 1","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":" [-1] "},{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"blue","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"score_name":"@e[tag=PlanetCoreEdit,limit=1,sort=nearest]","score_objective":"PlanetSize","score_value":null},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"green","insertion":"","click_event_type":"run_command","click_event_value":"/scoreboard players add @s PlanetSizeDelta 1","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":" [+1] "},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"green","insertion":"","click_event_type":"run_command","click_event_value":"/scoreboard players add @s PlanetSizeDelta 5","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":"[+5] "},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"green","insertion":"","click_event_type":"run_command","click_event_value":"/scoreboard players add @s PlanetSizeDelta 25","hover_event_type":"none","hover_event_value":"","hover_event_object":{},"hover_event_children":[],"text":"[+25]"}],"command":"tellraw @p %s","jtemplate":"tellraw"}

tellraw @a[tag=PlayerPlanetMenu] [""]
tellraw @a[tag=PlayerPlanetMenu] ["","Edit Planet Radius: ",{"text":"[-25]","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players remove @s PlanetSizeDelta 25"}},{"text":" [-5]","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players remove @s PlanetSizeDelta 5"}},{"text":" [-1] ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players remove @s PlanetSizeDelta 1"}},{"score":{"name":"@e[tag=PlanetCoreEdit,limit=1,sort=nearest]","objective":"PlanetSize"},"bold":true,"color":"blue"},{"text":" [+1] ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players add @s PlanetSizeDelta 1"}},{"text":"[+5] ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players add @s PlanetSizeDelta 5"}},{"text":"[+25]","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players add @s PlanetSizeDelta 25"}}]

tag @e[tag=PlanetEditItem] add PlanetEditItemFinished
tag @e[tag=PlanetEditItem] remove PlanetEditItem
tag @e[tag=PlayerPlanetMenu] remove PlayerPlanetMenu


# Destroy a planet: break the core redstone_lamp
execute as @e[type=minecraft:armor_stand,tag=PlanetCore] at @s unless block ~ ~ ~ minecraft:redstone_lamp run kill @s


# Planet Core Particles
execute as @e[tag=PlanetCore] at @s if entity @a[distance=..30] run particle minecraft:glow ~ ~ ~ 0.4 0.4 0.4 1 2 force


# Calculate the gravity of each planet.
# Sort by planets closest to (0,0,0) so that the priority is always constant.
# (using sort=arbitrary makes planet priority change after restarting the world)

scoreboard players set @a TargetGravPlanet -1
execute positioned 0 0 0 run execute as @e[type=minecraft:armor_stand,tag=PlanetCore,sort=nearest] at @s if block ~ ~ ~ minecraft:redstone_lamp[lit=true] run function internalstar:loop_planets_armorstands