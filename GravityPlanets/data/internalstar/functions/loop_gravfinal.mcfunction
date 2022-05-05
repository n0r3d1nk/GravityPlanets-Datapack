# FINAL GRAVITY SET: Determine gravity priority
# TargetGravFinal: 0-5=DUNSWE, 6=random, 7=forwards

execute as @a store result score @s CurrGrav run gravity get @s
scoreboard players remove @a[scores={TargetGravDelay=1..}] TargetGravDelay 1
scoreboard players set @a TargetGravFinal -1
scoreboard players set @a[scores={TargetGravDelay=1..}] TargetGravFinal -2

scoreboard players remove @a[scores={TargetGravPlanetDelay=1..}] TargetGravPlanetDelay 1
scoreboard players set @a[scores={TargetGravPlanetDelay=1..}] TargetGravPlanet -2

# DEATH override: While player is dead, their gravity is always down (so that they respawn properly)
scoreboard players set @a[nbt={Health:0.0f}] TargetGravFinal 0

# CREATIVE override: Holding a gravitychanger arrow in your offhand and that arrow will override all other gravity effects
scoreboard players set @a[scores={TargetGravFinal=-1},nbt={Inventory:[{Slot: -106b, id:"gravitychanger:gravity_changer_down"}]}] TargetGravFinal 0
scoreboard players set @a[scores={TargetGravFinal=-1},nbt={Inventory:[{Slot: -106b, id:"gravitychanger:gravity_changer_up"}]}] TargetGravFinal 1
scoreboard players set @a[scores={TargetGravFinal=-1},nbt={Inventory:[{Slot: -106b, id:"gravitychanger:gravity_changer_north"}]}] TargetGravFinal 2
scoreboard players set @a[scores={TargetGravFinal=-1},nbt={Inventory:[{Slot: -106b, id:"gravitychanger:gravity_changer_south"}]}] TargetGravFinal 3
scoreboard players set @a[scores={TargetGravFinal=-1},nbt={Inventory:[{Slot: -106b, id:"gravitychanger:gravity_changer_west"}]}] TargetGravFinal 4
scoreboard players set @a[scores={TargetGravFinal=-1},nbt={Inventory:[{Slot: -106b, id:"gravitychanger:gravity_changer_east"}]}] TargetGravFinal 5

# PERMAMENT gravity changes that assign a new default gravity
execute as @a[scores={TargetGravFinal=-1,TargetGravRand=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravRand
execute as @a[scores={TargetGravFinal=-1,TargetGravGlass=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravGlass
scoreboard players set @a[scores={TargetGravFinal=-1,TargetGravWallPush=0..}] TargetGravPlanetDelay 40
execute as @a[scores={TargetGravFinal=-1,TargetGravWallPush=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravWallPush
execute as @a[scores={TargetGravFinal=-1,TargetGravWallPull=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravWallPull
# (everything above this tag is permament, everything below it is temporary)
tag @a remove SetDefaultGravity
tag @a[scores={TargetGravFinal=0..}] add SetDefaultGravity
# TEMPORARY gravity changes that revert to default gravity when the effect ends
execute as @a[scores={TargetGravFinal=-1,TargetGravWallStick=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravWallStick
execute as @a[scores={TargetGravFinal=-1,TargetGravPlanet=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravPlanet
# DEFAULT gravity that is used if no other effects are currently active
execute as @a[scores={TargetGravFinal=-1,TargetGravDefault=0..}] run scoreboard players operation @s TargetGravFinal = @s TargetGravDefault

# Actually set the gravity (unless target = current)
tag @a remove SetFinalGrav
execute as @a[scores={TargetGravFinal=0..}] unless score @s TargetGravFinal = @s CurrGrav run tag @s add SetFinalGrav
gravity set down @a[tag=SetFinalGrav,scores={TargetGravFinal=0}]
gravity set up @a[tag=SetFinalGrav,scores={TargetGravFinal=1}]
gravity set north @a[tag=SetFinalGrav,scores={TargetGravFinal=2}]
gravity set south @a[tag=SetFinalGrav,scores={TargetGravFinal=3}]
gravity set west @a[tag=SetFinalGrav,scores={TargetGravFinal=4}]
gravity set east @a[tag=SetFinalGrav,scores={TargetGravFinal=5}]
gravity randomise @a[tag=SetFinalGrav,scores={TargetGravFinal=6}]
gravity rotate forward @a[tag=SetFinalGrav,scores={TargetGravFinal=7}]
scoreboard players set @a[tag=SetFinalGrav] TargetGravDelay 5
scoreboard players set @a[tag=SetFinalGrav] PrevGravWallStick -1

# If a PERMAMENT gravity was used, set the new default gravity (this must come AFTER the "gravity randomize" command)
execute as @a[tag=SetDefaultGravity] store result score @s TargetGravDefault run gravity get @s

# Reset vars for next tick
scoreboard players set @a TargetGravGlass -1
scoreboard players set @a TargetGravRand -1
scoreboard players set @a TargetGravWallPull -1
scoreboard players set @a TargetGravWallPush -1
scoreboard players set @a TargetGravWallStick -1
scoreboard players set @a TargetGravPlanet -1