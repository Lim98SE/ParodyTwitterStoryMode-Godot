extends CharacterBody2D

var speed = 15000
@onready var propreties = $"../AreaPropreties"

func _ready():
	$Camera2D.limit_right = propreties.Size.x
	$Camera2D.limit_bottom = propreties.Size.y

var moving = false

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
	
	
