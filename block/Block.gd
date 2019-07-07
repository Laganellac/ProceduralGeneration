extends Node2D

class_name Block, "res://block/art/Grass.PNG"

# Declare member variables here. Examples:
enum BlockTypes {
	Coal = 0,
	Dirt = 1,
	Glass = 2,
	Gold = 3,
	Grass = 4,
	Stone = 5,
	Tnt,
}

const TEXTURE_LOCATIONS = {
	BlockTypes.Coal: "res://block/art/Coat.PNG",
	BlockTypes.Dirt: "res://block/art/Dirt.PNG",
	BlockTypes.Glass: "res://block/art/Glass.PNG",
	BlockTypes.Gold: "res://block/art/Gold.PNG",
	BlockTypes.Grass: "res://block/art/Grass.PNG",
	BlockTypes.Stone: "res://block/art/Stone.PNG",
	BlockTypes.Tnt: "res://block/art/Tnt.PNG"
}
var type: = -1 setget set_type

func _init():
	type = BlockTypes.Tnt

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = load(TEXTURE_LOCATIONS[type])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_type(t: int):
	if t <= BlockTypes.size():
		type = t
	else:
		print("WARNING: Invalid block type given - " + str(t))
		type = BlockTypes.Tnt
	$Sprite.texture = load(TEXTURE_LOCATIONS[type])