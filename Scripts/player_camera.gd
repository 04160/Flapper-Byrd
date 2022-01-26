extends Camera2D

onready var player = get_node("/root/LevelBase/Player")

func _process(delta):
	position.x = player.position.x + 1024/2 - 200
