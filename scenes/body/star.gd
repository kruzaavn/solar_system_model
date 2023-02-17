@tool
extends Body

class_name Star


func build():
	
	var material = $SurfaceMesh.mesh.get_material()

	material.set_shader_parameter('emmit', true)
	material.set_shader_parameter('mesh_texture', data.noise)
