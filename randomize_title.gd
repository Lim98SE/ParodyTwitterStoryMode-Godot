extends Sprite2D

var files = DirAccess.get_files_at("res://Titles/")
var imgFiles = []
var imgFileExtensions = [".png", ".jpg"]

func randomize_image():
	for i in files:
		var is_image = false
		
		for x in imgFileExtensions:
			if i.ends_with(x):
				is_image = true
		
		if is_image:
			imgFiles.append(i)
	
	var image = imgFiles.pick_random()
	
	var imageFile = load("res://Titles/" + image)
	
	texture = imageFile

func _ready():
	
	randomize_image()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		randomize_image()
