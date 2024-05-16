extends Sprite2D
@onready var root = get_tree().root.get_child(0)

func _ready():
	position.y = -300
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(position.x, 20), 1).set_trans(Tween.TRANS_QUAD)
	root.change_song("res://Music/title.mp3")
