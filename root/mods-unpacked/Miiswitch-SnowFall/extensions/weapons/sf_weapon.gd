extends "res://weapons/weapon.gd"

const SNOWFALL_LOG = "Miiswitch-SnowFall"

var snow_scene = preload("res://mods-unpacked/Miiswitch-SnowFall/content/weapons/ranged/snow_ball/sf_snow_zone.tscn/sf_snow_zone_scene.tscn") # Test scene for the snow scene

# Extensions
# =============================================================================

func on_weapon_hit_something(_thing_hit: Node, damage_dealt: int, hitbox: Hitbox)->void :
	# Call of parent class
	.on_weapon_hit_something(_thing_hit, damage_dealt, hitbox)
	
	for effect in effects:
		if effect is SFSpawnSnowOnHitEffect and Utils.get_chance_success(effect.chance):
			# Get the main script of the loop
			var main_script = Engine.get_main_loop()
			# Then, get the tree of the main scene
			var root_tree = main_script.get_current_scene()
			
			# We instance the snow_zone_scene, and we add it to the Entities node in the main scene
			var snow_zone = snow_scene.instance()
			snow_zone.position = _thing_hit.global_position
			
			# We insert the snow zone inside an array
			# Check if the node exist (we create it at runtime)
			var snow_zone_array_node = root_tree.get_node('SnowZoneArrayNode')
			if not snow_zone_array_node:
				snow_zone_array_node = Node2D.new()
				var entities_array_index = root_tree.get_node('Items').get_index()
				snow_zone_array_node.name = 'SnowZoneArrayNode'
				root_tree.add_child(snow_zone_array_node)
				root_tree.move_child(snow_zone_array_node, entities_array_index)
				
			# Add the snow zone to the array	
			root_tree.get_node('SnowZoneArrayNode').add_child(snow_zone)
