<g:javascript>

	<g:if test="${flash}">
		showAlert("${flash.msg}","${flash.type}");
	</g:if>

</g:javascript>


<div class="row">
	<div id="alertContainer" class="col-md-12" style="margin-top:15px; margin-bottom:15px;display:none"></div>
</div>

