open Endpoint
open Opium

let health_check_handler _req =
	Speaker_endpoint.health_check ()
	|> Response.of_plain_text
	|> Lwt.return

let list_speakers_handler _req =
	Speaker_endpoint.list_speakers ()
	|> Speaker_response.yojson_of_t_list
	|> Response.of_json
	|> Lwt.return
;;

let enable_speaker_by_id_handler req =
	try Speaker_endpoint.enable_speaker_by_id (Router.param req "id")
		|> Response.of_plain_text
		|> Lwt.return
	with Not_found ->
		print_endline (Router.param req "id");
		"Speaker not found"
		|> Response.of_plain_text ~status:`Not_found
		|> Lwt.return
;;

let disable_speaker_by_id_handler req =
	try Speaker_endpoint.disable_speaker_by_id (Router.param req "id")
		|> Response.of_plain_text
		|> Lwt.return
	with Not_found -> "Speaker not found"
		|> Response.of_plain_text ~status:`Not_found
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