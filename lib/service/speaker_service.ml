open Data
open Model

let enable_speaker_by_id id =
	Yaml_reader.get_speaker_by_id id
	|> Ssh_service.enable_speaker

let disable_speaker_by_id id =
	Printf.sprintf "disabling speaker %s\n" id |> print_endline

let list_speakers () =
	List.map speaker_of_speaker_entity (Yaml_reader. ())
