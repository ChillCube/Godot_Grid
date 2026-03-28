extends TileMapLayer
class_name Grid

func get_grid_coordinate(_position: Vector2) -> Vector2:
	# 1. Convert global mouse/card position to the TileMap's local space
	var local_pos = to_local(_position)
	
	# 2. local_to_map automatically handles the "center vs corner" math 
	# by determining which cell boundary the point falls into.
	var map_coord = local_to_map(local_pos)
	
	return Vector2(map_coord.x, map_coord.y)

func get_grid_position(coordinate : Vector2) -> Vector2:
	# 3. Convert the Vector2 back to the specific Integer format TileMapLayer needs
	var map_coord = Vector2i(int(coordinate.x), int(coordinate.y))
	
	# 4. map_to_local returns the CENTER of the cell in local space
	var local_center = map_to_local(map_coord)
	
	# 5. Return that center point in Global/World space
	return to_global(local_center)

func is_valid_tile(coordinate: Vector2) -> bool:
	var map_coord = Vector2i(int(coordinate.x), int(coordinate.y))
	return get_cell_source_id(map_coord) != -1
