extends Button

@export_range(1, 16) var chapter_number: int = 1
@export_multiline var chapter_name: String = "name"
@export var unlocked: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/ChapterNumber.text = "Kapitel " + str(chapter_number)
	$VBoxContainer/ChapterName.text = chapter_name
	disabled = not unlocked


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed() -> void:
	print("Kapitel ", chapter_number, " ausgewählt")
