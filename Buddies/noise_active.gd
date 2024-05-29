extends Node

var triggered = false
var bomb = preload("res://noise_bomb.tscn")

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")

func _ready():
	$actionCooldown.wait_time = 0.5

func _process(delta):
	if triggered:
		triggered = false
		$actionCooldown.start()
		
	if Input.is_action_just_pressed("action") and $actionCooldown.time_left == 0 and not triggered:
		fire()
		triggered = true

func fire():
	var c_bullet

	c_bullet = bomb.instantiate()
	c_bullet.position = player.position
	c_bullet.target = player.get_global_mouse_position()
	root.get_node("Area").add_child(c_bullet)
