extends Control

@onready var Sprite = $CanvasLayer/Sprite2D
@export var fading = false

func fadeFinished():
	print("Fade finished")
	fading = false

func fadeIn():
	var tween = create_tween()
	fading = true
	tween.tween_property(Sprite, "modulate", Color(0, 0, 0, 1), 1)
	tween.tween_callback(fadeFinished)

func fadeOut():
	var tween = create_tween()
	fading = true
	tween.tween_property(Sprite, "modulate", Color(0, 0, 0, 0), 1)
	tween.tween_callback(fadeFinished)
