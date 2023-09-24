extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_login_button_down():
	var email = $EmailEdit.text.strip_edges()
	var password = $PasswordEdit.text.strip_edges()
	
	var session = await Online.nakama_client.authenticate_email_async(email, password, null, false)
	if session.is_exception():
		print("Authentication error: " + session.get_exception().message)
	else:
		Online.nakama_session = session
		SwitchToFindMatchScreen()


func _on_register_button_down():
	var username = $UsernameEdit.text.strip_edges()
	var email = $EmailEdit.text.strip_edges()
	var password = $PasswordEdit.text.strip_edges()
	
	var session = await Online.nakama_client.authenticate_email_async(email, password, username, true)
	if session.is_exception():
		print("Authentication error: " + session.get_exception().message)
	else:
		Online.nakama_session = session
		SwitchToFindMatchScreen()
	
 

func SwitchToFindMatchScreen():
	hide()
	get_parent().get_node("FindMatch").visible = true;

