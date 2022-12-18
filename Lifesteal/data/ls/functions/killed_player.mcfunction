#Adds a heart. Only executes if scoreboard player "$dropHearts" is set to 0 for ls_settings
execute if score $dropHearts ls_settings matches 0 unless score @s ls_maxHealth matches 20 run scoreboard players add @s ls_maxHealthModifier 1

advancement revoke @s only ls:killed_player