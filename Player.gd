extends KinematicBody

# A basic kinematic character controller
# referenced from https://www.youtube.com/watch?v=UpF7wm0186Q

export(NodePath) onready var cameraRig = get_node(cameraRig) as Spatial
export(NodePath) onready var characterModel = get_node(characterModel) as Spatial
export(float) var speed : float = 7.0
export(float) var jumpStrength : float = 20.0
export(float) var gravity : float = 50.0

var _velocity : Vector3 = Vector3.ZERO
var _snap_vector : Vector3 = Vector3.DOWN

func _physics_process(delta: float) -> void:
	var moveDirection : Vector3 = Vector3.ZERO
	
	# calculate movement direction based on input and look direction
	moveDirection.x = Input.get_axis("move_left", "move_right")
	moveDirection.z = Input.get_axis("move_forward", "move_back")
	moveDirection = moveDirection.rotated(Vector3.UP, cameraRig.rotation.y).normalized()
	
	# apply movement to velcity
	_velocity.x = moveDirection.x * speed
	_velocity.z = moveDirection.z * speed
	
	# apply gravity
	_velocity.y -= gravity * delta
	
	# check if in air or jumping
	var justLanded : bool = is_on_floor() && _snap_vector == Vector3.ZERO
	var isJumping : bool = is_on_floor() && Input.is_action_just_pressed("jump")
	
	# jump if we are allowed to
	if isJumping:
		_velocity.y = jumpStrength
		_snap_vector = Vector3.ZERO
	elif justLanded:
		_snap_vector = Vector3.DOWN
	
	# finally apply movement
	_velocity = move_and_slide_with_snap(_velocity, _snap_vector, Vector3.UP, true)
	
	# rotate player model to face movement direction
	if _velocity.length() > 0.2:
		var lookDir : Vector2 = Vector2(_velocity.z, _velocity.x)
		characterModel.rotation.y = lookDir.angle()
		
