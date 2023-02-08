extends Control


@onready @export var body: RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_velocity()

func update_velocity() -> void:
	
	var label = $VelocityLabel
	
	if body:
		
		var linear_velocity = body.linear_velocity
		
		var text = """Velocity
X: %4.1f
Y: %4.1f
Z: %4.1f""" % [linear_velocity.x, linear_velocity.y, linear_velocity.z]
		
		label.text = text
	else:
		label.text = ""
