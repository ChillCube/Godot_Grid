@icon("res://addons/Godot_Grid/pawn.png")
extends Node2D
class_name GridObject

@export var grid : Grid; ## The Grid (TileMapLayer) this object snaps to
@export var continous_movement : bool = true; ## If true, position is updated every frame to follow coordinate changes
@export var coordinate_x : int = 0 ## Current column on the grid
@export var coordinate_y : int = 0 ## Current row on the grid

func _process(delta: float) -> void: ## Each frame: moves parent to the current grid coordinate if continous_movement is on
	if continous_movement:
		_move(Vector2(coordinate_x, coordinate_y))

func move_to_coordinate(new_coordinate : Vector2) -> void: ## Teleport to a specific grid coordinate and immediately update position
	coordinate_x = new_coordinate.x
	coordinate_y = new_coordinate.y
	_move(Vector2(coordinate_x, coordinate_y))

func move_to_position(new_position : Vector2) -> void: ## Converts a world position to a grid coordinate and moves there
	var new_coordinate : Vector2 = grid.get_grid_coordinate(new_position)
	coordinate_y = new_coordinate.y
	coordinate_x = new_coordinate.x
	_move(Vector2(coordinate_x, coordinate_y))

func _move(coordinate : Vector2) -> void:
	if has_node("SmothMovement"):
		get_node("SmoothMovement").global_target_position = grid.get_grid_position(coordinate)
	else:
		global_position = grid.get_grid_position(coordinate)
