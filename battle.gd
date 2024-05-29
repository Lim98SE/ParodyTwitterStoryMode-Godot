extends Node2D

var transitioning = false
var won = false

func _ready():
	add_child($"..".battlescene.instantiate())

func _process(delta):
	
	var enemies_in_scene = false
	
	for child in $Battle.get_children():
		if "enemy" in child.get_groups():
			enemies_in_scene = true
	
	if not enemies_in_scene and $WinDelay.is_stopped() and not transitioning:
		$CanvasLayer/UI.visible = false
		$CanvasLayer/YouWin.visible = true
		$WinDelay.start()
		$WinSfx.play()
		$"../Music".stop()
		
	if transitioning:
		if not $"..".get_node("Fade").fading:
			print("Loading")
			$"..".back()

func _on_win_delay_timeout():
	transitioning = true
	$"..".get_node("Fade").fadeIn()
	pass # Replace with function body.
