scoreboard players set @s ls_maxHealthModifier 1
kill @e[type=item,sort=nearest,nbt={Item:{id:"minecraft:warped_fungus_on_a_stick",tag:{lsHeart:1b}}},limit=1]
setblock ~ ~1 ~ air
execute as @e[tag=lsRespawnBeaconStand,sort=nearest,limit=1] run kill @s