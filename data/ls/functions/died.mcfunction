#Drops heart. Only executes if scoreboard player "$dropHearts" is set to 1 for ls_settings
execute if score $dropHearts ls_settings matches 1 run summon item ~ ~ ~ {Motion:[0.0,0.27,0.0],PickupDelay:40,Item:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Heart","color":"red","bold":true,"italic":false}'},Unbreakable:1b,lsHeart:1b,Enchantments:[{}]}}}

#Removes health and resets death counter
scoreboard players set @s ls_died 2
scoreboard players remove @s ls_maxHealthModifier 1