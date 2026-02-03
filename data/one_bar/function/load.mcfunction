#set every player's max health to 10 hearts
execute as @a run attribute @s minecraft:max_health base set 20

#reset all scoreboard entries
scoreboard players reset @a

#create a scoreboard entry for the player's current health
scoreboard objectives add health health "Health"

#create a scoreboard entry for the player's last health
scoreboard objectives add last_health dummy "Last Health"

#create a scoreboard entry for the value of the minimum health of someone whose health has changed this tick
scoreboard objectives add min_health dummy "Minimum Health"

#create a scoreboard entry for the value of the maximum health of someone whose health has changed this tick
scoreboard objectives add max_health dummy "Maximum Health"

#create a scoreboard entry for death count
scoreboard objectives add deaths deathCount "Deaths"

#create a scoreboard objective for detecting when someone joins the game
scoreboard objectives add joins dummy "Joins"

#create a scoreboard objective for detecting when someone leaves the game
scoreboard objectives add leaves minecraft.custom:minecraft.leave_game "Leaves"

#show player health in tab menu
scoreboard objectives setdisplay list health
scoreboard objectives modify health rendertype hearts

#copy health objective to last_health
execute as @a run scoreboard players operation @s last_health = @s health

