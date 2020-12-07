open Data
open Model

let speaker_from_speaker_yml_entity (speaker : Speaker_yml_entity.t) : Speaker.t =
	{
		id = speaker.id;
		username = speaker.username;
		host = speaker.host;
		is_enabled = Ssh_service.is_speaker_enabled speaker
	}

let list_speakers () : Speaker.t list =
	Yaml_reader.list_speakers ()
	|> List.map speaker_from_speaker_yml_entity

let enable_speaker_by_id (id : string) =
	Yaml_reader.get_speaker_by_id id
	|> Ssh_service.enable_speaker

let disable_speaker_by_id (id : string) =
	Yaml_reader.get_speaker_by_id id
	|> Ssh_service.disable_speaker
