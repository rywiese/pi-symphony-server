open Model

type t = { id: string; is_enabled: bool }

let t_of_speaker (speaker: Speaker.t) : t =
	{
		id = speaker.id;
		is_enabled = speaker.is_enabled
	}

let yojson_of_t (response: t) =
	`Assoc [ "id", `String response.id; "is_enabled", `Bool response.is_enabled ]

let yojson_of_t_list (responses: t list) =
	`List (List.map yojson_of_t responses)