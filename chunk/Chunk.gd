extends Node2D

export (PackedScene) var Block
const BLOCK_SIZE = Vector2(80, 80)

enum ChunkTypes {
	TOP_LEVEL,
	MID_LEVEL,
	BOTTOM_LEVEL,
}
# To hold the ChunkType of this chunk
var size = Vector2(-1, -1) setget set_size
var type = -1 setget set_type
var hasType = false 
var hasSize = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func generate():
	if !hasType:
		print("WARNING: Trying to generate chunk without set ChunkType.")
		return
	if !hasSize:
		print("WARNING: Trying to generate chunk without set chunk size.")
		return
	
	match (type):
		ChunkTypes.TOP_LEVEL:
			generate_top()
		ChunkTypes.MID_LEVEL:
			generate_mid()
		ChunkTypes.BOTTOM_LEVEL:
			generate_bot()
			
func generate_top():
	for x in range(0, size.x, 1):
		for y in range(0, size.y, 1):
			var block = Block.instance()
			var r = rand_range(0, 100)
			
			# Top layer should be grass
			if y == 0:
				block.type = block.BlockTypes.Grass
			# First 5 layers all dirt
			elif y < 4:
				block.type = block.BlockTypes.Dirt
			elif r < 5:
				block.type = block.BlockTypes.Coal
			elif r < 50:
				block.type = block.BlockTypes.Stone
			else:
				block.type = block.BlockTypes.Dirt
				
			block.position = Vector2(x * BLOCK_SIZE.x, y * BLOCK_SIZE.y)
			add_child(block)
			
func generate_mid():
	for x in range(0, size.x, 1):
		for y in range(0, size.y, 1):
			var block = Block.instance()
			var r = rand_range(0, 100)
			
			if r < 3:
				block.type = block.BlockTypes.Gold
			elif r < 10:
				block.type = block.BlockTypes.Coal
			else:
				block.type = block.BlockTypes.Stone
				
			block.position = Vector2(x * BLOCK_SIZE.x, y * BLOCK_SIZE.y)
			add_child(block)
			
func generate_bot():
	for x in range(0, size.x, 1):
		for y in range(0, size.y, 1):
			var block = Block.instance()
			var r = rand_range(0, 100)
			
			if y == size.y - 1:
				block.type = block.BlockTypes.Glass
			elif r < 7:
				block.type = block.BlockTypes.Gold
			else:
				block.type = block.BlockTypes.Stone
				
			block.position = Vector2(x * BLOCK_SIZE.x, y * BLOCK_SIZE.y)
			add_child(block)
			
func set_size(s: Vector2):
	if s.x > 0 && s.y > 0:
		size = s
		hasSize = true
	else:
		print("WARNING: Invalid chunk size given - " + str(s))
		hasSize = false
	
func set_type(t: int):
	type = t
	hasType = true
