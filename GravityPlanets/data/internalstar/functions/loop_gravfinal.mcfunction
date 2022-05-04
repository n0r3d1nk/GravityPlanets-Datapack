# FINAL GRAVITY SET: Determine gravity priority
# TargetGravFinal: 0-5=DUNSWE, 6=random, 7=forwards

execute as @a store result score @s CurrGrav run gravity get @s
scoreboard players remove @a[scores={TargetGravDelay=1..}] TargetGravDelay 1
scoreboard players set @a TargetGravFinal -1
scoreboard players set @a[scores={TargetGravDelay=1..}] TargetGravFinal -2

scoreboard players remove @a[scores={TargetGravPlanetDelay=1..}] TargetGravPlanetDelay 1
scoreboard players set @a[scores={TargetGravPlanetDelay=1..}] TargetGravPlanet -2

execute as @a[scores={TargetGravFinal=-1,TargetGravRand=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravRand
execute as @a[scores={TargetGravFinal=-1,TargetGravGlass=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravGlass
scoreboard players set @a[scores={TargetGravFinal=-1,TargetGravWallPush=0..}] TargetGravPlanetDelay 40
execute as @a[scores={TargetGravFinal=-1,TargetGravWallPush=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravWallPush
execute as @a[scores={TargetGravFinal=-1,TargetGravWallPull=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravWallPull
execute as @a[scores={TargetGravFinal=-1,TargetGravWallStick=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravWallStick
execute as @a[scores={TargetGravFinal=-1,TargetGravPlanet=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravPlanet

execute as @a[scores={TargetGravFinal=0..5}] if score @s TargetGravFinal = @s CurrGrav run scoreboard players set @s TargetGravFinal -3

gravity set down @a[scores={TargetGravFinal=0}]
gravity set up @a[scores={TargetGravFinal=1}]
gravity set north @a[scores={TargetGravFinal=2}]
gravity set south @a[scores={TargetGravFinal=3}]
gravity set west @a[scores={TargetGravFinal=4}]
gravity set east @a[scores={TargetGravFinal=5}]
gravity randomise @a[scores={TargetGravFinal=6}]
gravity rotate forward @a[scores={TargetGravFinal=7}]

scoreboard players set @a[scores={TargetGravFinal=0..}] TargetGravDelay 5
scoreboard players set @a[scores={TargetGravFinal=0..}] PrevGravWallStick -1
scoreboard players set @a TargetGravGlass -1
scoreboard players set @a TargetGravRand -1
scoreboard players set @a TargetGravWallPull -1
scoreboard players set @a TargetGravWallPush -1
scoreboard players set @a TargetGravWallStick -1
scoreboard players set @a TargetGravPlanet -1