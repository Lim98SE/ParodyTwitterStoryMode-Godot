extends Sprite2D

var area
var vec = Vector2(0, 0)
var speed = 320
var from_enemy = false
var target = Vector2(0, 0)
var damage = 50
var started = false

@onready var root = get_tree().root.get_child(0)

func _ready():
	area = $Area2D
	remove_child(area)
	print(area)
	vec = position.direction_to(target).normalized()

func _physics_process(delta):
	position += vec * speed * delta
	speed -= delta * 500
	speed = clamp(speed, 0, INF)
	
	if speed == 0 and not started:
		started = true
		$explode.start()

func _on_explode_timeout():
	add_child(area)
	$die.start()
	pass # Replace with function body.

func _on_die_timeout():
	var sfx = AudioStreamPlayer.new()
	sfx.stream = load("res://SFX/explosion(3).wav")
	sfx.set_script(load("res://kms_on_end.gd"))
	root.add_child(sfx)
	queue_free()
	pass # Replace with function body.
