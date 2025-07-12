extends Node3D

@export var cam_path: NodePath
@export var lerp_speed: float = 5.0
@export var y_lerp_speed: float = 5.0
@export var y_turn_limit: float = 7.5

@onready var cam = get_node(cam_path)

var smoothed_rot := Vector3.ZERO
var y_mouse_input := 0.0 # Set this wherever your camera movement is, for me its my... player camera script

func _ready():
	smoothed_rot = rotation_degrees

func _physics_process(delta):
	# Fade the mouse input gradually back to zero, so once there is little to no mouse input it'll go back to the base rotation
	y_mouse_input = lerp(y_mouse_input, 0.0, delta * y_lerp_speed)

	# Target rotations
	var target_x = -cam.rotation_degrees.x * 0.1
	# First number (-180) is just the base rotation you want it at, and since its negative in my case we - the clamp rather than + it to the base rotation
	var target_y = -180 - clamp(y_mouse_input, -y_turn_limit, y_turn_limit)
	var target_z = -cam.rotation_degrees.z * 0.1

	# Smoothed rotation
	smoothed_rot.x = lerp(smoothed_rot.x, target_x, delta * lerp_speed)
	smoothed_rot.y = lerp(smoothed_rot.y, target_y, delta * lerp_speed)
	smoothed_rot.z = lerp(smoothed_rot.z, target_z, delta * lerp_speed)

	rotation_degrees = smoothed_rot
