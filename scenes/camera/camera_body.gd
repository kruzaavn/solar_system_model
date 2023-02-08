extends RigidBody3D

@export_range(1, 100, 1) var scale_factor: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _physics_process(delta):
	
	var inpulse = Vector3.ZERO
	
	if Input.is_action_pressed('Left'):
		inpulse += -transform.basis.x
	
	if Input.is_action_pressed("Right"):
		inpulse += transform.basis.x
		
	if Input.is_action_pressed("Forward"):
		inpulse += -transform.basis.z
	
	if Input.is_action_pressed("Back"):
		inpulse += transform.basis.z
		
	if Input.is_action_pressed("Up"):
		inpulse += transform.basis.y

	if Input.is_action_pressed("Down"):
		inpulse += -transform.basis.y
		
	inpulse = inpulse * scale_factor * delta
		
	if Input.is_action_pressed("Halt"):
		linear_velocity = Vector3.ZERO	
		
	apply_central_force(inpulse)
