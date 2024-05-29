extends Area2D

var vec = Vector2(0, 0)
var speed = 320
var from_enemy = false
var target = Vector2(0, 0)
var damage = 5
var offset = 0
@onready var root = get_tree().root.get_child(0)
var player_img = preload("res://Images/player_bullet.png")

func _ready():
	vec = position.direction_to(target).normalized()
	vec = vec.rotated(offset)
	
	if not from_enemy:
		$"Sprite2D".texture = player_img

func _physics_process(delta):
	position += vec * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
