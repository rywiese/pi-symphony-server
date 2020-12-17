open Model

let command = "sudo systemctl status snapclient.service | grep \"Active: active (running)\""


let is_speaker_enabled (speaker : Speaker_yml_entity.t) : bool =
	let session = Ssh.init () in
	let opts = Ssh.Client.({
		host = speaker.host;
		log_level = SSH_LOG_NOLOG;
		port = 22;
		username = speaker.username;
		auth = Auto;
	}) in
	Ssh.Client.connect opts session;
	session |> Ssh.Client.exec ~command:command |> String.length
	|> (fun s -> s <> 0)

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
