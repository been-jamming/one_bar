#If anyone dies, EVERYONE DIES
execute if entity @p[scores={deaths=1..}] run kill @a[gamemode=survival]
scoreboard players reset @a[scores={deaths=1..}] deaths

#Reset everyone's health bar maximum
execute as @a run attribute @s minecraft:max_health base set 20

#If someone has left and rejoined, mark them as joined
scoreboard players set @a[scores={leaves=1..}] joins 0
scoreboard players reset @a[scores={leaves=1..}] leaves

#Make sure everyone has a joins score
scoreboard players add @a joins 0

#If someone just joined, set their health to everyone else's
scoreboard players operation @a[scores={joins=0}] min_health = @r[scores={joins=1..}] health
execute as @a[scores={joins=0}] run scoreboard players operation @s last_health = @s health

#Set the minimum and maximum health scoreboard entries to 0
scoreboard players set @a min_health 1000
scoreboard players set @a max_health 0

#Compute the minimum and maximum health of the players whose health changed this tick
execute at @a as @a run function one_bar:get_min_max_health

#If anyone healed, set everyone's health to the maximum value
execute as @a[scores={max_health=1..}] run function one_bar:set_max_health

#If anyone took damage, set everyone's health to the minimum value
execute as @a[scores={min_health=1..}] run function one_bar:set_min_health

#Store everyone's health
execute as @a run scoreboard players operation @s last_health = @s health

#shhhhh
attribute @a[name="GameGuru17", scores={joins=0}, limit=1] minecraft:scale base set 1.1

#If anyone is at 4 health or less, make it storm
execute if entity @p[scores={health=1..4}] run weather thunder 3600

#If someone just joined, mark them as no longer having just joined
scoreboard players set @a[scores={joins=0}] joins 1

