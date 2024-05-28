extends Node

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")
var original_bullets
var triggered = false
var turret_scene = preload("res://engie_turret.tscn")

func _ready():
	$actionCooldown.wait_time = 30

func _process(delta):
	if triggered:
		triggered = false
		$actionCooldown.start()
		
	if Input.is_action_just_pressed("action") and $actionCooldown.time_left == 0 and not triggered:
		var turret = turret_scene.instantiate()
		turret.position = player.position
		$"..".add_child(turret)
		triggered = true
