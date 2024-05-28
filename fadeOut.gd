extends ColorRect

@onready var root = get_tree().root.get_child(0)
@onready var active_buddy = root.get_node("Area").get_node("BuddyManager").get_node("Active")

func _process(delta):
	var time_left = float(active_buddy.get_node("actionCooldown").time_left)
	var max_time = float(active_buddy.get_node("actionCooldown").wait_time)
	
	print(time_left)
	
	size.y = (float(time_left) / float(max_time)) * 96
