(* open Config *)
open Model

exception Yaml_reader_failure of string

let read_yml_from_config () = Yaml_unix.of_file_exn Fpath.(v Config.speaker_setup_file)

let speaker_of_yml_block ((id, body) : string * Yaml.value) : Speaker_yml_entity.t =
	match body with
	| `O [("username", `String username); ("host", `String host)] -> { id = id; username = username; host = host }
	| _ -> raise (Yaml_reader_failure ("Yaml block with id " ^ id ^ " is malformed"))

let list_speakers () : Speaker_yml_entity.t list =
	match read_yml_from_config () with
	| `O yml_block_list -> List.map speaker_of_yml_block yml_block_list
	| _ -> raise (Yaml_reader_failure "Yaml config is not a list of blocks")

let get_speaker_by_id (id : string) : Speaker_yml_entity.t =
	List.find (fun (speaker: Speaker_yml_entity.t) -> speaker.id = id) (list_speakers ())
