extends KinematicBody2D

onready var sprite: Sprite = $TriangleRed

export var max_speed := 300
var _velocity := Vector2.ZERO

func _physics_process(delta) -> void:
	var target_global_pos: Vector2 = get_global_mouse_position()
	
	_velocity = Steering.follow(
		_velocity,
		global_position,
		target_global_pos,
		max_speed
	)
	
	_velocity = move_and_slide(_velocity)
