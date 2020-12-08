open Model

let is_speaker_enabled (_speaker : Speaker_yml_entity.t) : bool = true

let enable_speaker (speaker : Speaker_yml_entity.t) : unit =
	Printf.sprintf "enabling speaker %s at %s@%s\n" speaker.id speaker.username speaker.host |> print_endline

let disable_speaker (speaker : Speaker_yml_entity.t) : unit =
	Printf.sprintf "disabling speaker %s at %s@%s\n" speaker.id speaker.username speaker.host |> print_endline