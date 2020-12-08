open Service

let health_check () : string = "Healthy"

let list_speakers () : Speaker_response.t list =
	Speaker_service.list_speakers ()
	|> List.map Speaker_response.t_of_speaker

let enable_speaker_by_id (id : string) : (string, exn) result =
	match Speaker_service.enable_speaker_by_id id with
	| Ok () -> Ok "Success"
	| Error e -> Error e

let disable_speaker_by_id (id : string) : (string, exn) result =
	match Speaker_service.disable_speaker_by_id id with
	| Ok () -> Ok "Success"
	| Error e -> Error e