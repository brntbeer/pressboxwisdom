$(document).ready(function() {
  if($('#flash').length){
        $.notifyBar({ cls: $('#flash').attr('class'), html: $('#flash').val() });
  }
});
