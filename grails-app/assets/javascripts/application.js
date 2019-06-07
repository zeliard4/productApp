function showAlert(msg, type) {

    var alerta = null;

    if(type=="error") {
        alerta = $('<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert"></button><strong>Error!</strong>&nbsp;'+msg+'<br></div>');
    } else if(type=="warning") {
        alerta = $('<div class="alert alert-warning"><button type="button" class="close" data-dismiss="alert"></button><strong>&nbsp;Warning!</strong>&nbsp;'+msg+'<br></div>');
    } else if(type=="message") {
        alerta = $('<div class="alert alert-info"><button type="button" class="close" data-dismiss="alert"></button><strong>&nbsp;Information!</strong>&nbsp;'+msg+'<br></div>');
    } else if(type=="success") {
        alerta = $('<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert"></button><strong>&nbsp;Success!</strong>&nbsp;'+msg+'<br></div>');
    }
    $('#alertContainer').empty()
    $('#alertContainer').show();
    $('#alertContainer').append(alerta);
    $('#alertContainer').scrollTop();

    if (type=="success"){
        setTimeout(function() {
            $('#alertContainer').fadeOut('slow');
        }, 2500); }
    else if (type=="error"){
        setTimeout(function() {
            $('#alertContainer').fadeOut('slow');
        }, 5000); }



}