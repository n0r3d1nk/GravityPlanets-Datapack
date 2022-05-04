
# This function is executed for each player that is not already effected by a planet


# Determine the player's position relative to the current planet

execute store result score @s PlanetPosX run data get entity @s Pos[0]
execute store result score @s PlanetPosY run data get entity @s Pos[1]
execute store result score @s PlanetPosZ run data get entity @s Pos[2]
scoreboard players operation @s PlanetPosX -= @e[tag=CurrPlanetCore,limit=1] PlanetPosX
scoreboard players operation @s PlanetPosY -= @e[tag=CurrPlanetCore,limit=1] PlanetPosY
scoreboard players operation @s PlanetPosZ -= @e[tag=CurrPlanetCore,limit=1] PlanetPosZ
scoreboard players set @s PlanetPosXNeg 0
scoreboard players set @s PlanetPosYNeg 0
scoreboard players set @s PlanetPosZNeg 0
scoreboard players operation @s PlanetPosXNeg -= @s PlanetPosX
scoreboard players operation @s PlanetPosYNeg -= @s PlanetPosY
scoreboard players operation @s PlanetPosZNeg -= @s PlanetPosZ



# Determine if the player is in range of the CUBICAL planet

execute if score @s PlanetPosX > @e[tag=CurrPlanetCore,limit=1] PlanetSizeNeg if score @s PlanetPosX < @e[tag=CurrPlanetCore,limit=1] PlanetSize if score @s PlanetPosY > @e[tag=CurrPlanetCore,limit=1] PlanetSizeNeg if score @s PlanetPosY < @e[tag=CurrPlanetCore,limit=1] PlanetSize if score @s PlanetPosZ > @e[tag=CurrPlanetCore,limit=1] PlanetSizeNeg if score @s PlanetPosZ < @e[tag=CurrPlanetCore,limit=1] PlanetSize run tag @s add CurrPlanetPlayer



# Calculate the gravity of the player (ex: Gravity 2=North, so player is on the south side of the planet)
# For any given axis A (with other axes B and C) the 4 planes to satsify are: A>B, A>-B, A>C, A>-C

# Planet Top (Y+)
execute as @s[tag=CurrPlanetPlayer] if score @s PlanetPosY > @s PlanetPosX if score @s PlanetPosY > @s PlanetPosXNeg if score @s PlanetPosY > @s PlanetPosZ if score @s PlanetPosY > @s PlanetPosZNeg run scoreboard players set @s TargetGravPlanet 0
# Planet Bottom (Y-)
execute as @s[tag=CurrPlanetPlayer] if score @s PlanetPosYNeg > @s PlanetPosX if score @s PlanetPosYNeg > @s PlanetPosXNeg if score @s PlanetPosYNeg > @s PlanetPosZ if score @s PlanetPosYNeg > @s PlanetPosZNeg run scoreboard players set @s TargetGravPlanet 1
# Planet South (Z+)
execute as @s[tag=CurrPlanetPlayer] if score @s PlanetPosZ > @s PlanetPosX if score @s PlanetPosZ > @s PlanetPosXNeg if score @s PlanetPosZ > @s PlanetPosY if score @s PlanetPosZ > @s PlanetPosYNeg run scoreboard players set @s TargetGravPlanet 2
# Planet North (Z-)
execute as @s[tag=CurrPlanetPlayer] if score @s PlanetPosZNeg > @s PlanetPosX if score @s PlanetPosZNeg > @s PlanetPosXNeg if score @s PlanetPosZNeg > @s PlanetPosY if score @s PlanetPosZNeg > @s PlanetPosYNeg run scoreboard players set @s TargetGravPlanet 3
# Planet East (X+)
execute as @s[tag=CurrPlanetPlayer] if score @s PlanetPosX > @s PlanetPosY if score @s PlanetPosX > @s PlanetPosYNeg if score @s PlanetPosX > @s PlanetPosZ if score @s PlanetPosX > @s PlanetPosZNeg run scoreboard players set @s TargetGravPlanet 4
# Planet East (X-)
execute as @s[tag=CurrPlanetPlayer] if score @s PlanetPosXNeg > @s PlanetPosY if score @s PlanetPosXNeg > @s PlanetPosYNeg if score @s PlanetPosXNeg > @s PlanetPosZ if score @s PlanetPosXNeg > @s PlanetPosZNeg run scoreboard players set @s TargetGravPlanet 5



# Remove the Current tag from all players
tag @e[tag=CurrPlanetPlayer] remove CurrPlanetPlayer
