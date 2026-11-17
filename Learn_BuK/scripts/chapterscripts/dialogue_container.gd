
extends Control

@onready var speaker_label: Label = $PanelContainer/MarginContainer/VBoxContainer/SpeakerName
@onready var dialogue_label: Label = $PanelContainer/MarginContainer/VBoxContainer/DialogueText
@onready var next_button: Button = $PanelContainer/MarginContainer/VBoxContainer/NextButton

var dialogue_lines: Array[Dictionary] = []
var current_line: int = 0

func _ready() -> void:
	next_button.pressed.connect(next_dialogue)
	hide()

func start_dialogue(lines: Array[Dictionary]) -> void:
	if lines.is_empty():
		return

	dialogue_lines = lines
	current_line = 0

	show()
	display_dialogue()

func display_dialogue() -> void:
	var line = dialogue_lines[current_line]

	speaker_label.text = line.get("speaker", "")
	dialogue_label.text = line.get("text", "")

	if current_line == dialogue_lines.size() - 1:
		next_button.text = "Schließen"
	else:
		next_button.text = "Weiter"

func next_dialogue() -> void:
	current_line += 1

	if current_line >= dialogue_lines.size():
		hide()
		return

	display_dialogue()
