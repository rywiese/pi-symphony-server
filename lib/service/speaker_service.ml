open Data
open Model

let speaker_from_yml_entity (speaker_entity : Speaker_yml_entity.t) : Speaker.t =
	Ssh_service.is_speaker_enabled speaker_entity
	|> Speaker.from_speaker_yml_entity speaker_entity

let list_speakers () : Speaker.t list =
	Yaml_reader.list_speakers ()
	|> List.map speaker_from_yml_entity

let enable_speaker_by_id (id : string) =
	Yaml_reader.get_speaker_by_id id
	|> Ssh_service.enable_speaker

let disable_speaker_by_id (id : string) =
	Yaml_reader.get_speaker_by_id id
	|> Ssh_service.disable_speaker
