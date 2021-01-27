extends CanvasModulate

const DARK = Color("111111")
const NIGHT_VISION = Color("37bf62")

var enabled = true

func _ready():
	visible = true
	color = DARK

func cycle_vision_mode():
	if color == NIGHT_VISION and enabled:
		DARK_mode()
	elif enabled:
		NIGHT_VISION_mode()

func DARK_mode():
	color = DARK
	$AudioStreamPlayer.stream = load("res://SFX/nightvision_off.wav")
	$AudioStreamPlayer.play()
	get_tree().call_group("Labels", "hide")
	get_tree().call_group("Lights", "show")
	enabled = false
	$Timer.start()

func NIGHT_VISION_mode():
	color = NIGHT_VISION
	$AudioStreamPlayer.stream = load("res://SFX/nightvision.wav")
	$AudioStreamPlayer.play()
	get_tree().call_group("Labels", "show")
	get_tree().call_group("Lights", "hide")
	enabled = false
	$Timer.start()


func _on_Timer_timeout():
	enabled = true
