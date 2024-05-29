extends Node2D

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")

@export var speed = 60
@export var fight_scenes : Array[PackedScene] = []
@export var image : Texture2D
@export var collision_box : Shape2D
@export var range = 100

func _ready():
	print(root.last_battle, " ", name)
	
	if name in root.last_battle:
		print(name, " is in ", root.last_battle)
		queue_free()
	
	else:
		print(name, " is good")
		
	$Sprite2D.texture = image
	$Area2D/CollisionShape2D.shape = collision_box
	root.battlescene = fight_scenes.pick_random()

func _process(delta):
	if position.distance_to(player.position) < range:
		var direction = position.direction_to(player.position)
		position += speed * direction * delta

func _on_area_2d_area_entered(area):
	if area.name == "PlayerArea":
		root.last_battle.append(name)
		var transition = load("res://Transition.tscn").instantiate()
		transition.to = "res://battle.tscn"
		transition.instant_transition = true
		transition.scale = Vector2(5, 5)
		root.player_position = player.position
		$"..".add_child(transition)

	pass # Replace with function body.
