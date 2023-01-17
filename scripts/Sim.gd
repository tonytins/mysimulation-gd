# current_mood: an integer value representing the Sim's current mood.
#
# needs: a dictionary containing the Sim's need levels for hunger, energy, fun, and social. 
# Each need has an initial value of 50.
# Activities: a list of activities that the Sim has performed.
# 
# update_mood() calculates the average need level for the Sim and updates its mood based on that value.
# do_activity() updates the Sim's need levels and appends the activity to the Activities list.
#
extends KinematicBody2D

onready var sprite: Sprite = $TriangleRed
export var max_speed := 300

var current_mood = 0
var last_mood = 0
var needs = {
	"hunger": 50, "energy": 50, "fun": 50, "social": 50,
}
var current_global_pos = Vector2.ZERO
var target_global_pos = Vector2.ZERO
var _velocity := Vector2.ZERO

# Define the `update_mood` instance method.
func update_mood(motive):
	# Calculate the average need level.
	var need_sum = 0
	for need in needs[motive]:
		need_sum += need
	var need_average = need_sum / len(needs)

	# Update the Sim's mood based on its average need and relationship levels.
	current_mood = need_average / 2
	last_mood = current_mood

# Define the `DoActivity` instance method, which takes an `motive` and 'amount' argument.
func do_activity(motive, amount):
	if motive == "hunger":
		needs["hunger"] = amount
	elif motive == "energy":
		needs["fun"] = amount
	elif motive == "energy":
		needs["energy"] = amount
	elif motive == "social":
		needs["social"] = amount
	
	# Update the Sim's mood after performing the `activity`.
	update_mood(motive)

# Define the `Sim` class constructor.
func _ready():
	# Print the `Sim` instance again.
	if last_mood != current_mood:
		print(current_mood)
	
func _physics_process(delta):	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		target_global_pos = get_global_mouse_position()
		
	detect_pos()

func detect_pos():
	if current_global_pos == target_global_pos:

		_velocity = Vector2.ZERO
		
	if current_global_pos != target_global_pos:
		_velocity = Steering.follow(
			_velocity,
			global_position,
			target_global_pos,
			max_speed
		)

		_velocity = move_and_slide(_velocity)

#func _physics_process(delta) -> void:
#	var target_global_pos: Vector2 = get_global_mouse_position()
#
#	_velocity = Steering.follow(
#		_velocity,
#		global_position,
#		target_global_pos,
#		max_speed
#	)
#
#	_velocity = move_and_slide(_velocity)
