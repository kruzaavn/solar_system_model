@tool
extends RigidBody3D

class_name Body

@export var influencing_body: RigidBody3D

@export var data: Resource: 
	set(value):
		data = value
		
		data.changed.connect(build)
		
func _ready():
	
	if data and not data.changed.is_connected(build):
		data.changed.connect(build)
		
	build()

func _physics_process(delta: float) -> void:

	if influencing_body:

		var gravitational_force = get_gravitational_force()

		apply_central_force(gravitational_force)

func get_gravitational_force():

	var r = influencing_body.transform.origin - transform.origin

	return ((Orbital.g * influencing_body.mass * mass) / r.length() ** 2) * r.normalized()


func _on_mouse_entered():
	
	var material = $OutlineMesh.mesh.get_material()

	material.set_shader_parameter('show', true)


func _on_mouse_exited():
	
	var material = $OutlineMesh.mesh.get_material()

	material.set_shader_parameter('show', false)
	
	
func build():
	
	print('build called')
	
	var material = $SurfaceMesh.mesh.get_material()
	
	material.set_shader_parameter('height_map', data.noise)
	material.set_shader_parameter('mesh_texture', data.noise)
