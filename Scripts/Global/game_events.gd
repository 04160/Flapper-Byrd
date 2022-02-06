extends Node

signal gun_picked_up(gun)
signal player_died
signal game_paused
signal game_unpaused


func emit_gun_picked_up(gun: Gun) -> void:
	call_deferred("emit_signal", "gun_picked_up", gun)

func emit_player_died() -> void:
	call_deferred("emit_signal", "player_died")

func emit_game_paused() -> void:
	call_deferred("emit_signal", "game_paused")

func emit_game_unpaused() -> void:
	call_deferred("emit_signal", "game_unpaused")
