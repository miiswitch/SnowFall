extends "res://ui/menus/pages/main_menu.gd"

const MOD_LOG = "Miiswitch-SnowFall"

# Called when the node enters the scene tree for the first time.
func _ready():
	ModLoaderLog.info("Init", MOD_LOG)
	# ------------------------- Content Loader init ----------------------------------------------------
	# Get the ContentLoader class
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")

	var content_dir = "res://mods-unpacked/Miiswitch-SnowFall/content_data/"
	var mod_log = MOD_LOG

	# Add content. These .tres files are ContentData resources
	# ContentLoader.load_data(content_dir + "modname_characters.tres", mod_log)
	# ContentLoader.load_data(content_dir + "modname_items.tres", mod_log)
	
	# Ranged weapon
	ContentLoader.load_data(content_dir + "content_data/weapons/ranged/SnowFall_snow_ball.tres", MOD_LOG)
	# ---------------------------------------------------------------------------------------------------
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func init():
	.init()
	version_label.text += "  |  Mods are working!"
