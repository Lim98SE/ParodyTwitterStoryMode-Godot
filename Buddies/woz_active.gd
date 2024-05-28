extends Node

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")
var original_fire_rate
var original_speed
var triggered = false
var length = 1
var timeSinceTrigger = 0

func _process(delta):
	if triggered:
		timeSinceTrigger += delta
	
	if timeSinceTrigger >= length and triggered:
		triggered = false
		player.get_node("FireCooldown").wait_time = original_fire_rate
		player.speed = original_speed
		$actionCooldown.start()
		
	if Input.is_action_just_pressed("action") and $actionCooldown.time_left == 0 and not triggered:
		timeSinceTrigger = 0
		original_fire_rate = player.get_node("FireCooldown").wait_time
		original_speed = player.speed
		
		player.get_node("FireCooldown").stop()
		player.get_node("FireCooldown").wait_time = 0.025
		player.get_node("FireCooldown").start()
		player.speed = 0
		triggered = true
