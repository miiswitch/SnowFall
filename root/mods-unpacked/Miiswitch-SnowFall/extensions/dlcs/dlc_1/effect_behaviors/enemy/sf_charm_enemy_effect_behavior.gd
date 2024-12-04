extends CharmEnemyEffectBehavior

func should_add_on_spawn()->bool:
			
	var player_is_snow_witch = false
	for player_id in RunData.players_data.size():
		if RunData.get_player_character(player_id).my_id == "sf_character_snow_witch":
			player_is_snow_witch = true
	
	return .should_add_on_spawn() or player_is_snow_witch

func on_hurt(hitbox: Hitbox)->void :
	# We have to recheck everything from the parent method
	# Mainly we check if the enemy isn't already charm, and if we haven't reach the max charm count
	if charmed or _parent.is_loot or _parent is Boss or not _parent.can_be_charmed:
		return 

	if hitbox and is_instance_valid(hitbox.from) and (hitbox.from is Enemy):
		return 

	if not is_instance_valid(hitbox.from):
		return 

	var from_player_index: int = hitbox.from.player_index
	if RunData.current_charmed_enemies[from_player_index] >= max_charm_count:
		return
		
	# ----------------------------------------------
	# Actual extension
	
	if RunData.get_player_character(from_player_index).my_id == "sf_character_snow_witch":
		# If the enemy is on at least one snow puddle
		if _parent.snow_zone_effect_count >= 1:
			var chance_to_charm: float = float(RunData.get_player_effect("sf_snow_witch_chance_to_charm", from_player_index)) / 100
			if not Utils.get_chance_success(chance_to_charm):
				print("not charmed", chance_to_charm)
				return

			print("charm")
			charm(from_player_index)
