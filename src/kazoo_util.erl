-module(kazoo_util).
-author("Kirill Sysoev <kirill.sysoev@gmail.com>").

-export([kz_admin_creds/1
    ,kz_user_creds/3
    ,kz_user_creds/4
    ,kz_api_key_creds/2
    ,kz_auth_token_creds/2
    ,crossbar_admin_request/4
    ,crossbar_admin_request/5
    ,crossbar_account_request/4
    ,crossbar_account_request/5
    ,crossbar_account_send_raw_request/5
    ,crossbar_account_send_raw_request_body/5
    ,crossbar_account_send_raw_request_body/6
    ,crossbar_account_send_raw_request_body/7
    ,crossbar_noauth_request_raw/4
    ,crossbar_noauth_request/4
    ,kz_get_acc_doc/1
    ,kz_get_acc_doc_by_account_id/2
    ,kz_get_acc_doc_by_account_id_and_authtoken/3
    ,kz_adminget_acc_doc_by_account_id/2
    ,kz_account_doc_field/2
    ,kz_account_doc_field/3
    ,kz_get_user_doc/1
    ,kz_get_user_doc/2
    ,kz_get_user_doc/3
    ,kz_get_user_doc/4
    ,kz_user_doc_field/2
    ,kz_user_doc_field/3
    ,kz_device_doc_field/3
    ,kz_media_doc_field/3
    ,create_kazoo_account/1
    ,update_kazoo_user/1
    ,kz_list_account_users/1
    ,kz_list_account_users/2
    ,kz_admin_list_account_users/2
    ,kz_list_account_devices/1
    ,list_account_recordings/1
    ,kz_list_account_cdr/3
    ,kz_list_account_cdr/5
    ,kz_list_account_cdr_page/3
    ,kz_list_account_cdr_reduced/3
    ,kz_list_user_cdr/3
    ,kz_list_user_cdr_reduced/3
    ,kz_fetch_cdr_details/2
    ,kz_cdr_legs/2
    ,kz_cdr_legs_localized/2
    ,kz_cdr_list_reduce/2
    ,kz_list_account_children/1
    ,kz_list_account_channels/1
    ,kz_list_account_channels/2
    ,kz_get_reseller_channels/2
    ,kz_channel_info/2
    ,kz_channel_info/3
    ,kz_channel_action/3
    ,kz_channel_action/4
    ,kz_channel_hangup/3
    ,kz_channel_transfer/4
    ,kz_channel_eavesdrop/5
    ,kz_list_user_devices/1
    ,kz_list_user_devices/2
    ,kz_get_device_doc/2
    ,kz_set_device_doc/4
    ,kz_list_account_vmboxes/1
    ,kz_list_user_vmboxes/1
    ,kz_list_user_vmbox_details/2
    ,kz_list_user_vmbox_messages/2
    ,kz_purge_voicemails/3
    ,kz_purge_voicemail/4
    ,kz_vmessage_download_link/3
    ,is_kazoo_account_admin/1
    ,set_vm_message_folder/4
    ,password_recovery/3
    ,password_reset_submit/2
    ,growl_redirect/4
    ,change_credentials/4
    ,current_account_credit/1
    ,current_account_credit/2
    ,kz_check_device_registration/2
    ,kz_kzattachment_link/5
    ,call_recording_attachment/4
    ,kz_get_device_registration_details/2
    ,azrates/1
    ,azrates_refresh/1
    ,rate_number/2
    ,kz_list_incoming_faxes/1
    ,kz_list_incoming_faxes/3
    ,kz_incoming_fax_download_link/2
    ,kz_incoming_fax/2
    ,kz_incoming_fax_attachment_pdf/2
    ,kz_incoming_fax_attachment_tiff/2
    ,kz_incoming_fax_delete/2
    ,kz_account_numbers/1
    ,kz_account_numbers/2
    ,phone_number/2
    ,phone_number/5
    ,kz_account_numbers_info/1
    ,kz_account_numbers_info/2
    ,account_numbers_fix/2
    ,account_numbers_fix_plus/2
    ,kz_send_fax/7
    ,kz_list_outgoing_faxes/1
    ,kz_list_ledgers/5
    ,kz_ledgers_summary/4
    ,kz_list_transactions/1
    ,kz_list_transactions/2
    ,kz_list_transactions/3
    ,kz_list_transactions/4
    ,kz_list_transactions/5
    ,kz_bt_transactions/1
    ,kz_list_subscriptions/1
    ,kz_list_subscriptions/2
    ,kz_current_balance/2
    ,kz_transactions_credit/6
    ,kz_admin_transactions_credit/6
    ,kz_transactions_debit/5
    ,kz_get_subscription/2
    ,kz_bt_customer/1
    ,bt_delete_card/2
    ,make_payment/3
    ,topup_submit/4
    ,topup_disable/2
    ,kz_set_user_doc/3
    ,kz_set_user_doc/4
    ,kz_set_user_doc/6
    ,kz_toggle_account_doc/2
    ,kz_toggle_account_doc/3
    ,kz_toggle_user_doc/2
    ,kz_toggle_user_doc/3
    ,kz_toggle_device_doc/3
    ,kz_set_acc_doc/3
    ,kz_set_acc_doc/4
    ,trigger_innoui_widget/2
    ,ui_element_state/2
    ,lookup_numbers/3
    ,rs_add_number/3
    ,purchase_numbers/3
    ,deallocate_number/2
    ,deallocate_number/3
    ,service_plan/2
    ,service_plan/3
    ,service_plan/5
    ,service_plans/1
    ,service_plans/2
    ,available_service_plans/1
    ,available_service_plans/2
    ,current_service_plans/1
    ,current_service_plans/2
    ,sync_service_plans/2
    ,reconcile_service_plans/2
    ,add_service_plan/3
    ,remove_service_plan_from_account/3
    ,valid_card_exists/1
    ,is_creditable/1
    ,process_purchase_numbers/3
    ,get_account_timezone/1
    ,get_user_timezone/1
    ,may_be_get_timezone/1
    ,is_service_plan_applied/1
    ,get_account_name/1
    ,get_account_name/2
    ,get_account_realm/1
    ,get_account_realm/2
    ,delete_account/2
    ,delete_user/2
    ,delete_device/2
    ,classify_number/2
    ,kz_list_classifiers/1
    ,add_user/1
    ,add_user/2
    ,add_user/3
    ,add_device/1
    ,add_device/2
    ,add_device/3
    ,add_group/1
    ,kz_list_account_groups/1
    ,kz_list_account_blacklists/1
    ,kz_list_account_callflows/1
    ,kz_list_account_callflows/2
    ,kz_get_account_callflow/2
    ,kz_get_account_callflow/3
    ,delete_group/2
    ,kz_get_group_doc/2
    ,kz_set_group_doc/4
    ,modify_group/1
    ,modify_group/2
    ,kz_list_account_media/1
    ,kz_get_media_doc/2
    ,kz_list_account_menus/1
    ,kz_menu/3
    ,kz_menu/1
    ,kz_list_account_temporal_rules/1
    ,kz_get_temporal_rule/2
    ,upload_media/1
    ,kz_delete_prompt/2
    ,kz_get_account_prompt/2
    ,kz_get_account_prompt_attachment/2
    ,kz_list_account_conferences/1
    ,kz_list_account_c2calls/1
    ,kz_vmbox/1
    ,kz_vmbox/3
    ,vmbox_messages/3
    ,vmbox_message/4
    ,kz_conference/1
    ,kz_conference/3
    ,kz_conference_participant/3
    ,kz_conference_participants/2
    ,dedup_kz_conference_participants/2
    ,kz_c2call/1
    ,kz_c2call/3
    ,kz_c2call_hyperlink/2
    ,start_outbound_conference/1
    ,add_conf_participant/1
    ,do_conference_action/3
    ,do_conference_participant_action/4
    ,maybe_update_conference_participants_headline/3
    ,kz_get_featurecode_by_name/2
    ,toggle_featurecode_voicemail_check/1
    ,toggle_featurecode_voicemail_direct/1
    ,toggle_featurecode_park_and_retrieve/1
    ,toggle_featurecode_park_valet/1
    ,toggle_featurecode_park_retrieve/1
    ,toggle_featurecode_intercom/1
    ,toggle_featurecode_privacy/1
    ,toggle_featurecode_hotdesk_enable/1
    ,toggle_featurecode_hotdesk_disable/1
    ,toggle_featurecode_hotdesk_toggle/1
    ,toggle_featurecode_call_forward_activate/1
    ,toggle_featurecode_call_forward_deactivate/1
    ,toggle_featurecode_call_forward_toggle/1
    ,toggle_featurecode_call_forward_update/1
    ,set_featurecode_dynamic_cid/2
    ,set_featurecode_eavesdrop/3
    ,delete_featurecode/2
    ,toggle_blacklist_member/2
    ,kz_get_account_blacklist/2
    ,set_blacklist_doc/4
    ,kz_delete_blacklist/2
    ,kz_get_name/3
    ,rs_delete_account/2
    ,toggle_all_calls_recording/1
    ,kz_cccp_creds_list/1
    ,add_cccp_doc/2
    ,add_cccp_autodial/5
    ,del_cccp_doc/2
    ,cccp_field_toggler/3
    ,cccp_field/3
    ,cccp_field_set/4
    ,kz_find_account_by_number/2
    ,kz_admin_find_accountname_by_number/2
    ,kz_admin_get_account_by_number/2
    ,kz_get_registrations_by_accountid/2
    ,kz_get_registrations_count_by_accountid/2
    ,kz_get_reseller_registrations/2
    ,kz_get_reseller_registrations_count/2
    ,list_account_trunks/1
    ,list_trunks_realm/2
    ,kz_registration_details_by_username/2
    ,kz_trunk/4
    ,kz_trunk_server/1
    ,kz_trunk_server_details/3
    ,kz_trunk_server_delete/3
    ,kz_trunk_server_numbers/1
    ,sync_trunkstore_realms/2
    ,ts_server_set_field/5
    ,ts_trunk_disable/3
    ,ts_trunk_enable/3
    ,kz_list_webhooks/1
    ,kz_list_account_webhooks/1
    ,kz_webhook_info/2
    ,kz_webhook_delete/2
    ,kz_webhook_toggle/2
    ,kz_flush_registration_by_username/2
    ,kz_flush_registration_by_username/3
    ,kz_webhook/1
    ,filter_custom_fields/2
    ,kz_current_context_reseller_status/1
    ,kz_current_context_reseller_id/1
    ,kz_current_context_superadmin/1
    ,kz_callflows_numbers/1
    ,kz_callflows_numbers/2
    ,kz_spare_numbers/1
    ,kz_spare_numbers/2
    ,kz_callflow_by_number/2
    ,kz_callflow_by_number/3
    ,set_global_carrier_routing/2
    ,set_reseller_based_routing/3
    ,set_account_based_routing/2
    ,kz_list_account_resources/1
    ,kz_resource_info/2
    ,kz_resource_info/3
    ,kz_resource_delete/2
    ,kz_resource_delete/3
    ,toggle_resource/2
    ,toggle_resource/3
    ,resource/1
    ,super_account_id/1
    ,kz_list_account_notifications/1
    ,kz_notification_info/2
    ,kz_notification_info/3
    ,kz_notification_template/3
    ,kz_notification_template/4
    ,kz_save_notification_template/5
    ,kz_delete_notification_template/3
    ,kz_list_account_lists/1
    ,account_list/1
    ,delete_account_list/2
    ,kz_get_account_list/2
    ,kz_list_account_list_entries/2
    ,kz_account_list_add_entry/3
    ,delete_account_list_entry/3
    ,email_sender_name/1
    ,sendmail_test_notification/1
    ,notifications_smtplog/1
    ,notifications_smtplog_by_id/2
    ,kz_notifications/1
    ,kz_notification_toggle/3
    ,rs_kz_customer_update/3
    ,rs_kz_all_customers_update/2
    ,list_system_dialplans/1
    ,list_system_dialplans_names/1
    ,kz_toggle_reseller_status/2
    ,kz_toggle_account_status/2
    ,per_minute_calls/1
    ,credit_transactions/1
    ,debit_transactions/1
    ,kz_account_access_lists/3
    ,kz_device_access_lists/4
    ,kz_limits/4
    ,save_trunks_limits/5
    ,kz_allotments/4
    ,kz_allotments_consumed/4
    ,allotment_element_delete/3
    ,allotment_element_add/3
    ,allotment_element_set_field/5
    ,set_e911_number_service/4
    ,remove_e911_number_service/3
    ,is_trial_account/1
    ,is_trial_account/2
    ,services_status/4
    ,toggle_services_status/2
    ,all_tasks/1
    ,account_tasks/4
    ,account_tasks/5
    ,get_tasks_csv/4
    ,account_task/5
    ,add_new_task/1
    ,add_new_task_file/3
    ,metaflows/4
    ,config/5
    ,set_config_field/5
    ,config_toggle/4
    ,queues/4
    ,queue/5
    ,queue_update/1
    ,queue_agents_roster/1
    ,queue_roster/5
    ,acdc_call_stats/2
    ,agents/4
    ,agent/5
    ,agents_status/5
    ,agents_queue_status/5
    ,forgottenpwd/1
    ,maybe_masked/1
]).

-include_lib("zotonic_core/include/zotonic.hrl").
-include_lib("include/mod_kazoo.hrl").

-define(MK_ACCOUNT, 
    {[{<<"call_restriction">>,{[]}}
      ,{<<"notifications">>,
       {[{<<"voicemail_to_email">>,{[]}}
         ,{<<"fax_to_email">>,{[]}}
         ,{<<"deregister">>,{[]}}]}}
      ,{<<"provision">>,{[]}}
      ,{<<"apps">>,[]}
      ,{<<"language">>, <<"en-en">>}
      ,{<<"timezone">>, <<"UTC">>}
      ,{<<"available_apps">>,[<<"voip">>,<<"pbxs">>]}
      ,{<<"is_trial_account">>, 'true'}
    ]}).

-define(MK_USER, 
    {[{<<"username">>, modkazoo_util:rand_hex_binary(5)},
      {<<"first_name">>, modkazoo_util:rand_hex_binary(5)},
      {<<"last_name">>, modkazoo_util:rand_hex_binary(5)},
      {<<"enabled">>, 'true'},
      {<<"email">>, modkazoo_util:rand_hex_binary(5)},
  %    {<<"contact_phonenumber">>, modkazoo_util:rand_hex_binary(5)},
      {<<"password">>, modkazoo_util:rand_hex_binary(5)},
      {<<"priv_level">>,<<"user">>},
      {<<"vm_to_email_enabled">>,true},
      {<<"fax_to_email_enabled">>,true},
      {<<"verified">>,false},
      {<<"timezone">>,get_account_timezone(Context)},
      {<<"call_forward">>,
       {[{<<"substitute">>,false},
         {<<"enabled">>,false},
         {<<"require_keypress">>,false},
         {<<"keep_caller_id">>,false},
         {<<"direct_calls_only">>,false}]}},
      {<<"record_call">>,false}
     ]}).

-define(MK_DEVICE_SIP, 
   {[{<<"enabled">>,true},
     {<<"media">>,
      {[{<<"peer_to_peer">>,<<"auto">>},
        {<<"audio">>,{[{<<"codecs">>,[<<"PCMA">>,<<"PCMU">>]}]}},
        {<<"video">>,{[{<<"codecs">>,[]}]}},
        {<<"fax">>,{[{<<"option">>,<<"true">>}]}},
        {<<"fax_option">>,true}]}},
     {<<"sip">>,
      {[{<<"method">>,<<"password">>},
        {<<"invite_format">>,<<"username">>},
        {<<"username">>,modkazoo_util:rand_hex_binary(5)},
        {<<"password">>,modkazoo_util:rand_hex_binary(5)}]}},
     {<<"contact_list">>,{[{<<"exclude">>,false}]}},
     {<<"call_forward">>,
      {[{<<"enabled">>,false},
        {<<"require_keypress">>,false},
        {<<"keep_caller_id">>,false}]}},
     {<<"music_on_hold">>,{[]}},
     {<<"device_type">>,<<"softphone">>},
     {<<"provision">>,{[]}},
     {<<"name">>,modkazoo_util:rand_hex_binary(3)},
     {<<"ignore_completed_elsewhere">>,false},
     {<<"suppress_unregister_notifications">>,true}]}).

-define(MK_GROUP, 
{[{<<"data">>,
   {[{<<"music_on_hold">>,{[]}}
     ,{<<"resources">>,{[]}}
   ]}
  }
]}).

-define(EMPTY_TS_SERVER,
{[{<<"DIDs">>,{[]}},
      {<<"options">>,
       {[{<<"enabled">>,true},
         {<<"inbound_format">>,<<"e164">>},
         {<<"international">>,false},
         {<<"caller_id">>,{[]}},
         {<<"e911_info">>,{[]}},
         {<<"failover">>,{[]}},
         {<<"media_handling">>,<<"process">>}]}},
      {<<"permissions">>,{[{<<"users">>,[]}]}},
      {<<"monitor">>,{[{<<"monitor_enabled">>,false}]}},
      {<<"server_type">>,<<"FreePBX">>}
]}).

-define(EMPTY_RESOURCE,
{[{<<"weight_cost">>,<<"50">>},
  {<<"enabled">>,false},
  {<<"gateways">>,
   [{[{<<"prefix">>,<<>>},
      {<<"codecs">>,[<<"PCMA">>,<<"PCMU">>]},
      {<<"media">>,{[{<<"fax_option">>,true}]}},
      {<<"progress_timeout">>,<<"7">>},
      {<<"server">>,<<>>},
      {<<"username">>,<<>>},
      {<<"password">>,<<>>},
      {<<"realm">>,<<>>},
      {<<"format_from_uri">>,false},
      {<<"suffix">>,<<>>},
      {<<"channel_selection">>,<<"ascending">>},
      {<<"custom_sip_headers">>,{[]}},
      {<<"emergency">>,false},
      {<<"enabled">>,true},
      {<<"endpoint_type">>,<<"sip">>},
      {<<"force_port">>,false},
      {<<"invite_format">>,<<"route">>},
      {<<"port">>,5060},
      {<<"skype_rr">>,false}]}]},
  {<<"rules">>,[]},
  {<<"cid_rules">>,[]},
  {<<"caller_id_options">>,{[{<<"type">>,<<"external">>}]}},
  {<<"type">>,<<"local">>},
  {<<"media">>,
   {[{<<"audio">>, {[{<<"codecs">>,[<<"PCMA">>,<<"PCMU">>]}]}},
     {<<"fax_option">>,true}
    ]}},
  {<<"name">>,<<>>},
  {<<"emergency">>,false},
  {<<"grace_period">>,5},
  {<<"flags">>,[<<"fax">>]}
]}).

-define(DEFAULT_RESOURCE_RULES, [<<"^\\+?(\\d*)$">>]).
-define(DEFAULT_RESOURCE_CIDRULES, []).

-define(NOTIFY_PREVIEW,
{[{<<"to">>, {[{<<"type">>, <<"specified">>}
              ,{<<"email_addresses">>,[]}
             ]}
  },
  {<<"from">>, <<"noreply@nowhere.com">>},
  {<<"subject">>, <<"Testing NOTIFICATION">>},
  {<<"html">>, <<>>},
  {<<"plain">>, <<>>},
  {<<"enabled">>, 'true'}
]}).

-define(DEFAULT_ALLOTMENTS,
{[{<<"amount">>, 600},
  {<<"cycle">>, <<"hourly">>},
  {<<"increment">>, 60},
  {<<"minimum">>, 60},
  {<<"no_consume_time">>, 0}
]}).

kz_admin_creds(Context) ->
    Crossbar_URL = m_vars:get_value('mod_kazoo', 'kazoo_crossbar_url', Context),
    URL = z_convert:to_list(<<Crossbar_URL/binary, ?V2/binary, ?API_AUTH/binary>>),
    API_Key = m_vars:get_value('mod_kazoo', 'kazoo_super_duper_api_key', Context),
    DataBag = {[{<<"data">>, {[{<<"api_key">>, API_Key}]}}]},
    Payload = jiffy:encode(DataBag),
    {'ok', _, _, Body} = ibrowse:send_req(URL, req_headers('undefined'), 'put', Payload, [{'inactivity_timeout', 15000}]),
    JsonBody = jiffy:decode(Body),
    Account_Id = modkazoo_util:get_value([<<"data">>, <<"account_id">>], JsonBody),
    Auth_Token = modkazoo_util:get_value(<<"auth_token">>, JsonBody),
    {'ok', {'account_id', Account_Id}, {'auth_token', Auth_Token}, {'crossbar', Crossbar_URL}}. 

kz_user_creds(Login, Password, AccountName, Context) ->
    Creds = io_lib:format("~s:~s", [Login, Password]),
    Md5Hash = iolist_to_binary([io_lib:format("~2.16.0b", [C]) || <<C>> <= erlang:md5(Creds)]),
    kz_user_creds(Md5Hash, AccountName, Context).

kz_user_creds(Md5Hash, AccountName, Context) ->
    Crossbar_URL = m_vars:get_value('mod_kazoo', 'kazoo_crossbar_url', Context),
    URL = z_convert:to_list(<<Crossbar_URL/binary, ?V1/binary, ?USER_AUTH/binary>>),
    DataBag = {[{<<"data">>, {[{<<"credentials">>, Md5Hash}, {<<"account_name">>, AccountName}]}}]},
    kz_creds(URL, DataBag, Context).

kz_api_key_creds(API_Key, Context) ->
    Crossbar_URL = m_vars:get_value('mod_kazoo', 'kazoo_crossbar_url', Context),
    URL = z_convert:to_list(<<Crossbar_URL/binary, ?V1/binary, ?API_AUTH/binary>>),
    DataBag = {[{<<"data">>, {[{<<"api_key">>, ?TO_BIN(API_Key)}]}}]},
    kz_creds(URL, DataBag, Context).

kz_creds(URL, DataBag, Context) ->
    try
        Payload = jiffy:encode(DataBag),
        case ibrowse:send_req(URL, req_headers('undefined'), 'put', Payload, [{'inactivity_timeout', 15000}]) of
            {'ok', [50,_,_], _, Body} ->
                JsonBody = jiffy:decode(Body),
                Owner_Id = modkazoo_util:get_value([<<"data">>, <<"owner_id">>], JsonBody),
                Account_Id = modkazoo_util:get_value([<<"data">>, <<"account_id">>], JsonBody),
                Account_Name = modkazoo_util:get_value([<<"data">>, <<"account_name">>], JsonBody),
                Auth_Token = modkazoo_util:get_value(<<"auth_token">>, JsonBody),
                Crossbar_URL = m_vars:get_value('mod_kazoo', 'kazoo_crossbar_url', Context),
                {'ok' ,{'owner_id', Owner_Id}
                      ,{'account_id', Account_Id}
                      ,{'auth_token', Auth_Token}
                      ,{'crossbar', Crossbar_URL}
                      ,{'account_name', Account_Name}
                };
            {'ok', Code, _, Body} ->
                Data = modkazoo_util:get_value(<<"data">>, jiffy:decode(Body)),
                {'badauth', Code, Data}
        end
    catch
        _E ->
            lager:info("kz_kreds Auth exception: ~p",[_E]),
            <<"Auth exception">>
    end.

kz_auth_token_creds(AuthToken, Context) ->
    try
        case token_auth(AuthToken, Context) of 
            {'ok', [50,_,_], _, Body} ->
                JsonBody = jiffy:decode(Body),
                Owner_Id = modkazoo_util:get_value([<<"data">>, <<"owner_id">>], JsonBody),
                Account_Id = modkazoo_util:get_value([<<"data">>, <<"account_id">>], JsonBody),
                Account_Name = modkazoo_util:get_value([<<"data">>, <<"account_name">>], JsonBody),
                Auth_Token = modkazoo_util:get_value(<<"auth_token">>, JsonBody),
                {'ok' ,{'owner_id', Owner_Id}
                      ,{'account_id', Account_Id}
                      ,{'auth_token', Auth_Token}
                      ,{'crossbar', m_vars:get_value('mod_kazoo', 'kazoo_crossbar_url', Context)}
                      ,{'account_name', Account_Name}
                };
            {'ok', Code, _, Body} ->
                Data = modkazoo_util:get_value(<<"data">>, jiffy:decode(Body)),
                {'badauth', Code, Data}
        end
    catch
        _E ->
            lager:info("kz_kreds Auth exception: ~p",[_E]),
            <<"Auth exception">>
    end.

kz_get_acc_doc(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_get_acc_doc_by_account_id(AccountId, Context).

kz_get_acc_doc_by_account_id('undefined', Context) ->
    case z_context:get_session('kazoo_account_id', Context) of
        'undefined' -> <<>>;
        AccountId ->
            kz_get_acc_doc_by_account_id(AccountId, Context)
    end;
kz_get_acc_doc_by_account_id(AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_get_acc_doc_by_account_id_and_authtoken(AccountId, AuthToken, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary>>,
    crossbar_account_authtoken_request('get', API_String, [], AuthToken, Context, <<>>).

kz_adminget_acc_doc_by_account_id('undefined', _Context) ->
    <<>>;
kz_adminget_acc_doc_by_account_id(AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary>>,
    {'ok', _, _, Body} = crossbar_admin_request('get', API_String, [], Context),
    modkazoo_util:get_value(<<"data">>, jiffy:decode(Body)).

kz_set_acc_doc(K, V, Context) ->
    kz_set_acc_doc(K, V, z_context:get_session('kazoo_account_id', Context), Context).

kz_set_acc_doc([<<"dial_plan">>,<<"system">>], V, AccountId, Context) when is_binary(V) ->
    kz_set_acc_doc([<<"dial_plan">>,<<"system">>], [?TO_BIN(V)], AccountId, Context);
kz_set_acc_doc(K, V, AccountId, Context) ->
    CurrDoc = kz_get_acc_doc_by_account_id(AccountId, Context),
    NewDoc = case V of
        'undefined' -> modkazoo_util:delete_key(K, CurrDoc);
        <<>> -> modkazoo_util:delete_key(K, CurrDoc);
        _ -> modkazoo_util:set_value(K, V, CurrDoc)
    end,
    case AccountId =:= 'undefined' of
        'false' -> 
            API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary>>,
            crossbar_account_request('post', API_String,  {[{<<"data">>, NewDoc}]}, Context);
        'true' -> []
    end.

kz_get_user_doc(Context) ->
    OwnerId = z_context:get_session('kazoo_owner_id', Context),
    kz_get_user_doc(OwnerId, Context).

kz_get_user_doc(OwnerId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_get_user_doc(OwnerId, AccountId, Context).

kz_get_user_doc(OwnerId, AccountId, Context) ->
    AuthToken = z_context:get_session(kazoo_auth_token, Context),
    kz_get_user_doc(OwnerId, AccountId, AuthToken, Context).

kz_get_user_doc(OwnerId, AccountId, AuthToken, Context) ->
    case AccountId =:= 'undefined' orelse OwnerId =:= 'undefined' orelse OwnerId =:= 'null' of
        'false' -> 
            API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?USERS/binary, "/", OwnerId/binary>>,
            crossbar_account_authtoken_request('get', API_String, [], AuthToken, Context, <<>>);
        'true' -> []
    end.

kz_set_user_doc(K, V, Context) ->
    OwnerId = z_context:get_session('kazoo_owner_id', Context),
    kz_set_user_doc(K, V, OwnerId, Context).

kz_set_user_doc([<<"dial_plan">>,<<"system">>], V, OwnerId, Context) when is_binary(V) ->
    kz_set_user_doc([<<"dial_plan">>,<<"system">>], [?TO_BIN(V)], OwnerId, Context);
kz_set_user_doc(K, V, OwnerId, Context) ->
    AuthToken = z_context:get_session(kazoo_auth_token, Context),
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_set_user_doc(K, V, OwnerId, AccountId, AuthToken, Context).

kz_set_user_doc(K, V, OwnerId, AccountId, AuthToken, Context) ->
    CurrDoc = kz_get_user_doc(OwnerId, AccountId, AuthToken, Context),
    NewDoc = modkazoo_util:set_value(K, V, CurrDoc),
    case AccountId =:= 'undefined' orelse OwnerId =:= 'undefined' of
        'false' -> 
            API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?USERS/binary, "/", OwnerId/binary>>,
            crossbar_account_authtoken_request('post', API_String, {[{<<"data">>, NewDoc}]}, AuthToken, Context, <<>>);
        'true' -> []
    end.

kz_toggle_account_doc(K, Context) ->
    AccountId = z_context:get_session(kazoo_account_id, Context),
    kz_toggle_account_doc(K, AccountId, Context).

kz_toggle_account_doc(K, 'undefined', Context) ->
    AccountId = z_context:get_session(kazoo_account_id, Context),
    kz_toggle_account_doc(K, AccountId, Context);
kz_toggle_account_doc(K, AccountId, Context) ->
    case kz_account_doc_field(K, AccountId, Context) of
        'true' -> kz_set_acc_doc(K, 'false', AccountId, Context);
        _ -> kz_set_acc_doc(K, 'true', AccountId, Context)
    end.

kz_toggle_user_doc(K, Context) ->
    OwnerId = z_context:get_session('kazoo_owner_id', Context),
    kz_toggle_user_doc(K, OwnerId, Context).

kz_toggle_user_doc(K, OwnerId, Context) ->
    case kz_user_doc_field(K, OwnerId, Context) of
        'true' -> kz_set_user_doc(K, 'false', OwnerId, Context);
        _ -> kz_set_user_doc(K, 'true', OwnerId, Context)
    end.

kz_toggle_device_doc(K, DeviceId, Context) ->
    case kz_device_doc_field(K, DeviceId, Context) of
        'true' -> kz_set_device_doc(K, 'false', DeviceId, Context);
        _ -> kz_set_device_doc(K, 'true', DeviceId, Context)
    end.

kz_get_device_doc(DeviceId, Context) ->
    Account_Id = z_context:get_session('kazoo_account_id', Context),
    case Account_Id =:= 'undefined' orelse DeviceId =:= 'undefoned' of
        'false' -> 
            API_String = <<?V1/binary, ?ACCOUNTS/binary, Account_Id/binary, ?DEVICES/binary, "/", DeviceId/binary>>,
            crossbar_account_request('get', API_String, [], Context);
        'true' -> []
    end.

kz_set_device_doc([<<"dial_plan">>,<<"system">>], V, DeviceId, Context) when is_binary(V) ->
    kz_set_device_doc([<<"dial_plan">>,<<"system">>], [?TO_BIN(V)], DeviceId, Context);
kz_set_device_doc([<<"media">>,<<"encryption">>,<<"methods">>], <<"No encryption">>, DeviceId, Context) ->
    kz_set_device_doc([<<"media">>,<<"encryption">>,<<"methods">>], [], DeviceId, Context);
kz_set_device_doc([<<"media">>,<<"encryption">>,<<"methods">>], <<V/binary>>, DeviceId, Context) ->
    kz_set_device_doc([<<"media">>,<<"encryption">>,<<"methods">>], binary:split(V, <<",">>), DeviceId, Context);
kz_set_device_doc(K, V, DeviceId, Context) ->
    CurrDoc = kz_get_device_doc(DeviceId, Context),
    NewDoc = case V of
        'undefined' -> modkazoo_util:delete_key(K, CurrDoc);
         _ -> modkazoo_util:set_value(K, V, CurrDoc)
    end,
    Account_Id = z_context:get_session('kazoo_account_id', Context),
    case Account_Id =:= 'undefined' orelse DeviceId =:= 'undefined' of
        'false' -> 
            API_String = <<?V1/binary, ?ACCOUNTS/binary, Account_Id/binary, ?DEVICES/binary, "/", DeviceId/binary>>,
            crossbar_account_request('post', API_String,  {[{<<"data">>, device_doc_cure(NewDoc)}]}, Context);
        'true' -> []
    end.

device_doc_cure(Doc) ->
    case modkazoo_util:get_value([<<"sip">>,<<"expire_seconds">>], Doc, undefined) of
        'undeined' -> Doc;
         ExpSec when is_integer(ExpSec) -> Doc;
         ExpSec -> modkazoo_util:set_value([<<"sip">>,<<"expire_seconds">>], ?TO_INT(ExpSec), Doc)
    end.

crossbar_noauth_request_raw(Verb, API_String, DataBag, Context) ->
    Crossbar_URL = m_vars:get_value('mod_kazoo', 'kazoo_crossbar_url', Context),
    URL = z_convert:to_list(<<Crossbar_URL/binary, API_String/binary>>),
    Payload = case DataBag of
                  [] -> [];
                   _ -> jiffy:encode(DataBag)
              end,
    ibrowse:send_req(URL, req_headers('undefined'), Verb, Payload, [{'inactivity_timeout', 15000}]).

crossbar_noauth_request(Verb, API_String, DataBag, Context) ->
    case crossbar_noauth_request_raw(Verb, API_String, DataBag, Context) of
        {'ok', ReturnCode, _, Body} ->
            case ReturnCode of
                [50,_,_] ->    %  50 = "2"
                    modkazoo_util:get_value(<<"data">>, jiffy:decode(Body));
                _ -> <<"">>
            end;
        E -> 
            lager:info("crossbar_noauth_request Error: ~p", [E]),
            <<"">>
    end.

req_headers(Token) ->
    req_headers("application/json", Token).

req_headers(ContentType, Token) ->
    modkazoo_util:filter_undefined(
        [{"Content-Type", ContentType}
         ,{"X-Auth-Token", z_convert:to_list(Token)}
         ,{"User-Agent", z_convert:to_list(erlang:node())}
        ]).

req_headers(ContentType, Accept, Token) ->
    modkazoo_util:filter_undefined(
        [{"Content-Type", ContentType}
         ,{"X-Auth-Token", z_convert:to_list(Token)}
         ,{"User-Agent", z_convert:to_list(erlang:node())}
         ,{"Accept", Accept}
        ]).

crossbar_account_send_request(Verb, API_String, DataBag, Context) ->
    crossbar_account_send_request(Verb, API_String, "application/json", DataBag, Context).

crossbar_account_send_request(Verb, API_String, ContentType, DataBag, Context) ->
    AuthToken = z_context:get_session(kazoo_auth_token, Context),
    crossbar_account_send_request(Verb, API_String, ContentType, DataBag, AuthToken, Context).

crossbar_account_send_request(Verb, API_String, ContentType, DataBag, AuthToken, Context) ->
    Crossbar_URL = m_vars:get_value('mod_kazoo', 'kazoo_crossbar_url', Context),
    URL = z_convert:to_list(<<Crossbar_URL/binary, API_String/binary>>),
    Payload = case DataBag of
                  [] -> [];
                  _ ->
                      case ContentType of
                          "application/json" -> jiffy:encode(DataBag);
                          _ -> DataBag
                      end
              end,
 %   lager:info("crossbar_account_send_request URL: ~p", [URL]),
 %   lager:info("crossbar_account_send_request Headers: ~p", [req_headers(ContentType, AuthToken)]),
 %   lager:info("crossbar_account_send_request Verb: ~p", [Verb]),
 %   lager:info("crossbar_account_send_request Payload: ~p", [Payload]),
    ibrowse:send_req(URL, req_headers(ContentType, AuthToken), Verb, Payload, [{'inactivity_timeout', 15000}]).

crossbar_account_send_raw_request_body(Verb, API_String, Headers, Data, Context) ->
    AuthToken = z_context:get_session(kazoo_auth_token, Context),
    crossbar_account_send_raw_request_body(AuthToken, Verb, API_String, Headers, Data, Context).

crossbar_account_send_raw_request_body(AuthToken, Verb, API_String, Headers, Data, Context) ->
    crossbar_account_send_raw_request_body(AuthToken, Verb, API_String, Headers, Data, Context, <<>>).

crossbar_account_send_raw_request_body(AuthToken, Verb, API_String, Headers, Data, Context, Default) ->
    case crossbar_account_send_raw_request(AuthToken, Verb, API_String, Headers, Data, Context) of
        {'ok', [50,_,_], _, Body} ->  Body; %  50 = "2"
        E -> 
            lager:info("crossbar_account_send_raw_request_body Error: ~p", [E]),
            lager:info("crossbar_account_send_raw_request_body Error Verb: ~p", [Verb]),
            lager:info("crossbar_account_send_raw_request_body Error API_String: ~p", [API_String]),
            lager:info("crossbar_account_send_raw_request_body Error Data: ~p", [Data]),
            Default
    end.
        
crossbar_account_send_raw_request(Verb, API_String, Headers, Data, Context) ->
    AuthToken = z_context:get_session(kazoo_auth_token, Context),
    crossbar_account_send_raw_request(AuthToken, Verb, API_String, Headers, Data, Context).

crossbar_account_send_raw_request(AuthToken, Verb, API_String, Headers, Data, Context) ->
    Crossbar_URL = m_vars:get_value('mod_kazoo', 'kazoo_crossbar_url', Context),
    URL = z_convert:to_list(<<Crossbar_URL/binary, API_String/binary>>),
    ibrowse:send_req(URL, req_headers(AuthToken)++Headers, Verb, Data, [{'inactivity_timeout', 15000}]).

crossbar_account_request(Verb, API_String, DataBag, Context) ->
    crossbar_account_request(Verb, API_String, DataBag, Context, <<>>).

crossbar_account_request(Verb, API_String, DataBag, Context, Default) ->
    case crossbar_account_send_request(Verb, API_String, DataBag, Context) of
        {'ok', ReturnCode, Headers, Body} ->
            case ReturnCode of
                [50,_,_] ->
                    try
                        modkazoo_util:get_value(<<"data">>, jiffy:decode(Body))
                    catch
                        _ -> Body
                    end;
                "402" -> 
                    error_return(ReturnCode, Body, Default);
                _ -> 
                    case ReturnCode of
                        "401" -> z_notifier:notify({kazoo_notify, <<"no_auth">>,'undefined','undefined','undefined'}, Context);
                        "429" ->
                            mod_signal:emit({emit_growl_signal
                                            ,?SIGNAL_FILTER(Context) ++
                                             [{'text',?__("Too many requests, please wait and refresh page.", Context)}
                                             ,{'type', 'notice'}
                                             ]
                                            }
                                           ,Context);
                        _ -> 'ok'
                    end,
                    lager:info("crossbar_account_request API String: ~p", [API_String]),
                    lager:info("crossbar_account_request DataBag: ~p", [DataBag]),
                    lager:info("crossbar_account_request Verb: ~p", [Verb]),
                    lager:info("crossbar_account_request RC: ~p", [ReturnCode]),
                    lager:info("crossbar_account_request Headers: ~p", [Headers]),
                    lager:info("crossbar_account_request Body: ~p", [Body]),
                    error_return(ReturnCode, Body, Default)
            end;
        E -> 
            lager:info("crossbar_account_request Error Verb: ~p", [Verb]),
            lager:info("crossbar_account_request Error API_String: ~p", [API_String]),
            lager:info("crossbar_account_request Error DataBag: ~p", [DataBag]),
            lager:info("crossbar_account_request Error: ~p", [E]),
            Default
    end.

crossbar_account_authtoken_request(Verb, API_String, DataBag, AuthToken, Context, Default) ->
    case crossbar_account_send_request(Verb, API_String, "application/json", DataBag, AuthToken, Context) of
        {'ok', ReturnCode, _, Body} ->
            case ReturnCode of
                [50,_,_] ->
                    modkazoo_util:get_value(<<"data">>, jiffy:decode(Body));
                _ -> 
                    case ReturnCode of
                        "401" -> z_notifier:notify({kazoo_notify, <<"no_auth">>,'undefined','undefined','undefined'}, Context);
                        "429" ->
                            mod_signal:emit({emit_growl_signal
                                            ,?SIGNAL_FILTER(Context) ++
                                             [{'text',?__("Too many requests, please wait and refresh page.", Context)}
                                             ,{'type', 'notice'}
                                             ]
                                            }
                                           ,Context);
                        _ -> 'ok'
                    end,
                    error_return(ReturnCode, Body, Default)
            end;
        _E -> 
            Default
    end.

error_return(ReturnCode, Body, Default) ->
    case Default of
        'return_error' -> {'error', ReturnCode, Body};
        _ -> Default
    end.

crossbar_account_attachment_request(Verb, API_String, DataBag, Context) ->
    case crossbar_account_send_request(Verb, API_String, DataBag, Context) of
        {'ok', ReturnCode, _, Body} ->
            case ReturnCode of
                [50,_,_] -> Body;
                _ -> <<"">>
            end;
        E -> 
            lager:info("crossbar_account_request Error: ~p", [E]),
            <<"">>
    end.

crossbar_admin_request(Verb, API_String, DataBag, Context) ->
    crossbar_admin_request(Verb, API_String, DataBag, 10000, Context).
crossbar_admin_request(Verb, API_String, DataBag, Timeout, Context) ->
    {'ok', {'account_id', _}, {'auth_token', AuthToken}, {'crossbar', CrossbarURL}} = kz_admin_creds(Context),
    URL = z_convert:to_list(<<CrossbarURL/binary, API_String/binary>>),
    Payload = case DataBag of
                  [] -> [];
                   _ -> jiffy:encode(DataBag)
              end,
    ibrowse:send_req(URL, req_headers("application/json", "application/json", AuthToken), Verb, Payload, [], Timeout).

kz_account_doc_field(Field, Context) ->
    kz_account_doc_field(Field, z_context:get_session(kazoo_account_id, Context), Context).

kz_account_doc_field(Field, 'undefined', Context) ->
    kz_account_doc_field(Field, z_context:get_session(kazoo_account_id, Context), Context);
kz_account_doc_field(Field, AccountId, Context) when is_binary(Field) ->
    modkazoo_util:get_value(Field, kz_get_acc_doc_by_account_id(AccountId, Context));
kz_account_doc_field(Field, AccountId, Context) when is_list(hd(Field)) ->
    modkazoo_util:get_value([?TO_BIN(X) || X <- Field], kz_get_acc_doc_by_account_id(AccountId, Context));
kz_account_doc_field(Field, AccountId, Context) when is_binary(hd(Field)) ->
    modkazoo_util:get_value(Field, kz_get_acc_doc_by_account_id(AccountId, Context));
kz_account_doc_field(Field, AccountId, Context) when is_list(Field) ->
    modkazoo_util:get_value(?TO_BIN(Field), kz_get_acc_doc_by_account_id(AccountId, Context)).

kz_user_doc_field(Field, Context) ->
    OwnerId = z_context:get_session('kazoo_owner_id', Context),
    kz_user_doc_field(Field, OwnerId, Context).

kz_user_doc_field(Field, OwnerId, Context) when is_binary(Field) ->
    modkazoo_util:get_value(Field, kz_get_user_doc(OwnerId, Context));
kz_user_doc_field(Field, OwnerId, Context) when is_list(hd(Field)) ->
    modkazoo_util:get_value([?TO_BIN(X) || X <- Field], kz_get_user_doc(OwnerId, Context));
kz_user_doc_field(Field, OwnerId, Context) when is_binary(hd(Field)) ->
    modkazoo_util:get_value(Field, kz_get_user_doc(OwnerId, Context));
kz_user_doc_field(Field, OwnerId, Context) when is_list(Field) ->
    modkazoo_util:get_value(?TO_BIN(Field), kz_get_user_doc(OwnerId, Context)).

kz_device_doc_field(Field, DeviceId, Context) when is_binary(Field) ->
    modkazoo_util:get_value(Field, kz_get_device_doc(DeviceId, Context));
kz_device_doc_field(Field, DeviceId, Context) when is_list(hd(Field)) ->
    modkazoo_util:get_value([?TO_BIN(X) || X <- Field], kz_get_device_doc(DeviceId, Context));
kz_device_doc_field(Field, DeviceId, Context) when is_binary(hd(Field)) ->
    modkazoo_util:get_value(Field, kz_get_device_doc(DeviceId, Context));
kz_device_doc_field(Field, DeviceId, Context) when is_list(Field) ->
    modkazoo_util:get_value(?TO_BIN(Field), kz_get_device_doc(DeviceId, Context)).

kz_media_doc_field(Field, MediaId, Context) when is_binary(Field) ->
    modkazoo_util:get_value(Field, kz_get_media_doc(MediaId, Context));
kz_media_doc_field(Field, MediaId, Context) when is_list(hd(Field)) ->
    modkazoo_util:get_value([?TO_BIN(X) || X <- Field], kz_get_media_doc(MediaId, Context));
kz_media_doc_field(Field, MediaId, Context) when is_binary(hd(Field)) ->
    modkazoo_util:get_value(Field, kz_get_media_doc(MediaId, Context));
kz_media_doc_field(Field, MediaId, Context) when is_list(Field) ->
    modkazoo_util:get_value(?TO_BIN(Field), kz_get_media_doc(MediaId, Context)).

create_kazoo_account(Context) ->
    ClientIP = cowmachine_req:peer(z_context:get_reqdata(Context)),
    Firstname = z_context:get_q(firstname, Context),
    Surname = z_context:get_q(surname, Context),
    Username = modkazoo_util:to_lower_binary(z_context:get_q("signup_username", Context)),
    Companyname = z_context:get_q(companyname, Context),
    Email = z_context:get_q(email, Context),
    Phonenumber = z_context:get_q(phonenumber, Context),
    DefaultRealm = m_vars:get_value('mod_kazoo', 'kazoo_default_realm', Context),
    Accountname = case valid_account_name(Companyname) of
      'false' -> ?TO_BIN(modkazoo_util2:translit(z_convert:to_list(<<Firstname/binary, <<" ">>/binary, Surname/binary>>)));
      'true' -> ?TO_BIN(modkazoo_util2:translit(z_convert:to_list(Companyname)))
    end,
    ResellerId = case z_context:get_session('kazoo_account_id', Context) of
        'undefined' -> 
            case z_context:get_q("kazoo_reseller_id", Context) of
                'undefined' ->
                    lager:info("No reseller_is configured for signup..."),
                    <<>>;
                 AdminAccountId ->
                     ?TO_BIN(AdminAccountId)
            end;
        AccountId ->
          AccountId
    end,

    Language = 
        case m_vars:get_value('mod_kazoo', 'default_kazoo_language', Context) of
            'undefined' -> <<"en-en">>;
             Lang -> ?TO_BIN(Lang)
        end,
    Timezone = 
        case m_vars:get_value('mod_kazoo', 'default_kazoo_timezone', Context) of
            'undefined' -> <<"Europe/London">>;
            TZ -> ?TO_BIN(TZ)
        end,
    Realm = <<(modkazoo_util:normalize_account_name(Accountname))/binary, DefaultRealm/binary>>,

    Props = modkazoo_util:filter_empty([
         {[<<"name">>], Accountname}
        ,{[<<"username">>], Username}
        ,{[<<"contact">>,<<"billing">>,<<"email">>], Email}
        ,{[<<"contact">>,<<"billing">>,<<"number">>], Phonenumber}
        ,{[<<"contact">>,<<"signup">>,<<"email">>], Email}
        ,{[<<"contact">>,<<"signup">>,<<"number">>], Phonenumber}
        ,{[<<"contact">>,<<"signup">>,<<"first_name">>], Firstname}
        ,{[<<"contact">>,<<"signup">>,<<"last_name">>], Surname}
        ,{[<<"contact">>,<<"signup">>,<<"client_ip">>], ClientIP}
        ,{[<<"language">>], Language}
        ,{[<<"timezone">>], Timezone}
        ,{[<<"companyname">>], Companyname}
        ,{[<<"realm">>], Realm}
        ]),

    AccountJObj = modkazoo_util:set_values(Props, ?MK_ACCOUNT),

    case z_context:get_session(kazoo_auth_token, Context) of
        'undefined' ->
            API_String = <<?V2/binary, "/onbill_signup/", ResellerId/binary>>,
            {'ok', _, _, Body} = crossbar_noauth_request_raw('put', API_String, ?MK_DATABAG(AccountJObj), Context);
        _ ->
            API_String = <<?V2/binary, ?ACCOUNTS/binary, ResellerId/binary, "/onbill_signup/", ResellerId/binary>>,
            {'ok', _, _, Body} = crossbar_account_send_raw_request('put', API_String, [], jiffy:encode(?MK_DATABAG(AccountJObj)), Context)
    end,
    CreatedUserAccountId =  case modkazoo_util:get_value([<<"data">>,<<"id">>], jiffy:decode(Body)) of
                                'undefined' -> throw({'error', 'account_name_already_in_use'});
                                 AccId -> AccId
                            end,
    {'new_account_id', CreatedUserAccountId}.
 
valid_account_name(Name) when size(Name) < 3 -> 'false';
valid_account_name(_) -> 'true'.

kz_account_create_callflow(Callflow, Context) ->
    DataBag = ?MK_DATABAG(Callflow),
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary>>,
    crossbar_account_request('put', API_String, DataBag, Context).

update_kazoo_user(Context) ->
    CallForwardEnabled = modkazoo_util:on_to_true(z_context:get_q("call_forward_enabled", Context)),
    ForwardTo = z_context:get_q('ring-number-txt', Context),
    RingVoip = not modkazoo_util:on_to_true(z_context:get_q("ring-device-checkbox", Context)),
    KeepCallerID = modkazoo_util:on_to_true(z_context:get_q("call_forward_keep_caller_id", Context)),
    VmToEmail = modkazoo_util:on_to_true(z_context:get_q("vm-to-email-checkbox", Context)),
    Timezone = z_context:get_q(user_timezone, Context),
    z_context:set_session('user_timezone', Timezone, Context),
    CurrentDoc = kz_get_user_doc(Context),
    Routines = [fun(J) -> modkazoo_util:set_value([<<"call_forward">>, <<"enabled">>], CallForwardEnabled, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"call_forward">>, <<"number">>], ForwardTo, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"call_forward">>, <<"substitute">>], RingVoip, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"call_forward">>, <<"keep_caller_id">>], KeepCallerID, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"vm_to_email_enabled">>], VmToEmail, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"timezone">>], Timezone, J) end
               ],
    NewDoc = lists:foldl(fun(F, J) -> F(J) end, CurrentDoc, Routines),
    Owner_Id = z_context:get_session('kazoo_owner_id', Context),
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?USERS/binary, "/", Owner_Id/binary>>,
    crossbar_account_request('post', API_String, {[{<<"data">>, NewDoc}]}, Context),
    Context.

add_user(Context) ->
    AcceptCharges = modkazoo_util:get_q_boolean("accept_charges", Context),
    add_user(AcceptCharges, Context).

add_user(AcceptCharges, Context) ->
    Email = z_context:get_q('email',Context),
    UserPassword = modkazoo_util:rand_hex_binary(10),
    Props = modkazoo_util:filter_empty([
         {[<<"username">>], Email}
        ,{[<<"first_name">>], z_context:get_q('firstname', Context)}
        ,{[<<"last_name">>], z_context:get_q('surname', Context)}
        ,{[<<"email">>], Email}
        ,{[<<"password">>], UserPassword}
        ,{[<<"priv_level">>], <<"user">>}
        ,{[<<"timezone">>], get_account_timezone(Context)}
        ]),
    UserJObj = modkazoo_util:set_values(Props, ?MK_USER),
    add_user(?MK_DATABAG(UserJObj), AcceptCharges, Context).

add_user(DataBag, AcceptCharges, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    API_String =
        case is_trial_account(Context) of
            {'true', _} ->
                <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?USERS/binary>>;
            'false' ->
                <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?USERS/binary>>
        end,
    AcceptChargesCataBag = modkazoo_util:set_value(<<"accept_charges">>, AcceptCharges, DataBag),
    case crossbar_account_request('put', API_String, AcceptChargesCataBag, Context, 'return_error') of
        {'error', "402", Body} ->
            Data = modkazoo_util:get_value(<<"data">>, jiffy:decode(Body)),
            case modkazoo_util:get_value([<<"users">>,<<"user">>], Data) of
                'undefined' ->
                    Message = modkazoo_util:get_value(<<"message">>, Data),
                    mod_signal:emit({emit_growl_signal
                                    ,?SIGNAL_FILTER(Context) ++
                                     [{'text',?__(?TO_LST(Message), Context)}
                                     ,{'type', 'error'}
                                     ]}
                                    ,Context),
                    z_render:dialog_close(Context);
                LimitsItem ->
                    AccountId = z_context:get_session('kazoo_account_id', Context),
                    Expences = modkazoo_util:get_value(<<"activation_charge">>, LimitsItem)
                               + modkazoo_util:get_value(<<"rate">>, LimitsItem),
                    CurrentAccountCredit = modkazoo_util:get_value(<<"amount">>, current_account_credit(AccountId, Context)),
                    PVT_Limits = onbill_util:onbill_pvt_limits('get', AccountId, [], Context),
                    MaybePostpayCredit =
                        case modkazoo_util:get_value(<<"allow_postpay">>, PVT_Limits, 'false') of
                            'true' ->
                                modkazoo_util:get_value(<<"max_postpay_amount">>, PVT_Limits, 0);
                            'false' -> 0
                        end,
                    case Expences > (CurrentAccountCredit + MaybePostpayCredit) of
                        'true' ->
                            mod_signal:emit({emit_growl_signal
                                            ,?SIGNAL_FILTER(Context) ++
                                             [{'text',?__("Not enough funds.", Context)}
                                             ,{'type', 'error'}
                                             ]}
                                            ,Context),
                            z_render:dialog_close(Context);
                        'false' ->
                            z_render:dialog(?__("Charges Confirmation",Context)
                                           ,"_accept_new_element_charges.tpl"
                                           ,[{item, LimitsItem}
                                            ,{databag, DataBag}
                                            ,{element_type, <<"user">>}
                                            ,{account_id, AccountId}
                                            ,{width, "auto"}
                                            ]
                                           ,Context)
                    end
            end;
        {'error', _ReturnCode, Body} ->
            Message = modkazoo_util:get_first_defined([[<<"data">>,<<"username">>,<<"unique">>,<<"message">>]
                                                      ,[<<"message">>]
                                                      ]
                                                     ,jiffy:decode(Body)
                                                     ,<<"Something went wrong">>),
            mod_signal:emit({emit_growl_signal
                            ,?SIGNAL_FILTER(Context) ++
                             [{'text',?__(?TO_LST(Message), Context)}
                             ,{'type', 'error'}
                             ]}
                            ,Context),
            z_render:dialog_close(Context);
        _E ->
            mod_signal:emit({update_admin_portal_users_list_tpl, ?SIGNAL_FILTER(Context)}, Context),
            modkazoo_util:delay_signal(3, 'update_fin_info_signal', ?SIGNAL_FILTER(Context), Context),
            z_render:dialog_close(Context)
    end.

email_sender_name(Context) ->
    case z_context:get_session('kazoo_account_id', Context) of
        'undefined' -> m_vars:get_value('mod_kazoo', 'sender_name', Context);
        ResellerId ->
            case kz_account_doc_field(<<"sender_name">>, ResellerId, Context) of
                'undefined' -> m_vars:get_value('mod_kazoo', 'sender_name', Context);
                SenderName -> lager:info("SenderName: ~p", [SenderName]), SenderName
            end
    end.

kz_list_account_users(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_list_account_users(AccountId, Context).

kz_list_account_users(AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?USERS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_admin_list_account_users(AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?USERS/binary>>,
    {'ok', _, _, Body} = crossbar_admin_request('get', API_String, [], Context),
    modkazoo_util:get_value([<<"data">>], jiffy:decode(Body)).

kz_list_account_devices(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?DEVICES/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_user_devices(Context) ->
    Owner_Id = z_context:get_session('kazoo_owner_id', Context),
    kz_list_user_devices(Owner_Id, Context).

kz_list_user_devices(Owner_Id, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?DEVICES/binary, "?", ?FILTER_OWNER/binary, Owner_Id/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_account_vmboxes(Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?VMBOXES/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_user_vmboxes(Context) ->
    Owner_Id = z_context:get_session('kazoo_owner_id', Context),
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?VMBOXES/binary, "?", ?FILTER_OWNER/binary, Owner_Id/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_user_vmbox_details(VMBoxId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?VMBOXES/binary, "/", VMBoxId/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_user_vmbox_messages(VMBoxId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?VMBOXES/binary, "/", VMBoxId/binary, ?MESSAGES/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_purge_voicemails(VMBoxId, DaysTo, Context) ->
    Candidates = vmbox_messages('get', VMBoxId, Context),
    FilterTS = calendar:datetime_to_gregorian_seconds(calendar:universal_time()) - (z_convert:to_integer(DaysTo) * 86400),
    MediaIds = [modkazoo_util:get_value(<<"media_id">>, X)
                || X <- Candidates
                   ,(FilterTS > (z_convert:to_integer(modkazoo_util:get_value(<<"timestamp">>, X))))
                    andalso (modkazoo_util:get_value(<<"folder">>, X) =/= <<"deleted">>)
               ],
    lists:foldl(fun(MediaId, Delay) -> spawn(?MODULE, kz_purge_voicemail, [VMBoxId, MediaId, Delay, Context]), Delay + 1 end, 0, MediaIds),
    length(MediaIds) + 2.

kz_purge_voicemail(VMBoxId, MediaId, Delay, Context) ->
    timer:sleep(Delay * ?MILLISECONDS_IN_SECOND),
    vmbox_message('delete', MediaId, VMBoxId, Context).

list_account_recordings(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    AuthToken = z_context:get_session(kazoo_auth_token, Context),
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary,?RECORDINGS/binary>>,
    crossbar_account_authtoken_request('get', API_String, [], AuthToken, Context, <<>>).

kz_list_account_cdr(CreatedFrom, CreatedTo, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    AuthToken = z_context:get_session(kazoo_auth_token, Context),
    kz_list_account_cdr(AccountId, CreatedFrom, CreatedTo, AuthToken, Context).

kz_list_account_cdr(AccountId, CreatedFrom, CreatedTo, AuthToken, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?CDRS/binary, <<"?">>/binary, 
                    ?MK_TIME_FILTER(?TO_BIN(CreatedFrom), ?TO_BIN(CreatedTo))/binary, ?NO_PAGINATION/binary>>,
    crossbar_account_authtoken_request('get', API_String, [], AuthToken, Context, <<>>).

kz_list_account_cdr_interaction(CreatedFrom, CreatedTo, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    AuthToken = z_context:get_session(kazoo_auth_token, Context),
    kz_list_account_cdr_interaction(AccountId, CreatedFrom, CreatedTo, AuthToken, Context).

kz_list_account_cdr_interaction(AccountId, CreatedFrom, CreatedTo, AuthToken, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?CDRS/binary, ?INTERACTION/binary, <<"?">>/binary, 
                    ?MK_TIME_FILTER(?TO_BIN(CreatedFrom), ?TO_BIN(CreatedTo))/binary, ?NO_PAGINATION/binary>>,
    crossbar_account_authtoken_request('get', API_String, [], AuthToken, Context, <<>>).

kz_list_account_cdr_page(_StartKey, PageSize, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?CDRS/binary, ?INTERACTION/binary, <<"?">>/binary,
                   ?PAGE_SIZE/binary, ?TO_BIN(PageSize)/binary>>,
 %                  ?START_KEY/binary, ?TO_BIN(StartKey)/binary, <<"&">>/binary, ?PAGE_SIZE/binary, ?TO_BIN(PageSize)/binary>>,
 %  Docs to implement pagination: https://github.com/2600hz/kazoo/blob/master/applications/crossbar/doc/basics.md#pagination                 
    crossbar_account_request('get', API_String, [], Context).

kz_list_user_cdr(CreatedFrom, CreatedTo, Context) ->
    OwnerId = z_context:get_session('kazoo_owner_id', Context),
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?USERS/binary, "/", OwnerId/binary, ?CDRS/binary, <<"?">>/binary, 
                   ?MK_TIME_FILTER(?TO_BIN(CreatedFrom), ?TO_BIN(CreatedTo))/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_user_cdr_reduced(CreatedFrom, CreatedTo, Context) ->
    kz_cdr_list_reduce(kz_list_user_cdr(CreatedFrom, CreatedTo, Context), Context).

kz_fetch_cdr_details(CdrId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?CDRS/binary, "/", ?TO_BIN(CdrId)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_cdr_legs(CdrId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?CDRS/binary, ?LEGS/binary, "/", ?TO_BIN(CdrId)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_cdr_legs_localized(CdrId, Context) ->
    Timezone = z_convert:to_list(kazoo_util:may_be_get_timezone(Context)),
    [cdr_jobj_add_localtime(CdrElement, Timezone) || CdrElement <- kz_cdr_legs(CdrId, Context)].

cdr_jobj_add_localtime(CdrElement, Timezone) ->
    T = z_convert:to_integer(modkazoo_util:get_value(<<"timestamp">>,CdrElement)),
    modkazoo_util:set_value(<<"filtered_call_date">>
                           ,localtime:local_to_local(calendar:gregorian_seconds_to_datetime(T), "UTC", Timezone)
                           ,CdrElement).

kz_vmessage_download_link(VMBoxId, MediaId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?VMBOXES/binary, "/", VMBoxId/binary,
                   ?MESSAGES/binary, "/", ?TO_BIN(MediaId)/binary, ?RAW/binary, <<"?">>/binary,
                   ?AUTH_TOKEN/binary, (z_context:get_session(kazoo_auth_token, Context))/binary>>,
    <<(m_vars:get_value('mod_kazoo', 'kazoo_crossbar_url', Context))/binary, API_String/binary>>. 
    
kz_kzattachment_link(RecordingId, DocType, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    AuthToken = z_context:get_session('kazoo_auth_token', Context),
    kz_kzattachment_link(AccountId, RecordingId, AuthToken, DocType, Context).

kz_kzattachment_link(AccountId, [_|_] = RecordingIds, AuthToken, DocType, Context) ->
    [kz_kzattachment_link(AccountId, RecordingId, AuthToken, DocType, Context) || RecordingId <- RecordingIds];
kz_kzattachment_link(AccountId, RecordingId, AuthToken, DocType, Context) ->
    API_String = <<"/kzattachment?"
                   ,"account_id=", AccountId/binary
                   ,"&recording_id=", ?TO_BIN(RecordingId)/binary
                   ,"&auth_token=", ?TO_BIN(AuthToken)/binary
                   ,"&doc_type=", ?TO_BIN(DocType)/binary
                 >>,
    <<"https://", ?TO_BIN(z_dispatcher:hostname(Context))/binary, API_String/binary>>. 

call_recording_attachment(AccountId, RecordingId, AuthToken, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary,?RECORDINGS/binary,"/", RecordingId/binary>>,
    crossbar_account_send_raw_request_body(AuthToken, 'get', API_String, [{"Accept", "audio/mpeg"}], [], Context).

kz_cdr_list_reduce(CdrList, Context) when is_list(CdrList) ->
    Timezone = z_convert:to_list(kazoo_util:may_be_get_timezone(Context)),
    [ kz_cdr_element_reduce(Element, Timezone, Context) || Element <- CdrList ];
kz_cdr_list_reduce(_,_) ->
    [].

kz_cdr_element_reduce({CdrElement} = _Element, Timezone, Context) ->
    FilterFun = fun ({<<"timestamp">>,_}) -> true;
                    ({<<"calling_from">>,_}) -> true;
                    ({<<"from">>,_}) -> true;
                    ({<<"dialed_number">>,_}) -> true;
                    ({<<"to">>,_}) -> true;
                    ({<<"duration_seconds">>,_}) -> true;
                    ({<<"billing_seconds">>,_}) -> true;
                    ({<<"id">>,_}) -> true;
                    ({<<"call_id">>,_}) -> true;
                    ({<<"media_recordings">>,_}) -> true;
                    ({<<"rate_name">>,_}) -> true;
                    ({<<"rate">>,_}) -> true;
                    ({<<"cost">>,_}) -> true;
                    (_) -> false end,
    T = z_convert:to_integer(proplists:get_value(<<"timestamp">>,CdrElement)),
    ?JSON_WRAPPER(lists:filter(FilterFun, CdrElement)
      ++[{<<"full_element">>,  CdrElement}]
      ++[{<<"z_recording_download_link">>, kz_kzattachment_link(proplists:get_value(<<"media_recordings">>, CdrElement)
                                                                ,"call_recording"
                                                                ,Context)
        }]
      ++[{<<"filtered_call_date">>, localtime:local_to_local(calendar:gregorian_seconds_to_datetime(T), "UTC", Timezone)}]).

kz_list_account_cdr_reduced(CreatedFrom, CreatedTo, Context) ->
    case z_context:get_session('show_cdr_legs', Context) of
        'true' ->
            kz_cdr_list_reduce(kz_list_account_cdr(CreatedFrom, CreatedTo, Context), Context);
        _ ->
            kz_cdr_list_reduce(kz_list_account_cdr_interaction(CreatedFrom, CreatedTo, Context), Context)
    end.

kz_incoming_fax_download_link(DocId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?FAXES_INCOMING/binary, ?TO_BIN(DocId)/binary,
                   ?ATTACHMENT/binary, <<"?">>/binary, ?AUTH_TOKEN/binary, (z_context:get_session(kazoo_auth_token, Context))/binary>>,
    <<(m_vars:get_value('mod_kazoo', 'kazoo_crossbar_url', Context))/binary, API_String/binary>>. 

is_kazoo_account_admin(Context) ->
    case z_context:get_session('kazoo_account_admin', Context) of
        'true' -> 'true';
        _ -> 'false'
    end.

set_vm_message_folder(Folder, VMBoxId, MediaId, Context) ->
    CurrVMBox = kz_list_user_vmbox_details(VMBoxId, Context),
    Messages = [update_folder1(Message, Folder, MediaId, modkazoo_util:get_value(<<"media_id">>, Message))
                || Message <- modkazoo_util:get_value(<<"messages">>, CurrVMBox, [])],
    NewVMBox = modkazoo_util:set_value(<<"messages">>, Messages, CurrVMBox),
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?VMBOXES/binary, "/", VMBoxId/binary>>,
    crossbar_account_request('post', API_String, {[{<<"data">>, NewVMBox}]}, Context).

update_folder1(Message, Folder, MediaId, MediaId) ->
    modkazoo_util:set_value(<<"folder">>, ?TO_BIN(Folder), Message);
update_folder1(Message, _, _, _) ->
    Message.

password_recovery(Username, NumberOrAccountname, Context) ->
    case password_recovery(Username, <<"account_name">>, NumberOrAccountname, Context) of
        <<>> -> 
            password_recovery(Username, <<"phone_number">>, NumberOrAccountname, Context);
        Resp ->
            Resp
    end.

password_recovery(Username, K, V, Context) ->
    API_String = <<?V2/binary, ?USER_AUTH/binary, ?RECOVERY/binary>>,
    DataBag = {[{<<"data">>,
                  {[{<<"username">>, Username}
                    ,{K, V}
                    ,{<<"ui_url">>, <<"https://", ?TO_BIN(z_dispatcher:hostname(Context))/binary, "/password_reset_form">>}
                  ]}
              }]},
    crossbar_noauth_request('put', API_String, DataBag, Context). 

password_reset_submit(ResetId, Context) ->
    API_String = <<?V2/binary, ?USER_AUTH/binary, ?RECOVERY/binary>>,
    DataBag = {[{<<"data">>, {[{<<"reset_id">>, ?TO_BIN(ResetId)}]}}]},
    crossbar_noauth_request_raw('post', API_String, DataBag, Context). 

growl_redirect(Type, Text, Dispatch, Context) ->
    Routines = [
                fun(J) -> z_render:wire({'growl', [{text, ?__(Text, J)}, {type, Type}, {stay, true}]}, J) end
               ,fun(J) -> z_render:wire([{redirect, [{dispatch, Dispatch}]}], J) end
               ],
    lists:foldl(fun(F, J) -> F(J) end, Context, Routines).

change_credentials(Username, Password, OwnerId, Context) ->
    CurrDoc = kz_get_user_doc(OwnerId, Context),
    Routines = [fun(J) -> modkazoo_util:set_value([<<"username">>], Username, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"email">>], Username, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"password">>], Password, J) end],
    NewDoc = lists:foldl(fun(F, J) -> F(J) end, CurrDoc, Routines),
    Account_Id = z_context:get_session('kazoo_account_id', Context),
    case Account_Id =:= 'undefined' orelse OwnerId =:= 'undefined' of
        'false' ->
            API_String = <<?V1/binary, ?ACCOUNTS/binary, Account_Id/binary, ?USERS/binary, "/", OwnerId/binary>>,
            crossbar_account_request('post', API_String,  {[{<<"data">>, NewDoc}]}, Context, 'return_error');
        'true' -> []
    end.

current_account_credit(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    current_account_credit(AccountId, Context).

current_account_credit(AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?BRAINTREE/binary, ?CREDITS/binary>>, 
    crossbar_account_request('get', API_String, [], Context).

kz_check_device_registration(DeviceId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?DEVICES/binary, ?STATUS/binary>>, 
    DevicesStatus = crossbar_account_request('get', API_String, [], Context, []),
    lists:member({[{<<"device_id">>,?TO_BIN(DeviceId)},{<<"registered">>,true}]}, DevicesStatus).

kz_get_registrations_by_accountid(AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?REGISTRATIONS/binary>>, 
    crossbar_account_request('get', API_String, [], Context).

kz_get_registrations_count_by_accountid(AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?REGISTRATIONS/binary, ?COUNT/binary>>, 
    crossbar_account_request('get', API_String, [], Context).

kz_get_reseller_registrations(AccountId, Context) ->
    API_String = case kz_current_context_superadmin(Context) of
                     'true' ->
                         <<?V2/binary, ?REGISTRATIONS/binary>>;
                     'false' ->
                         <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?REGISTRATIONS/binary>> 
                 end,
    crossbar_account_request('get', API_String, [], Context).

kz_get_reseller_registrations_count(AccountId, Context) ->
    API_String = case kz_current_context_superadmin(Context) of
                     'true' ->
                         <<?V2/binary, ?REGISTRATIONS/binary, ?COUNT/binary>>;
                     'false' ->
                         <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?REGISTRATIONS/binary, ?COUNT/binary>> 
                 end,
    crossbar_account_request('get', API_String, [], Context).

kz_get_device_registration_details(DeviceId, Context) ->
    Username = modkazoo_util:get_value([<<"sip">>, <<"username">>], kz_get_device_doc(DeviceId, Context)),
    kz_registration_details_by_username(Username, Context).

kz_registration_details_by_username(Username, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    Registrations = kz_get_registrations_by_accountid(AccountId, Context),
    get_reg_details(Username, Registrations).

get_reg_details(_, []) -> <<"">>;
get_reg_details(Username, [Registration|T]) -> 
    case modkazoo_util:get_value(<<"username">>, Registration) of
        Username -> Registration;
        _ -> get_reg_details(Username, T)
    end.

kz_flush_registration_by_username(Username, Context) ->
    kz_flush_registration_by_username(Username, z_context:get_session('kazoo_account_id', Context), Context).

kz_flush_registration_by_username(Username, AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?REGISTRATIONS/binary, "/", ?TO_BIN(Username)/binary>>, 
    crossbar_account_request('delete', API_String, [], Context).

azrates(Context) ->
    {{Year,Month,Day},{Hour,_,_}} = erlang:localtime(),
    RatesFile = m_vars:get_value('mod_kazoo', 'rates_file', Context),
    case filelib:last_modified(RatesFile) of
        {{Year,Month,Day},{Hour,_,_}} -> 'ok';
        _ -> spawn('kazoo_util', 'azrates_refresh', [Context])
    end,
    {ok, Rates} = file:read_file(RatesFile),
    jiffy:decode(Rates).

azrates_refresh(Context) ->
    API_String = <<?RATES/binary>>, 
    {'ok', _, _, Body} = crossbar_admin_request('get', API_String, [], 120000, Context),
    RateList = lists:reverse(modkazoo_util:get_value(<<"data">>, jiffy:decode(Body))),
    TabId = ets:new(rates, [bag]),
    ets:insert(TabId
              ,lists:map(fun (JObj) -> 
                             {modkazoo_util:get_value(<<"prefix">>, JObj)
                             ,modkazoo_util:get_value(<<"description">>, JObj)
                             ,modkazoo_util:get_value(<<"cost">>, JObj)
                             ,modkazoo_util:get_value(<<"surcharge">>, JObj)
                             }
                         end
                        ,RateList)),
    DescriptionPriceTuples = lists:usort(ets:match(TabId,{'_','$1','$2','$3'})),
    CombinedRL = lists:map(fun ([Description, Cost, Surcharge]) ->
                               {[{<<"prefix">>, ets:match(TabId, {'$1',Description,Cost,Surcharge})}
                                ,{<<"cost">>, Cost}
                                ,{<<"description">>, Description}
                                ,{<<"surcharge">>,Surcharge}
                               ]}
                           end
                          ,DescriptionPriceTuples),
    file:write_file(m_vars:get_value('mod_kazoo', 'rates_file', Context), jiffy:encode(CombinedRL)).

rate_number(Number, Context) ->
    API_String = <<?RATES/binary, ?NUMBER/binary, "/", ?TO_BIN(Number)/binary>>, 
    case crossbar_admin_request('get', API_String, [], Context) of
        {'ok',"200", _, Body} -> 
            crossbar_admin_request('get', API_String, [], Context),
            {'ok', modkazoo_util:get_value(<<"data">>, jiffy:decode(Body))};
        E -> E
    end.

kz_list_incoming_faxes(Context) ->
    UserId = z_context:get_session('kazoo_owner_id', Context),
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_list_incoming_faxes(UserId, AccountId, Context).

kz_list_incoming_faxes(UserId, AccountId, Context) ->
    API_String =  case UserId of
                      'undefined' -> <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?FAXES_INCOMING/binary>>;
                      _ -> <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?FAXES_INCOMING/binary, <<"?">>/binary, ?FILTER_OWNER/binary, UserId/binary>>
                  end,
    Fun = fun({I}, {J}) ->
                   II = proplists:get_value(<<"timestamp">>, I),
                   JJ = proplists:get_value(<<"timestamp">>, J),
                   II =< JJ
    end,
    lists:reverse(lists:sort(Fun, z_convert:to_list(crossbar_account_request('get', API_String, [], Context)))).

kz_incoming_fax(DocId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?FAXES_INCOMING/binary, ?TO_BIN(DocId)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_incoming_fax_delete(DocId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?FAXES_INBOX/binary, ?TO_BIN(DocId)/binary>>,
    crossbar_account_request('delete', API_String, [], Context).

kz_incoming_fax_attachment_pdf(DocId, Context) ->
    TiffFile = list_to_binary(["/tmp/", DocId, ".tiff"]),
    PDFFile = list_to_binary(["/tmp/", DocId, ".pdf"]),
    case file:read_file(PDFFile) of
        {'ok', PDFBin} -> PDFBin;
        _ ->
            case kz_incoming_fax_attachment_tiff(DocId, Context) of
                <<>> -> <<>>;
                Body ->
                    _ = file:write_file(TiffFile, Body),
                    Cmd = io_lib:format("tiff2pdf -o ~s ~s &> /dev/null && echo -n \"success\"", [PDFFile, TiffFile]),
                    _ = os:cmd(Cmd),
                    _ = file:delete(TiffFile),
                    case file:read_file(PDFFile) of
                        {'ok', PDFBin} -> PDFBin;
                        _ -> <<>>
                    end
            end
    end.

kz_incoming_fax_attachment_tiff(DocId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?FAXES_INBOX/binary, ?TO_BIN(DocId)/binary, ?ATTACHMENT/binary>>,
    crossbar_account_attachment_request('get', API_String, [], Context).

phone_number(<<"+", Number/binary>>, Context) ->
    phone_number(<<"%2B", Number/binary>>, Context);
phone_number(Number, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    phone_number('get', Number, AccountId, [], Context).

phone_number(Verb, <<"+", Number/binary>>, AccountId, DataBag, Context) ->
    phone_number(Verb, <<"%2B", Number/binary>>, AccountId, DataBag, Context);
phone_number(Verb, Number, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?PHONE_NUMBERS/binary, "/", ?TO_BIN(Number)/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

kz_account_numbers_info(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_account_numbers_info(AccountId, Context).

kz_account_numbers_info(AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?PHONE_NUMBERS/binary>>,
    case crossbar_account_request('get', API_String, [], Context) of
        <<>> -> [];
        Result -> modkazoo_util:to_proplist(<<"numbers">>,Result)
    end.

account_numbers_fix_plus(AccountId, Context) ->
    _ = account_numbers_fix(AccountId, Context),
    mod_signal:emit({onnet_allocated_numbers_tpl, ?SIGNAL_FILTER(Context)} ,Context),
    mod_signal:emit({emit_growl_signal
                    ,?SIGNAL_FILTER(Context) ++
                     [{'text',?__("Numbers refresh finished", Context)}
                     ,{'type', 'notice'}
                     ]}
                   ,Context).

account_numbers_fix(AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?PHONE_NUMBERS/binary, ?FIX/binary>>,
    crossbar_account_request('post', API_String, [], Context).

kz_account_numbers(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_account_numbers(AccountId, Context).

kz_account_numbers(AccountId, Context) ->
    proplists:get_keys(kz_account_numbers_info(AccountId, Context)).

kz_spare_numbers(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_spare_numbers(AccountId, Context).

kz_spare_numbers(AccountId, Context) ->
    [Number || {Number, JObj} <- kz_account_numbers_info(AccountId, Context), modkazoo_util:get_value(<<"used_by">>,JObj) == 'undefined'].

kz_send_fax(Account_Id, FaxTo, FaxFrom, Url, Attempts, FaxHeader, Context) ->
    DataBag = {[{<<"data">>,
                           {[{<<"document">>,
                                 {[{<<"url">>, Url},
                                   {<<"method">>, <<"get">>}]
                                 }
                             },
                             {<<"retries">>, Attempts},
                             {<<"from_name">>, list_to_binary(z_convert:to_list(FaxHeader))},
                             {<<"from_number">>, FaxFrom},
                             {<<"to_name">>, FaxTo},
                             {<<"to_number">>, FaxTo}
                            ]
                    }
                }]
              },
    API_String = <<?V1/binary, ?ACCOUNTS/binary, Account_Id/binary, ?FAXES/binary>>,
    RequestAnswer = crossbar_account_request('put', API_String, DataBag, Context),
    RequestAnswer.

kz_list_outgoing_faxes(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, (z_context:get_session('kazoo_account_id', Context))/binary, ?FAXES_OUTGOING/binary>>,
    [{[{<<"a">>, TimeStamp}, A, B, C, D]} || {[A, B, C, D, {<<"created">>,TimeStamp}=_E]} <- crossbar_account_request('get', API_String, [], Context)].

kz_list_ledgers(LedgerId, AccountId, CreatedFrom, CreatedTo, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?LEDGERS/binary, "/", ?TO_BIN(LedgerId)/binary
                   ,"?", ?MK_TIME_FILTER(?TO_BIN(CreatedFrom), ?TO_BIN(CreatedTo))/binary>>,
    crossbar_account_request('get', API_String, [], Context, []).

kz_ledgers_summary(AccountId, CreatedFrom, CreatedTo, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?LEDGERS/binary
                   ,"?", ?MK_TIME_FILTER(?TO_BIN(CreatedFrom), ?TO_BIN(CreatedTo))/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_transactions(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_list_transactions(AccountId, Context).

kz_list_transactions(AccountId, Context) ->
    {Year, Month, _} = erlang:date(),
    CreatedFrom = calendar:datetime_to_gregorian_seconds({{Year,Month,1},{0,0,0}}),
    CreatedTo = calendar:datetime_to_gregorian_seconds({{Year,Month,calendar:last_day_of_the_month(Year, Month)},{23,59,59}}),
    kz_list_transactions(AccountId, CreatedFrom, CreatedTo, Context).

kz_list_transactions(CreatedFrom, CreatedTo, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_list_transactions(AccountId, CreatedFrom, CreatedTo, Context).

kz_list_transactions(AccountId, CreatedFrom, CreatedTo, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?TRANSACTIONS/binary, <<"?">>/binary,
                   ?MK_TIME_FILTER(?TO_BIN(CreatedFrom), ?TO_BIN(CreatedTo))/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_transactions(AccountId, CreatedFrom, CreatedTo, Reason, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?TRANSACTIONS/binary, <<"?">>/binary,
                   ?MK_TIME_FILTER(?TO_BIN(CreatedFrom), ?TO_BIN(CreatedTo))/binary, ?SET_REASON(Reason)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_bt_transactions(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?BRAINTREE/binary, ?TRANSACTIONS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_subscriptions(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_list_subscriptions(AccountId, Context).

kz_list_subscriptions(AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?TRANSACTIONS/binary, ?SUBSCRIPTIONS/binary>>,
    lager:info("kz_list_subscriptions: ~p", [crossbar_account_request('get', API_String, [], Context)]),
    crossbar_account_request('get', API_String, [], Context).

kz_current_balance(AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?TRANSACTIONS/binary, ?CURRENT_BALANCE/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_transactions_credit(CreditType, Amount, Reason, Description, AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?TRANSACTIONS/binary, ?CREDIT/binary>>,
    DataBag = {[{<<"data">>,{[{<<"amount">>, Amount}
                             ,{<<"reason">>, Reason}
                             ,{<<"description">>, Description}
                             ,{<<"credit_type">>, CreditType}
                             ]}}]},
    lager:info("kz_transactions_credit DataBag: ~p", [DataBag]),
    crossbar_account_request('put', API_String, DataBag, Context).

kz_admin_transactions_credit(CreditType, Amount, Reason, Description, AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?TRANSACTIONS/binary, ?CREDIT/binary>>,
    DataBag = {[{<<"data">>,{[{<<"amount">>, Amount}
                             ,{<<"reason">>, Reason}
                             ,{<<"description">>, Description}
                             ,{<<"credit_type">>, CreditType}
                             ]}}]},
    lager:info("kz_transactions_credit DataBag: ~p", [DataBag]),
    crossbar_admin_request('put', API_String, DataBag, Context).

kz_transactions_debit(Amount, Reason, Description, AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?TRANSACTIONS/binary, ?DEBIT/binary>>,
    DataBag = {[{<<"data">>,{[{<<"amount">>, Amount}
                              ,{<<"reason">>, Reason}
                              ,{<<"description">>, Description}
                             ]}}]},
    crossbar_account_request('delete', API_String, DataBag, Context).

kz_get_subscription(SubscriptionId, [H|T]) ->
    case modkazoo_util:get_value(<<"id">>, H) of
        SubscriptionId -> H;
        _ -> kz_get_subscription(SubscriptionId, T)
    end;
kz_get_subscription(_, _) -> <<>>.

kz_bt_customer(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, (z_context:get_session('kazoo_account_id', Context))/binary, ?BRAINTREE/binary, ?CUSTOMER/binary>>,
    crossbar_account_request('get', API_String, [], Context).

bt_delete_card(CardId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, (z_context:get_session('kazoo_account_id', Context))/binary, ?BRAINTREE/binary, ?CARDS/binary, "/", CardId/binary>>,
    crossbar_account_request('delete', API_String, [], Context).
    
make_payment(Amount, AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?BRAINTREE/binary, ?CREDITS/binary>>, 
    DataBag = {[{<<"data">>,{[{<<"amount">>, ?TO_BIN(Amount)}]}}]},
    lager:info("Make payment attempt. AccountId: ~p. Amount: ~p.",[AccountId, Amount]),
    crossbar_account_request('put', API_String, DataBag, Context, 'return_error').

topup_submit(Threshold, Amount, AccountId, Context) ->
    CurrDoc = kz_get_acc_doc_by_account_id(AccountId, Context),
    TopUp = {[{<<"threshold">>,z_convert:to_integer(Threshold)},{<<"amount">>,z_convert:to_integer(Amount)}]},
    NewDoc = modkazoo_util:set_value(<<"topup">>, TopUp, CurrDoc),
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary>>,
    crossbar_account_request('post', API_String,  {[{<<"data">>, NewDoc}]}, Context),
    Context.

topup_disable(AccountId, Context) ->
    CurrDoc = kz_get_acc_doc_by_account_id(AccountId, Context),
    NewDoc = modkazoo_util:delete_key(<<"topup">>, CurrDoc),
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary>>,
    crossbar_account_request('post', API_String,  {[{<<"data">>, NewDoc}]}, Context),
    Context.
   
ui_element_state(ElementName,Context) ->
    case z_context:get_session(z_convert:to_atom(ElementName), Context) of
        'true' -> 'true';
        'false' -> 'false';
        'undefined' ->
            case z_convert:to_atom(kz_user_doc_field([<<"inno_ui">>,?TO_BIN(ElementName)], Context)) of
                'true' -> 
                    z_context:set_session(z_convert:to_atom(ElementName), 'true', Context),
                    'true';
                'false' ->
                    z_context:set_session(z_convert:to_atom(ElementName), 'false', Context),
                    'false';
                _ ->
                    case m_vars:get_value('mod_kazoo', z_convert:to_atom(ElementName), Context) of
                        <<"true">> ->
                            z_context:set_session(z_convert:to_atom(ElementName), 'true', Context),
                            'true';
                        _ ->
                            z_context:set_session(z_convert:to_atom(ElementName), 'false', Context),
                            'false'
                    end
            end
    end.

trigger_innoui_widget(ElementName, Context) ->
    case z_context:get_session(z_convert:to_atom(ElementName), Context) of 
        'true' -> 
            z_context:set_session(z_convert:to_atom(ElementName), 'false', Context),
            kz_set_user_doc([<<"inno_ui">>,?TO_BIN(ElementName)], 'false', Context);
        _ -> 
            z_context:set_session(z_convert:to_atom(ElementName), 'true', Context),
            kz_set_user_doc([<<"inno_ui">>,?TO_BIN(ElementName)], 'true', Context)
    end. 

lookup_numbers(Country, AreaCode, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    lookup_numbers(Country, AreaCode, AccountId, Context).

lookup_numbers('undefined', AreaCode, AccountId, Context) ->
    Country = case m_vars:get_value('mod_kazoo', 'default_country', Context) of
                  'undefined' -> <<"US">>;
                  Val -> Val
              end,
    lookup_numbers(Country, AreaCode, AccountId, Context);
lookup_numbers(Country, AreaCode, AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?PHONE_NUMBERS/binary
                   ,<<"?">>/binary, ?COUNTRY/binary, (?TO_BIN(Country))/binary
                   ,<<"&">>/binary,?PREFIX/binary, AreaCode/binary
                   ,<<"&">>/binary, ?QUANTITY/binary, <<"100">>/binary>>,
    crossbar_account_request('get', API_String, [], Context).

rs_add_number(Num, AccountId, Context) ->
    Number = case ?TO_BIN(Num) of 
        <<$+, BNum/binary>> -> BNum;
        BNum -> BNum
    end,
    DataBag = ?SET_ACCEPT_CHARGES('true', {[{<<"numbers">>, [Number]}]}),
    _ = crossbar_account_request('put'
                                 ,<<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?PHONE_NUMBERS/binary, "/", Number/binary>>
                                 ,DataBag
                                 ,Context
                                ),
    _ = crossbar_account_request('put'
                                 ,<<?V2/binary, ?ACCOUNTS/binary, AccountId/binary
                                   ,?PHONE_NUMBERS/binary, "/", Number/binary, ?ACTIVATE/binary>>
                                 ,[]
                                 ,Context
                                ).

purchase_numbers(Numbers, AcceptCharges, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?PHONE_NUMBERS/binary, ?COLLECTION/binary, ?ACTIVATE/binary>>,
    DataBag = ?SET_ACCEPT_CHARGES(AcceptCharges, {[{<<"numbers">>, [?TO_BIN(Number) || Number <- Numbers]}]}),
    crossbar_account_request('put', API_String, DataBag, Context, 'return_error').

process_purchase_numbers([Number|_] = Numbers, AcceptCharges, Context) ->
    Routines = [fun(C) -> z_render:update("onnet_allocated_numbers_tpl"
                                         ,z_template:render("onnet_allocated_numbers.tpl", [{headline, "Allocated numbers"}], C)
                                         ,C)
                end
               ,fun(C) -> z_render:update("onnet_widget_monthly_fees_tpl"
                                         ,z_template:render("onnet_widget_monthly_fees.tpl", [{headline,"Current month services"}], C)
                                         ,C)
                end
               ,fun(C) -> z_render:update("onnet_widget_order_additional_number_tpl"
                                         ,z_template:render("onnet_widget_order_additional_number.tpl", [], C)
                                         ,C)
                end
               ,fun(C) -> z_render:dialog_close(C) end],
    case purchase_numbers(Numbers, AcceptCharges, Context) of
        {'error', _ReturnCode, Body} ->
            Ctx = lists:foldl(fun(F, J) -> F(J) end, Context, Routines),
            Message = modkazoo_util:get_value([<<"data">>,<<"error">>, ?TO_BIN(Number),<<"message">>], jiffy:decode(Body)),
            z_render:growl_error(?TO_LST(Message), Ctx);
        _ ->
            Ctx = lists:foldl(fun(F, J) -> F(J) end, Context, Routines),
            modkazoo_util:delay_signal(2, 'update_fin_info_signal', ?SIGNAL_FILTER(Context), Context),
            AccountId = z_context:get_session('kazoo_account_id', Context),
            _ = z_mqtt:publish(<<"site/phiz/public/current_account_credit_", AccountId/binary>>, <<>>, z_acl:sudo(Ctx)),
            z_render:growl(?__("Number ", Ctx)++z_convert:to_list(Number)++?__(" successfully allocated.", Ctx), Ctx)
    end.

deallocate_number(<<"+", Number/binary>>, Context) ->
    deallocate_number(<<"%2B", Number/binary>>, Context);
deallocate_number(Number, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    deallocate_number(Number, AccountId, Context).

deallocate_number(<<"+", Number/binary>>, AccountId, Context) ->
    deallocate_number(<<"%2B", Number/binary>>, AccountId, Context);
deallocate_number(Number, AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?PHONE_NUMBERS/binary, "/", ?TO_BIN(Number)/binary>>,
    crossbar_account_request('delete', API_String, [], Context).

service_plan(PlanId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    service_plan(PlanId, AccountId, Context).

service_plan(PlanId, AccountId, Context) ->
    service_plan('get', PlanId, AccountId, [], Context).

service_plan(Verb, PlanId, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?SERVICE_PLANS/binary, "/", ?TO_BIN(PlanId)/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

service_plans(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    service_plans(AccountId, Context).

service_plans(AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?SERVICE_PLANS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

available_service_plans(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    available_service_plans(AccountId, Context).

available_service_plans(AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?SERVICE_PLANS/binary, ?AVAILABLE/binary>>,
    crossbar_account_request('get', API_String, [], Context).

current_service_plans(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    current_service_plans(AccountId, Context).

current_service_plans(AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?SERVICE_PLANS/binary, ?CURRENT/binary>>,
    crossbar_account_request('get', API_String, [], Context).

sync_service_plans(AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?SERVICE_PLANS/binary, ?SYNCHRONIZATION/binary>>,
    crossbar_account_request('post', API_String, [], Context).

reconcile_service_plans(AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?SERVICE_PLANS/binary, ?RECONCILIATION/binary>>,
    crossbar_account_request('post', API_String, [], Context).

add_service_plan(PlanId, AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?SERVICE_PLANS/binary, "/", ?TO_BIN(PlanId)/binary>>,
    DataBag = {[{<<"data">>, {[{<<"id">>, ?TO_BIN(PlanId)}]}}]},
    crossbar_account_request('post', API_String, DataBag, Context).

remove_service_plan_from_account(PlanId, AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?SERVICE_PLANS/binary, "/", ?TO_BIN(PlanId)/binary>>,
    crossbar_account_request('delete', API_String, ?MK_DATABAG({[]}), Context).

is_service_plan_applied(Context) ->
    case modkazoo_util:get_value(<<"plans">>, current_service_plans(Context)) of
        'undefined' -> 'false';
        {[]} -> 'false';
        _ -> 'true'
    end.

valid_card_exists(Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?BRAINTREE/binary, ?CARDS/binary>>,
    case crossbar_account_request('get', API_String, [], Context) of
        <<>> -> 'false';
        Cards -> lists:member('false',[modkazoo_util:get_value(<<"expired">>,Card) || Card <- Cards])
    end.

is_creditable(Context) ->
    valid_card_exists(Context).

kz_get_user_timezone(Context) ->
    case kz_user_doc_field(<<"timezone">>, Context) of
        'undefined' -> get_account_timezone(Context);
        Timezone -> Timezone
    end.

get_account_timezone(Context) ->
    case z_context:get_session('kazoo_account_id', Context) of
        'undefined' ->
            m_vars:get_value('mod_kazoo', 'default_kazoo_timezone', Context);
        AccountId ->
            case kz_account_doc_field(<<"timezone">>, AccountId, Context) of
                'undefined' -> m_vars:get_value('mod_kazoo', 'default_kazoo_timezone', Context);
                Timezone -> Timezone
            end
    end.

get_user_timezone(Context) ->
    case z_context:get_session('user_timezone', Context) of
        'undefined' ->
            Timezone = kz_get_user_timezone(Context),
            z_context:set_session('user_timezone', Timezone, Context),
            Timezone;
        Timezone -> Timezone
    end.

may_be_get_timezone(Context) ->
    case kz_get_user_timezone(Context) of
        'undefined' -> <<"UTC">>;
        Timezone -> Timezone
    end.

get_account_name(Context) ->
    case z_context:get_session('kazoo_account_name', Context) of
        'undefined' ->
            Name = kz_account_doc_field(<<"name">>, Context),
            z_context:set_session('kazoo_account_name', Name, Context),
            Name;
        Name -> Name
    end.

get_account_name(AccountId, Context) ->
    kz_account_doc_field(<<"name">>, AccountId, Context).

get_account_realm(Context) ->
    case z_context:get_session('account_realm', Context) of
        'undefined' ->
            Realm = kz_account_doc_field(<<"realm">>, Context),
            z_context:set_session('account_realm', Realm, Context),
            Realm;
        Realm -> Realm
    end.

get_account_realm(AccountId, Context) ->
    kz_account_doc_field(<<"realm">>, AccountId, Context).

delete_account(AccountId,Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary>>,
    crossbar_account_request('delete', API_String, [], Context).

delete_user(UserId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    case AccountId =:= 'undefined' orelse UserId =:= 'undefined' of
        'false' ->
            API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?USERS/binary, "/", UserId/binary>>,
            crossbar_account_request('delete', API_String, [], Context);
        'true' -> []
    end.

delete_device(DeviceId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    case AccountId =:= 'undefined' orelse DeviceId =:= 'undefined' of
        'false' ->
            API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?DEVICES/binary, "/", DeviceId/binary>>,
            crossbar_account_request('delete', API_String, [], Context);
        'true' -> []
    end.

classify_number(PhoneNumber, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?PHONE_NUMBERS/binary, ?CLASSIFIERS/binary, "/", ?TO_BIN(PhoneNumber)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_classifiers(Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?PHONE_NUMBERS/binary, ?CLASSIFIERS/binary>>,
    case crossbar_account_request('get', API_String, [], Context) of
        <<>> -> [<<"">>];
        Result -> Result
    end.

add_device(Context) ->
    AcceptCharges = modkazoo_util:get_q_boolean("accept_charges", Context),
    add_device(AcceptCharges, Context).

add_device(AcceptCharges, Context) ->
    DeviceType = z_context:get_q('device_type',Context),
    AuthProps =
        case z_context:get_q('sip_ip_auth',Context) of
            <<_:7/binary, _/binary>> = IP ->
                [{[<<"sip">>,<<"method">>],<<"ip">>}
                ,{[<<"sip">>,<<"ip">>], IP}
                ];
            _ ->
                [{[<<"sip">>,<<"method">>],<<"password">>}
                ,{[<<"sip">>,<<"username">>],z_context:get_q('sipusername',Context)}
                ,{[<<"sip">>,<<"password">>],z_context:get_q('sippassword',Context)}
                ]
        end,
    Props = modkazoo_util:filter_empty(
        [{[<<"sip">>,<<"invite_format">>], case z_context:get_q("route",Context) of 'undefined' -> <<"username">>; _ -> <<"route">> end}
        ,{[<<"sip">>,<<"route">>], z_context:get_q(route,Context)}
        ,{[<<"call_forward">>,<<"enabled">>], case z_context:get_q("cellphonenumber",Context) of 'undefined' -> false; _ -> true end}
        ,{[<<"call_forward">>,<<"number">>],z_context:get_q('cellphonenumber',Context)}
        ,{[<<"name">>],z_context:get_q('name',Context)}
        ,{[<<"owner_id">>],z_context:get_q('device_owner_id',Context)}
        ,{[<<"caller_id">>,<<"internal">>,<<"number">>],z_context:get_q('callerid_internal_number',Context)}
        ,{[<<"caller_id">>,<<"external">>,<<"number">>],z_context:get_q('callerid_external_number',Context)}
        ,{[<<"device_type">>], DeviceType}
        ] ++ AuthProps),
    DeviceJObj = lists:foldl(fun({K,V},J) -> modkazoo_util:set_value(K,V,J) end, ?MK_DEVICE_SIP, Props),
    add_device(?MK_DATABAG(DeviceJObj), AcceptCharges, Context).

add_device(DataBag, AcceptCharges, Context) ->
    API_String =
        case is_trial_account(Context) of
            {'true', _} ->
                <<?V1/binary, ?ACCOUNTS(Context)/binary, ?DEVICES/binary>>;
            'false' ->
                <<?V2/binary, ?ACCOUNTS(Context)/binary, ?DEVICES/binary>>
        end,
    AcceptChargesCataBag = modkazoo_util:set_value(<<"accept_charges">>, AcceptCharges, DataBag),
    case crossbar_account_request('put', API_String, AcceptChargesCataBag, Context, 'return_error') of
        {'error', "402", Body} ->
            Data = modkazoo_util:get_value(<<"data">>, jiffy:decode(Body)),
            case modkazoo_util:get_value([<<"devices">>,<<"sip_devices">>], Data) of
                'undefined' ->
                    Message = modkazoo_util:get_value(<<"message">>, Data),
                    mod_signal:emit({emit_growl_signal
                                    ,?SIGNAL_FILTER(Context) ++
                                     [{'text',?__(?TO_LST(Message), Context)}
                                     ,{'type', 'error'}
                                     ]}
                                    ,Context),
                    z_render:dialog_close(Context);
                LimitsItem ->
                    AccountId = z_context:get_session('kazoo_account_id', Context),
                    Expences = modkazoo_util:get_value(<<"activation_charge">>, LimitsItem)
                               + modkazoo_util:get_value(<<"rate">>, LimitsItem),
                    CurrentAccountCredit = modkazoo_util:get_value(<<"amount">>, current_account_credit(AccountId, Context)),
                    PVT_Limits = onbill_util:onbill_pvt_limits('get', AccountId, [], Context),
                    MaybePostpayCredit =
                        case modkazoo_util:get_value(<<"allow_postpay">>, PVT_Limits, 'false') of
                            'true' ->
                                modkazoo_util:get_value(<<"max_postpay_amount">>, PVT_Limits, 0);
                            'false' -> 0
                        end,
                    case Expences > (CurrentAccountCredit + MaybePostpayCredit) of
                        'true' ->
                            mod_signal:emit({emit_growl_signal
                                            ,?SIGNAL_FILTER(Context) ++
                                             [{'text',?__("Not enough funds.", Context)}
                                             ,{'type', 'error'}
                                             ]}
                                            ,Context),
                            z_render:dialog_close(Context);
                        'false' ->
                            z_render:dialog(?__("Charges Confirmation",Context)
                                           ,"_accept_new_element_charges.tpl"
                                           ,[{item, LimitsItem}
                                            ,{databag, DataBag}
                                            ,{element_type, <<"device">>}
                                            ,{account_id, AccountId}
                                            ,{width, "auto"}
                                            ]
                                           ,Context)
                    end
            end;
        {'error', _ReturnCode, Body} ->
            Keys = [[<<"data">>,<<"message">>]
                   ,[<<"data">>,<<"sip.ip">>,<<"unique">>,<<"message">>]
                   ,[<<"message">>]
                   ],
            Message = modkazoo_util:get_first_defined(Keys, jiffy:decode(Body)),
            mod_signal:emit({emit_growl_signal
                            ,?SIGNAL_FILTER(Context) ++
                             [{'text',?__(?TO_LST(Message), Context)}
                             ,{'type', 'error'}
                             ]}
                            ,Context),
            z_render:dialog_close(Context);
        Result ->
            case modkazoo_util:get_value(<<"id">>, Result) of
                ?MATCH_ACCOUNT_RAW(DeviceId) ->
                    maybe_add_device_callflow(DeviceId, Context);
                _ -> 'ok'
            end,
            mod_signal:emit({update_admin_portal_devices_list_tpl, ?SIGNAL_FILTER(Context)}, Context),
            modkazoo_util:delay_signal(3, 'update_fin_info_signal', ?SIGNAL_FILTER(Context), Context),
            z_render:dialog_close(Context)
    end.

maybe_add_device_callflow(DeviceId, Context) ->
    case z_context:get_q('add_device_callflow',Context) of
        <<"add_device_callflow">> ->
            CIDNumber = z_context:get_q('callerid_internal_number',Context),
            add_device_callflow(DeviceId, CIDNumber, Context);
        _ ->
            'ok'
    end. 

add_device_callflow(_DeviceId, <<>>, _Context) ->
    'ok';
add_device_callflow(DeviceId, CIDNumber, Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"id">>], DeviceId}
             ,{[<<"flow">>,<<"data">>,<<"timeout">>], <<"60">>}
             ,{[<<"flow">>,<<"data">>,<<"can_call_self">>], 'true'}
             ,{[<<"flow">>,<<"module">>], <<"device">>}
             ,{[<<"numbers">>], [CIDNumber]}
             ],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_list_account_groups(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?GROUPS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_account_blacklists(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?BLACKLISTS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_account_callflows(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_list_account_callflows(AccountId, Context).

kz_list_account_callflows(AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?CALLFLOWS/binary>>,
    crossbar_account_request('get', API_String, [], Context, []).

kz_get_account_callflow(CallflowId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_get_account_callflow(CallflowId, AccountId, Context).

kz_get_account_callflow(CallflowId, AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?CALLFLOWS/binary, "/", ?TO_BIN(CallflowId)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_account_children(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CHILDREN/binary>>,
    lists:reverse(crossbar_account_request('get', API_String, [], Context)).

kz_list_account_channels(Context) ->
    kz_list_account_channels(z_context:get_session('kazoo_account_id', Context), Context).

kz_list_account_channels('undefined', Context) ->
    kz_list_account_channels(z_context:get_session('kazoo_account_id', Context), Context);
kz_list_account_channels(AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?CHANNELS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_get_reseller_channels(AccountId, Context) ->
    API_String = case kz_current_context_superadmin(Context) of
                     'true' ->
                         <<?V2/binary, ?CHANNELS/binary>>;
                     'false' ->
                         <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?CHANNELS/binary>>
                 end,
    crossbar_account_request('get', API_String, [], Context).

kz_channel_info(CallId, Context) ->
    kz_channel_info(CallId, z_context:get_session('kazoo_account_id', Context), Context).

kz_channel_info(CallId, 'undefined', Context) ->
    kz_channel_info(CallId, z_context:get_session('kazoo_account_id', Context), Context);
kz_channel_info(CallId, AccountId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?CHANNELS/binary, "/" , ?TO_BIN(CallId)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_channel_action(CallId, DataBag, Context) ->
    kz_channel_action(CallId, DataBag, z_context:get_session('kazoo_account_id', Context), Context).

kz_channel_action(CallId, DataBag, 'undefined', Context) ->
    kz_channel_action(CallId, DataBag, z_context:get_session('kazoo_account_id', Context), Context);
kz_channel_action(CallId, DataBag, AccountId, Context) ->
    kz_channel_action('post', CallId, DataBag, AccountId, Context).
kz_channel_action(Verb, CallId, DataBag, AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?CHANNELS/binary, "/", ?TO_BIN(CallId)/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

kz_channel_hangup(CallId, AccountId, Context) ->
    Values =
        [{<<"action">>, <<"hangup">>}
        ,{<<"module">>, <<"hangup">>}
        ],
    DataBag = ?MK_DATABAG(modkazoo_util:set_values(Values, modkazoo_util:new())),
    kz_channel_action('post', CallId, DataBag, AccountId, Context).

kz_channel_transfer(Target, CallId, AccountId, Context) ->
    DataBag = {[{<<"data">>, {[{<<"action">>, <<"transfer">>}, {<<"target">>, ?TO_BIN(Target)}, {<<"takeback_dtmf">>, <<"*1">>}]}}]},
    kz_channel_action(CallId, DataBag, AccountId, Context).

kz_channel_eavesdrop(Id, Mode, CallId, AccountId, Context) ->
    DataBag = {[{<<"data">>, {[{<<"call_id">>, ?TO_BIN(CallId)}, {<<"mode">>, ?TO_BIN(Mode)}, {<<"id">>, ?TO_BIN(Id)}]}}]},
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?QUEUES/binary, ?EAVESDROP/binary>>,
    crossbar_account_request('put', API_String, DataBag, Context).

add_group(Context) ->
    Endpoints = lists:foldr(fun(T,J) -> case T of
                                           {_,[]} -> []++J; 
                                           {<<"user">>,Id} ->  J++[{Id,{[{<<"type">>,<<"user">>}]}}];
                                           {<<"device">>,Id} ->  J++[{Id,{[{<<"type">>,<<"device">>}]}}];
                                           _ -> []++J 
                                       end 
                               end, [], z_context:get_q_all(Context)),
    Props = modkazoo_util:filter_empty(
        [{[<<"data">>,<<"name">>],z_context:get_q(name,Context)}
        ,{[<<"data">>,<<"endpoints">>],{Endpoints}}
        ]),
    DataBag = lists:foldl(fun({K,V},J) -> modkazoo_util:set_value(K,V,J) end, ?MK_GROUP, Props),
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?GROUPS/binary>>,
    _ = crossbar_account_request('put', API_String, DataBag, Context),
    Context.

modify_group(Context) ->
    modify_group(z_context:get_q("group_id",Context), Context).

modify_group(GroupId, Context) ->
    Endpoints = lists:foldr(fun(T,J) -> case T of
                                           {_,[]} -> []++J; 
                                           {<<"user">>,Id} ->  J++[{Id,{[{<<"type">>,<<"user">>}]}}];
                                           {<<"device">>,Id} ->  J++[{Id,{[{<<"type">>,<<"device">>}]}}];
                                           _ -> []++J 
                                       end 
                               end, [], z_context:get_q_all(Context)),
    Props = modkazoo_util:filter_empty(
        [{[<<"data">>,<<"name">>],z_context:get_q(name,Context)}
        ,{[<<"data">>,<<"endpoints">>],{Endpoints}}
        ]),
    DataBag = lists:foldl(fun({K,V},J) -> modkazoo_util:set_value(K,V,J) end, kz_get_group_doc(GroupId, Context), Props),
    AccountId = z_context:get_session('kazoo_account_id', Context),
    case AccountId =:= 'undefined' orelse GroupId =:= 'undefined' of
        'false' ->
            API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?GROUPS/binary, "/", ?TO_BIN(GroupId)/binary>>,
            crossbar_account_request('post', API_String, DataBag, Context);
        'true' -> []
    end.

delete_group(GroupId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    case AccountId =:= 'undefined' orelse GroupId =:= 'undefined' of
        'false' ->
            API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?GROUPS/binary, "/", ?TO_BIN(GroupId)/binary>>,
            crossbar_account_request('delete', API_String, [], Context);
        'true' -> []
    end.

kz_get_group_doc(GroupId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    case AccountId =:= 'undefined' orelse GroupId =:= 'undefined' of
        'false' -> 
            API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?GROUPS/binary, "/", ?TO_BIN(GroupId)/binary>>,
            crossbar_account_request('get', API_String, [], Context);
        'true' -> []
    end.

kz_set_group_doc(K, V, GroupId, Context) ->
    CurrDoc = kz_get_group_doc(GroupId, Context),
    NewDoc = modkazoo_util:set_value(K, V, CurrDoc),
    AccountId = z_context:get_session('kazoo_account_id', Context),
    case AccountId =:= 'undefined' orelse GroupId =:= 'undefined' of
        'false' -> 
            API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?GROUPS/binary, "/", ?TO_BIN(GroupId)/binary>>,
            crossbar_account_request('post', API_String,  {[{<<"data">>, NewDoc}]}, Context);
        'true' -> []
    end.

kz_list_account_media(Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?MEDIA/binary>>,
    crossbar_account_request('get', API_String, [], Context, []).

kz_get_media_doc(MediaId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    case AccountId =:= 'undefined' orelse MediaId =:= 'undefined' orelse MediaId =:= 'null' of
        'false' -> 
            API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?MEDIA/binary, "/", ?TO_BIN(MediaId)/binary>>,
            crossbar_account_request('get', API_String, [], Context);
        'true' -> []
    end.

kz_list_account_menus(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?MENUS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_menu(Context) ->
    Id = z_context:get_q("menu_id",Context),
    Props = [{<<"name">>, z_context:get_q(name, Context)}
            ,{<<"retries">>, z_context:get_q(retries, Context)}
            ,{<<"timeout">>, z_context:get_q(timeout, Context)}
            ,{<<"max_extension_length">>, z_context:get_q(max_extension_length, Context)}
            ,{<<"media">>, {[{<<"exit_media">>, not(modkazoo_util:on_to_true(z_context:get_q("suppress_media", Context)))}
                            ,{<<"invalid_media">>, not(modkazoo_util:on_to_true(z_context:get_q("suppress_media", Context)))}
                            ,{<<"transfer_media">>, not(modkazoo_util:on_to_true(z_context:get_q("suppress_media", Context)))}
                            ,{<<"greeting">>, z_context:get_q(greeting, Context)}]}}
            ,{<<"record_pin">>, z_context:get_q(record_pin, Context)}
            ,{<<"allow_record_from_offnet">>, modkazoo_util:on_to_true(z_context:get_q("allow_record_from_offnet", Context))}
            ,{<<"hunt">>, modkazoo_util:on_to_true(z_context:get_q("hunt", Context))}
            ,{<<"suppress_media">>, modkazoo_util:on_to_true(z_context:get_q("suppress_media", Context))}
            ,{<<"hunt_allow">>, z_context:get_q(hunt_allow, Context)}
            ,{<<"hunt_deny">>, z_context:get_q(hunt_deny, Context)}
            ,{<<"id">>, ?TO_BIN(Id)}],
    DataBag = ?MK_DATABAG(modkazoo_util:set_values(modkazoo_util:filter_empty(Props), modkazoo_util:new())),
    case Id of
        'undefined'->
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?MENUS/binary>>,
            crossbar_account_request('put', API_String, DataBag, Context);
        _ ->
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?MENUS/binary, "/", ?TO_BIN(Id)/binary>>,
            crossbar_account_request('post', API_String, DataBag, Context)
    end.

kz_menu(Verb, MenuId,Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?MENUS/binary, "/", ?TO_BIN(MenuId)/binary>>,
    crossbar_account_request(Verb, API_String, [], Context).

kz_list_account_temporal_rules(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?TEMPORAL_RULES/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_get_temporal_rule(RuleId,Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?TEMPORAL_RULES/binary, "/", ?TO_BIN(RuleId)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_get_name(Id, Type, Context) ->
    case Type of
        <<"device_id">> -> modkazoo_util:get_value(<<"name">>,kz_get_device_doc(Id, Context));
        <<"group_id">> -> modkazoo_util:get_value(<<"name">>,kz_get_device_doc(Id, Context));
        <<"user_id">> -> 
            UserDoc = kz_get_user_doc(Id, Context),
            <<(modkazoo_util:get_value(<<"first_name">>,UserDoc))/binary
             ,<<" ">>/binary
             ,(modkazoo_util:get_value(<<"last_name">>,UserDoc))/binary>>
    end.
    
upload_media(Context) ->
    try
        PromptName = case z_context:get_q("promptname", Context) of
            [] ->
               throw(no_name_entered);
            PromptNameStr ->
               ?TO_BIN(PromptNameStr)
        end,
        case z_context:get_q("promptfile", Context) of
            {upload, UploadFilename, UploadTmp, _, _} ->
                false = modkazoo_util:check_file_size_exceeded(promptfile, UploadTmp, 15000000),
                Result = set_media_doc(z_context:get_q("prompt_id", Context), PromptName, ?TO_BIN(UploadFilename), Context),
                set_media_attachment(modkazoo_util:get_value(<<"id">>, Result), UploadFilename, UploadTmp, Context);
            _ ->
                case z_context:get_q("existing_description", Context) of
                    'undefined' -> throw(no_document_uploaded);
                    ExistingDescr ->  
                        set_media_doc(z_context:get_q("prompt_id", Context), PromptName, ExistingDescr, Context)
                end
        end,
        mod_signal:emit({update_admin_portal_media_list_tpl, ?SIGNAL_FILTER(Context)}, Context),
        z_render:dialog_close(Context)
    catch
        no_name_entered ->
            z_render:growl_error(?__("No name entered",Context), Context);
        no_document_uploaded ->
            z_render:growl_error(?__("No document chosen",Context), Context);
        error:{badmatch, {true, promptfile}} ->
            z_render:growl_error(?__("Maximum file size exceeded. Please try to upload smaller file.",Context), Context);
        E1:E2 ->
            lager:info("Error. E1: ~p E2: ~p", [E1, E2]),
            z_render:growl_error(?__("Something wrong happened.",Context), Context)
    end.

set_media_doc(Id, PromptName, Description, Context) ->
    Props =  [{<<"streamable">>,true}
             ,{<<"name">>, ?TO_BIN(PromptName)}
             ,{<<"media_source">>, <<"upload">>}
             ,{<<"id">>, ?TO_BIN(Id)}
             ,{<<"description">>, ?TO_BIN(Description)}],
    DataBag = ?MK_DATABAG(modkazoo_util:set_values(modkazoo_util:filter_empty(Props), modkazoo_util:new())),
    case Id of
        'undefined'->
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?MEDIA/binary>>,
            crossbar_account_request('put', API_String, DataBag, Context);
        _ ->
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?MEDIA/binary, "/", ?TO_BIN(Id)/binary>>,
            crossbar_account_request('post', API_String, DataBag, Context)
    end.
  
set_media_attachment(Id, UploadFilename, UploadTmp, Context) ->
    {ok, Data} = file:read_file(UploadTmp),
    {ok, IdnProps} = z_media_identify:identify(UploadTmp, UploadFilename, Context),
    Mime = proplists:get_value(mime, IdnProps),
    API_String_Raw = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?MEDIA/binary, "/", ?TO_BIN(Id)/binary, ?RAW/binary>>,
    Headers = [{"Content-Type",Mime}],
    crossbar_account_send_raw_request('post', API_String_Raw, Headers, Data, Context).

kz_delete_prompt(PromptId,Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?MEDIA/binary, "/", ?TO_BIN(PromptId)/binary>>,
    crossbar_account_request('delete', API_String, [], Context).

kz_get_account_prompt(PromptId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?MEDIA/binary, "/", ?TO_BIN(PromptId)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_get_account_prompt_attachment(PromptId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?MEDIA/binary, "/", ?TO_BIN(PromptId)/binary, ?RAW/binary>>,
    crossbar_account_attachment_request('get', API_String, [], Context).

kz_list_account_conferences(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CONFERENCES/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_account_c2calls(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CLICKTOCALL/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_vmbox(Context) ->
    Id = z_context:get_q("vmbox_id",Context),
    Props = [{<<"name">>, z_context:get_q(name, Context)}
            ,{<<"mailbox">>, z_context:get_q(mailbox, Context)}
            ,{<<"pin">>, z_context:get_q(pin, Context)}
            ,{<<"owner_id">>, z_context:get_q(owner_id, Context)}
            ,{<<"media">>, case z_context:get_q("unavailable_message_id", Context) of
                               [] -> 'undefined';
                               MessageId -> {[{<<"unavailable">>, ?TO_BIN(MessageId)}]}
                           end
             }
            ,{<<"timezone">>, z_context:get_q(vmbox_timezone, Context)}
            ,{<<"is_setup">>, modkazoo_util:on_to_true(z_context:get_q("is_setup", Context))}
            ,{<<"require_pin">>, modkazoo_util:on_to_true(z_context:get_q("require_pin", Context))}
            ,{<<"check_if_owner">>, modkazoo_util:on_to_true(z_context:get_q("check_if_owner", Context))}
            ,{<<"skip_greeting">>, modkazoo_util:on_to_true(z_context:get_q("skip_greeting", Context))}
            ,{<<"skip_instructions">>, modkazoo_util:on_to_true(z_context:get_q("skip_instructions", Context))}
            ,{<<"delete_after_notify">>, modkazoo_util:on_to_true(z_context:get_q("delete_after_notify", Context))}
            ,{<<"id">>, ?TO_BIN(Id)}],
    DataBag = ?MK_DATABAG(modkazoo_util:set_values(modkazoo_util:filter_empty(Props), modkazoo_util:new())),
    case Id of
        'undefined'->
            API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?VMBOXES/binary>>,
            crossbar_account_request('put', API_String, DataBag, Context);
        _ ->
            API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?VMBOXES/binary, "/", ?TO_BIN(Id)/binary>>,
            crossbar_account_request('post', API_String, DataBag, Context)
    end.

kz_vmbox(Verb, VMBoxId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?VMBOXES/binary, "/", VMBoxId/binary>>,
    crossbar_account_request(Verb, API_String, [], Context).

vmbox_messages(Verb, VMBoxId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?VMBOXES/binary, "/", VMBoxId/binary, ?MESSAGES/binary>>,
    crossbar_account_request(Verb, API_String, [], Context).

vmbox_message(Verb, MessageId, VMBoxId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?VMBOXES/binary, "/", VMBoxId/binary
                  ,?MESSAGES/binary, "/", ?TO_BIN(MessageId)/binary>>,
    crossbar_account_request(Verb, API_String, [], Context).

kz_conference(Context) ->
    Id = z_context:get_q("conference_id", Context),
    Numbers = lists:map(fun (K) -> re:replace(K, "[^A-Za-z0-9]", "", [global, {return, binary}]) end
                       ,z_string:split(z_context:get_q("numbers", Context),",")),
    Pins = lists:map(fun (K) -> re:replace(K, "[^A-Za-z0-9]", "", [global, {return, binary}]) end
                    ,z_string:split(z_context:get_q("pins", Context),",")),
    Props = [{<<"name">>, z_context:get_q(conference_name, Context)}
            ,{<<"member">>, {[{<<"numbers">>, case Numbers of [<<>>] -> []; _ -> Numbers end}
                            ,{<<"pins">>, case Pins of [<<>>] -> []; _ -> Pins end}
                            ,{<<"join_muted">>, modkazoo_util:on_to_true(z_context:get_q("join_muted", Context))}
                            ,{<<"join_deaf">>, modkazoo_util:on_to_true(z_context:get_q("join_deaf", Context))}]}}
            ,{<<"owner_id">>, z_context:get_q(owner_id, Context)}
            ,{<<"play_name">>, modkazoo_util:on_to_true(z_context:get_q("play_name", Context))}
            ,{<<"moderator">>, {[{<<"numbers">>, []}
                            ,{<<"pins">>, []}
                            ,{<<"join_muted">>, 'false'}
                            ,{<<"join_deaf">>, 'false'}]}}
            ,{<<"conference_numbers">>, []}
            ,{<<"id">>, ?TO_BIN(Id)}],
    DataBag = ?MK_DATABAG(modkazoo_util:set_values(modkazoo_util:filter_empty(Props), modkazoo_util:new())),
    case Id of
        'undefined'->
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CONFERENCES/binary>>,
            crossbar_account_request('put', API_String, DataBag, Context);
        _ ->
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CONFERENCES/binary, "/", ?TO_BIN(Id)/binary>>,
            crossbar_account_request('post', API_String, DataBag, Context)
    end.

kz_conference(Verb, ConferenceId,Context) ->
    kz_conference(Verb, ConferenceId, [], Context).

kz_conference(Verb, ConferenceId, DataBag, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CONFERENCES/binary, "/", ?TO_BIN(ConferenceId)/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

kz_conference_participant(ParticipantId, ConferenceId, Context) ->
    kz_conference_participant('get', ParticipantId, ConferenceId, [], Context).

kz_conference_participant(Verb, ParticipantId, ConferenceId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?CONFERENCES/binary, "/", ?TO_BIN(ConferenceId)/binary,
                                                          ?PARTICIPANTS/binary, "/", ?TO_BIN(ParticipantId)/binary>>,
%%
%% It seems cluster has problems with delivery action to the node where conference resides...
%% We'll send request several times it order at least one could reach needed node 
%%
    _ = crossbar_account_request(Verb, API_String, DataBag, Context),
    _ = crossbar_account_request(Verb, API_String, DataBag, Context),
    _ = crossbar_account_request(Verb, API_String, DataBag, Context),
    _ = crossbar_account_request(Verb, API_String, DataBag, Context),
    _ = crossbar_account_request(Verb, API_String, DataBag, Context).

kz_conference_participants(ConferenceId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?CONFERENCES/binary, "/", ?TO_BIN(ConferenceId)/binary, ?PARTICIPANTS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

dedup_kz_conference_participants(ConferenceId,Context) ->
    case kz_conference_participants(ConferenceId,Context) of
        <<>> -> <<>>;
        Pts ->
            lists:foldl(fun(X,Acc) ->
                            case lists:member(modkazoo_util:get_value(<<"Participant-ID">>, X), modkazoo_util:props_get_values(<<"Participant-ID">>, Acc)) of
                                'true' -> Acc;
                                'false' -> Acc ++ [X]
                            end
                        end
                        ,[]
                        ,Pts)
    end.

start_outbound_conference(Context) ->
    ConferenceId = z_context:get_q('conference_selector', Context),
    SelectedListId = z_context:get_q('selected_list', Context),
    SelectedMedia = z_context:get_q('selected_media', Context),
    start_outbound_conference(SelectedListId, ConferenceId, SelectedMedia, Context).

start_outbound_conference([], _, _, Context) ->
    z_render:growl_error(?__("No participants list chosen.",Context), Context);
start_outbound_conference(_, [], _, Context) ->
    z_render:growl_error(?__("No conference chosen.",Context), Context);
start_outbound_conference(ListId, ConferenceId, MediaId, Context) ->
    UserId = z_context:get_session('kazoo_owner_id', Context),
    NumbersList = [modkazoo_util:get_value([<<"value">>,<<"number">>],JObj) || JObj <- kz_list_account_list_entries(ListId, Context)],
    [add_cccp_autodial(ParticipantNumber, ConferenceId, UserId, MediaId, Context) || ParticipantNumber <- NumbersList],
    z_render:growl(?__("Attempt sent.",Context), Context).

add_conf_participant(Context) ->
    ConferenceId = z_context:get_q('conference_selector', Context),
    ParticipantNumber = z_context:get_q('a_leg_number', Context),
    SelectedMedia = z_context:get_q('selected_media', Context),
    add_conf_participant(ParticipantNumber, ConferenceId, SelectedMedia, Context).

add_conf_participant([], _, _, Context) ->
    z_render:growl_error(?__("No participant number filled in.",Context), Context);
add_conf_participant(_, [], _, Context) ->
    z_render:growl_error(?__("No conference chosen.",Context), Context);
add_conf_participant(ParticipantNumber, ConferenceId, MediaId, Context) ->
    UserId = z_context:get_session('kazoo_owner_id', Context),
    add_cccp_autodial(ParticipantNumber, ConferenceId, UserId, MediaId, Context),
    z_render:growl(?__("Attempt sent.",Context), Context).

do_conference_action(Action, ConferenceId, Context) ->
    DataBag = ?MK_DATABAG(?ACTION_TUPLE(Action)),
    kz_conference('put', ConferenceId, DataBag, Context).

do_conference_participant_action(Action, ParticipantId, ConferenceId, Context) ->
    DataBag = ?MK_DATABAG(?ACTION_TUPLE(Action)),
    kz_conference_participant('put', ParticipantId, ConferenceId, DataBag, Context).

maybe_update_conference_participants_headline("add-member", ConferenceId, Context) ->
    case current_conference_participants_number(ConferenceId, Context) of
        1 -> mod_signal:emit({update_conference_participants_headline, ?SIGNAL_FILTER(Context)}, Context);
        _ -> 'ok'
    end;
maybe_update_conference_participants_headline("del-member", ConferenceId, Context) ->
    case current_conference_participants_number(ConferenceId, Context) of
        0 -> mod_signal:emit({update_conference_participants_headline, ?SIGNAL_FILTER(Context)}, Context);
        _ -> 'ok'
    end.

current_conference_participants_number(ConferenceId, Context) ->
    ConferenceDetails = kz_conference('get', ConferenceId, Context),
    modkazoo_util:get_value_integer([<<"_read_only">>,<<"moderators">>], ConferenceDetails)
    +
    modkazoo_util:get_value_integer([<<"_read_only">>,<<"members">>], ConferenceDetails).

kz_c2call(Context) ->
    Id = z_context:get_q("c2call_id",Context),
    Props = [{<<"name">>, z_context:get_q(name, Context)}
            ,{<<"auth_required">>, modkazoo_util:on_to_true(z_context:get_q("auth_required", Context))}
            ,{<<"dial_first">>, z_context:get_q(dial_first, Context)}
            ,{<<"extension">>, z_context:get_q(extension, Context)}
            ,{<<"caller_id_number">>, z_context:get_q(caller_id_number, Context)}
            ,{<<"outbound_callee_id_number">>, z_context:get_q(caller_id_number, Context)}
            ,{<<"id">>, ?TO_BIN(Id)}],
    DataBag = ?MK_DATABAG(modkazoo_util:set_values(modkazoo_util:filter_empty(Props), modkazoo_util:new())),
    case Id of
        'undefined'->
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CLICKTOCALL/binary>>,
            crossbar_account_request('put', API_String, DataBag, Context);
        _ ->
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CLICKTOCALL/binary, "/", ?TO_BIN(Id)/binary>>,
            crossbar_account_request('post', API_String, DataBag, Context)
    end.

kz_c2call(Verb, C2CallId,Context) ->
    kz_c2call(Verb, C2CallId, [], Context).

kz_c2call(Verb, C2CallId, DataBag, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CLICKTOCALL/binary, "/", ?TO_BIN(C2CallId)/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

kz_c2call_hyperlink(C2CallId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CLICKTOCALL/binary, "/", ?TO_BIN(C2CallId)/binary, ?CONNECT/binary>>,
    Crossbar_URL = m_vars:get_value('mod_kazoo', 'kazoo_crossbar_url', Context),
    <<Crossbar_URL/binary, API_String/binary>>.

kz_get_featurecode_by_name(FCName, Context) ->
    case lists:filter(fun(X) -> ?TO_BIN(FCName) == modkazoo_util:get_value([<<"featurecode">>,<<"name">>],X) end, kz_list_account_callflows(Context)) of
        [] -> [];
        [H|_] -> H
    end.

kz_add_featurecode_voicemail_check(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"check">>}
             ,{[<<"flow">>,<<"module">>], <<"voicemail">>}
             ,{[<<"numbers">>], [<<"*97">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"voicemail[action=check]">>}
             ,{[<<"featurecode">>, <<"number">>], <<"97">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_voicemail_direct(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"compose">>}
             ,{[<<"flow">>,<<"module">>], <<"voicemail">>}
             ,{[<<"patterns">>], [<<"^\\*\\*([0-9]*)$">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"voicemail[action=\"direct\"]">>}
             ,{[<<"featurecode">>, <<"number">>], <<"\\*">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_park_and_retrieve(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"auto">>}
             ,{[<<"flow">>,<<"module">>], <<"park">>}
             ,{[<<"patterns">>], [<<"^\\*3([0-9]*)$">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"park_and_retrieve">>}
             ,{[<<"featurecode">>, <<"number">>], <<"3">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_park_valet(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"park">>}
             ,{[<<"flow">>,<<"module">>], <<"park">>}
             ,{[<<"numbers">>], [<<"*4">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"valet">>}
             ,{[<<"featurecode">>, <<"number">>], <<"4">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_park_retrieve(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"retrieve">>}
             ,{[<<"flow">>,<<"module">>], <<"retrieve">>}
             ,{[<<"patterns">>], [<<"^\\*5([0-9]*)$">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"retrieve">>}
             ,{[<<"featurecode">>, <<"number">>], <<"5">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_intercom(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"compose">>}
             ,{[<<"flow">>,<<"module">>], <<"intercom">>}
             ,{[<<"patterns">>], [<<"^\\*0([0-9]*)$">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"intercom">>}
             ,{[<<"featurecode">>, <<"number">>], <<"0">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_privacy(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"full">>}
             ,{[<<"flow">>,<<"module">>], <<"privacy">>}
             ,{[<<"patterns">>], [<<"^\\*67([0-9]*)$">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"privacy[mode=full]">>}
             ,{[<<"featurecode">>, <<"number">>], <<"67">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_hotdesk_enable(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"login">>}
             ,{[<<"flow">>,<<"module">>], <<"hotdesk">>}
             ,{[<<"numbers">>], [<<"*11">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"hotdesk[action=login]">>}
             ,{[<<"featurecode">>, <<"number">>], <<"11">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_hotdesk_disable(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"logout">>}
             ,{[<<"flow">>,<<"module">>], <<"hotdesk">>}
             ,{[<<"numbers">>], [<<"*12">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"hotdesk[action=logout]">>}
             ,{[<<"featurecode">>, <<"number">>], <<"12">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_hotdesk_toggle(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"toggle">>}
             ,{[<<"flow">>,<<"module">>], <<"hotdesk">>}
             ,{[<<"numbers">>], [<<"*13">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"hotdesk[action=toggle]">>}
             ,{[<<"featurecode">>, <<"number">>], <<"13">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_call_forward_activate(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"activate">>}
             ,{[<<"flow">>,<<"module">>], <<"call_forward">>}
             ,{[<<"numbers">>], [<<"*72">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"call_forward[action=activate]">>}
             ,{[<<"featurecode">>, <<"number">>], <<"72">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_call_forward_deactivate(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"deactivate">>}
             ,{[<<"flow">>,<<"module">>], <<"call_forward">>}
             ,{[<<"numbers">>], [<<"*73">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"call_forward[action=deactivate]">>}
             ,{[<<"featurecode">>, <<"number">>], <<"73">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_call_forward_toggle(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"toggle">>}
             ,{[<<"flow">>,<<"module">>], <<"call_forward">>}
             ,{[<<"patterns">>], [<<"^\\*74([0-9]*)$">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"call_forward[action=toggle]">>}
             ,{[<<"featurecode">>, <<"number">>], <<"74">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

kz_add_featurecode_call_forward_update(Context) ->
    Values = [{[<<"flow">>,<<"data">>,<<"action">>], <<"update">>}
             ,{[<<"flow">>,<<"module">>], <<"call_forward">>}
             ,{[<<"numbers">>], [<<"*56">>]}
             ,{[<<"featurecode">>, <<"name">>], <<"call_forward[action=update]">>}
             ,{[<<"featurecode">>, <<"number">>], <<"56">>}],
    kz_account_create_callflow(modkazoo_util:set_values(Values, ?EMPTY_CALLFLOW), Context).

set_featurecode_dynamic_cid(ListId, Context) ->
    Routines = [fun(J) -> modkazoo_util:set_value([<<"flow">>,<<"data">>,<<"action">>], <<"lists">>, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"flow">>,<<"data">>,<<"id">>], ?TO_BIN(ListId), J) end
                ,fun(J) -> modkazoo_util:set_value([<<"flow">>,<<"module">>], <<"dynamic_cid">>, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"patterns">>], [<<"^\\*69([0-9]{2,})$">>], J) end
                ,fun(J) -> modkazoo_util:set_value([<<"featurecode">>, <<"number">>], <<"69">>, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"featurecode">>, <<"name">>], <<"dynamic_cid">>, J) end],
    update_featurecode(<<"dynamic_cid">>, Routines, Context).


set_featurecode_eavesdrop(ApprovedGroupId, TargetGroupId, Context) ->
    Routines = [fun(J) -> modkazoo_util:set_value([<<"flow">>,<<"module">>], <<"eavesdrop_feature">>, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"featurecode">>, <<"name">>], <<"eavesdrop_feature">>, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"patterns">>], [<<"^\\*68([0-9]{2,})$">>], J) end
                ,fun(J) -> modkazoo_util:set_value([<<"featurecode">>, <<"number">>], <<"68">>, J) end
                ,fun(J) -> case ApprovedGroupId of
                               [] -> 
                                   modkazoo_util:delete_key([<<"flow">>,<<"data">>,<<"approved_group_id">>], J);
                               _ -> 
                                   modkazoo_util:set_value([<<"flow">>,<<"data">>,<<"approved_group_id">>], ?TO_BIN(ApprovedGroupId), J)
                           end
                 end
                ,fun(J) -> modkazoo_util:set_value([<<"flow">>,<<"data">>,<<"group_id">>], ?TO_BIN(TargetGroupId), J) end],
    update_featurecode(<<"eavesdrop_feature">>, Routines, Context).

update_featurecode(FeatureCodeName, Routines, Context) ->
    case kz_get_featurecode_by_name(FeatureCodeName, Context) of
        [] ->
            Callflow = lists:foldl(fun(F, J) -> F(J) end, ?EMPTY_CALLFLOW, Routines),
            kz_account_create_callflow(Callflow, Context);
        JObj -> 
            CallflowId = modkazoo_util:get_value(<<"id">>,JObj),
            CurrDoc = kz_get_account_callflow(CallflowId, Context),
            APIString = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", CallflowId/binary>>,
            DataBag = ?MK_DATABAG(lists:foldl(fun(F, J) -> F(J) end, CurrDoc, Routines)),
            crossbar_account_request('post', APIString, DataBag, Context)
    end.

toggle_featurecode_voicemail_check(Context) ->
    case kz_get_featurecode_by_name(<<"voicemail[action=check]">>, Context) of
        [] -> kz_add_featurecode_voicemail_check(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_voicemail_direct(Context) ->
    case kz_get_featurecode_by_name(<<"voicemail[action=\"direct\"]">>, Context) of
        [] -> kz_add_featurecode_voicemail_direct(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_park_and_retrieve(Context) ->
    case kz_get_featurecode_by_name(<<"park_and_retrieve">>, Context) of
        [] -> kz_add_featurecode_park_and_retrieve(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_park_valet(Context) ->
    case kz_get_featurecode_by_name(<<"valet">>, Context) of
        [] -> kz_add_featurecode_park_valet(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_park_retrieve(Context) ->
    case kz_get_featurecode_by_name(<<"retrieve">>, Context) of
        [] -> kz_add_featurecode_park_retrieve(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_intercom(Context) ->
    case kz_get_featurecode_by_name(<<"intercom">>, Context) of
        [] -> kz_add_featurecode_intercom(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_privacy(Context) ->
    case kz_get_featurecode_by_name(<<"privacy[mode=full]">>, Context) of
        [] -> kz_add_featurecode_privacy(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_hotdesk_enable(Context) ->
    case kz_get_featurecode_by_name(<<"hotdesk[action=login]">>, Context) of
        [] -> kz_add_featurecode_hotdesk_enable(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_hotdesk_disable(Context) ->
    case kz_get_featurecode_by_name(<<"hotdesk[action=logout]">>, Context) of
        [] -> kz_add_featurecode_hotdesk_disable(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_hotdesk_toggle(Context) ->
    case kz_get_featurecode_by_name(<<"hotdesk[action=toggle]">>, Context) of
        [] -> kz_add_featurecode_hotdesk_toggle(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_call_forward_activate(Context) ->
    case kz_get_featurecode_by_name(<<"call_forward[action=activate]">>, Context) of
        [] -> kz_add_featurecode_call_forward_activate(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_call_forward_deactivate(Context) ->
    case kz_get_featurecode_by_name(<<"call_forward[action=deactivate]">>, Context) of
        [] -> kz_add_featurecode_call_forward_deactivate(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_call_forward_toggle(Context) ->
    case kz_get_featurecode_by_name(<<"call_forward[action=toggle]">>, Context) of
        [] -> kz_add_featurecode_call_forward_toggle(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

toggle_featurecode_call_forward_update(Context) ->
    case kz_get_featurecode_by_name(<<"call_forward[action=update]">>, Context) of
        [] -> kz_add_featurecode_call_forward_update(Context);
        JObj -> 
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
            crossbar_account_request('delete', API_String, [], Context)
    end.

delete_featurecode(CodeName, Context) ->
    JObj = kz_get_featurecode_by_name(CodeName, Context),
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>,JObj))/binary>>,
    crossbar_account_request('delete', API_String, [], Context).

toggle_blacklist_member(BlacklistId,Context) ->
    Blacklists = case kz_account_doc_field(<<"blacklists">>, Context) of
        'undefined' -> [];
        Value -> Value
    end,
    case lists:member(BlacklistId, Blacklists) of
        'true' -> kz_set_acc_doc(<<"blacklists">>, lists:usort(Blacklists)--[BlacklistId,<<"undefined">>], Context); 
        'false' -> kz_set_acc_doc(<<"blacklists">>, lists:usort(Blacklists++[BlacklistId])--[<<"undefined">>], Context) 
    end.

kz_get_account_blacklist(BlacklistId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?BLACKLISTS/binary, "/", ?TO_BIN(BlacklistId)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

set_blacklist_doc(Id, Name, Nums, Context) ->
    Props =  [{<<"name">>, ?TO_BIN(Name)}
             ,{<<"id">>, ?TO_BIN(Id)}
             ,{<<"numbers">>, ?JSON_WRAPPER(lists:map(fun(X) -> {modkazoo_util:cleanout(X)
                                                                ,modkazoo_util:set_value(<<"description">>, modkazoo_util:get_q_bin(X, Context), ?EMPTY_JSON_OBJECT)}
                                                      end
                                           ,Nums))
              }
             ],
    DataBag = ?MK_DATABAG(modkazoo_util:set_values(modkazoo_util:filter_empty(Props), modkazoo_util:new())),
    case Id of
        'undefined'->
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?BLACKLISTS/binary>>,
            crossbar_account_request('put', API_String, DataBag, Context);
        _ ->
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?BLACKLISTS/binary, "/", ?TO_BIN(Id)/binary>>,
            crossbar_account_request('post', API_String, DataBag, Context)
    end.

kz_delete_blacklist(BlacklistId,Context) ->
    kz_set_acc_doc(<<"blacklists">>, lists:usort(kazoo_util:kz_account_doc_field(<<"blacklists">>, Context))--[BlacklistId,<<"undefined">>], Context),
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?BLACKLISTS/binary, "/", ?TO_BIN(BlacklistId)/binary>>,
    crossbar_account_request('delete', API_String, [], Context).

rs_delete_account(AccountId,Context) ->
    _ = delete_account(AccountId,Context),
    _ = z_context:set_session('rs_selected_account_id', 'undefined', Context),
    z_context:add_script_session([<<"z_reload();">>], Context),
    Context.

toggle_all_calls_recording(Context) ->
    RecState = case kz_account_doc_field([<<"preflow">>,<<"always">>],Context) of
        'undefined' -> [];
        [] -> [];
        <<>> -> [];
        Value -> Value
    end,
    case RecState of
        [] ->
            kz_set_acc_doc([<<"preflow">>,<<"always">>], record_call_doc_id(Context), Context),
            kz_set_acc_doc([<<"record_call">>], 'true', Context);
        _ ->
            kz_set_acc_doc([<<"preflow">>,<<"always">>], <<>>, Context),
            kz_set_acc_doc([<<"record_call">>], 'false', Context)
    end.

record_call_doc_id(Context) ->
    Cfs = kz_list_account_callflows(Context),
    case lists:filter(fun(X) -> [<<"record_call">>] =:= modkazoo_util:get_value(<<"numbers">>,X) end, Cfs) of
        [] ->
            _ = create_record_call_callflow(Context),
            record_call_doc_id(Context);
        [Cf|_] -> 
            modkazoo_util:get_value(<<"id">>,Cf)
    end.

create_record_call_callflow(Context) ->
    Routines = [fun(J) -> modkazoo_util:set_value([<<"name">>], <<"record_call">>, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"numbers">>], [<<"record_call">>], J) end
                ,fun(J) -> modkazoo_util:set_value([<<"contact_list">>, <<"exclude">>], true, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"flow">>, <<"module">>], <<"record_call">>, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"flow">>, <<"data">>, <<"action">>], <<"start">>, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"flow">>, <<"data">>, <<"url">>], <<>>, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"flow">>, <<"data">>, <<"format">>], <<"mp3">>, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"flow">>, <<"data">>, <<"time_limit">>], <<"6000">>, J) end],
    DataBag = ?MK_DATABAG(lists:foldl(fun(F, J) -> F(J) end, ?EMPTY_CALLFLOW, Routines)),
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CALLFLOWS/binary>>,
    crossbar_account_request('put', API_String, DataBag, Context).

kz_cccp_creds_list(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CCCPS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

add_cccp_doc(Payload, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CCCPS/binary>>,
    crossbar_account_request('put', API_String, ?MK_DATABAG(Payload), Context).

add_cccp_autodial(ALegNumber, BLegNumber, UserId, MediaId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CCCPS/binary, ?AUTODIAL/binary>>,
    Payload = modkazoo_util:filter_empty([{<<"a_leg_number">>, ?TO_BIN(ALegNumber)}
                                         ,{<<"b_leg_number">>, ?TO_BIN(BLegNumber)}
                                         ,{<<"user_id">>, ?TO_BIN(UserId)}
                                         ,{<<"media_id">>, ?TO_BIN(MediaId)}
                                         ,{<<"retain_cid">>, 'true'}
                                         ,{<<"callback_delay">>, 1}]),
    crossbar_account_request('put', API_String, ?MK_DATABAG({Payload}), Context).

del_cccp_doc(DocId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CCCPS/binary, "/", ?TO_BIN(DocId)/binary>>,
    crossbar_account_request('delete', API_String, [], Context).

get_cccp_doc(DocId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CCCPS/binary, "/", ?TO_BIN(DocId)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

cccp_field_toggler(DocId, FieldName, Context) ->
    CurrDoc = get_cccp_doc(DocId, Context),
    NewDoc = case modkazoo_util:get_value(?TO_BIN(FieldName), CurrDoc) of
        'true' -> modkazoo_util:set_value(?TO_BIN(FieldName), 'false', CurrDoc);
        _ -> modkazoo_util:set_value(?TO_BIN(FieldName), 'true', CurrDoc)
    end,
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?CCCPS/binary, "/", ?TO_BIN(DocId)/binary>>,
    crossbar_account_request('post', API_String, ?MK_DATABAG(NewDoc), Context).

cccp_field(K, DocId, Context) ->
    CurrDoc = get_cccp_doc(DocId, Context),
    modkazoo_util:get_value(K, CurrDoc).

cccp_field_set(K, V, DocId, Context) ->
    CurrDoc = get_cccp_doc(DocId, Context),
    NewDoc = case V of
        'undefined' -> modkazoo_util:delete_key(K, CurrDoc);
         _ -> modkazoo_util:set_value(K, V, CurrDoc)
    end,
    AccountId = z_context:get_session('kazoo_account_id', Context),
    case AccountId =:= 'undefined' orelse DocId =:= 'undefined' of
        'false' ->
            API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?CCCPS/binary, "/", ?TO_BIN(DocId)/binary>>,
            crossbar_account_request('post', API_String, ?MK_DATABAG(NewDoc), Context);
        'true' -> []
    end.

kz_find_account_by_number(Number, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?PHONE_NUMBERS/binary, "/", ?TO_BIN(Number)/binary, ?IDENTIFY/binary>>,
    modkazoo_util:get_value(<<"account_id">>, crossbar_account_request('get', API_String, [], Context)).

kz_admin_find_accountname_by_number(Number, Context) ->
    modkazoo_util:get_value(<<"name">>,kz_adminget_acc_doc_by_account_id(kz_admin_get_account_by_number(Number, Context),Context)).

kz_admin_get_account_by_number(Number, Context) ->
    {'ok', {'account_id', AccountId}, {'auth_token', AuthToken}, {'crossbar', CrossbarURL}} = kz_admin_creds(Context),
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?PHONE_NUMBERS/binary, "/", ?TO_BIN(Number)/binary, ?IDENTIFY/binary>>,
    URL = z_convert:to_list(<<CrossbarURL/binary, API_String/binary>>),
    {'ok', _, _, Body} = ibrowse:send_req(URL, req_headers(AuthToken), 'get', [], [], 10000),
    modkazoo_util:get_value([<<"data">>,<<"account_id">>], jiffy:decode(Body)).

list_account_trunks(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    list_account_trunks(AccountId, Context).

list_account_trunks(AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?CONNECTIVITY/binary>>,
    crossbar_account_request('get', API_String, [], Context).

check_trunk_name_field(TrunkDoc, Context) ->
    case modkazoo_util:get_value(<<"name">>, TrunkDoc) of
        'undefined' -> modkazoo_util:set_value(<<"name">>, <<(get_account_name(Context))/binary, " Trunkstore">>, TrunkDoc);
        _ -> TrunkDoc
    end.

kz_trunk_server(Context) ->
    TrunkId = case z_context:get_q("trunk_id",Context) of
             'undefined' ->
                 case list_account_trunks(Context) of
                     [] ->
                         DataBag = ?MK_DATABAG({[{<<"account">>, {[{<<"credits">>,{[{<<"prepay">>,<<"0.00">>}]}}
                                                                  ,{<<"trunks">>,<<"0">>}
                                                                  ,{<<"inbound_trunks">>,<<"0">>}
                                                                  ,{<<"auth_realm">>,get_account_realm(Context)}
                                                                  ]}}
                                                ,{<<"name">>, <<(get_account_name(Context))/binary, " Trunkstore">>}
                                                ,{<<"servers">>, []}
                                                ]}),
                         _ = kz_trunk('put', <<>>, DataBag, Context),
                         [CreatedTrunkId|_] = list_account_trunks(Context),
                         CreatedTrunkId;
                     ExistingTrunkId -> ExistingTrunkId
                 end;
             ContextId -> ContextId
         end,
    CurrTrunkDoc = kz_trunk('get', TrunkId, [], Context),
    Servers = modkazoo_util:get_value(<<"servers">>, CurrTrunkDoc),
    NewServers = case z_context:get_q("server_index",Context) of
        'undefined' -> Servers ++ [update_trunk_server(?EMPTY_TS_SERVER, Context)];
        Ind ->
            Index = z_convert:to_integer(Ind),
            lists:sublist(Servers, Index-1) ++ [update_trunk_server(lists:nth(Index, Servers), Context)] ++ lists:nthtail(Index, Servers)
    end,
    NewTrunkDoc = modkazoo_util:set_value(<<"servers">>, NewServers, CurrTrunkDoc),
    kz_trunk('post', TrunkId, ?MK_DATABAG(check_trunk_name_field(NewTrunkDoc, Context)), Context).

kz_trunk_server_details('undefined', _, _) ->
    [];
kz_trunk_server_details(_, 'undefined', _) ->
    [];
kz_trunk_server_details(TrunkId, Index, Context) ->
    lists:nth(Index, modkazoo_util:get_value(<<"servers">>, kz_trunk('get', TrunkId, [], Context))).

kz_trunk_server_delete(TrunkId, Index, Context) ->
    CurrTrunkDoc = kz_trunk('get', TrunkId, [], Context),
    Servers = modkazoo_util:get_value(<<"servers">>, CurrTrunkDoc),
    NewServers = lists:sublist(Servers, Index-1) ++ lists:nthtail(Index, Servers),
    NewTrunkDoc = modkazoo_util:set_value(<<"servers">>, NewServers, CurrTrunkDoc),
    kz_trunk('post', TrunkId, ?MK_DATABAG(check_trunk_name_field(NewTrunkDoc, Context)), Context).

kz_trunk_server_numbers(Context) ->
    case z_context:get_q("trunk_id",Context) of
        'undefined' -> ok;
        TrunkId ->
            TS_Numbers = case z_context:get_q_all("ts_number",Context) of
                [] -> {[]};
                NumbersList -> ?JSON_WRAPPER(lists:map(fun(Number) ->
                                                           {?TO_BIN(Number)
                                                           ,modkazoo_util:set_value(<<"force_outbound">>, false, ?EMPTY_JSON_OBJECT)}
                                                        %   ,?EMPTY_JSON_OBJECT}
                                                       end
                                                      ,NumbersList))
            end,
            Index = z_convert:to_integer(z_context:get_q("server_index",Context)),
            CurrTrunkDoc = kz_trunk('get', TrunkId, [], Context),
            Servers = modkazoo_util:get_value(<<"servers">>, CurrTrunkDoc),
            NewServers = lists:sublist(Servers, Index-1)
                         ++ [modkazoo_util:set_value(<<"DIDs">>, TS_Numbers, lists:nth(Index, Servers))]
                         ++ lists:nthtail(Index, Servers),
            NewTrunkDoc = modkazoo_util:set_value(<<"servers">>, NewServers, CurrTrunkDoc),
            kz_trunk('post', TrunkId, ?MK_DATABAG(NewTrunkDoc), Context)
    end.

kz_trunk(Verb, TrunkId, DataBag, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_trunk(Verb, TrunkId, AccountId, DataBag, Context).

kz_trunk(Verb, TrunkId, AccountId, DataBag, Context) ->
    case Verb of
        'get' ->
            API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?CONNECTIVITY/binary, "/", ?TO_BIN(TrunkId)/binary>>,
            crossbar_account_request(Verb, API_String, [], Context);
        'put' -> 
            API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?CONNECTIVITY/binary>>,
            crossbar_account_request(Verb, API_String, DataBag, Context);
        'post' ->
            API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?CONNECTIVITY/binary, "/", ?TO_BIN(TrunkId)/binary>>,
            crossbar_account_request(Verb, API_String, DataBag, Context);
        _ -> 'ok'
    end.

get_trunk_doc_field(K, TrunkId, AccountId, Context) ->
    modkazoo_util:get_value(K, kz_trunk('get', TrunkId, AccountId, [], Context)).

set_trunk_doc_field(K, V, TrunkId, AccountId, Context) ->
    TrunkDoc = kz_trunk('get', TrunkId, AccountId, [], Context),
    kz_trunk('post', TrunkId, AccountId, ?MK_DATABAG(modkazoo_util:set_value(K, V, TrunkDoc)), Context).

list_trunks_realm(?MATCH_ACCOUNT_RAW(AccountId), Context) ->
    [get_trunk_doc_field([<<"account">>,<<"auth_realm">>], TrunkId, AccountId, Context) || TrunkId <- list_account_trunks(AccountId, Context)];
list_trunks_realm(_, _) -> [].

sync_trunkstore_realm(TrunkId, AccountId, Context) ->
    AccountRealm = get_account_realm(AccountId, Context),
    set_trunk_doc_field([<<"account">>,<<"auth_realm">>], AccountRealm, TrunkId, AccountId, Context).

sync_trunkstore_realms(AccountId, Context) ->
    AccountRealm = get_account_realm(AccountId, Context),
    [sync_trunkstore_realm(TrunkId, AccountId, Context) || TrunkId <- list_account_trunks(AccountId, Context)
                                                          ,get_trunk_doc_field([<<"account">>,<<"auth_realm">>], TrunkId, AccountId, Context) =/= AccountRealm].

ts_trunk_disable(Ind, TrunkId, Context) ->
    ts_server_set_field([<<"options">>,<<"enabled">>], 'false', Ind, TrunkId, Context).

ts_trunk_enable(Ind, TrunkId, Context) ->
    ts_server_set_field([<<"options">>,<<"enabled">>], 'true', Ind, TrunkId, Context).

ts_server_set_field(K, V, Ind, TrunkId, Context) ->
    Index = z_convert:to_integer(Ind),
    CurrTrunkDoc = kz_trunk('get', TrunkId, [], Context),
    Servers = modkazoo_util:get_value(<<"servers">>, CurrTrunkDoc),
    NewServers = lists:sublist(Servers, Index-1)
                 ++ [modkazoo_util:set_value(K, V, lists:nth(Index, Servers))]
                 ++ lists:nthtail(Index, Servers),
    NewTrunkDoc = modkazoo_util:set_value(<<"servers">>, NewServers, CurrTrunkDoc),
    kz_trunk('post', TrunkId, ?MK_DATABAG(NewTrunkDoc), Context).

update_trunk_server(Server, Context) ->
    Routines = [fun(J) -> modkazoo_util:set_value([<<"options">>,<<"enabled">>], 'true', J) end
                ,fun(J) -> modkazoo_util:set_value([<<"options">>,<<"inbound_format">>]
                                                  ,z_context:get_q('inbound_format',Context)
                                                  ,J)
                 end
                ,fun(J) -> modkazoo_util:set_value([<<"auth">>,<<"auth_method">>]
                                                  ,z_context:get_q('auth_method',Context)
                                                  ,J)
                 end
                ,fun(J) -> case z_context:get_q('auth_trunk_user',Context) of
                               <<>> -> J;
                               User -> modkazoo_util:set_value([<<"auth">>,<<"auth_user">>], User, J)
                           end
                 end
                ,fun(J) -> case z_context:get_q('auth_password',Context) of
                               <<>> -> J;
                               Pwd -> modkazoo_util:set_value([<<"auth">>,<<"auth_password">>], Pwd, J)
                           end
                 end
                ,fun(J) -> case z_context:get_q('ipaddress',Context) of
                               <<>> -> J;
                               Ip -> modkazoo_util:set_value([<<"auth">>,<<"ip">>], Ip, J)
                           end
                 end
                ,fun(J) -> case z_context:get_q('media_handling',Context) of
                               <<>> -> J;
                               MH -> modkazoo_util:set_value([<<"options">>,<<"media_handling">>], MH, J)
                           end
                 end
                ,fun(J) -> case z_context:get_q('ipaddress',Context) of
                               <<>> -> J;
                               Ip -> modkazoo_util:set_value([<<"options">>,<<"ip">>], Ip, J)
                           end
                 end
                ,fun(J) -> case z_context:get_q('cid_number',Context) of
                               <<>> -> modkazoo_util:delete_key([<<"options">>,<<"caller_id">>] ,J);
                               CID_Number ->
                                   CID_Name = case z_context:get_q('cid_name',Context) of
                                                  <<>> -> CID_Number;
                                                  CName -> CName
                                              end,
                                   Values = [{[<<"options">>,<<"caller_id">>,<<"cid_number">>], CID_Number}
                                            ,{[<<"options">>,<<"caller_id">>,<<"cid_name">>], CID_Name}],
                                   modkazoo_util:set_values(Values ,J)
                           end
                 end
                ,fun(J) -> modkazoo_util:set_value([<<"server_name">>]
                          ,z_context:get_q('server_name',Context)
                          ,J)
                 end],
    lists:foldl(fun(F, J) -> F(J) end, Server, Routines).

kz_list_webhooks(Context) ->
    API_String = <<?V2/binary, ?WEBHOOKS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_account_webhooks(Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?WEBHOOKS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_webhook_info(WebhookId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?WEBHOOKS/binary, "/", ?TO_BIN(WebhookId)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_webhook_delete(WebhookId, Context) ->
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?WEBHOOKS/binary, "/", ?TO_BIN(WebhookId)/binary>>,
    crossbar_account_request('delete', API_String, [], Context).

kz_webhook_toggle(WebhookId, Context) ->
    CurrDoc = kz_webhook_info(WebhookId, Context),
    NewDoc = case modkazoo_util:get_value(<<"enabled">>, CurrDoc) of
        'true' -> modkazoo_util:set_value(<<"enabled">>, 'false', CurrDoc);
        'false' -> modkazoo_util:set_value(<<"enabled">>, 'true', CurrDoc)
    end,
    API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?WEBHOOKS/binary, "/", ?TO_BIN(WebhookId)/binary>>,
    crossbar_account_request('post', API_String, ?MK_DATABAG(NewDoc), Context).

kz_webhook(Context) ->
    CurrDoc = case z_context:get_q("webhook_id", Context) of
        'undefined' -> ?EMPTY_JSON_OBJECT;
         WebhookId -> kz_webhook_info(WebhookId, Context)
    end,
    Routines = [fun(J) -> modkazoo_util:set_value(<<"name">>, modkazoo_util:get_q_bin("name",Context), J) end
                ,fun(J) -> modkazoo_util:set_value(<<"hook">>, modkazoo_util:get_q_bin("hook",Context), J) end
                ,fun(J) -> modkazoo_util:set_value(<<"enabled">>, modkazoo_util:get_q_atom("enabled",Context), J) end
                ,fun(J) -> modkazoo_util:set_value(<<"http_verb">>, modkazoo_util:get_q_bin("http_verb",Context), J) end
                ,fun(J) -> modkazoo_util:set_value(<<"retries">>, modkazoo_util:get_q_integer("retries",Context), J) end
                ,fun(J) -> modkazoo_util:set_value(<<"uri">>, modkazoo_util:get_q_bin("uri",Context), J) end
               ] ++ [filter_custom_fields(Pair, Context) || Pair <- z_context:get_q_all(Context)],
    NewDoc = lists:foldl(fun(F, J) -> F(J) end, modkazoo_util:delete_key(<<"custom_data">>,CurrDoc), Routines),
    case z_context:get_q("webhook_id", Context) of
        'undefined'->
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?WEBHOOKS/binary>>,
            crossbar_account_request('put', API_String, ?MK_DATABAG(NewDoc), Context);
        Id ->
            API_String = <<?V1/binary, ?ACCOUNTS(Context)/binary, ?WEBHOOKS/binary, "/", ?TO_BIN(Id)/binary>>,
            crossbar_account_request('post', API_String, ?MK_DATABAG(NewDoc), Context)
    end.

filter_custom_fields({<<"custom_key_", T/binary>>, Key}, Context) ->
    fun(J) -> modkazoo_util:set_value([<<"custom_data">>,?TO_BIN(Key)], modkazoo_util:get_q_bin(T,Context), J) end;
filter_custom_fields(_, _Context) ->
    fun(J) -> J end.

kz_current_context_reseller_status(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_reseller_status(AccountId, Context).

kz_reseller_status(AccountId, Context) ->
    modkazoo_util:get_value(<<"is_reseller">>, kz_get_acc_doc_by_account_id(AccountId, Context)).

kz_current_context_reseller_id(Context) ->
    modkazoo_util:get_value(<<"reseller_id">>, kz_get_acc_doc(Context)).

kz_current_context_superadmin(Context) ->
    modkazoo_util:get_value(<<"superduper_admin">>, kz_get_acc_doc(Context)).

kz_callflows_numbers(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_callflows_numbers(AccountId, Context).

kz_callflows_numbers(AccountId, Context) ->
    lists:foldl(fun(X,Acc) -> modkazoo_util:get_value([<<"numbers">>],X) ++ Acc end, [], kz_list_account_callflows(AccountId, Context)).

kz_callflow_by_number(Number, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_callflow_by_number(Number, AccountId, Context).

kz_callflow_by_number(Number, AccountId, Context) ->
    case lists:filter(fun(X) -> modkazoo_util:get_value([<<"numbers">>],X) == [Number] end, kz_list_account_callflows(AccountId, Context)) of
        [CF|_] -> kz_get_account_callflow(modkazoo_util:get_value(<<"id">>, CF), AccountId, Context);
        _ -> ?EMPTY_JSON_OBJECT
    end.

set_global_carrier_routing(AccountId, Context) ->
    Routines = [fun(J) -> modkazoo_util:set_value([<<"flow">>, <<"data">>], ?EMPTY_JSON_OBJECT, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"flow">>, <<"module">>], <<"offnet">>, J) end],
    set_no_match_routing(Routines, AccountId, Context).

set_reseller_based_routing(ResellerId, AccountId, Context) ->
    Routines = [fun(J) -> modkazoo_util:set_value([<<"flow">>, <<"data">>, <<"hunt_account_id">>], ResellerId, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"flow">>, <<"module">>], <<"resources">>, J) end],
    set_no_match_routing(Routines, AccountId, Context).

set_account_based_routing(AccountId, Context) ->
    Routines = [fun(J) -> modkazoo_util:set_value([<<"flow">>, <<"data">>], ?EMPTY_JSON_OBJECT, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"flow">>, <<"module">>], <<"resources">>, J) end],
    set_no_match_routing(Routines, AccountId, Context).

set_no_match_routing(Routines, AccountId, Context) ->
    CurrDoc = kz_callflow_by_number(<<"no_match">>, AccountId, Context),
    DataBag = ?MK_DATABAG(lists:foldl(fun(F, J) -> F(J) end, CurrDoc, Routines)),
    API_String = <<?V1/binary, ?ACCOUNTS/binary, AccountId/binary, ?CALLFLOWS/binary, "/", (modkazoo_util:get_value(<<"id">>, CurrDoc))/binary>>,
    crossbar_account_request('post', API_String, DataBag, Context).

kz_list_account_resources(Context) ->
    API_String = case kz_current_context_superadmin(Context) of
        'true' -> <<?V2/binary, ?RESOURCES/binary>>; 
        'false' -> <<?V2/binary, ?ACCOUNTS(Context)/binary, ?RESOURCES/binary>>
    end,
    crossbar_account_request('get', API_String, [], Context).
    
kz_resource_info(ResourceId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_resource_info(ResourceId, AccountId, Context).

kz_resource_info(ResourceId, AccountId, Context) ->
    API_String = case kz_current_context_superadmin(Context) of
        'true' -> <<?V2/binary, ?RESOURCES/binary, "/", ?TO_BIN(ResourceId)/binary>>; 
        'false' -> <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?RESOURCES/binary, "/", ?TO_BIN(ResourceId)/binary>>
    end,
    crossbar_account_request('get', API_String, [], Context).
    
kz_resource_delete(ResourceId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_resource_delete(ResourceId, AccountId, Context).

kz_resource_delete(ResourceId, AccountId, Context) ->
    API_String = case kz_current_context_superadmin(Context) of
        'true' -> <<?V2/binary, ?RESOURCES/binary, "/", ?TO_BIN(ResourceId)/binary>>; 
        'false' -> <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?RESOURCES/binary, "/", ?TO_BIN(ResourceId)/binary>>
    end,
    crossbar_account_request('delete', API_String, [], Context).

toggle_resource(ResourceId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    toggle_resource(ResourceId, AccountId, Context).

toggle_resource(ResourceId, AccountId, Context) ->
    CurrDoc = kz_resource_info(ResourceId, AccountId, Context),
    NewDoc = case modkazoo_util:get_value(<<"enabled">>, CurrDoc) of
        'false' -> modkazoo_util:set_value(<<"enabled">>, 'true', CurrDoc);
        'true' -> modkazoo_util:set_value(<<"enabled">>, 'false', CurrDoc)
    end,
    API_String = case kz_current_context_superadmin(Context) of
        'true' -> <<?V2/binary, ?RESOURCES/binary, "/", ?TO_BIN(ResourceId)/binary>>; 
        'false' -> <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?RESOURCES/binary, "/", ?TO_BIN(ResourceId)/binary>>
    end,
    crossbar_account_request('post', API_String, ?MK_DATABAG(NewDoc), Context).
    
resource(Context) ->
    ResourceId = modkazoo_util:get_q_bin("resource_id",Context),
    PropsGateway = modkazoo_util:filter_empty(
        [{[<<"server">>],modkazoo_util:get_q_bin("server",Context)}
        ,{<<"port">>,modkazoo_util:get_q_bin("port",Context)}
        ,{<<"username">>,modkazoo_util:get_q_bin("username",Context)}
        ,{<<"password">>,modkazoo_util:get_q_bin("password",Context)}
        ,{<<"prefix">>,modkazoo_util:get_q_bin("prefix",Context)}
        ,{<<"suffix">>,modkazoo_util:get_q_bin("suffix",Context)}
        ,{<<"progress_timeout">>,modkazoo_util:get_q_bin("progress_timeout",Context)}
        ,{<<"realm">>,modkazoo_util:get_q_bin("realm",Context)}
        ,{<<"format_from_uri">>,modkazoo_util:on_to_true(z_context:get_q("format_from_uri",Context))}
        ,{[<<"media">>,<<"fax_option">>],modkazoo_util:on_to_true(z_context:get_q("fax_option",Context))}
        ,{<<"codecs">>,lists:foldl(fun(Codec,J) -> case Codec of [] -> J; _ -> J ++ [?TO_BIN(Codec)] end end, [], z_context:get_q_all("codecs",Context))}
        ]),
    PropsResource = modkazoo_util:filter_empty(
        [{<<"name">>,modkazoo_util:get_q_bin("name",Context)}
        ,{<<"weight_cost">>,modkazoo_util:get_q_bin("weight_cost",Context)}
        ,{[<<"caller_id_options">>,<<"type">>],modkazoo_util:get_q_bin("caller_id_options_type",Context)}]) ++
        [{<<"rules">>,case modkazoo_util:get_q_bin("rules",Context) of <<>> -> ?DEFAULT_RESOURCE_RULES; Rules -> [Rules] end}
        ,{<<"cid_rules">>,case modkazoo_util:get_q_bin("cid_rules",Context) of <<>> -> ?DEFAULT_RESOURCE_CIDRULES; Rules -> [Rules] end}
        ,{<<"flags">>,case z_context:get_q("flags", Context) of
                          'undefined' -> [];
                          [] -> [];
                           Flags -> lists:map(fun (K) -> re:replace(K, "[^A-Za-z0-9]", "", [global, {return, binary}]) end, z_string:split(Flags,","))
                      end
         }
        ],
    [Gateway, Resource] = case ResourceId of
        <<>> ->
            [CurrGateway|_] = modkazoo_util:get_value(<<"gateways">>,?EMPTY_RESOURCE),
            [lists:foldl(fun({K,V},J) -> modkazoo_util:set_value(K,V,J) end, CurrGateway, PropsGateway),
             lists:foldl(fun({K,V},J) -> modkazoo_util:set_value(K,V,J) end, ?EMPTY_RESOURCE, PropsResource)];
        _ ->
            CurrResource = kz_resource_info(ResourceId, Context),
            [CurrGateway|_] = modkazoo_util:get_value(<<"gateways">>,CurrResource),
            [lists:foldl(fun({K,V},J) -> modkazoo_util:set_value(K,V,J) end, CurrGateway, PropsGateway),
             lists:foldl(fun({K,V},J) -> modkazoo_util:set_value(K,V,J) end, CurrResource, PropsResource)]
    end,
    DataBag = ?MK_DATABAG(modkazoo_util:set_value(<<"gateways">>,[Gateway],Resource)),
    case ResourceId of
        <<>> ->
            API_String = case kz_current_context_superadmin(Context) of
                'true' -> <<?V2/binary, ?RESOURCES/binary>>; 
                'false' -> <<?V2/binary, ?ACCOUNTS(Context)/binary, ?RESOURCES/binary>>
            end,
            _ = crossbar_account_request('put', API_String, DataBag, Context);
        _ ->
            API_String = case kz_current_context_superadmin(Context) of
                'true' -> <<?V2/binary, ?RESOURCES/binary, "/", ?TO_BIN(ResourceId)/binary>>; 
                'false' -> <<?V2/binary, ?ACCOUNTS(Context)/binary, ?RESOURCES/binary, "/", ?TO_BIN(ResourceId)/binary>>
            end,
            _ = crossbar_account_request('post', API_String, DataBag, Context)
    end.

super_account_id(Context) ->
    case z_context:get_session('super_account_id', Context) of
        'undefined' ->
            {'ok', {'account_id', SuperAccountId}, {'auth_token', _}, {'crossbar', _}} = kz_admin_creds(Context),
            z_context:set_session('super_account_id', SuperAccountId, Context),
            SuperAccountId;
        AccountId ->
             AccountId
    end.

kz_list_account_notifications(Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?NOTIFICATIONS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_notification_info(NotificationId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_notification_info(NotificationId, AccountId, Context).

kz_notification_info(NotificationId, AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?NOTIFICATIONS/binary, "/", ?TO_BIN(NotificationId)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_delete_notification_template(NotificationId, AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?NOTIFICATIONS/binary, "/", ?TO_BIN(NotificationId)/binary>>,
    crossbar_account_request('delete', API_String, [], Context).

kz_notification_template(ContentType, NotificationId, Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    kz_notification_template(ContentType, NotificationId, AccountId, Context).

kz_notification_template(ContentType, NotificationId, AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?NOTIFICATIONS/binary, "/", ?TO_BIN(NotificationId)/binary>>,
    AuthToken = z_context:get_session(kazoo_auth_token, Context),
    erlang:list_to_binary(crossbar_account_send_raw_request_body(AuthToken, 'get', API_String, [{"Accept", ContentType}], [], Context,"")).

kz_save_notification_template(ContentType, NotificationId, AccountId, MessageBody, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?NOTIFICATIONS/binary, "/", ?TO_BIN(NotificationId)/binary>>,
    crossbar_account_send_request('post', API_String, ContentType, MessageBody, Context).

rs_kz_all_customers_update(AccountId, Context) ->
    rs_kz_customer_update('undefined', AccountId, Context).

rs_kz_customer_update(RecipientAccountId, AccountId, Context) ->
    CurrNotifyDoc = kz_notification_info(<<"customer_update">>, Context),
    Values = 
        [{[<<"to">>,<<"email_addresses">>], emails_list('input_to', Context)}
        ,{[<<"to">>,<<"type">>], z_context:get_q('to', Context)}
        ,{[<<"cc">>,<<"email_addresses">>], emails_list('input_cc', Context)}
        ,{[<<"cc">>,<<"type">>], z_context:get_q('cc', Context)}
        ,{[<<"bcc">>,<<"email_addresses">>], emails_list('input_bcc', Context)}
        ,{[<<"bcc">>,<<"type">>], z_context:get_q('bcc', Context)}
        ,{[<<"from">>], z_context:get_q('from', Context)}
        ,{[<<"subject">>], z_context:get_q('subject', Context)}
        ,{[<<"template_charset">>], <<"utf-8">>}
        ,{<<"plain">>, z_context:get_q(text_body, Context)}
        ,{<<"html">>, base64:encode(z_context:get_q('html_body', Context))}
        ,{<<"user_type">>, z_context:get_q('selected_user', Context)}
        ,{<<"recipient_id">>, RecipientAccountId}
        ],
    NewDoc = maybe_fields(Values, CurrNotifyDoc),
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?NOTIFICATIONS/binary, ?CUSTOMER_UPDATE/binary, ?MESSAGE/binary>>,
    crossbar_account_send_request('post', API_String, ?MK_DATABAG(NewDoc), Context).

kz_list_account_lists(Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?LISTS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

account_list(Context) ->
    ListId = z_context:get_q("list_id", Context),
    CurrDoc = case ListId of
        'undefined' -> ?EMPTY_JSON_OBJECT;
         _ -> kz_get_account_list(ListId, Context)
    end,
    Routines = [fun(J) -> modkazoo_util:set_value(<<"name">>, modkazoo_util:get_q_bin("list_name",Context), J) end
                ,fun(J) -> modkazoo_util:set_value(<<"description">>, modkazoo_util:get_q_bin("list_description",Context), J) end
                ,fun(J) -> modkazoo_util:set_value(<<"list_type">>, modkazoo_util:get_q_bin("list_type",Context), J) end
               ],
    NewDoc = lists:foldl(fun(F, J) -> F(J) end, CurrDoc, Routines),
    case ListId of
        'undefined' ->
            API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?LISTS/binary>>,
            crossbar_account_request('put', API_String, ?MK_DATABAG(NewDoc), Context);
        _ ->
            API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?LISTS/binary, "/", ?TO_BIN(ListId)/binary>>,
            crossbar_account_request('post', API_String, ?MK_DATABAG(NewDoc), Context)
    end.

delete_account_list(ListId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?LISTS/binary, "/", ?TO_BIN(ListId)/binary>>,
    crossbar_account_request('delete', API_String, [], Context).

delete_account_list_entry(EntryId, ListId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?LISTS/binary, "/", ?TO_BIN(ListId)/binary,
                                                          ?ENTRIES/binary, "/", ?TO_BIN(EntryId)/binary>>,
    crossbar_account_request('delete', API_String, [], Context).

kz_get_account_list(ListId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?LISTS/binary, "/", ?TO_BIN(ListId)/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_list_account_list_entries(ListId,Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?LISTS/binary, "/", ?TO_BIN(ListId)/binary, ?ENTRIES/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_account_list_add_entry(ListType, ListId, Context) ->
    EntryId = z_context:get_q('entry_id', Context),
    CurrDoc = case EntryId of
        <<>> -> ?EMPTY_JSON_OBJECT;
         _ -> kz_get_account_list_entry(EntryId, ListId, Context)
    end,
    Routines = list_routines(ListType, Context),
    NewDoc = lists:foldl(fun(F, J) -> F(J) end, CurrDoc, Routines),
    case EntryId of
        'undefined' ->
            API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?LISTS/binary, "/", ListId/binary, ?ENTRIES/binary>>,
            crossbar_account_request('put', API_String, ?MK_DATABAG(NewDoc), Context);
        _ ->
            API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?LISTS/binary, "/", ListId/binary,
                                                                  ?ENTRIES/binary, "/", EntryId/binary>>,
            crossbar_account_request('post', API_String, ?MK_DATABAG(NewDoc), Context)
    end.

list_routines(<<"phone_book">>, Context) ->
    [fun(J) -> modkazoo_util:set_value(<<"number">>, modkazoo_util:cleanout(z_context:get_q('list_entry_number', Context)), J) end
    ,fun(J) -> modkazoo_util:set_value(<<"displayname">>, z_context:get_q('list_entry_displayname', Context), J) end
    ];
list_routines(<<"dynamic_cid">>, Context) ->
    [fun(J) -> modkazoo_util:set_value(<<"cid_key">>, z_context:get_q('cid_key', Context), J) end
     ,fun(J) -> modkazoo_util:set_value(<<"cid_name">>, z_context:get_q('cid_name', Context), J) end
     ,fun(J) -> modkazoo_util:set_value(<<"cid_number">>, z_context:get_q('cid_number', Context), J) end
    ];
list_routines(_, Context) ->
    list_routines(<<"phone_book">>, Context).

kz_get_account_list_entry(_EntryId, _ListId, _Context) ->
    ?EMPTY_JSON_OBJECT.

sendmail_test_notification(Context) ->
    Email = z_context:get_q(chosen_email, Context),
    AccountId = z_context:get_session(kazoo_account_id, Context),
    NotificationId = z_context:get_q(notification_id, Context),
    sendmail_test_notification(Email, AccountId, NotificationId, Context).

sendmail_test_notification(Email, AccountId, NotificationId, Context) ->
    CurrNotifyDoc = kz_notification_info(NotificationId, Context),
    Plain = ?TO_BIN(kz_notification_template("text/plain", NotificationId, AccountId, Context)),
    HTML = kz_notification_template("text/html", NotificationId, AccountId, Context),
    Routines = [fun(J) -> modkazoo_util:set_value([<<"to">>,<<"email_addresses">>], [Email], J) end
                ,fun(J) -> modkazoo_util:set_value([<<"to">>,<<"type">>], <<"specified">>, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"template_charset">>], <<"utf-8">>, J) end
                ,fun(J) -> modkazoo_util:set_value([<<"enabled">>], 'true', J) end
                ,fun(J) -> modkazoo_util:set_value(<<"from">>, Email, J) end
                ,fun(J) -> modkazoo_util:set_value(<<"reply_to">>, Email, J) end
                ,fun(J) -> modkazoo_util:set_value(<<"plain">>, Plain, J) end
                ,fun(J) -> modkazoo_util:set_value(<<"html">>, base64:encode(HTML), J) end
               ],
    NewDoc = lists:foldl(fun(F, J) -> F(J) end, CurrNotifyDoc, Routines),
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?NOTIFICATIONS/binary, "/", NotificationId/binary, ?PREVIEW/binary>>,
    _ = crossbar_account_request('post', API_String, ?MK_DATABAG(NewDoc), Context),
    case modkazoo_util:get_value(<<"account_overridden">>, CurrNotifyDoc) of
        'undefined' ->
            _ = kz_save_notification_template("text/html", NotificationId, AccountId, HTML, Context),
            _ = kz_save_notification_template("text/plain", NotificationId, AccountId, Plain, Context);
        _ -> 'ok'
    end.

notifications_smtplog(Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?NOTIFICATIONS/binary, ?SMTPLOG/binary>>,
    {'ok', _, _, Body} = crossbar_account_send_request('get', API_String, "text/plain", [], Context),
    modkazoo_util:get_value(<<"data">>,jiffy:decode(Body)). 

notifications_smtplog_by_id(LogId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?NOTIFICATIONS/binary, ?SMTPLOG/binary, "/", (?TO_BIN(LogId))/binary>>,
    crossbar_account_request('get', API_String, [], Context).

kz_notifications(Context) ->
    AccountId = z_context:get_session(kazoo_account_id, Context),
    NotificationId = z_context:get_q('notification_id', Context),
    CurrNotifyDoc = kz_notification_info(NotificationId, Context),
    Plain = ?TO_BIN(kz_notification_template("text/plain", NotificationId, AccountId, Context)),
    HTML = kz_notification_template("text/html", NotificationId, AccountId, Context),
    Values =
        [{[<<"to">>,<<"email_addresses">>], emails_list('input_to', Context)}
        ,{[<<"to">>,<<"type">>], z_context:get_q('to', Context)}
        ,{[<<"cc">>,<<"email_addresses">>], emails_list('input_cc', Context)}
        ,{[<<"cc">>,<<"type">>], z_context:get_q('cc', Context)}
        ,{[<<"bcc">>,<<"email_addresses">>], emails_list('input_bcc', Context)}
        ,{[<<"bcc">>,<<"type">>], z_context:get_q('bcc', Context)}
        ,{[<<"from">>], z_context:get_q('from', Context)}
        ,{[<<"subject">>], z_context:get_q('subject', Context)}
        ,{[<<"template_charset">>], <<"utf-8">>}
        ],
    NewDoc = maybe_fields(Values, CurrNotifyDoc),
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?NOTIFICATIONS/binary, "/", NotificationId/binary>>,
    _ = crossbar_account_request('post', API_String, ?MK_DATABAG(NewDoc), Context),
    case modkazoo_util:get_value(<<"account_overridden">>, CurrNotifyDoc) of
        'undefined' ->
            _ = kz_save_notification_template("text/html", NotificationId, AccountId, HTML, Context),
            _ = kz_save_notification_template("text/plain", NotificationId, AccountId, Plain, Context);
        _ -> 'ok'
    end.

emails_list(Field, Context) ->
    case ?EMPTY(z_context:get_q(Field, Context)) of
        'undefined' -> 'undefined';
        Emails -> lists:map(fun (K) ->
                              re:replace(K, "[^A-Za-z0-9@_.-]", "", [global, {return, binary}])
                          end
                         ,binary:split(Emails, <<",">>, [global])
                         )
    end.

kz_notification_toggle(State, NotificationId, Context) ->
    AccountId = z_context:get_session(kazoo_account_id, Context),
    CurrNotifyDoc = kz_notification_info(NotificationId, Context),
    Plain = ?TO_BIN(kz_notification_template("text/plain", NotificationId, AccountId, Context)),
    HTML = kz_notification_template("text/html", NotificationId, AccountId, Context),
    Routines = [fun(J) -> modkazoo_util:set_value([<<"enabled">>], State, J) end],
    NewDoc = lists:foldl(fun(F, J) -> F(J) end, CurrNotifyDoc, Routines),
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?NOTIFICATIONS/binary, "/", ?TO_BIN(NotificationId)/binary>>,
    _ = crossbar_account_request('post', API_String, ?MK_DATABAG(NewDoc), Context),
    case modkazoo_util:get_value(<<"account_overridden">>, CurrNotifyDoc) of
        'undefined' ->
            _ = kz_save_notification_template("text/html", NotificationId, AccountId, HTML, Context),
            _ = kz_save_notification_template("text/plain", NotificationId, AccountId, Plain, Context);
        _ -> 'ok'
    end.

list_system_dialplans(Context) -> 
    API_String = case kz_current_context_superadmin(Context) of
        'true' -> <<?V2/binary, ?DIALPLANS/binary>>; 
        'false' -> <<?V2/binary, ?ACCOUNTS(Context)/binary, ?DIALPLANS/binary>>
    end,
    case crossbar_account_request('get', API_String, [], Context) of
        <<>> -> {[]};
        JObj -> JObj
    end.

list_system_dialplans_names(Context) -> 
    Dialplans = modkazoo_util:to_proplist(list_system_dialplans(Context)),
    lists:usort(lists:foldl(fold_dialplan_names(), [], Dialplans)).

fold_dialplan_names() ->
    fun({_, Val}, Acc) when is_list(Val) ->
        lists:foldl(fun(ValElem, A) -> [modkazoo_util:get_value(<<"name">>, ValElem)] ++ A end, Acc, Val);
       ({_, Val}, Acc) ->
        [modkazoo_util:get_value(<<"name">>, Val)] ++ Acc
    end.

kz_set_reseller_status(Verb, AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?RESELLER/binary>>,
    crossbar_account_request(Verb, API_String, [], Context).

kz_toggle_reseller_status(AccountId, Context) ->
    case kz_reseller_status(AccountId, Context) of
        'true' -> kz_set_reseller_status('delete', AccountId, Context);
        _ -> kz_set_reseller_status('put', AccountId, Context)
    end.

kz_toggle_account_status(AccountId, Context) ->
    kz_toggle_account_doc(<<"enabled">>, AccountId, Context).

per_minute_calls(Transactions) ->
    Fun = fun(Transaction) -> modkazoo_util:get_value(<<"reason">>, Transaction) == <<"per_minute_call">> end,
    modkazoo_util:filter(Fun, Transactions).

credit_transactions(Transactions) ->
    Fun = fun(Transaction) ->
              (modkazoo_util:get_value(<<"type">>, Transaction) == <<"credit">>)
              and
              (modkazoo_util:get_value(<<"reason">>, Transaction) =/= <<"database_rollup">>)
          end,
    modkazoo_util:filter(Fun, Transactions).

debit_transactions(Transactions) ->
    Fun = fun(Transaction) ->
              (modkazoo_util:get_value(<<"type">>, Transaction) == <<"debit">>)
              and
              (modkazoo_util:get_value(<<"reason">>, Transaction) =/= <<"per_minute_call">>)
              and
              (modkazoo_util:get_value(<<"reason">>, Transaction) =/= <<"database_rollup">>)
          end,
    modkazoo_util:filter(Fun, Transactions).

kz_account_access_lists(Verb, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?ACCESS_LISTS/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

kz_device_access_lists(Verb, DeviceId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?DEVICES(DeviceId)/binary, ?ACCESS_LISTS/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

kz_limits(Verb, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?LIMITS/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context, 'return_error').

save_trunks_limits(InputValue, TrunksType, AccountId, AcceptCharges, Context) ->
    CurrDoc = kz_limits('get', AccountId, [], Context),
    QtyDiff = ?TO_INT(InputValue) - modkazoo_util:get_value(?TO_BIN(TrunksType), CurrDoc, 0),
    Upd = [{?TO_BIN(TrunksType), ?TO_INT(InputValue)}
          ],
    NewDoc = modkazoo_util:set_values(Upd, CurrDoc),
    Routines = [fun(C) -> z_render:update("trunks_manager_table"
                                         ,z_template:render("trunks_manager_table_body.tpl", [], C)
                                         ,C)
                end
               ],
    case kz_limits('post', AccountId, ?SET_ACCEPT_CHARGES(AcceptCharges, NewDoc), Context) of
        {'error', "402", Body} ->
            Data = modkazoo_util:get_value(<<"data">>, jiffy:decode(Body)),
            case modkazoo_util:get_value([<<"limits">>,?TO_BIN(TrunksType)], Data) of
                'undefined' ->
                    Message = modkazoo_util:get_value(<<"message">>, Data),
                    z_render:growl_error(?TO_LST(Message), Context);
                LimitsItem ->
                    Expences = QtyDiff * modkazoo_util:get_value(<<"activation_charge">>, LimitsItem)
                               + QtyDiff * modkazoo_util:get_value(<<"rate">>, LimitsItem),
                    CurrentAccountCredit = modkazoo_util:get_value(<<"amount">>, current_account_credit(AccountId, Context)),
                    PVT_Limits = onbill_util:onbill_pvt_limits('get', AccountId, [], Context),
                    MaybePostpayCredit =
                        case modkazoo_util:get_value(<<"allow_postpay">>, PVT_Limits, 'false') of
                            'true' ->
                                modkazoo_util:get_value(<<"max_postpay_amount">>, PVT_Limits, 0);
                            'false' -> 0
                        end,
                    case Expences > (CurrentAccountCredit + MaybePostpayCredit) of
                        'true' ->
                            Ctx = lists:foldl(fun(F, J) -> F(J) end, Context, Routines),
                            z_render:growl_error(?__("Not enough funds.",Ctx), Ctx);
                        'false' ->
                            z_render:dialog(?__("Charges Confirmation",Context)
                                           ,"_accept_trunks_limits_charges.tpl"
                                           ,[{item, LimitsItem}
                                            ,{quantity_diff, QtyDiff}
                                            ,{trunks_type, TrunksType}
                                            ,{account_id, AccountId}
                                            ,{width, "auto"}
                                            ]
                                           ,Context)
                    end
            end;
        {'error', _ReturnCode, Body} ->
            Message = modkazoo_util:get_value([<<"data">>,<<"message">>], jiffy:decode(Body)),
            Ctx = lists:foldl(fun(F, J) -> F(J) end, Context, Routines),
            z_render:growl_error(?TO_LST(Message), Ctx);
        _ ->
            Ctx = lists:foldl(fun(F, J) -> F(J) end, Context, Routines),
            z_render:growl(?__("Trunks amount successfully changed.", Ctx), Ctx)
    end.

kz_allotments(Verb, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?ALLOTMENTS/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

kz_allotments_consumed(Verb, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?ALLOTMENTS/binary, ?CONSUMED/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

allotment_element_delete(AllotmentElementName, AccountId, Context) ->
    CurrAllotments = kz_allotments('get', AccountId, [], Context),
    NewAllotments = modkazoo_util:delete_key(AllotmentElementName, CurrAllotments),
    kz_allotments('post', AccountId, ?MK_DATABAG(NewAllotments), Context).

allotment_element_add(AllotmentElementName, AccountId, Context) ->
    CurrAllotments = kz_allotments('get', AccountId, [], Context),
    NewAllotments = modkazoo_util:set_value(AllotmentElementName, (?DEFAULT_ALLOTMENTS), CurrAllotments),
    kz_allotments('post', AccountId, ?MK_DATABAG(NewAllotments), Context).

allotment_element_set_field(InputValue, FieldName, AllotmentElementName, AccountId, Context) ->
    FieldValue = case FieldName of
                     "cycle" -> ?TO_BIN(InputValue);
                     "group_consume" -> [?TO_BIN(InputValue)];
                     _ -> ?TO_INT(InputValue)
                 end,
    CurrAllotments = kz_allotments('get', AccountId, [], Context),
    NewAllotments = modkazoo_util:set_value([?TO_BIN(AllotmentElementName), ?TO_BIN(FieldName)], FieldValue, CurrAllotments),
    kz_allotments('post', AccountId, ?MK_DATABAG(NewAllotments), Context).

set_e911_number_service(AddressValues, Number, AccountId, Context) ->
    NumberDoc = kazoo_util:phone_number('get', Number, AccountId, [], Context),
    Features = modkazoo_util:get_value(<<"features">>, NumberDoc, []),
    NewFeatures = lists:usort([<<"e911">>] ++ Features),
    E911AddrJObj = modkazoo_util:set_values(AddressValues, modkazoo_util:new()),
    Routines =
        [fun(JObj) -> modkazoo_util:set_value(<<"features">>, NewFeatures, JObj) end
        ,fun(JObj) -> modkazoo_util:set_value(<<"e911">>, E911AddrJObj, JObj) end],
    NewDoc = lists:foldl(fun(F, JObj) -> F(JObj) end, NumberDoc, Routines),
    kazoo_util:phone_number('post', Number, AccountId, ?MK_DATABAG(NewDoc), Context).

remove_e911_number_service(Number, AccountId, Context) ->
    NumberDoc = kazoo_util:phone_number('get', Number, AccountId, [], Context),
    Features = modkazoo_util:get_value(<<"features">>, NumberDoc, []),
    NewFeatures = lists:delete(<<"e911">>, Features),
    Routines =
        [fun(JObj) -> modkazoo_util:set_value(<<"features">>, NewFeatures, JObj) end
        ,fun(JObj) -> modkazoo_util:delete_key(<<"e911">>, JObj) end],
    NewDoc = lists:foldl(fun(F, JObj) -> F(JObj) end, NumberDoc, Routines),
    kazoo_util:phone_number('post', Number, AccountId, ?MK_DATABAG(NewDoc), Context).

is_trial_account(Context) ->
    AccountId = z_context:get_session('kazoo_account_id', Context),
    is_trial_account(AccountId, Context).

is_trial_account(AccountId, Context) ->
    case kz_account_doc_field(<<"trial_time_left">>, AccountId, Context) of
        'undefined' -> 'false';
        TimeLeft -> {'true', TimeLeft}
    end.

services_status(Verb, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?SERVICES/binary, ?STATUS/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

toggle_services_status(AccountId, Context) ->
    StatusData = services_status('get', AccountId, [], Context),
    case modkazoo_util:get_value(<<"in_good_standing">>, StatusData) of
        'false' ->
            DataBag = ?MK_DATABAG({[{<<"in_good_standing">>, 'true'},{<<"reason">>,<<"administratively_justified">>}]}),
            services_status('post', AccountId, DataBag, Context);
        'true' ->
            DataBag = ?MK_DATABAG({[{<<"in_good_standing">>, 'false'},{<<"reason">>,<<"administratively_convicted">>}]}),
            services_status('post', AccountId, DataBag, Context)
    end.

all_tasks(Context) ->
    API_String = <<?V2/binary, ?TASKS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

account_tasks(Verb, AccountId, DataBag, Context) ->
    account_tasks(Verb, AccountId, "application/json", DataBag, Context).

account_tasks(Verb, AccountId, ContentType, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?TASKS/binary>>,
    {'ok', _, _, Body} = crossbar_account_send_request(Verb, API_String, ContentType, DataBag, Context),
    modkazoo_util:get_value(<<"data">>,jiffy:decode(Body)).

get_tasks_csv(AttName, TaskId, AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?TASKS/binary
                  ,"/", ?TO_BIN(TaskId)/binary, "?csv_name=", ?TO_BIN(AttName)/binary>>,
    crossbar_account_send_raw_request('get', API_String, [{"Accept", "text/csv"}], [], Context).

account_task(Verb, TaskId, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?TASKS/binary, "/", ?TO_BIN(TaskId)/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

add_new_task(Context) ->
    case z_context:get_q("task_args", Context) of
        {upload, UploadFilename, UploadTmp, _, _} ->
            add_new_task_file(UploadFilename, UploadTmp, Context);
        <<Day:2/binary,"/",Month:2/binary,"/",Year:4/binary>> ->
            GregSec = calendar:datetime_to_gregorian_seconds({{?TO_INT(Year), ?TO_INT(Month), ?TO_INT(Day)},{12,0,0}}),
            DataBag = ?MK_DATABAG(modkazoo_util:set_value([<<"records">>, <<"billing_period_ts">>], GregSec, modkazoo_util:new())),
            Category = modkazoo_util:get_q_bin(<<"task_category">>, Context),
            Action = modkazoo_util:get_q_bin(<<"task_action">>, Context),
            add_new_task('put', Category, Action, DataBag, Context);
        _ ->
            Category = modkazoo_util:get_q_bin(<<"task_category">>, Context),
            Action = modkazoo_util:get_q_bin(<<"task_action">>, Context),
            add_new_task('put', Category, Action, [], Context)
    end.

add_new_task(Verb, Category, Action, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?TASKS/binary
                  ,"?category=", Category/binary, "&action=", Action/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

add_new_task_file(UploadFilename, UploadTmp, Context) ->
    Category = modkazoo_util:get_q_bin(<<"task_category">>, Context),
    Action = modkazoo_util:get_q_bin(<<"task_action">>, Context),
    {ok, Data} = file:read_file(UploadTmp),
    Mime =
        case binary:split(?TO_BIN(UploadFilename), <<".csv">>) of
            [_,_] -> "text/csv";
            _ ->
                {ok, IdnProps} = z_media_identify:identify(UploadTmp, UploadFilename, Context),
                proplists:get_value(mime, IdnProps)
        end,
    Headers = [{"Content-Type",Mime}],
    API_String = <<?V2/binary, ?ACCOUNTS(Context)/binary, ?TASKS/binary, "?category=", Category/binary
                  ,"&action=", Action/binary, "&file_name=", ?TO_BIN(UploadFilename)/binary>>,
    crossbar_account_send_raw_request('put', API_String, Headers, Data, Context).

metaflows(Verb, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?METAFLOWS/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

config(Verb, Category, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?CONFIGS/binary, "/", Category/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

set_config_field(K, V, Category, AccountId, Context) ->
    CurrDoc = config('get', Category, AccountId, [], Context),
    NewDoc = modkazoo_util:set_value(K, V, CurrDoc),
    config('post', Category, AccountId, ?MK_DATABAG(NewDoc), Context).

config_toggle(K, Category, AccountId, Context) ->
    CurrDoc = config('get', Category, AccountId, [], Context),
    case modkazoo_util:get_value(K, CurrDoc) of
        'true' -> set_config_field(K, 'false', Category, AccountId, Context);
        _ -> set_config_field(K, 'true', Category, AccountId, Context)
    end.

queues(Verb, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?QUEUES/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

queue(Verb, QueueId, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?QUEUES/binary, "/", QueueId/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

queue_update(Context) ->
    AccountId = z_context:get_session(kazoo_account_id, Context),
    QueueName = z_context:get_q('queue_name', Context),
    Values = modkazoo_util:filter_undefined(
        [{<<"name">>, QueueName}
        ,{<<"strategy">>,z_context:get_q('strategy', Context)}
        ,{<<"enter_when_empty">>,modkazoo_util:on_to_true(z_context:get_q('enter_when_empty', Context))}
        ,{<<"record_caller">>,modkazoo_util:on_to_true(z_context:get_q('record_caller', Context))}
        ,{<<"agent_ring_timeout">>,?TO_INT(z_context:get_q('agent_ring_timeout', Context))}
        ,{<<"agent_wrapup_time">>,?TO_INT(z_context:get_q('agent_wrapup_time', Context))}
        ,{<<"caller_exit_key">>,z_context:get_q('caller_exit_key', Context)}
        ,{<<"connection_timeout">>,?TO_INT(z_context:get_q('connection_timeout', Context))}
        ,{<<"max_queue_size">>,?TO_INT(z_context:get_q('max_queue_size', Context))}
        ,{<<"ring_simultaneously">>,?TO_INT(z_context:get_q('ring_simultaneously', Context))}
        ]),
    KVs = [{<<"announce">>, modkazoo_util:to_undefined(z_context:get_q('announce', Context))}
          ,{<<"moh">>, modkazoo_util:to_undefined(z_context:get_q('moh', Context))}],
    case z_context:get_q('queue_id', Context) of
        'undefined' ->
            Queue = maybe_fields(KVs, modkazoo_util:set_values(Values, modkazoo_util:new())),
            queues('put', AccountId, ?MK_DATABAG(Queue), Context);
        QueueId ->
            CurrQueue = queue('get', QueueId, AccountId, [], Context),
            Queue = maybe_fields(KVs, modkazoo_util:set_values(Values, CurrQueue)),
            queue('post', QueueId, AccountId, ?MK_DATABAG(Queue), Context)
    end.

maybe_fields([], JObj) ->
    JObj;
maybe_fields([{K,V}|T], JObj) ->
    maybe_fields(T, maybe_field(K, V, JObj)).

maybe_field(Key, 'undefined', JObj) ->
    modkazoo_util:delete_key(Key, JObj);
maybe_field(Key, Value, JObj) ->
    modkazoo_util:set_value(Key, Value, JObj).

queue_agents_roster(Context) ->
    case z_context:get_q('queue_id', Context) of
        'undefined' ->
            Context;
        QueueId ->
            AccountId = z_context:get_session(kazoo_account_id, Context),
            Agents =
                lists:foldr(fun(T,J) -> case T of
                                            <<_:32/binary>> -> [T]++J;
                                            _ -> J
                                        end
                            end
                           ,[]
                           ,z_context:get_q_all('user', Context)),
            queue_roster('post', QueueId, AccountId, ?MK_DATABAG(Agents), Context)
    end.

queue_roster(Verb, QueueId, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?QUEUES/binary, "/", QueueId/binary, ?ROSTER/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

acdc_call_stats(AccountId, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?ACDC_CALL_STATS/binary>>,
    crossbar_account_request('get', API_String, [], Context).

agents(Verb, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?AGENTS/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

agent(Verb, AgentId, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?AGENTS/binary, "/", AgentId/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

agents_status(Verb, AgentId, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?AGENTS/binary, "/", AgentId/binary, ?STATUS/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

agents_queue_status(Verb, AgentId, AccountId, DataBag, Context) ->
    API_String = <<?V2/binary, ?ACCOUNTS/binary, AccountId/binary, ?AGENTS/binary, "/", AgentId/binary, ?QUEUE_STATUS/binary>>,
    crossbar_account_request(Verb, API_String, DataBag, Context).

forgottenpwd(Context) ->
    Username = z_convert:to_binary(z_context:get_q('forgotten_username',Context)),
    NumberOrName = modkazoo_util:normalize_account_name(z_context:get_q('forgotten_account_name',Context)),
    case password_recovery(Username, NumberOrName, Context) of
        <<>> -> z_render:growl_error(?__("No account found",Context), Context);
        Answer ->
            lager:info("Password recovery request answer: ~p",[Answer]),
            Routines = [fun(Ctx) ->
                            z_render:wire([{set_class, [{target, "forgot-pwd-box"},{class,"search-box hidden"}]}]
                                         ,Ctx)
                        end
                       ,fun(Ctx) -> z_render:growl(?__("Please check your mailbox", Ctx), Ctx) end
                       ,fun(Ctx) ->
                            z_render:update("password_change_span_id"
                                           ,z_template:render("password_change_check_email.tpl",[],Ctx)
                                           ,Ctx)
                        end
                       ],
            lists:foldl(fun(F, Ctx) -> F(Ctx) end, Context, Routines)
    end.

maybe_masked(Context) ->
    z_context:get_session(kazoo_reseller_account_id, Context) =/= 'undefined'
    andalso (z_context:get_session(kazoo_account_id, Context)
             =/= z_context:get_session(kazoo_reseller_account_id, Context)).

token_auth(AuthToken, Context) ->
    API_String = <<?V2/binary, ?TOKEN_AUTH/binary>>,
    crossbar_account_send_request('get', API_String, "application/json", [], AuthToken, Context).
