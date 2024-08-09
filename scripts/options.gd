extends Control

@onready var player = $"../../../Level SubViewportContainer/Level SubViewport/Test Level/Player"
@onready var pause = $"../Pause"
@onready var resume = $"../Pause/MarginContainer/VBoxContainer/Resume"
@onready var checkbox = $"MarginContainer/HBoxContainer/VBoxContainer/CheckBox"
@onready var checkbox2 = $"MarginContainer/HBoxContainer/VBoxContainer/CheckBox2"
@onready var back = $"MarginContainer/HBoxContainer/VBoxContainer/Back"
@onready var level_subviewport_container = $"../../../Level SubViewportContainer"
@onready var pause_subviewport_container = $"../../../Pause SubViewportContainer"
@onready var hud_subviewport_container = $"../../../HUD SubViewportContainer"

var integer_scaling: bool



func _process(_delta):
	if pause.paused == 1 and pause.visible == false:
		visible = true
	else:
		visible = false

	var display_resolution = DisplayServer.window_get_size()
	# Desired screen size
	var target_width: float = display_resolution.x
	var target_height: float = display_resolution.y

	# Original game screen size
	var game_width: float = 424.0
	var game_height: float = 240.0

	# Calculate scaling factors
	var width_scale: float = target_width / game_width
	var height_scale: float = target_height / game_height

	# Since we want to maintain the aspect ratio, choose the smaller scaling factor
	var scale_factor: float = min(width_scale, height_scale)

	# Apply the scaling factor to the viewport
	if integer_scaling == false:
		level_subviewport_container.scale.x = scale_factor
		level_subviewport_container.scale.y = scale_factor
		pause_subviewport_container.scale.x = scale_factor
		pause_subviewport_container.scale.y = scale_factor
		if pause.paused == 1:
			hud_subviewport_container.scale.x = 0
			hud_subviewport_container.scale.y = 0
		else:
			hud_subviewport_container.scale.x = scale_factor
			hud_subviewport_container.scale.y = scale_factor
	else:
		level_subviewport_container.scale.x = int(scale_factor)
		level_subviewport_container.scale.y = int(scale_factor)
		pause_subviewport_container.scale.x = int(scale_factor)
		pause_subviewport_container.scale.y = int(scale_factor)
		if pause.paused == 1:
			hud_subviewport_container.scale.x = 0
			hud_subviewport_container.scale.y = 0
		else:
			hud_subviewport_container.scale.x = int(scale_factor)
			hud_subviewport_container.scale.y = int(scale_factor)


func _on_back_pressed():
	visible = false
	resume.grab_focus()


func _on_check_box_toggled(toggled_on):
	integer_scaling = toggled_on


func _on_check_box_2_toggled(toggled_on):
	player.hud_visibility = toggled_on
