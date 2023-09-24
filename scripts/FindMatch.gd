extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	OnlineMatch.matchmaker_matched.connect(OnMatchFound)


func OnMatchFound(players):
	print(players)


func _on_find_match_button_down():
	$FindMatchLabel.visible = true;
	$FindMatchButton.hide()
	
	if not Online.is_nakama_socket_connected():
		print("connecting socket")
		Online.connect_nakama_socket()
		await Online.socket_connected
	
	print("Finding Match")
	
	var data = {
		min_count = 2
	}
	OnlineMatch.start_matchmaking(Online.nakama_socket, data)
