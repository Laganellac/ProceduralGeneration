extends Node2D

# Declare member variables here. Examples:
export (PackedScene) var Chunk
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
	if delta:
		$HUD/Label.text = str(1 / delta)

# Generate the world in a bunch of chunks
# each chunk maybe 16 blocks deep
# top chunk should be grass with a mix of dirt and stone
# mid chunk should be dirt stone and ore
func generate_world():
	var chunk_size = Vector2(16, 16)
	
	for x in range(0, world_size.x, 1):
		for y in range(0, world_size.y, 1):
			var chunk = Chunk.instance()
			chunk.size = chunk_size
			if y == 0:
				chunk.type = chunk.ChunkTypes.TOP_LEVEL
			elif y < world_size.y / 2 + 1:
				chunk.type = chunk.ChunkTypes.MID_LEVEL
			else:
				chunk.type = chunk.ChunkTypes.BOTTOM_LEVEL
			
			chunk.position = Vector2(x * chunk_size.x * 80, y * chunk_size.y * 80)
			chunk.generate()
			add_child(chunk)
			
# need to take in an array of block types and fequencies for each block
# maybe each block should have a properties struct like location frequency, cluster frequency and such
