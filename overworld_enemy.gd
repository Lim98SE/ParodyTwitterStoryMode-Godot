extends Node2D

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")

@export var speed = 60
@export var fight_scene : PackedScene
@export var image : Texture2D
@export var collision_box : Shape2D

func _ready():
	if root.last_battle == name:
		queue_free()
		
	$Sprite2D.texture = image
	$Area2D/CollisionShape2D.shape = collision_box
	root.battlescene = fight_scene

func _process(delta):
	if position.distance_to(player.position) < 64:
		var direction = position.direction_to(player.position)
		position += speed * direction * delta

func _on_area_2d_area_entered(area):
	if area.name == "PlayerArea":
		root.last_battle = name
		var transition = load("res://Transition.tscn").instantiate()
		transition.to = "res://battle.tscn"
		transition.instant_transition = true
		transition.scale = Vector2(5, 5)
		root.player_position = player.position
		$"..".add_child(transition)

	pass # Replace with function body.
