#Set new players' scoreboard to 10 max health and give lsPlayer tag
execute as @a unless score @s ls_maxHealth matches -2.. run function ls:calibrate_health

#Sets $dropHearts to 1 if it detects unexpected value
execute unless score $dropHearts ls_settings matches 0 unless score $dropHearts ls_settings matches 1 run scoreboard players set $dropHearts ls_settings 1

#This system used to be so much worse ;-;

#Set player health modifier to 10 if over or under limit
execute as @a if score @s ls_maxHealthModifier matches 21.. run scoreboard players set @s ls_maxHealthModifier 10
execute as @a if score @s ls_maxHealthModifier matches ..-2 run scoreboard players set @s ls_maxHealthModifier 10

#Respawn beacon
scoreboard players enable @a respawn
execute as @e[tag=lsRespawnBeaconCloud,limit=1,tag=!lsSummoned] at @s run summon minecraft:armor_stand ~ ~-0.75 ~ {NoGravity:1b,Invulnerable:1b,Invisible:1b,Tags:["lsRespawnBeaconStand","lsAirNotChecked"],DisabledSlots:4144959}
execute as @e[tag=lsRespawnBeaconCloud,limit=1] run tag @s add lsSummoned
execute as @e[tag=lsRespawnBeaconStand,tag=lsAirNotChecked] at @s if block ~ ~1 ~ air run function ls:respawn_beacon/place
execute as @e[tag=lsRespawnBeaconStand,tag=lsAirNotChecked] at @s unless block ~ ~1 ~ air run function ls:respawn_beacon/failed_place
execute as @e[tag=lsRespawnBeaconStand,tag=lsAirChecked] at @s if block ~ ~1 ~ air run function ls:respawn_beacon/broken
execute at @e[tag=lsRespawnBeaconStand,tag=lsAirChecked] as @a[scores={respawn=1,ls_maxHealth=0},limit=1,distance=..10] if block ~ ~1 ~ beacon if entity @e[type=item,distance=..2,nbt={Item:{id:"minecraft:warped_fungus_on_a_stick",tag:{lsHeart:1b}}}] run function ls:respawn_beacon/succeed
execute as @a if score @s respawn matches 1.. run scoreboard players set @s respawn 0

#Withdrawing hearts
scoreboard players enable @a withdraw
execute as @a if score @s withdraw matches 1.. unless score @s ls_maxHealth matches ..1 run function ls:withdraw
execute as @a if score @s withdraw matches 1.. run scoreboard players remove @s withdraw 1
execute as @a if score @s withdraw matches ..-1 run scoreboard players set @s withdraw 0

#Adding hearts
execute as @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{lsHeart:1b}}}] if score @s ls_heartClicked matches 1.. unless score @s ls_maxHealth matches 30 run function ls:add_health
execute as @a if score @s ls_heartClicked matches 1.. run scoreboard players remove @s ls_heartClicked 1

#Run death script
execute as @a at @s if score @s ls_died matches 1 run function ls:died
execute as @e[type=player] if score @s ls_died matches 2.. run function ls:modify_health
execute as @e[type=player] if score @s ls_died matches 2.. run scoreboard players set @s ls_died 0

#Force players into spectator when at 0 hearts & let them respawn when at more than 0
execute as @a[tag=!lsDead] if score @s ls_maxHealthModifier matches 0 run gamemode spectator @s
execute as @a[tag=!lsDead] if score @s ls_maxHealthModifier matches 0 run tag @s add lsDead
execute as @e[type=player,tag=lsDead] if score @s ls_maxHealthModifier matches 1.. run function ls:respawn
execute as @e[type=player,tag=lsRespawn] if score @s ls_maxHealthModifier matches 1.. run function ls:modify_health
execute as @e[type=player,tag=lsRespawn] if score @s ls_maxHealthModifier matches 1.. run tag @s remove lsRespawn

#Modify health if ls_maxHealthModifier has a value that is differant than ls_maxHealth
execute as @a unless score @s ls_maxHealthModifier = @s ls_maxHealth run function ls:modify_health