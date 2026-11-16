class_name Save_Manager
extends Resource

@export
var profile_name : String = "New Profile"
@export
var save_path : String = "user://saves/saved"

func _init(
	_profile_name : String = "New Profile",
	_save_path : String = "user://saves/saved"
) -> void:
	profile_name = _profile_name
	save_path = _save_path
	
