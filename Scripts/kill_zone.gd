extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_KillZoneTop_body_entered(body: Node2D):
	# TODO: will this break when something non Node2D enteres the kill zone?
	handle_on_kill_zone_entered(body)


func _on_KillZoneBottom_body_entered(body: Node2D):
	# TODO: will this break when something non Node2D enteres the kill zone?
	print('----bottom----')
	print(body)
	print('----bottom----')
	handle_on_kill_zone_entered(body)

func handle_on_kill_zone_entered(body: Node2D):
	print(body.name)
	if body.name == 'Player':
		GameEvents.emit_player_died()
