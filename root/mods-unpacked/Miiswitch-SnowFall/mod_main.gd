extends Node

const MENUSTRING_LOG = "Miiswitch-SnowFall"

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", MENUSTRING_LOG)
	modLoader.install_script_extension("res://mods-unpacked/Miiswitch-SnowFall/content/main_menu.gd")

func _ready():
	ModLoaderUtils.log_info("Ready", MENUSTRING_LOG)
