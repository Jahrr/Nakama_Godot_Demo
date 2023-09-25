extends Control


var readyStatus
var username

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func setReady(readytext):
	$Status.text = readytext
	readyStatus = readytext
	
func setUsername(currentUsername):
	$Username.text = currentUsername
	username = currentUsername
