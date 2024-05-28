extends CharacterBody2D

var speed = 7500
var damage = 25
var moving = false

@export var enableFiring = false

var knockback = 200
var health = 100
var maxhp = 100
var bullets = 1

var bullet = preload("res://Bullet.tscn")

func _ready():
	position.x = get_viewport_rect().size.x / 2
	position.y = (get_viewport_rect().size.y / 4) * 3

func _physics_process(delta):
	var xAxis = Input.get_axis("left", "right")
	var yAxis = Input.get_axis("up", "down")
	
	velocity = (Vector2(xAxis, yAxis) * speed) * delta
	
	move_and_slide()
	
	moving = velocity.x != 0 or velocity.y != 0
	
	if moving:
		if velocity.x == 0:
			if sign(velocity.y) == -1:
				$AnimatedSprite2D.play("up")
			
			if sign(velocity.y) == 1:
				$AnimatedSprite2D.play("down")
		
		else:
			if sign(velocity.x) == -1:
				$AnimatedSprite2D.play("left")
			
			if sign(velocity.x) == 1:
				$AnimatedSprite2D.play("right")
		
	else:
		$AnimatedSprite2D.frame = 0
	
	if enableFiring:
		if Input.is_action_pressed("fire") and $FireCooldown.time_left == 0:
			fire()

func _on_player_area_area_entered(area):
	if "bullet" in area.get_groups():
		if area.from_enemy:
			velocity += area.vec * knockback
			move_and_slide()
			area.queue_free()
			health -= area.damage
			$Hurt.play()
	pass # Replace with function body.

func fire():
	var c_bullet
		
	for i in range(bullets):
		c_bullet = bullet.instantiate()
		c_bullet.position = position
		c_bullet.target = get_global_mouse_position()
		c_bullet.offset = i
		c_bullet.damage = damage
		$"../".add_child(c_bullet)
		
	$FireCooldown.start()
	$PlayerFire.play()
