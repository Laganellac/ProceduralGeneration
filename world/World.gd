extends Node2D

# Declare member variables here. Examples:
export (PackedScene) var Block
export var world_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	generate_world()
	$Player.position = Vector2(world_size.x / 2, -135)
	$Player.focus = true
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/Label.text = str(1 / delta)

func generate_world():
	var block_size = Vector2(80, 80)
	
	for x in range(0, world_size.x, block_size.x):
		for y in range(0, world_size.y, block_size.y):
			var block = Block.instance()
			var index = randi() % block.BLOCK_TYPES.size()
			block.type = block.BLOCK_TYPES[index]
			block.position = Vector2(x, y)
			add_child(block)
