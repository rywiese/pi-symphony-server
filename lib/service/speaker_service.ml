open Model

let enable_speaker_by_id id =
	Printf.sprintf "enabling speaker %s\n" id |> print_endline

let disable_speaker_by_id id =
	Printf.sprintf "disabling speaker %s\n" id |> print_endline

let list_speakers () : Speaker.t list = []
