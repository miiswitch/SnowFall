extends Player

signal gold_changed(new_value, player_index)

func take_damage(value: int, args: TakeDamageArgs)->Array:
	
	var bypass_invincibility = args.bypass_invincibility
	
	if RunData.get_player_effect("sf_stat_gain_harvesting_while_hurt", player_index) == 0:
		return .take_damage(value, args)
	
	if _invincibility_timer.is_stopped() or bypass_invincibility:
		RunData.add_gold(RunData.get_player_effect("sf_stat_gain_harvesting_while_hurt", player_index), player_index)
	return .take_damage(value, args)
