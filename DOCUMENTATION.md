# Godot_Grid API Reference
Generated: 2026-05-20

An addon that manages grid placement. Useful for card games, strategy games, among others

## Class: GridPlayer
**Inherits:** [GridObject](#class-gridobject)


### ⚙️ Inspector Variables (Exported)
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **input_left** | `Variant` | `"move_left"` | Input action name for moving one cell to the left |
| **input_right** | `Variant` | `"move_right"` | Input action name for moving one cell to the right |
| **input_down** | `Variant` | `"move_down"` | Input action name for moving one cell down |
| **input_up** | `Variant` | `"move_up"` | Input action name for moving one cell up |

---

## Class: GridObject
**Inherits:** [Node2D](https://docs.godotengine.org/en/stable/classes/class_node2d.html)


### ⚙️ Inspector Variables (Exported)
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **grid** | `Grid;` | `-` | The Grid (TileMapLayer) this object snaps to |
| **continous_movement** | `bool` | `true` | If true, position is updated every frame to follow coordinate changes |
| **coordinate_x** | `int` | `0` | Current column on the grid |
| **coordinate_y** | `int` | `0` | Current row on the grid |

### 🛠️ Methods
| Method | Arguments | Returns | Description |
| :--- | :--- | :--- | :--- |
| **move_to_coordinate()** | `new_coordinate : Vector2` | `void` |  Teleport to a specific grid coordinate and immediately update position |
| **move_to_position()** | `new_position : Vector2` | `void` |  Converts a world position to a grid coordinate and moves there |

---

## Class: Grid
**Inherits:** [TileMapLayer](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html)


### 🛠️ Methods
| Method | Arguments | Returns | Description |
| :--- | :--- | :--- | :--- |
| **get_grid_coordinate()** | `_position: Vector2` | `Vector2` |  Converts a global world position to a grid coordinate; snaps to nearest painted tile if force_to_nearest_tile is on |
| **get_grid_position()** | `coordinate : Vector2` | `Vector2` |  Converts a grid coordinate back to a global world position (center of that tile) |
| **is_valid_tile()** | `coordinate: Vector2` | `bool` |  Returns true if there is a painted tile at the given grid coordinate |
| **()** | - | `void` |  Helper function to find the closest painted tile |

---

