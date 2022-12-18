#Matches max.health attribute to health modifier
execute if entity @s[scores={ls_maxHealthModifier=1}] run attribute @s minecraft:generic.max_health base set 2
execute if entity @s[scores={ls_maxHealthModifier=2}] run attribute @s minecraft:generic.max_health base set 4
execute if entity @s[scores={ls_maxHealthModifier=3}] run attribute @s minecraft:generic.max_health base set 6
execute if entity @s[scores={ls_maxHealthModifier=4}] run attribute @s minecraft:generic.max_health base set 8
execute if entity @s[scores={ls_maxHealthModifier=5}] run attribute @s minecraft:generic.max_health base set 10
execute if entity @s[scores={ls_maxHealthModifier=6}] run attribute @s minecraft:generic.max_health base set 12
execute if entity @s[scores={ls_maxHealthModifier=7}] run attribute @s minecraft:generic.max_health base set 14
execute if entity @s[scores={ls_maxHealthModifier=8}] run attribute @s minecraft:generic.max_health base set 16
execute if entity @s[scores={ls_maxHealthModifier=9}] run attribute @s minecraft:generic.max_health base set 18
execute if entity @s[scores={ls_maxHealthModifier=10}] run attribute @s minecraft:generic.max_health base set 20
execute if entity @s[scores={ls_maxHealthModifier=11}] run attribute @s minecraft:generic.max_health base set 22
execute if entity @s[scores={ls_maxHealthModifier=12}] run attribute @s minecraft:generic.max_health base set 24
execute if entity @s[scores={ls_maxHealthModifier=13}] run attribute @s minecraft:generic.max_health base set 26
execute if entity @s[scores={ls_maxHealthModifier=14}] run attribute @s minecraft:generic.max_health base set 28
execute if entity @s[scores={ls_maxHealthModifier=15}] run attribute @s minecraft:generic.max_health base set 30
execute if entity @s[scores={ls_maxHealthModifier=16}] run attribute @s minecraft:generic.max_health base set 32
execute if entity @s[scores={ls_maxHealthModifier=17}] run attribute @s minecraft:generic.max_health base set 34
execute if entity @s[scores={ls_maxHealthModifier=18}] run attribute @s minecraft:generic.max_health base set 36
execute if entity @s[scores={ls_maxHealthModifier=19}] run attribute @s minecraft:generic.max_health base set 38
execute if entity @s[scores={ls_maxHealthModifier=20}] run attribute @s minecraft:generic.max_health base set 40

#Stores the value of ls_maxHealthModifier to ls_maxHealth, and posions the player to update health
effect give @s minecraft:poison 1 1 true
execute store result score @s ls_maxHealth run scoreboard players get @s ls_maxHealthModifier