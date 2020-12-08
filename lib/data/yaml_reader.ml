open Model

exception Configuration_exception of string

let speaker_of_yml (yml : string * Yaml.value) : Speaker_yml_entity.t =
	let (id, body) = yml in
	match body with
	| `O [("username", `String username); ("host", `String host)] -> { id = id; username = username; host = host }
	| _ -> { id = id; username = "ry"; host = "linuxbook" }

let list_speakers () : Speaker_yml_entity.t list =
	let config_file_name = "config/speaker_setup.yml" in
	let speaker_yml = Yaml_unix.of_file_exn Fpath.(v config_file_name) in
	match speaker_yml with
	| `O l -> List.map speaker_of_yml l
	| _ -> []

let get_speaker_by_id (id : string) : (Speaker_yml_entity.t, exn) result =
	try Ok (List.find (fun (speaker: Speaker_yml_entity.t) -> speaker.id = id) (list_speakers ()))
	with e -> Error e
