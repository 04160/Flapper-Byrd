extends KinematicBody2D

export (int) var x_speed = 200
export var jump_velocity = 500 #Jump height

#Items
onready var weapon_spawn = get_node("GunPosition")

export(Resource) var _runtime_data = _runtime_data as RuntimeData

#Physics
var velocity = Vector2()
var earth_gravity = 9.807 # m/s^2
export var gravity_scale := 100.0


func _physics_process(delta):
	if _runtime_data.current_gameplay_state == Enums.GameplayState.PLAYING:
		_set_movement(delta)


func _set_movement(delta):
	velocity.x = x_speed
	velocity += Vector2.DOWN * earth_gravity * gravity_scale * delta
	if Input.is_action_just_pressed("jump"):
		velocity = Vector2.UP * jump_velocity
	velocity = move_and_slide(velocity, Vector2.UP) 


# Handle player coliding with killzones at top and bottom of screen
func _on_KillZoneTop_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	_handle_kill_zone_entered()

func _on_KillZoneBottom_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	_handle_kill_zone_entered()

func _handle_kill_zone_entered():
	print('killzoned')
	GameEvents.emit_player_died()
