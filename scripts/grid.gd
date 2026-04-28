extends TileMapLayer
class_name Grid

## If true, the grid will force any coordinate to the nearest painted tile
@export var force_to_nearest_tile : bool = false

func get_grid_coordinate(_position: Vector2) -> Vector2:
	var local_pos = to_local(_position)
	var map_coord = local_to_map(local_pos)
	
	# If the toggle is on and the current tile is empty, find the neighbor
	if force_to_nearest_tile and get_cell_source_id(map_coord) == -1:
		map_coord = _get_nearest_valid_cell(map_coord)
	return Vector2(map_coord.x, map_coord.y)

func get_grid_position(coordinate : Vector2) -> Vector2:
	var map_coord = Vector2i(int(coordinate.x), int(coordinate.y))
	
	# Safety check: if the coordinate passed in isn't valid 
	# and we want to force it, find the closest one. 
	if force_to_nearest_tile and get_cell_source_id(map_coord) == -1:
		map_coord = _get_nearest_valid_cell(map_coord) 
		
	var local_center = map_to_local(map_coord)
	return to_global(local_center)

func is_valid_tile(coordinate: Vector2) -> bool:
	var map_coord = Vector2i(int(coordinate.x), int(coordinate.y))
	return get_cell_source_id(map_coord) != -1

## Helper function to find the closest painted tile
func _get_nearest_valid_cell(invalid_coord: Vector2i) -> Vector2i:
	var used_cells = get_used_cells()
	if used_cells.is_empty():
		return invalid_coord # No tiles painted, return original
		
	var closest_cell = used_cells[0]
	var min_dist = invalid_coord.distance_squared_to(closest_cell)
	
	for cell in used_cells:
		var dist = invalid_coord.distance_squared_to(cell)
		if dist < min_dist:
			min_dist = dist
			closest_cell = cell
			
	return closest_cell
