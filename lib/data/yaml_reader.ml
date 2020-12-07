open Model

let get_speaker_by_id (id : string) : Speaker_yml_entity.t =
	{ id = id; username = "ry"; host = "linuxbook" }

let list_speakers () : Speaker_yml_entity.t list =
	[
		get_speaker_by_id "speaker 1";
		get_speaker_by_id "speaker 2";
		get_speaker_by_id "speaker 3";
	]