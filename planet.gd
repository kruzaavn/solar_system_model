extends Body

class_name Planet

@export var height_map: Texture2D
@export var texture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	var material = $SurfaceMesh.mesh.get_material()

	material.set_shader_parameter('height_map', height_map)
	material.set_shader_parameter('mesh_texture', texture)
