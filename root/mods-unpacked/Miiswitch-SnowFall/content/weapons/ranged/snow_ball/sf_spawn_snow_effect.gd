class_name SFSpawnSnowOnHitEffect
extends NullEffect

export (float, 0.0, 1.0, 0.01) var chance: = 1.0

static func get_id()->String:
	return "sf_spawn_snow_on_hit_effect"

# Used for translation
func get_args(_player_index: int)->Array:
	return [str(round(chance * 100.0))]

func serialize()->Dictionary:
	var serialized = .serialize()

	serialized.chance = chance

	return serialized


func deserialize_and_merge(serialized: Dictionary)->void :
	.deserialize_and_merge(serialized)

	chance = serialized.chance
