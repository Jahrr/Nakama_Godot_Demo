extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	OnlineMatch.player_joined.connect(PlayerJoined)
	OnlineMatch.player_left.connect(PlayerLeft)
	OnlineMatch.player_status_changed.connect(PlayerStatusChanged)
	OnlineMatch.match_ready.connect(MatchReady)
	OnlineMatch.match_not_ready.connect(MatchNotReady)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ready_button_down():
	pass
	
	
func PlayerJoined(player):
	pass
func PlayerLeft(player):
	pass
func PlayerStatusChanged(player, status):
	pass
func MatchReady(player):
	pass
func MatchNotReady():
	pass
