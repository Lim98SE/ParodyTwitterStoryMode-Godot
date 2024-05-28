extends Control

@onready var root = get_tree().root.get_child(0)
@onready var buddies = root.get_node("Area").get_node("BuddyManager")

func _ready():
	$ActiveBuddy.texture = load("res://" + buddies.active_buddy["avatar"])
	$PassiveBuddy.texture = load("res://" + buddies.passive_buddy["avatar"])
