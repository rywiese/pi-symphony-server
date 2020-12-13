open Model

let is_speaker_enabled (_speaker : Speaker_yml_entity.t) : bool = true

let enable_speaker (speaker : Speaker_yml_entity.t) : unit =
	(* Remove the ping when we get the linuxbook network thing figured out... *)
	Printf.sprintf "ping -t 1 %s; ssh %s@%s sudo systemctl start snapclient.service" speaker.host speaker.username speaker.host
	|> Sys.command
	|> ignore

let disable_speaker (speaker : Speaker_yml_entity.t) : unit =
	(* Remove the ping when we get the linuxbook network thing figured out... *)
	Printf.sprintf "ping -t 1 %s; ssh %s@%s sudo systemctl stop snapclient.service" speaker.host speaker.username speaker.host
	|> Sys.command
	|> ignore