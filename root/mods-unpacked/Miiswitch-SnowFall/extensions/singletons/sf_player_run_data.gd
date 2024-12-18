extends "res://singletons/player_run_data.gd"

static func init_effects()->Dictionary:

	if (not Utils == null) :
		var vanilla_effects = .init_effects()

		var new_effects: = {
			"snow_zone_move_speed_modifier" : -40,
			"sf_sledge_effect" : 0,
			"sf_snow_witch_chance_to_charm" : 0,
			"sf_stat_gain_harvesting_while_hurt" : 0
		}

		new_effects.merge(vanilla_effects)

		return new_effects;
	else:
		return {}
