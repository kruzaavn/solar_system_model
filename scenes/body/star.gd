extends Body

class_name Star

@export var texture: Texture2D

func _ready():
	
	var material = $SurfaceMesh.mesh.get_material()

	material.set_shader_parameter('emmit', true)
	material.set_shader_parameter('mesh_texture', texture)
