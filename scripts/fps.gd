extends Label

@onready var player = $"../../../../../Level SubViewportContainer/Level SubViewport/Test Level/Player"

func _process(_delta):
	var fps = Engine.get_frames_per_second()
	if player.hud_visibility == true:
		text = "FPS: "+ str(fps)
