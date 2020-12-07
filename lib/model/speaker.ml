type t = {
	id: string;
	username: string;
	host: string;
	is_enabled: bool
}

let from_speaker_yml_entity (speaker : Speaker_yml_entity.t) (is_enabled : bool) : t =
	{
		id = speaker.id;
		username = speaker.username;
		host = speaker.host;
		is_enabled = is_enabled
	}
