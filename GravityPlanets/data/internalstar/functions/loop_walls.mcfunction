
# Gravity Wall Notes:
# Block detection distance: feet=0.1, leg=0.4, head=1.9
# CurrGrav: 0=Down(Y-) 1=Up(Y+) 2=North(Z-) 3=South(Z+) 4=West(X-) 5=East(X+)


# Gravity Wall: STICKY (Glow Lichen)

scoreboard players set @a TargetGravWallStick -1

execute as @a at @s if block ~-0.3 ~ ~ minecraft:glow_lichen[east=true] run scoreboard players set @s TargetGravWallStick 5
execute as @a at @s if block ~-0.3 ~ ~ minecraft:glow_lichen[west=true] run scoreboard players set @s TargetGravWallStick 4
execute as @a at @s if block ~-0.3 ~ ~ minecraft:glow_lichen[south=true] run scoreboard players set @s TargetGravWallStick 3
execute as @a at @s if block ~-0.3 ~ ~ minecraft:glow_lichen[north=true] run scoreboard players set @s TargetGravWallStick 2
execute as @a at @s if block ~-0.3 ~ ~ minecraft:glow_lichen[up=true] run scoreboard players set @s TargetGravWallStick 1
execute as @a at @s if block ~-0.3 ~ ~ minecraft:glow_lichen[down=true] run scoreboard players set @s TargetGravWallStick 0

execute as @a at @s if block ~0.3 ~ ~ minecraft:glow_lichen[east=true] run scoreboard players set @s TargetGravWallStick 5
execute as @a at @s if block ~0.3 ~ ~ minecraft:glow_lichen[west=true] run scoreboard players set @s TargetGravWallStick 4
execute as @a at @s if block ~0.3 ~ ~ minecraft:glow_lichen[south=true] run scoreboard players set @s TargetGravWallStick 3
execute as @a at @s if block ~0.3 ~ ~ minecraft:glow_lichen[north=true] run scoreboard players set @s TargetGravWallStick 2
execute as @a at @s if block ~0.3 ~ ~ minecraft:glow_lichen[up=true] run scoreboard players set @s TargetGravWallStick 1
execute as @a at @s if block ~0.3 ~ ~ minecraft:glow_lichen[down=true] run scoreboard players set @s TargetGravWallStick 0

execute as @a at @s if block ~ ~ ~-0.3 minecraft:glow_lichen[east=true] run scoreboard players set @s TargetGravWallStick 5
execute as @a at @s if block ~ ~ ~-0.3 minecraft:glow_lichen[west=true] run scoreboard players set @s TargetGravWallStick 4
execute as @a at @s if block ~ ~ ~-0.3 minecraft:glow_lichen[south=true] run scoreboard players set @s TargetGravWallStick 3
execute as @a at @s if block ~ ~ ~-0.3 minecraft:glow_lichen[north=true] run scoreboard players set @s TargetGravWallStick 2
execute as @a at @s if block ~ ~ ~-0.3 minecraft:glow_lichen[up=true] run scoreboard players set @s TargetGravWallStick 1
execute as @a at @s if block ~ ~ ~-0.3 minecraft:glow_lichen[down=true] run scoreboard players set @s TargetGravWallStick 0

execute as @a at @s if block ~ ~ ~0.3 minecraft:glow_lichen[east=true] run scoreboard players set @s TargetGravWallStick 5
execute as @a at @s if block ~ ~ ~0.3 minecraft:glow_lichen[west=true] run scoreboard players set @s TargetGravWallStick 4
execute as @a at @s if block ~ ~ ~0.3 minecraft:glow_lichen[south=true] run scoreboard players set @s TargetGravWallStick 3
execute as @a at @s if block ~ ~ ~0.3 minecraft:glow_lichen[north=true] run scoreboard players set @s TargetGravWallStick 2
execute as @a at @s if block ~ ~ ~0.3 minecraft:glow_lichen[up=true] run scoreboard players set @s TargetGravWallStick 1
execute as @a at @s if block ~ ~ ~0.3 minecraft:glow_lichen[down=true] run scoreboard players set @s TargetGravWallStick 0

# Cravity Wall: Sticky logic

# Start touching a sticky wall: record gravity state before sticky wall was touched
execute as @a[scores={TargetGravWallStick=0..5,PrevGravWallStick=-1}] run scoreboard players operation @s GravBeforeStick = @s CurrGrav
# Stop touching a sticky wall: run timer for ending the sticky effect
scoreboard players add @a[scores={TargetGravWallStick=-1,PrevGravWallStick=0..5}] GravWallStickTimer 1
# Timer finishes: player is no longer attached to sticky wall, revert gravity to what it was before touching sticky wall (and reset the timer)
execute as @a[scores={GravWallStickTimer=10..}] run scoreboard players operation @s TargetGravWallStick = @s GravBeforeStick
scoreboard players set @a[scores={GravWallStickTimer=10..}] PrevGravWallStick -1
scoreboard players set @a[scores={PrevGravWallStick=-1}] GravWallStickTimer 0
# Touching a sticky wall: record state for next tick, reset unstick timer to 0
execute as @a[scores={TargetGravWallStick=0..5}] run scoreboard players operation @s PrevGravWallStick = @s TargetGravWallStick
scoreboard players set @a[scores={TargetGravWallStick=0..5}] GravWallStickTimer 0
# If unstick timer is counting down: player hasn't disconnected yet, keep the sticky gravity from when they last touched the wall
execute as @a[scores={GravWallStickTimer=1..}] run scoreboard players operation @s TargetGravWallStick = @s PrevGravWallStick




# Gravity Wall: PULL (light gray glazed terracotta)

execute as @a at @s[scores={CurrGrav=0}] if block ~ ~-0.1 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 0
execute as @a at @s[scores={CurrGrav=1}] if block ~ ~-1.9 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 0
execute as @a at @s[scores={CurrGrav=2..5}] if block ~ ~-0.4 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 0
execute as @a at @s[scores={CurrGrav=2}] if block ~ ~-0.4 ~1 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 0
execute as @a at @s[scores={CurrGrav=3}] if block ~ ~-0.4 ~-1 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 0
execute as @a at @s[scores={CurrGrav=4}] if block ~1 ~-0.4 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 0
execute as @a at @s[scores={CurrGrav=5}] if block ~-1 ~-0.4 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 0

execute as @a at @s[scores={CurrGrav=1}] if block ~ ~0.1 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 1
execute as @a at @s[scores={CurrGrav=0}] if block ~ ~1.9 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 1
execute as @a at @s[scores={CurrGrav=2..5}] if block ~ ~0.4 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 1
execute as @a at @s[scores={CurrGrav=2}] if block ~ ~0.4 ~1 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 1
execute as @a at @s[scores={CurrGrav=3}] if block ~ ~0.4 ~-1 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 1
execute as @a at @s[scores={CurrGrav=4}] if block ~1 ~0.4 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 1
execute as @a at @s[scores={CurrGrav=5}] if block ~-1 ~0.4 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 1

execute as @a at @s[scores={CurrGrav=2}] if block ~ ~ ~-0.1 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 2
execute as @a at @s[scores={CurrGrav=3}] if block ~ ~ ~-1.9 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 2
execute as @a at @s[scores={CurrGrav=0..1}] if block ~ ~ ~-0.4 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 2
execute as @a at @s[scores={CurrGrav=4..5}] if block ~ ~ ~-0.4 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 2
execute as @a at @s[scores={CurrGrav=0}] if block ~ ~1 ~-0.4 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 2
execute as @a at @s[scores={CurrGrav=1}] if block ~ ~-1 ~-0.4 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 2
execute as @a at @s[scores={CurrGrav=4}] if block ~1 ~ ~-0.4 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 2
execute as @a at @s[scores={CurrGrav=5}] if block ~-1 ~ ~-0.4 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 2

execute as @a at @s[scores={CurrGrav=3}] if block ~ ~ ~0.1 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 3
execute as @a at @s[scores={CurrGrav=2}] if block ~ ~ ~1.9 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 3
execute as @a at @s[scores={CurrGrav=0..1}] if block ~ ~ ~0.4 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 3
execute as @a at @s[scores={CurrGrav=4..5}] if block ~ ~ ~0.4 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 3
execute as @a at @s[scores={CurrGrav=0}] if block ~ ~1 ~0.4 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 3
execute as @a at @s[scores={CurrGrav=1}] if block ~ ~-1 ~0.4 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 3
execute as @a at @s[scores={CurrGrav=4}] if block ~1 ~ ~0.4 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 3
execute as @a at @s[scores={CurrGrav=5}] if block ~-1 ~ ~0.4 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 3

execute as @a at @s[scores={CurrGrav=4}] if block ~-0.1 ~ ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 4
execute as @a at @s[scores={CurrGrav=5}] if block ~-1.9 ~ ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 4
execute as @a at @s[scores={CurrGrav=0..3}] if block ~-0.4 ~ ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 4
execute as @a at @s[scores={CurrGrav=0}] if block ~-0.4 ~1 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 4
execute as @a at @s[scores={CurrGrav=1}] if block ~-0.4 ~-1 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 4
execute as @a at @s[scores={CurrGrav=2}] if block ~-0.4 ~ ~1 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 4
execute as @a at @s[scores={CurrGrav=3}] if block ~-0.4 ~ ~-1 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 4

execute as @a at @s[scores={CurrGrav=5}] if block ~0.1 ~ ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 5
execute as @a at @s[scores={CurrGrav=4}] if block ~1.9 ~ ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 5
execute as @a at @s[scores={CurrGrav=0..3}] if block ~0.4 ~ ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 5
execute as @a at @s[scores={CurrGrav=0}] if block ~0.4 ~1 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 5
execute as @a at @s[scores={CurrGrav=1}] if block ~0.4 ~-1 ~ minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 5
execute as @a at @s[scores={CurrGrav=2}] if block ~0.4 ~ ~1 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 5
execute as @a at @s[scores={CurrGrav=3}] if block ~0.4 ~ ~-1 minecraft:light_gray_glazed_terracotta run scoreboard players set @s TargetGravWallPull 5




# Gravity Wall: PUSH (pink glazed gray terracotta)

execute as @a at @s[scores={CurrGrav=1}] if block ~ ~0.1 ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 0
execute as @a at @s[scores={CurrGrav=2..5}] if block ~ ~0.4 ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 0
execute as @a at @s[scores={CurrGrav=2}] if block ~ ~0.4 ~1 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 0
execute as @a at @s[scores={CurrGrav=3}] if block ~ ~0.4 ~-1 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 0
execute as @a at @s[scores={CurrGrav=4}] if block ~1 ~0.4 ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 0
execute as @a at @s[scores={CurrGrav=5}] if block ~-1 ~0.4 ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 0

execute as @a at @s[scores={CurrGrav=0}] if block ~ ~-0.1 ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 1
execute as @a at @s[scores={CurrGrav=2..5}] if block ~ ~-0.4 ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 1
execute as @a at @s[scores={CurrGrav=2}] if block ~ ~-0.4 ~1 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 1
execute as @a at @s[scores={CurrGrav=3}] if block ~ ~-0.4 ~-1 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 1
execute as @a at @s[scores={CurrGrav=4}] if block ~1 ~-0.4 ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 1
execute as @a at @s[scores={CurrGrav=5}] if block ~-1 ~-0.4 ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 1

execute as @a at @s[scores={CurrGrav=3}] if block ~ ~ ~0.1 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 2
execute as @a at @s[scores={CurrGrav=0..1}] if block ~ ~ ~0.4 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 2
execute as @a at @s[scores={CurrGrav=4..5}] if block ~ ~ ~0.4 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 2
execute as @a at @s[scores={CurrGrav=0}] if block ~ ~1 ~0.4 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 2
execute as @a at @s[scores={CurrGrav=1}] if block ~ ~-1 ~0.4 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 2
execute as @a at @s[scores={CurrGrav=4}] if block ~1 ~ ~0.4 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 2
execute as @a at @s[scores={CurrGrav=5}] if block ~-1 ~ ~0.4 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 2

execute as @a at @s[scores={CurrGrav=2}] if block ~ ~ ~-0.1 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 3
execute as @a at @s[scores={CurrGrav=0..1}] if block ~ ~ ~-0.4 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 3
execute as @a at @s[scores={CurrGrav=4..5}] if block ~ ~ ~-0.4 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 3
execute as @a at @s[scores={CurrGrav=0}] if block ~ ~1 ~-0.4 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 3
execute as @a at @s[scores={CurrGrav=1}] if block ~ ~-1 ~-0.4 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 3
execute as @a at @s[scores={CurrGrav=4}] if block ~1 ~ ~-0.4 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 3
execute as @a at @s[scores={CurrGrav=5}] if block ~-1 ~ ~-0.4 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 3

execute as @a at @s[scores={CurrGrav=5}] if block ~0.1 ~ ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 4
execute as @a at @s[scores={CurrGrav=0..3}] if block ~0.4 ~ ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 4
execute as @a at @s[scores={CurrGrav=0}] if block ~0.4 ~1 ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 4
execute as @a at @s[scores={CurrGrav=1}] if block ~0.4 ~-1 ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 4
execute as @a at @s[scores={CurrGrav=2}] if block ~0.4 ~ ~1 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 4
execute as @a at @s[scores={CurrGrav=3}] if block ~0.4 ~ ~-1 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 4

execute as @a at @s[scores={CurrGrav=4}] if block ~-0.1 ~ ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 5
execute as @a at @s[scores={CurrGrav=0..3}] if block ~-0.4 ~ ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 5
execute as @a at @s[scores={CurrGrav=0}] if block ~-0.4 ~1 ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 5
execute as @a at @s[scores={CurrGrav=1}] if block ~-0.4 ~-1 ~ minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 5
execute as @a at @s[scores={CurrGrav=2}] if block ~-0.4 ~ ~1 minecraft:pink_glazed_terracotta run scoreboard players set @s TargetGravWallPush 5
execute as @a at @s[scores={CurrGrav=3}] if block ~-0.4 ~ ~-1 minecraft:pink_glazed_terracotta run scoreboard players set @a TargetGravWallPush 5