let is_speaker_enabled _id = true

let enable_speaker_by_id id =
	Printf.sprintf "Enabling speaker %s\n" id |> print_endline

let disable_speaker_by_id id =
	Printf.sprintf "disabling speaker %s\n" id |> print_endline

let list_speakers () =
	let id = "bedroom speaker" in
	let is_enabled = is_speaker_enabled id in
	{ Speaker.id; is_enabled }