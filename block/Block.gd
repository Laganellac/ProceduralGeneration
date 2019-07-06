extends Node2D

class_name Block, "res://block/art/Grass.PNG"

# Declare member variables here. Examples:
const BLOCK_TYPES = ["coal", "dirt", "glass", "gold", "grass", "stone"]

const TEXTURE_LOCATIONS = {
	BLOCK_TYPES[0]: "res://block/art/Coat.PNG",
	BLOCK_TYPES[1]: "res://block/art/Dirt.PNG",
	BLOCK_TYPES[2]: "res://block/art/Glass.PNG",
	BLOCK_TYPES[3]: "res://block/art/Gold.PNG",
	BLOCK_TYPES[4]: "res://block/art/Grass.PNG",
	BLOCK_TYPES[5]: "res://block/art/Stone.PNG",
	"tnt": "res://block/art/Tnt.PNG"
}
var type: String setget set_type

func _init():
	type = BLOCK_TYPES[1]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = load(TEXTURE_LOCATIONS[type])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_type(t: String):
	if BLOCK_TYPES.find(t) > -1:
		type = t
	else:
		print("Invalid block type given - " + t)
		type = "tnt"
	$Sprite.texture = load(TEXTURE_LOCATIONS[type])