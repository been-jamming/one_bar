#If the executor's health changed this tick and it's lower that @p's min_health value, set @p's min health value
execute unless score @s health = @s last_health if entity @s[scores={joins=1..}] if score @p min_health > @s health run scoreboard players operation @p min_health = @s health

#If the executor's health changed this tick and it's higher than @p's max_health value, set @p's max health value
execute unless score @s health = @s last_health if entity @s[scores={joins=1..}] if score @p max_health < @s health run scoreboard players operation @p max_health = @s health

