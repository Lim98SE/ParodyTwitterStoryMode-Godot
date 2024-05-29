extends ColorRect

@onready var root = get_tree().root.get_child(0)
@onready var active_buddy = root.get_node("Area").get_node("BuddyManager").get_node("Active")

var just_played_sound = false

func _process(delta):
	var time_left = float(active_buddy.get_node("actionCooldown").time_left)
	var max_time = float(active_buddy.get_node("actionCooldown").wait_time)
	
	if (float(time_left) / float(max_time)) == 0:
		if not just_played_sound:
			$"../ready".play()
			just_played_sound = true
	
	else:
		just_played_sound = false
	
	size.y = (float(time_left) / float(max_time)) * 96
	
	if active_buddy.triggered:
		size.y = 96
