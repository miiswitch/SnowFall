extends "res://weapons/weapon.gd"


const SNOWFALL_LOG = "Miiswitch-SnowFall"

# Extensions
# =============================================================================

func on_weapon_hit_something(_thing_hit: Node, damage_dealt: int, hitbox: Hitbox)->void :
	# Call of parent class
	.on_weapon_hit_something(_thing_hit, damage_dealt, hitbox)
#
	ModLoaderLog.info("Ready for snow spawn", SNOWFALL_LOG)
	
	for effect in effects:
		if effect is SFSpawnSnowOnHitEffect and Utils.get_chance_success(effect.chance):
			ModLoaderLog.info("Effect spawn snow prock", SNOWFALL_LOG)
	

