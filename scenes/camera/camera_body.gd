extends RigidBody3D

@export_range(0.1, 1, 0.1) var scale_factor: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _physics_process(delta):
	
	var inpulse = Vector3.ZERO
	
	if Input.is_action_pressed('Left'):
		inpulse += Vector3.LEFT
	
	if Input.is_action_pressed("Right"):
		inpulse += Vector3.RIGHT
		
	if Input.is_action_pressed("Forward"):
		inpulse += Vector3.FORWARD
	
	if Input.is_action_pressed("Back"):
		inpulse += Vector3.BACK
		
	inpulse *= scale_factor
		
	if Input.is_action_pressed("Halt"):
		linear_velocity = Vector3.ZERO	
		
	apply_central_force(inpulse)
