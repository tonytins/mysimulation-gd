# Mood: an integer value representing the Sim's current mood.
#
# Needs: a dictionary containing the Sim's need levels for hunger, energy, fun, and social. 
# Each need has an initial value of 50.
# Activities: a list of activities that the Sim has performed.
# 
# UpdateMood() calculates the average need level for the Sim and updates its mood based on that value.
# DoActivity() updates the Sim's need levels and appends the activity to the Activities list.
#
extends KinematicBody2D

var Mood = 0
var Needs = {
	"hunger": 50, "energy": 50, "fun": 50, "social": 50,
}


onready var sprite: Sprite = $TriangleRed

export var max_speed := 300
var current_global_pos = Vector2.ZERO
var target_global_pos = Vector2.ZERO
var _velocity := Vector2.ZERO

# Define the `UpdateMood` instance method.
func UpdateMood(motive):
	# Calculate the average need level.
	var need_sum = 0
	for need in Needs[motive]:
		need_sum += need
	var need_average = need_sum / len(Needs)

	# Update the Sim's mood based on its average need and relationship levels.
	Mood = need_average / 2

# Define the `DoActivity` instance method, which takes an `motive` and 'amount' argument.
func DoActivity(motive, amount):
	if motive == "hunger":
		Needs["hunger"] = amount
	elif motive == "energy":
		Needs["fun"] = amount
	elif motive == "energy":
		Needs["energy"] = amount
	elif motive == "social":
		Needs["social"] = amount
	
	# Update the Sim's mood after performing the `activity`.
	UpdateMood(motive)

# Define the `Sim` class constructor.
func _ready():
	# Call the `DoActivity` method on the `Sim` instance and pass in the string "eating" as an argument.
	DoActivity("hunger", 10)

	# Print the `Sim` instance again.
	print(Mood)
	
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
