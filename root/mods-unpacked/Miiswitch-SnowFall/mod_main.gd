extends Node

const SNOWFALL_LOG = "Miiswitch-SnowFall"
const SNOWFALL_DIR = "Miiswitch-SnowFall/"
var dir = ""

func _init():
	ModLoaderLog.info("Init", SNOWFALL_LOG)
	dir = ModLoaderMod.get_unpacked_dir() + SNOWFALL_DIR
	
	# Add extensions
	ModLoaderMod.install_script_extension(dir + "extensions/weapons/sf_weapon.gd")
	
	# Add translations
	ModLoaderMod.add_translation(dir + "translations/SnowFall_translations.en.translation") # English
	ModLoaderMod.add_translation(dir + "translations/SnowFall_translations.fr.translation") # French

func _ready():
	ModLoaderLog.info("Ready", SNOWFALL_LOG)
	
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")
	
	# Ranged Weapon
	ContentLoader.load_data(dir + "content_data/weapons/ranged/SnowFall_snow_ball.tres", SNOWFALL_LOG)
