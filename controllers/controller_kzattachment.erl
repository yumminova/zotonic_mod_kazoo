-module(controller_kzattachment).
-export([
    init/1,
    service_available/2,
    allowed_methods/2,
    resource_exists/2,
    forbidden/2,
    content_types_provided/2,
    charsets_provided/2,
    encodings_provided/2,
    provide_content/2,
    finish_request/2
]).

-include_lib("controller_webmachine_helper.hrl").
-include_lib("zotonic.hrl").

init(ConfigProps) ->
    {ok, ConfigProps}.

service_available(ReqData, DispatchArgs) ->
    Context  = z_context:new(ReqData, ?MODULE),
    Context1 = z_context:set(DispatchArgs, Context),
    Context2 = z_context:ensure_all(Context1),
    ?WM_REPLY(true, Context2).

allowed_methods(ReqData, Context) ->
    {['HEAD', 'GET'], ReqData, Context}.

forbidden(ReqData, Context) ->
    {false, ReqData, Context}.

content_types_provided(ReqData, Context) ->
 %   {[{z_context:get(mime, Context), provide_content}], ReqData, Context}.
    {[{"application/pdf", provide_content}], ReqData, Context}.

encodings_provided(ReqData, Context) ->
    Encodings = [{"identity", fun(Data) -> Data end}], 
    {Encodings, ReqData, z_context:set(encode_data, length(Encodings) > 1, Context)}.

resource_exists(ReqData, Context) ->
    {true , ReqData, Context}.

charsets_provided(ReqData, Context) ->
    case is_text(z_context:get(mime, Context)) of
        true -> {[{"utf-8", fun(X) -> X end}], ReqData, Context};
        _ -> {no_charset, ReqData, Context}
    end.

provide_content(ReqData, Context) ->
lager:info("IAM provide_content/2. Q ALL: ~p ",[z_context:get_q_all(Context)]),
    ReqData1 = case z_context:get(content_disposition, Context) of
              inline ->     wrq:set_resp_header("Content-Disposition", "inline", ReqData);
              attachment -> wrq:set_resp_header("Content-Disposition", "attachment", ReqData);
              undefined ->  ReqData
          end,
    case z_context:get_q("doc_type", Context) of
        "onbill_doc" ->
                    {'ok', Body} = onbill_doc(Context),
                    {Body, ReqData1, z_context:set(body, Body, Context)};
        "call_recording" ->
                    {'ok', Body} = call_recording_attachment(Context),
                    {Body, ReqData1, z_context:set(body, Body, Context)};
        _ ->
            {<<>>, ReqData, Context}
    end.

finish_request(ReqData, Context) ->
    {ok, ReqData, Context}.

onbill_doc(_Context) ->
    {ok, <<"Hello from controller">>}.

call_recording_attachment(Context) ->
    AccountId = z_context:get_q("account_id", Context),
    CallId = z_context:get_q("call_id", Context),
    AuthToken = z_context:get_q("auth_token", Context),
    Body = kazoo_util:call_recording_attachment(AccountId, CallId, AuthToken, Context),
    {ok, Body}.

is_text("text/" ++ _) -> true;
is_text("application/x-javascript") -> true;
is_text("application/xhtml+xml") -> true;
is_text("application/xml") -> true;
is_text(_Mime) -> false.

