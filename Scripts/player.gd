extends KinematicBody2D

export (int) var x_speed = 200
export var jump_velocity = 500 #Jump height

#Physics
var velocity = Vector2()
var earth_gravity = 9.807 # m/s^2
export var gravity_scale := 100.0


func _physics_process(delta):
	_set_movement(delta)


func _set_movement(delta):
	velocity.x = x_speed
	velocity += Vector2.DOWN * earth_gravity * gravity_scale * delta
	if Input.is_action_just_pressed("jump"):
		velocity = Vector2.UP * jump_velocity
	velocity = move_and_slide(velocity, Vector2.UP) 
