type speaker = { id: string; is_enabled: bool }

let yojson_of_speaker speaker = `Assoc [ "id", `String speaker.id; "is_enabled", `Bool speaker.is_enabled ]
