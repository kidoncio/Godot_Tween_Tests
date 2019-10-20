extends Node2D


onready var TweenNode: Tween = get_node("Tween")

export (int, 0, 10, 1) var TRANSITION_TYPE: int = 10
export (int, 0, 3, 1) var EASE_TYPE: int = 1

const POSITION_PROPERTY: String = "position"
const SCALE_PROPERTY: String = "scale"

var SCALE: Vector2

func _ready():
	SCALE = self.scale


func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		go_to_mouse_pos()
		pass


func go_to_mouse_pos():
	var mouse_pos = get_global_mouse_position()
	var current_pos = self.global_position
	
	TweenNode.interpolate_property(self, POSITION_PROPERTY, current_pos, mouse_pos, 1.0, TRANSITION_TYPE, EASE_TYPE)
	TweenNode.interpolate_property(self, SCALE_PROPERTY, self.scale, self.scale * 3, 2, TRANSITION_TYPE, EASE_TYPE)
	
	TweenNode.start()
	pass

func _on_Tween_tween_all_completed():
	if self.scale == SCALE:
		pass
	
	TweenNode.interpolate_property(self, SCALE_PROPERTY, self.scale, SCALE, 1, TRANSITION_TYPE, EASE_TYPE)
	TweenNode.start()
	pass