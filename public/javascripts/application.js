$(document).ready(function() {
  if($('#flash').length){
        $.notifyBar({ cls: $('#flash').attr('class'), html: $('#flash').html() });
  }

  if($('#nickname').length){
    $('#nickname').click(function() {
        $('#nickname_input').html($('#nickname').html());
        $('#nickname').hide();
        $('#nicname_input').fadeIn().focus();
    });
    $('#nickname_input').blur(function(){
        previous = $('#nickname').html();
        $('#nickname').html($('#nickname_input').html());
        $('#nickname_input').hide();
        $('#nickname').fadeIn();
        if(previous == $('#nickname').html()){
          //ajax callback
        }
    });
    $('#nickname_input').keypress(function(event){
      if (event.keyCode == 13) {
       event.preventDefault();
       $('#nickname_input').blur()
      }else if (event.keyCode == 27){
       $('#nickname_input').html(previous);
       $('#nickname_input').blur()
      }
    });
  }

});
