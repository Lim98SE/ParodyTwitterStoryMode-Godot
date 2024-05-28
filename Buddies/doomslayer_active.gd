extends Node

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")
var original_bullets
var triggered = false

func _ready():
	$actionCooldown.wait_time = 3

func _process(delta):
	if triggered:
		triggered = false
		$actionCooldown.start()
		
	if Input.is_action_just_pressed("action") and $actionCooldown.time_left == 0 and not triggered:
		original_bullets = player.bullets
		player.get_node("FireCooldown").stop()
		player.bullets = 20
		player.fire()
		player.bullets = original_bullets
		triggered = true
