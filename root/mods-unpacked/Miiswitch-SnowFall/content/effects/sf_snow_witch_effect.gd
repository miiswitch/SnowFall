class_name SFSnowWitchEffect
extends NullEffect

static func get_id()->String:
	return "sf_snow_witch_effect"

# Used for translation
func get_args(_player_index: int)->Array:
	return [str(value)]
	
# Yes, we use NullEffect, but it's because technically we don't need it, especially the "unapply" method. This is just to store information
func apply(_player_index: int) -> void:
	var effects = RunData.get_player_effects(_player_index)
	effects["sf_snow_witch_chance_to_charm"] = value
