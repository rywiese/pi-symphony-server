open Model

let is_speaker_enabled (_speaker : Speaker_yml_entity.t) : bool = true

let enable_speaker (speaker : Speaker_yml_entity.t) : unit =
	Printf.sprintf "ssh %s@%s sudo systemctl start snapclient.service" speaker.username speaker.host
	|> Sys.command
	|> ignore

let disable_speaker (speaker : Speaker_yml_entity.t) : unit =
	Printf.sprintf "ssh %s@%s sudo systemctl stop snapclient.service" speaker.username speaker.host
	|> Sys.command
	|> ignore