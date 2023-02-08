extends RigidBody3D

class_name Body

@export var influencing_body: RigidBody3D
@export var height_map: Texture2D
@export var texture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:


	var material = $SurfaceMesh.mesh.get_material()

	material.set_shader_parameter('height_map', height_map)
	material.set_shader_parameter('mesh_texture', texture)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
