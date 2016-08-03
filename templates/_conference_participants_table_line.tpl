            <td style="text-align: center;">
              {{ participant["channel"][1]["custom_channel_vars"][1]["presence_id"]|split:"@"|first }}
            </td>

            <td style="text-align: center;">
              {% if participant["talking"] %}
                <i id="talking_{{ participant_id }}" class="fa fa-check zalarm pointer" title="Speaking now"></i>
              {% else %}
                <i id="talking_{{ participant_id }}"  class="fa fa-remove zprimary pointer" title="Keeps silence"></i>
              {% endif %}
            </td>

            <td style="text-align: center;">
              {% if participant["speak"] %}
                <i id="mic_{{ participant_id }}" class="fa fa-check zprimary pointer" title="Enabled"></i>
               {% wire id="mic_"++participant_id
                       action={confirm text="Do you really want to switch microphone off?"
                                       action={postback postback={do_conference_participant_action
                                                                  action="mute"
                                                                  participant_id=participant_id
                                                                  conference_id=conference_id 
                                                                 }
                                                        delegate="mod_kazoo"
                                              }
                              }
               %} 
              {% else %}
                <i id="mic_{{ participant_id }}"  class="fa fa-remove zalarm pointer" title="Disabled"></i>
               {% wire id="mic_"++participant_id
                       action={confirm text="Do you really want to switch microphone on?"
                                       action={postback postback={do_conference_participant_action 
                                                                  action="unmute"
                                                                  participant_id=participant_id
                                                                  conference_id=conference_id 
                                                                 }
                                                        delegate="mod_kazoo"
                                              }
                              }
               %} 
              {% endif %}
            </td>

            <td style="text-align: center;">
              {% if participant["hear"] %}
                <i id="speaker_{{ participant_id }}" class="fa fa-check zprimary pointer" title="Enabled"></i>
               {% wire id="speaker_"++participant_id
                       action={confirm text="Do you really want to switch speaker off?"
                                       action={postback postback={do_conference_participant_action
                                                                  action="deaf"
                                                                  participant_id=participant_id
                                                                  conference_id=conference_id 
                                                                 }
                                                        delegate="mod_kazoo"
                                              }
                              }
               %} 
              {% else %}
                <i id="speaker_{{ participant_id }}"  class="fa fa-remove zalarm pointer" title="Disabled"></i>
               {% wire id="speaker_"++participant_id
                       action={confirm text="Do you really want to switch speaker on?"
                                       action={postback postback={do_conference_participant_action 
                                                                  action="undeaf"
                                                                  participant_id=participant_id
                                                                  conference_id=conference_id 
                                                                 }
                                                        delegate="mod_kazoo"
                                              }
                              }
               %} 
              {% endif %}
            </td>

            <td style="text-align: center;">
              <i id="kick_{{ participant_id}}" style="cursor: pointer;" class="fa fa-trash-o" title="Delete"></i>
            </td>
            {% wire id="kick_"++participant_id
                    action={confirm text="Do you really want to kick this participant off?"
                                    action={postback postback={do_conference_participant_action
                                                               action="kick"
                                                               participant_id=participant_id
                                                               conference_id=conference_id 
                                                              }
                                                     delegate="mod_kazoo"
                                           }
                           }
            %} 
            <td style="text-align: center;">
              <i id="pinfo_{{ participant_id }}" class="fa fa-info-circle zprimary pointer" title="{_ Participant information _}"></i>
            </td>
            {% wire id="pinfo_"++participant_id
                    action={ dialog_open title=participant["Custom-Channel-Vars"][1]["Presence-ID"]|split:"@"|first
                                         template="_details_conference.tpl"
                                         conference_id=conference_id width="auto"
                           }
            %}