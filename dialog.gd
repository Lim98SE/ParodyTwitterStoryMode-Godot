extends Control

@export var dialog_file = "res://Dialog/eggman.txt"
@export var current_line = ["", ""]
var dialog = ""
var parsed_dialog = []
var characters = []
var index = 0
var running = true
var last_line = ["", ""]

func parse_dialog(tree_id):
	var found_start = false
	var start_index = 0
	var end_index = null
	parsed_dialog = []
	
	var lines = dialog.split("\n")
	
	for i in lines:
		var line = i.split("|")
		var cmd_type = line[0]
		
		if cmd_type == "tree":
			if int(line[1]) == tree_id:
				start_index = lines.find(i)
				print("found at ", start_index)
				found_start = true
		
		elif cmd_type == "endtree" and found_start:
			end_index = lines.find(i)
			parsed_dialog.append(line)
			break
		
		elif found_start:
			parsed_dialog.append(line)
	
	pass

func parse_line(line):
	print(line)
	var command = line[0]
	
	if command == "sfx":
		var sound = load("res://Dialog/Sounds/" + line[1] + ".mp3")
		$"../SFXPlayer".stop()
		$"../SFXPlayer".stream = sound
		$"../SFXPlayer".play()
	
	elif command == "endtree":
		running = false
	
	else:
		current_line = line

func reload_dialog():
	dialog = FileAccess.get_file_as_string(dialog_file)
	dialog = dialog.replace("\r", "")
	pass

func _init():
	var start = Time.get_unix_time_from_system()
	reload_dialog()
	parse_dialog(0)
	parse_line(parsed_dialog[0])
	var end = Time.get_unix_time_from_system()
	print(end - start)

func _process(delta):
	
	$Box/Text.text = current_line[0] + ": " + current_line[1]
	
	if running:
		visible = true
		if Input.is_action_just_pressed("ui_accept") or last_line[0] != current_line[0] and last_line[1] != current_line[1]:
			parse_line(parsed_dialog[index])
			index += 1
	
	else:
		visible = false
	
	last_line = current_line
