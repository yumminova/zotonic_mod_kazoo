{% with m.kazoo.get_user_timezone as timezone %}
<table id="rs_payments_lists_table" class="table display table-striped table-condensed">
  <thead>
    <tr>
      <th class="td-center">{_ Date _}</th>
      <th class="td-center1">{_ Description _}</th>
      <th class="td-center">{_ Sum _}</th>
      <th class="td-center"></th>
    </tr>
  </thead>
  <tbody>
    {% for
         transaction
       in
         m.kazoo[{kz_list_transactions account_id=account_id
                                       selected_billing_period=selected_billing_period
                                       type="credit"}]
    %}
      <tr id={{ transaction["id"] }}
          {% if transaction["subscription_id"] %}
            style="cursor: pointer;"
          {% endif %}>
        <td class="td-center">
          {{ transaction["created"]|gregsec_to_date|date:"Y-m-d H:i T":timezone }}
        </td>
        <td class="td-center1">
          {% if transaction["description"] %}
            {{ transaction["description"] }}
          {% else %}
            {{ transaction["reason"] }}
          {% endif %}
        </td>
        <td class="pri-1 td-right">
          {{ transaction["amount"]|format_price:[".",""]|currency_sign }}
        </td>
        <td class="td-center1">
          {% if transaction["metadata"][1]["invoice_id"] %}
           <a target="_blank"
              href="{{ m.onbill[{attachment_download_link account_id=account_id
                                                          doc_id=transaction["metadata"][1]["invoice_id"]
                                                          doc_type="onbill_modb"}] }}">
            <i class="fa fa-money pointer" aria-hidden="true"></i></a>
          {% else %}
            <i id="invoice_me_{{ transaction["id"]|cleanout }}"
               class="fa fa-paper-plane pointer"
               aria-hidden="true"
               title="Issue an invoice"></i>
            {% wire id="invoice_me_"++transaction["id"]|cleanout
                    action={dialog_open template="_issue_invoice_for_transaction.tpl"
                                        title="Issue an invoice for"
                                                ++
                                              " "
                                                ++
                                              transaction["description"]
                                                ++
                                              " "
                                                ++
                                              transaction["amount"]|format_price:[".",""]
                                                |currency_sign
                                        transaction=transaction
                                        account_id=account_id
                                        selected_billing_period=selected_billing_period
                           }
            %}
          {% endif %}
        </td>
      </tr>
    {% endfor %}
  </tbody>
</table>
{% endwith %}

{% javascript %}
//var initSearchParam = $.getURLParam("filter");
  var oTable = $('#rs_payments_lists_table').dataTable({
  "pagingType": "simple",
  "bFilter" : true,
  "aaSorting": [[ 0, "desc" ]],
  "aLengthMenu" : [[5, 15, -1], [5, 15, "All"]],
  "iDisplayLength" : 5,
  "oLanguage" : {
        "sInfoThousands" : " ",
        "sLengthMenu" : "_MENU_ {_ lines per page _}",
        "sSearch" : "{_ Filter _}:",
        "sZeroRecords" : "{_ Nothing found, sorry _}",
        "sInfo" : "{_ Showing _} _START_ {_ to _} _END_ {_ of _} _TOTAL_ {_ entries _}",
        "sInfoEmpty" : "{_ Showing 0 entries _}",
        "sInfoFiltered" : "({_ Filtered from _} _MAX_ {_ entries _})",
        "oPaginate" : {
                "sPrevious" : "{_ Back _}",
                "sNext" : "{_ Forward _}"
        }
  }
});
{% endjavascript %}
