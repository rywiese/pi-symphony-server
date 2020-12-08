open Data
open Model

let speaker_from_yml_entity (speaker_entity : Speaker_yml_entity.t) : Speaker.t =
	Ssh_service.is_speaker_enabled speaker_entity
	|> Speaker.from_speaker_yml_entity speaker_entity

let list_speakers () : Speaker.t list =
	Yaml_reader.list_speakers ()
	|> List.map speaker_from_yml_entity

let enable_speaker_by_id (id : string) : (unit, exn) result =
	match Yaml_reader.get_speaker_by_id id with
	| Ok speaker_entity -> Ok (Ssh_service.enable_speaker speaker_entity)
	| Error e -> Error e

let disable_speaker_by_id (id : string) : (unit, exn) result =
	match Yaml_reader.get_speaker_by_id id with
	| Ok speaker_entity -> Ok (Ssh_service.disable_speaker speaker_entity)
	| Error e -> Error e
