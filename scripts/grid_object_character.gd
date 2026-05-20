@icon("res://addons/Godot_Grid/king.png")
extends GridObject
class_name GridPlayer

@export var input_left = "move_left" ## Input action name for moving one cell to the left
@export var input_right = "move_right" ## Input action name for moving one cell to the right
@export var input_down = "move_down" ## Input action name for moving one cell down
@export var input_up = "move_up" ## Input action name for moving one cell up

func _unhandled_input(event: InputEvent) -> void: ## Adjusts the grid coordinate by one cell in the pressed direction
	if event.is_action_pressed(input_left):
		coordinate_x -= 1;
	if event.is_action_pressed(input_right):
		coordinate_x += 1;
	if event.is_action_pressed(input_down):
		coordinate_y += 1;
	if event.is_action_pressed(input_up):
		coordinate_y -= 1;
