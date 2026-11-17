extends Control


@onready var dialogue_box = $DialogueLayer/DialogueContainer

func _on_start_button_pressed() -> void:
	var dialogue = DialogueManager.get_dialogue(
		1,
		"introduction"
	)

	dialogue_box.start_dialogue(dialogue)
