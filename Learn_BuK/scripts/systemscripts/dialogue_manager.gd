
extends Node

# Lädt einen bestimmten Dialog aus einer Kapiteldatei
func get_dialogue(chapter: int, dialogue_id: String) -> Array[Dictionary]:

	# Dateipfad erstellen
	var path = "res://data/dialogues/chapter_%02d.json" % chapter

	# Prüfen, ob die Datei existiert
	if not FileAccess.file_exists(path):
		push_error("Dialogdatei nicht gefunden: " + path)
		return []

	# Datei öffnen
	var file = FileAccess.open(path, FileAccess.READ)

	if file == null:
		push_error("Dialogdatei konnte nicht geöffnet werden!")
		return []

	# JSON lesen
	var json = JSON.new()
	var error = json.parse(file.get_as_text())
	file.close()

	if error != OK:
		push_error("Fehler in der JSON-Datei: " + path)
		return []

	# Daten überprüfen
	if not json.data is Dictionary:
		push_error("Ungültiges JSON-Format!")
		return []

	# Gewünschten Dialog suchen
	var dialogues = json.data.get("dialogues", {})
	
	if not dialogues is Dictionary:
		return []

	var lines = dialogues.get(dialogue_id, [])

	# Dialogzeilen zurückgeben
	var result: Array[Dictionary] = []

	if lines is Array:
		for line in lines:
			if line is Dictionary:
				result.append(line)

	return result
