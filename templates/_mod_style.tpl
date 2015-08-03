<style type="text/css">
.mkz-c1, .zprimary {color: {{ m.config.mod_kazoo.color1.value }}; }
.mkz-bc1 {background-color: {{ m.config.mod_kazoo.color1.value }}; }
.mkz-c2 {color: {{ m.config.mod_kazoo.color2.value }}; }
.mkz-bc2 {background-color: {{ m.config.mod_kazoo.color2.value }}; }
.mkz-c3 {color: {{ m.config.mod_kazoo.color3.value }}; }
.mkz-bc3 {background-color: {{ m.config.mod_kazoo.color3.value }}; }

.btn-zprimary,
.btn-zprimary:hover {
color: {{ m.config.mod_kazoo.color3.value }}!important;
background-color: {{ m.config.mod_kazoo.color1.value }};
border-color: {{ m.config.mod_kazoo.color1.value }};
}

.registered {
  color: {{ m.config.mod_kazoo.color1.value }};
  font-size: 18px!important;
}

.unregistered {
  color: {{ m.config.mod_kazoo.color2.value }};
  font-size: 18px!important;
}

.btn-zalarm,
.btn-zalarm:hover {
  color: {{ m.config.mod_kazoo.color3.value }}!important;
  background-color: {{ m.config.mod_kazoo.color2.value }};
  border-color: {{ m.config.mod_kazoo.color2.value }};
}

h2 {
  font-size: 30px;
  margin-top: 20px;
  margin-bottom: 10px;
}

h3 {
  font-size: 24px;
}

.onnet-service-description {
  font-size: 1.2em;
}

.onnet-07em {
  font-size: 0.7em;
}

a {
  color: {{ m.config.mod_kazoo.color1.value }};
}

.nav-tabs > li > a {
  color: {{ m.config.mod_kazoo.color1.value }};
}

.nav-tabs>li.active>a, 
.nav-tabs>li.active>a:hover, 
.nav-tabs>li.active>a:focus {
  color: #E86110;
}

/* Hide made by reCaptcha empty iframe */
body > iframe[src="about:blank"] {
  display:none;
}

.navbar-nav li#order {
        background: {{ m.config.mod_kazoo.color1.value }};
        background: linear-gradient(top, {{ m.config.mod_kazoo.color1.value }}, {{ m.config.mod_kazoo.color1.value }});
        background: -webkit-linear-gradient(top, {{ m.config.mod_kazoo.color1.value }}, {{ m.config.mod_kazoo.color1.value }});
        background: -moz-linear-gradient(top, {{ m.config.mod_kazoo.color1.value }}, {{ m.config.mod_kazoo.color1.value }});
        position: relative;
}

div table tbody tr td label.radio {
  margin-bottom: .5em;
}

.pager li>a, .pager li>span {
  border-radius: 0px!important;
  color: {{ m.config.mod_kazoo.color1.value }};
}

.th-onnet {
  background-color: #eee;
  color: #333;
}

table#calls_list_table tfoot tr {
  background-color: white;
}

.table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th {
  background-color: white;
}

.zalarm {
  color: {{ m.config.mod_kazoo.color2.value }};
}

.zwarning {
  color: #c09853;
}

.pagination>li>a,
.pagination>li>a:hover {
  color: {{ m.config.mod_kazoo.color1.value }};
}

.pagination > .active > a,
.pagination > .active > a:hover {
  background-color: {{ m.config.mod_kazoo.color1.value }};
}

.info-board-onnet {
  background-color: #eee;
  border-color: {{ m.config.mod_kazoo.color1.value }};
}

input[type="text"].input-long-onnet {
  width: 90%!important;
  padding-left: 5%;
  vertical-align: middle;
  margin-bottom: 1px!important;
}

table.dataTable thead > tr > th {
  padding-left: 10px!important;
  padding-right: 10px!important;
}

input[type="text"].input-number-onnet {
  width: 7.9em!important;
  height: 1.6em!important;
  padding-left: 1%;
  vertical-align: middle;
  margin-bottom: 1px!important;
}

input[type="text"].input-number-zonnet {
  width: 9em!important;
  height: 1.6em!important;
  padding-left: 5%;
  vertical-align: middle;
  margin-bottom: 1px!important;
}

.znone {
  text-decoration: none!important;
  color: #333333!important;
}

.input-small-onnet {
  width: 90px;
  height: 20px;
  text-align: center;
  vertical-align: middle;
  margin-bottom: 1px!important;
}

.input-middle-onnet {
  width: 150px;
  height: 20px;
  text-align: center;
  vertical-align: middle;
  margin-bottom: 1px!important;
}

.input-small-zonnet {
  width: 90px;
  height: 20px;
  text-align: center;
  vertical-align: middle;
  margin-bottom: 1px!important;
}

#incoming_calls_list_table {
  margin-top: 0px !important;
  margin-bottom: 0px !important;
}

.display_none {
  display: none;
}

.disabled {
  display: none!important;
  visibility: hidden!important;
}

.panel-onnet {
  border-radius: 0px;
}

input, select{
  border-radius: 0px!important;
}

.btn {
  border-radius: 0px;
}

.btn-onnet {
  color: #515151;
  background-color: #e6e6e6;
  border-color: {{ m.config.mod_kazoo.color2.value }};
  margin-left: 3px;
}

.panel-onnet>.panel-heading>.panel-title {
  font-size: 14px;
}

.panel-onnet>.panel-heading {
  background-color: rgba(62,122,140,.2);
  border-radius: 0px;
}

.panel-onnet>.panel-body {
  padding: 0px;
}

.panel {
  padding: 0px;
  background-color: #F6F6F6;
}

.undecorate-button {
  text-decoration: none!important;
  color: white!important;
  cursor: pointer;
}

.undecorate-link {
  text-decoration: none!important;
  color: inherit!important;
  cursor: pointer;
}

.table-centered {
  margin: 0 auto !important;
  color: #515151;
}

.max-800 {
  max-width: 800px! important;
}

.table>thead>tr>th {
  border-bottom-width: 0px!important;
}

.center-block {
  display: block;
  margin-left: auto;
  margin-right: auto;
}

.modal-dialog {
/*  width: auto; */
  max-width: 800px;
}

.modal-content {
  border-radius: 0px;
}

.modal-header {
  padding: 5px;
  padding-left: 10%;
}

.modal-body {
  position: relative;
  padding: none!important;
}

table#calls_amount1.table>tbody>tr>td {
  padding: 1px;
  border-top: 1px solid #ddd;
}

table#calls_amount2.table>tbody>tr>td {
  padding: 1px;
  border-top: 1px solid #ddd;
}

table#calls_amount1.table {
  margin-bottom: auto!important;
}

table#calls_amount2.table {
  margin-bottom: auto!important;
}

div.widget {
  margin-bottom: 10px;
  border-bottom: none;
  border-radius: 2px;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
}

#orderform-service-description {
  padding: 3%;
}

#comments {
  width: 100%;
}

.onnet-pager {
  padding-left: 0;
  padding-bottom: 15px;
  text-align: center;
  list-style: none;
}

.onnet-pager div>a {
  display: inline-block;
  padding: 5px 14px;
  background-color: #fff;
  border: 1px solid #ddd;
}

.td-center {
  text-align: center!important;
  vertical-align: middle!important;
}

.vcenter {
    display: inline-block;
    vertical-align: middle;
    float: none;
}

.mt-1 {
  margin-top: 1em;
}

.mb-1 {
  margin-bottom: 1em;
}

.pt-1 {
  padding-top: 1em;
}

.pb-1 {
  padding-bottom: 1em;
}

.p-3 {
  padding: 3em;
}

.pl-0 {
  padding-left: 0px;
}

.pr-0 {
  padding-right: 0px;
}

.pl-10 {
  padding-left: 10px;
}

.pr-10 {
  padding-right: 10px;
}

.pb-10 {
  padding-bottom: 10px;
}

.pl-15 {
  padding-left: 15px;
}

.pr-15 {
  padding-right: 15px;
}

.mb-10 {
  margin-bottom: 10px!important;
}

input#recaptcha_response_field {
  width: 260px!important;
  margin-left: 9px;
  margin-right: 0px!important;
  text-align: center;
}

div#recaptcha_widget {
  margin-left: 90px;
}

#sign-in-box {
  position: absolute;
  right: -90px;
  bottom: -200px;
  width: 250px;
  padding: 10px;
  background: #E86110;
  display: none;
}

#admin-sign-in-box {
  position: absolute;
  right: -110px;
  bottom: -235px;
  right: -145px;
/*  width: 250px; */
  padding: 10px;
  background: #E86110;
  display: none;
}

@media (max-width: 992px) { /* Adjusting for small devices */
    #admin-sign-in-box {
      right: -95px!important;
    }
}


#forgot-pwd-box {
  position: absolute;
  right: -90px;
  bottom: -182px;
  width: 250px;
  padding: 10px;
  background: #E86110;
  display: none;
}

#forgot-pwd {
  padding-top: 16px;
  text-transform: none;
}

.alert-error {
  color: #b94a48;
  background-color: #f2dede;
  border-color: #eed3d7;
}

.index-slogan {
  font-size: 1.15em; 
  text-align: center;
  color: #E86110;
  padding-bottom: .7em;
}

.opensource-img-center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  max-height: 7em;
}

#call-forward-data {
  padding: 1em;
  width: 22em;
  display: block;
  margin-left: 3em;
  border: 1px solid rgb(153, 153, 153);
  border-radius: 5px;
  background-color: white;
}

#add-credit-card {
  padding: 1em;
  width: 22em;
  display: block;
  margin-left: 3em;
  margin-bottom: 2em;
  border: 1px solid rgb(153, 153, 153);
  border-radius: 5px;
  background-color: white;
}

#set-customer-address {
  padding: 1em;
  width: 22em;
  display: block;
  margin-left: 3em;
  margin-bottom: 2em;
  border: 1px solid rgb(153, 153, 153);
  border-radius: 5px;
  background-color: white;
}

.aztable {
  display: table-row;
}

.azrow {
  display: table-row;
}

.azcell {
  display: table-cell;
}

.input-number-onnet {
  width: 150px;
  height: 22px;
  line-height: 22px;
  text-align: center;
  vertical-align: middle;
  margin-bottom: 1px!important;
  padding-top: 3px;
}

.padding-card-fields {
  padding: 0.5em;
}

.input-card-field {
  text-align: center;
  border: 1px solid rgb(153, 153, 153);
  border-radius: 3px;
  height: 20px;
}

.input-address-field {
  text-align: left;
  border: 1px solid rgb(153, 153, 153);
  border-radius: 3px;
  padding-left: 0.5em;
}

.arrowpad {
  padding-right: 0.5em;
}

.input-sm {
  height: 25px!important;
}

.pointer {
  cursor: pointer;
}

.trans-list {
  text-align: left;
  color: {{ m.config.mod_kazoo.color1.value }};
}

.trans-h {

}

.trans-t {

}

.edit_user_label {
  float: right;
  color: {{ m.config.mod_kazoo.color1.value }};
}

label.radio-inline, label.checkbox-inline, label.radio, label.checkbox {
  background-color: {{ m.config.mod_kazoo.color1.value }};
  color: #fff !important;
  cursor: pointer;
  font-weight: 400;
  margin-bottom: 10px !important;
  margin-right: 2%;
  margin-left: 0;
  padding: 7px 10px 7px 30px;
}
label.radio-inline.checked, label.checkbox-inline.checked, label.radio.checked, label.checkbox.checked {
  background-color: {{ m.config.mod_kazoo.color2.value }};
  color: #fff !important;
  text-shadow: 1px 1px 2px #000 !important;
}
.columns label.radio-inline, .columns label.checkbox-inline {
  vertical-align: top;
  width: 30%;
}
.additional-info-wrap {
  display: inline-block;
  margin: 0 2% 0 0;
  position: relative;
  vertical-align: top;
  width: 30%;
}
.additional-info-wrap label.checkbox-inline, .additional-info-wrap label.radio-inline {
  width: 100% !important;
}
.checkbox-inline + .checkbox-inline, .radio-inline + .radio-inline {
  margin-left: 0;
}
.additional-info-wrap .additional-info {
  background-color: #E86110;
  clear: both;
  color: #fff !important;
  margin-top: -10px;
  padding: 0 10px 10px;
  text-shadow: 1px 1px 2px #000 !important;
  width: 100%;
}

.text-center {
  text-align: center;
}

.datepicker {
  z-index:1151 !important;
}

.form-control-text {
  padding: 6px 12px;
}

.btn-zprimary-checkbox,
.btn-zprimary-checkbox:hover {
color: #ffffff;
background-color: {{ m.config.mod_kazoo.color1.value }};
border-color: {{ m.config.mod_kazoo.color1.value }};
}

.btn-zprimary-checkbox.active,
.btn-zprimary-checkbox.active:hover {
color: #ffffff;
background-color: {{ m.config.mod_kazoo.color2.value }}!important;
border-color: {{ m.config.mod_kazoo.color2.value }}!important;
}

.form-control-onnet {
  border-radius: 0!important;
  display: block;
  width: 100%;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  background-image: none;
//  border: 1px solid #ccc;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
  box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
  -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
  -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
  transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}

//input[placeholder], [placeholder], *[placeholder] {
//    color: #ccc!important;
//}
::-webkit-input-placeholder { /* WebKit browsers */
    color:    #ccc!important;
}
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
   color:    #ccc!important;
   opacity:  1;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
   color:    #ccc!important;
   opacity:  1;
}
:-ms-input-placeholder { /* Internet Explorer 10+ */
   color:    #ccc!important;
}

</style>