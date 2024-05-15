extends Label

func _on_timer_timeout():
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(8, -100), 1).set_trans(Tween.TRANS_QUAD)
	pass # Replace with function body.
