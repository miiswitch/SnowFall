extends Node

const SNOWFALL_LOG = "Miiswitch-SnowFall"
const SNOWFALL_DIR = "Miiswitch-SnowFall/"
var dir = ""

func _init():
	ModLoaderLog.info("Init", SNOWFALL_LOG)
	dir = ModLoaderMod.get_unpacked_dir() + SNOWFALL_DIR
	
	# Add extensions
	ModLoaderMod.install_script_extension(dir + "extensions/weapons/sf_weapon.gd")
	ModLoaderMod.install_script_extension(dir + "extensions/entities/units/unit/sf_unit.gd")
	ModLoaderMod.install_script_extension(dir + "extensions/singletons/sf_player_run_data.gd")
	
	# Add translations
	ModLoaderMod.add_translation(dir + "translations/SnowFall_translations.en.translation") # English
	ModLoaderMod.add_translation(dir + "translations/SnowFall_translations.fr.translation") # French

func _ready():
	ModLoaderLog.info("Ready", SNOWFALL_LOG)
	
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")
	
	# DEBUG
	ContentLoader.load_data(dir + "content_data/debug/debug_ressource.tres", SNOWFALL_LOG)
	# Items
	ContentLoader.load_data(dir + "content_data/items/sf_items.tres", SNOWFALL_LOG)
	
	# Ranged Weapon
	ContentLoader.load_data(dir + "content_data/weapons/ranged/sf_snow_ball.tres", SNOWFALL_LOG)
	
