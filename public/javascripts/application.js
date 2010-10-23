function updateNicknameCallbackSuccess(){
  $.notifyBar({cls: 'success', html: "Nickname Changed!" });
}

function updateNicknameCallbackFail(){
  $.notifyBar({cls: 'error', html: "Failed To Change Nickname: Try Another Name" });
  $('#nickname').html(previous);
}
$(document).ready(function() {
$.ajaxSettings.accepts.html = $.ajaxSettings.accepts.script;


  if($('#flash').length){
        $.notifyBar({ cls: $('#flash').attr('class'), html: $('#flash').html() });
  }

if ($('#nickname').length){
    $('#nickname').click(function() {
        $('#nickname_input').val($('#nickname').html());
        $('#nickname').hide();
        $('#nickname_input').fadeIn().select().focus();
    });
    $('#nickname_input').blur(function(){
        previous = document.createTextNode($('#nickname').html());
        $('#nickname').html(document.createTextNode($('#nickname_input').val()));
        $('#nickname_input').hide();
        $('#nickname').fadeIn();
        if(previous != $('#nickname').html()){
          $.ajax({
              url: '/main/update_nickname?nickname='+ $('#nickname').html(), type: 'get', dataType: 'html',
              success: updateNicknameCallbackSuccess,
              error: updateNicknameCallbackFail
              
          });
          
        }
    });
    $('#nickname_input').keypress(function(event){
      if (event.keyCode == 13) {
       event.preventDefault();
       $('#nickname_input').blur();
      }
    });
  }

});


