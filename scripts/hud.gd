extends Control

@onready var player = $"../../../Level SubViewportContainer/Level SubViewport/Test Level/Player"
@onready var fps_counter = $"CanvasLayer/FPS"
@onready var variables_left = $"CanvasLayer/Variables (Left)"
@onready var variables_right = $"CanvasLayer/Variables (Right)"

var hud_visibility: bool = true


func _process(_delta):
	var fps = Engine.get_frames_per_second()

	if hud_visibility == true:
		variables_left.visible = true
		variables_right.visible = true
		fps_counter.visible = true
		variables_left.text = str("X Velocity: ", int(player.velocity.x), "\nY Velocity: ", int(player.velocity.y), "\nResistance: ", player.resistance, "\nLast Run Animation: ", player.last_run_anim)
		variables_right.text = str("Horizontal Direction: ", player.horizontal_direction, "\nFloor Angle: ", player.floor_angle, "\nFloor Normal: ", player.normal.x, "\nCamera X Offset: ", player.camera.offset.x)
		fps_counter.text = "FPS: "+ str(fps)
	else:
		variables_left.text = " "
		variables_right.text = " "
		fps_counter.text = " "
