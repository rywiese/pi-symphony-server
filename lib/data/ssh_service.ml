open Model

let is_enabled_command = "sudo systemctl status snapclient.service | grep \"Active: active (running)\""
let enable_command = "sudo systemctl start snapclient.service"
let disable_command = "sudo systemctl stop snapclient.service"

let ssh_command host username command =
	let session = Ssh.init () in
	let opts = Ssh.Client.({
		host = host;
		log_level = SSH_LOG_NOLOG;
		port = 22;
		username = username;
		auth = Auto;
	}) in
	Ssh.Client.connect opts session;
	session |> Ssh.Client.exec ~command:command

let is_speaker_enabled (speaker : Speaker_yml_entity.t) : bool =
	try ssh_command speaker.host speaker.username is_enabled_command
		|> String.length
		|> (fun s -> s <> 0)
	with _ -> false

let enable_speaker (speaker : Speaker_yml_entity.t) : unit =
	ssh_command speaker.host speaker.username enable_command
	|> ignore

let disable_speaker (speaker : Speaker_yml_entity.t) : unit =
	ssh_command speaker.host speaker.username disable_command
	|> ignore
