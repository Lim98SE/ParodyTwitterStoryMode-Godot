extends CharacterBody2D

var speed = 15000
@onready var propreties = $"../AreaPropreties"

func _ready():
	$Camera2D.limit_right = propreties.Size.x
	$Camera2D.limit_bottom = propreties.Size.y

func _physics_process(delta):
	var xAxis = Input.get_axis("left", "right")
	var yAxis = Input.get_axis("up", "down")
	
	velocity = (Vector2(xAxis, yAxis) * speed) * delta
	
	move_and_slide()
