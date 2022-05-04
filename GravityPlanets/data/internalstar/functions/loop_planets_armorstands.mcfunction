
# This function is executed for each armorstand that is representing an active planet


# tag this armorstand as Current and prepare scoreboard variables for future math

tag @s add CurrPlanetCore
execute store result score @s PlanetPosX run data get entity @s Pos[0]
execute store result score @s PlanetPosY run data get entity @s Pos[1]
execute store result score @s PlanetPosZ run data get entity @s Pos[2]
scoreboard players set @s PlanetSizeNeg 0
scoreboard players operation @s PlanetSizeNeg -= @s PlanetSize


# calculate gravity for each player (ignore players that are already affected by another planet)
execute as @a[scores={TargetGravPlanet=-1}] at @s run function internalstar:loop_planets_players


# Remove the Current tag from all planets
tag @e[tag=CurrPlanetCore] remove CurrPlanetCore