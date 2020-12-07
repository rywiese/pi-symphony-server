type t = {
	id: string;
	is_enabled: bool
}

let speaker_response_of_speaker (speaker : Speaker.t) = { id=speaker.id; is_enabled = speaker.is_enabled }

let speaker_list_response_of_speaker_list (speakers : Speaker.t list) = List.map speaker_response_of_speaker speakers

let yojson_of_speaker_response (speaker : t) = `Assoc [ "id", `String speaker.id; "is_enabled", `Bool speaker.is_enabled ]

let yojson_of_speaker_list_response (speakers : t list) = `List (List.map yojson_of_speaker_response speakers)