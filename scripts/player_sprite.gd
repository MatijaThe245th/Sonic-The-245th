extends AnimatedSprite2D

@onready var player = $".."

func _process(_delta):
	if player.horizontal_direction == 1:
		if animation == "Run1" or animation == "Run2":
			offset.x = -1
		else:
			offset.x = 0
	if player.horizontal_direction == -1:
		if animation == "Run1" or animation == "Run2":
			offset.x = 1
		else:
			offset.x = 0

	if animation == "Run1" or animation == "Walk1" or animation == "Skid":
		offset.y = -1
	elif animation == "Walk2":
		offset.y = -0.5
	elif animation == "Turn (Fast)":
		offset.y = -3
	else:
		offset.y = 0


func _on_animation_looped():
	if animation == "Turn (Slow)" or animation == "Turn (Fast)":
		stop()
		play("Skid")
