extends Node2D


onready var TweenNode: Tween = get_node("Tween")

export (int, 0, 10, 1) var TRANSITION_TYPE: int = 10
export (int, 0, 3, 1) var EASY_TYPE: int = 1

const NODE_PROPERTY: String = "position"


func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		go_to_mouse_pos()
		pass


func go_to_mouse_pos():
	var mouse_pos = get_global_mouse_position()
	var current_pos = self.global_position
	
	TweenNode.interpolate_property(self, NODE_PROPERTY, current_pos, mouse_pos, 1.0, TRANSITION_TYPE, EASY_TYPE)
	TweenNode.start()
	pass