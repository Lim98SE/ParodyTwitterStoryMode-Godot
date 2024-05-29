extends Node

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")

func _ready():
	player.speed = 10000
	player.maxhp = 75
	player.health = 75
