scoreboard objectives add ls_maxHealth dummy
scoreboard objectives add ls_maxHealthModifier dummy
scoreboard objectives add withdraw trigger
scoreboard objectives add ls_heartClicked minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add ls_died deathCount
scoreboard objectives add respawn trigger
scoreboard objectives add ls_settings dummy
execute unless score $dropHearts ls_settings matches 0 unless score $dropHearts ls_settings matches 1 run scoreboard players set $dropHearts ls_settings 1
execute unless score $menuPrompted ls_settings matches 1 run function ls:settings