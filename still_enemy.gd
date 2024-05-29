extends Area2D

@onready var root = get_tree().root.get_child(0)
@onready var player = root.get_node("Area").get_node("CharacterBody2D")

var health = 50
var max_health = health
var bullet_scene = preload("res://Bullet.tscn")
var started = false

func _process(delta):
	$HealthBar.scale.x = float(health) / float(max_health)
	
	if health <= 0:
		root.get_node("Area").get_node("Die").play()
		queue_free()

func _on_cooldown_timeout():
	if started:
		var bullet = bullet_scene.instantiate()
		bullet.position = position
		bullet.target = player.position
		bullet.from_enemy = true
		get_parent().add_child(bullet)
	pass # Replace with function body.



func _on_area_entered(area):
	if "bullet" in area.get_groups():
		if not area.from_enemy:
			area.queue_free()
			health -= area.damage
			$Hurt.play()
	pass # Replace with function body.


func _on_start_timer_timeout():
	started = true
	pass # Replace with function body.
