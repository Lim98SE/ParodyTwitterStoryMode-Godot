extends Node2D

@export var Name = "Demo Area"
@export var Size = Vector2(1920, 720)
@export var Song = "res://Music/tutorial.mp3"

func _ready():
	if $"../../Music".stream == null or $"../../Music".currentpath != Song:
		$"../../".change_song(Song)
