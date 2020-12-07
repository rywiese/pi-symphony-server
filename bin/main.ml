open Lib
open Opium

let health_check_handler _req =
	"Healthy"
	|> Response.of_plain_text
	|> Lwt.return

let list_speakers_handler _req =
	let speaker = Speaker_service.list_speakers () |> Speaker.yojson_of_speaker in
	Lwt.return (Response.of_json speaker)
;;

let enable_speaker_by_id_handler req =
	Speaker_service.enable_speaker_by_id (Router.param req "id");
	Response.of_json `Null
	|> Lwt.return
;;

let disable_speaker_by_id_handler req =
	Speaker_service.disable_speaker_by_id (Router.param req "id");
	Response.of_json `Null
	|> Lwt.return
;;

let _ =
	App.empty
	|> App.get "/health" health_check_handler
	|> App.get "/speakers" list_speakers_handler
	|> App.put "/speakers/:id/enable" enable_speaker_by_id_handler
	|> App.put "/speakers/:id/disable" disable_speaker_by_id_handler
	|> App.run_command
;;