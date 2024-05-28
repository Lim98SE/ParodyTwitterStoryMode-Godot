extends Node2D

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")
var buddy_scene = preload("res://Buddy.tscn")

var active_buddy
var passive_buddy

func _ready():
	var buddies = JSON.parse_string(FileAccess.get_file_as_string("res://Data/buddies.json"))
	active_buddy = buddies[root.buddies[0]]
	passive_buddy = buddies[root.buddies[1]]
	
	var buddy = buddy_scene.instantiate()
	buddy.name = "Active"
	buddy.set_script(load(active_buddy["active"]))
	add_child(buddy)
	
	buddy = buddy_scene.instantiate()
	buddy.name = "Passive"
	buddy.set_script(load(passive_buddy["passive"]))
	add_child(buddy)
