extends Control

var global
var coins
var coins_total
var game_time
var boost

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	get_node("FramesPerSecond").hide()

func _input(event):
	if Input.is_action_pressed("toggle_fps_display"):
		if get_node("FramesPerSecond").is_visible():
			get_node("FramesPerSecond").hide()
		else:
			get_node("FramesPerSecond").show()

func _fixed_process(delta):
	global = get_node("/root/Global")
	coins = global.coins
	coins_total = global.coins_total
	boost = global.boost

	# Set the values
	get_node("FramesPerSecond").set_text(str(OS.get_frames_per_second()) + " FPS")
	get_node("Panel/CoinsCount").set_text(str(coins))
	get_node("Panel/CoinsProgress").set_value(int(coins))
	get_node("Panel/CoinsProgress").set_max(int(coins_total))
	get_node("Panel/TimeLabel").set_text(str(global.make_game_time_string(global.game_time)))
	get_node("Panel/ProgressRotation/BoostProgress").set_value(float(global.boost))
