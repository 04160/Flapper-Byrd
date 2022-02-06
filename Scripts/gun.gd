extends Node2D

"""
Handles weapon related things
Target on cursor
Click to shoot
Reload and bullet count
"""

func _ready():
	GameEvents.connect("gun_picked_up", self, "_on_mouse_entered")
func emit_gun_picked_up(gun: Gun) -> void:
	call_rederred("emit_signal", "gun_picked_up", gun)
