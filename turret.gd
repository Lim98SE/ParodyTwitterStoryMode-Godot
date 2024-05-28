extends Node2D

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")

var health = 25

func _physics_process(delta):
	draw_circle(position, 62.5, Color.WHITE)
	if health <= 0:
		root.get_node("Area").get_node("Die").play()
		queue_free()
	
	if position.distance_to(player.position) < 125:
		player.health += 5 * delta
		player.health = clamp(player.health, 0, player.maxhp)


func _on_area_2d_area_entered(area):
	if "bullet" in area.get_groups():
		if area.from_enemy:
			area.queue_free()
			health -= area.damage
			$Hurt.play()
	pass # Replace with function body.
