open Model
open Service
open Opium

let health_check_handler _req =
	"Healthy"
	|> Response.of_plain_text
	|> Lwt.return

let list_speakers_handler _req =
	Speaker_service.list_speakers ()
	|> Speaker_response.yojson_of_speaker_list
	|> Response.of_json
	|> Lwt.return
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