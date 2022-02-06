extends Node


export(Resource) var _runtime_data = _runtime_data as RuntimeData


func _ready():
	GameEvents.connect("player_died", self, "_on_player_died")
	GameEvents.connect("game_paused", self, "_on_game_paused")
	GameEvents.connect("game_unpaused", self, "_on_game_unpaused")
	

func _input(event):
	print(event)
	if Input.is_action_just_pressed("pause_game"):
		print('ding')
		handle_pause_game_key_pressed()

func handle_pause_game_key_pressed():
	if _runtime_data.current_gameplay_state == Enums.GameplayState.PLAYING:
		GameEvents.emit_game_paused()
	elif _runtime_data.current_gameplay_state == Enums.GameplayState.PAUSED:
		GameEvents.emit_game_unpaused()
	elif _runtime_data.current_gameplay_state == Enums.GameplayState.PLAYER_DEAD:
		# if escape is pressed and player is dead, quit the game
		get_tree().quit()


func _on_player_died():
	print('player dead')
	_runtime_data.current_gameplay_state = Enums.GameplayState.PLAYER_DEAD


func _on_game_paused():
	_runtime_data.current_gameplay_state = Enums.GameplayState.PAUSED


func _on_game_unpaused():
	_runtime_data.current_gameplay_state = Enums.GameplayState.PLAYING

