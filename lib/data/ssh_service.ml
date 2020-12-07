open Model

let is_speaker_enabled (_speaker : Speaker_yml_entity.t) : bool = true

let enable_speaker (speaker : Speaker_yml_entity.t) : unit =
	Printf.sprintf "enabling speaker %s\n" speaker.id |> print_endline

let disable_speaker (speaker : Speaker_yml_entity.t) : unit =
	Printf.sprintf "disabling speaker %s\n" speaker.id |> print_endline