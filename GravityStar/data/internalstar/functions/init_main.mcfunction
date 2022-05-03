
# Core Functionality

gamerule sendCommandFeedback false
gamerule commandBlockOutput false
scoreboard objectives add CurrGrav dummy
scoreboard objectives add TargetGravFinal dummy
scoreboard objectives add TargetGravDelay dummy
scoreboard players set @a TargetGravDelay 0


# Gravity Glass

scoreboard objectives add SpyGlass minecraft.used:minecraft.spyglass
scoreboard players set @a SpyGlass 0
scoreboard objectives add TargetGravGlass dummy
scoreboard players set @a TargetGravGlass -1

# Timed Randomizer

scoreboard objectives add GravTimerEnable dummy
scoreboard players set @a GravTimerEnable 0
scoreboard objectives add GravTimerTick dummy
scoreboard players set @a GravTimerTick 0
scoreboard objectives add GravTimer dummy
scoreboard players set @a GravTimer 300
scoreboard objectives add TargetGravRand dummy
scoreboard players set @a TargetGravRand -1

# Gravity Walls

scoreboard objectives add TargetGravWallPull dummy
scoreboard players set @a TargetGravWallPull -1
scoreboard objectives add TargetGravWallPush dummy
scoreboard players set @a TargetGravWallPush -1
scoreboard objectives add TargetGravWallStick dummy
scoreboard players set @a TargetGravWallStick -1
scoreboard objectives add PrevGravWallStick dummy
scoreboard players set @a PrevGravWallStick -1
scoreboard objectives add GravWallStickTimer dummy
scoreboard players set @a GravWallStickTimer 0
scoreboard objectives add GravBeforeStick dummy
scoreboard players set @a GravBeforeStick -1


# Planets

scoreboard objectives add PlanetSize dummy
scoreboard objectives add PlanetSizeDelta dummy 
scoreboard objectives add PlanetSizeNeg dummy
scoreboard objectives add PlanetPosX dummy
scoreboard objectives add PlanetPosY dummy
scoreboard objectives add PlanetPosZ dummy
scoreboard objectives add PlanetPosXNeg dummy
scoreboard objectives add PlanetPosYNeg dummy
scoreboard objectives add PlanetPosZNeg dummy
scoreboard objectives add TargetGravPlanet dummy
scoreboard players set @a TargetGravPlanet -1
scoreboard objectives add TargetGravPlanetDelay dummy