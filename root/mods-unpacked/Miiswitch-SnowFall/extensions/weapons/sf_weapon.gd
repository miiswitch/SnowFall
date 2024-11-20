extends "res://weapons/weapon.gd"

const SNOWFALL_LOG = "Miiswitch-SnowFall"

var snow_scene = preload("res://mods-unpacked/Miiswitch-SnowFall/content/weapons/ranged/snow_ball/sf_snow_zone.tscn/sf_snow_zone.tscn") # Test scene for the snow scene

# Extensions
# =============================================================================

func on_weapon_hit_something(_thing_hit: Node, damage_dealt: int, hitbox: Hitbox)->void :
	# Call of parent class
	.on_weapon_hit_something(_thing_hit, damage_dealt, hitbox)
#
	ModLoaderLog.info("Ready for snow spawn", SNOWFALL_LOG)
	
	for effect in effects:
		if effect is SFSpawnSnowOnHitEffect and Utils.get_chance_success(effect.chance):
			ModLoaderLog.info("Effect spawn snow prock", SNOWFALL_LOG) # This works
			var root_tree = Engine.get_main_loop().get_current_scene()
			print(root_tree.get_node('Entities'))
			var snow_zone = snow_scene.instance()
			snow_zone.position = _thing_hit.global_position
			root_tree.get_node('Entities').add_child(snow_zone)
			# var parent_node_weapon = get_tree().get_root() # Doesn't work because weapon is a scene by itself
			# print(parent_node_weapon.get_parent())		 # I was trying to get the reference of Main.tscn, 
			# parent_node_weapon.add_child(snow_zone)        # but it doesn't seems to work that way in godot
