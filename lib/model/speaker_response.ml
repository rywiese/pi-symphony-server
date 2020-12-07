type t = {
	id: string;
	is_enabled: bool
}

let response_of_speaker (speaker: Speaker.t) : t =
	{
		id = speaker.id;
		is_enabled = speaker.is_enabled
	}

let yojson_of_speaker_list (speakers : Speaker.t list) =
	let responses = List.map response_of_speaker speakers in
	let yojson_of_response (response : t) =
		`Assoc [ "id", `String response.id; "is_enabled", `Bool response.is_enabled ] in
	`List (List.map yojson_of_response responses)