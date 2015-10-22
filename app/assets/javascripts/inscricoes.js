$(document).on('page:change', function(e) {
  var incrementerProgressBar = function() {
    var progress = $('.progress:first');
    var quantidade = progress.data('quantidade') + 1;
    progress.data('quantidade', quantidade);
    var title = progress.prev('h3').text(quantidade + ' pessoas inscritas');
    progress.find('.progress-bar').css('width', quantidade + '%');
  }

  $('#inscricao-form').on('ajax:before', function() {
    var button = $(this).find('button');
    button.text('Aguarde...');
    button.attr('disabled', 'disabled');
  });

  $('#inscricao-form').on('ajax:complete', function() {
    var button = $(this).find('button');
    button.text('Cadastrar');
    button.removeAttr('disabled');
  });

  $('#inscricao-form').on('ajax:success', function() {
    $(this).find('*').hide();
    var divMessage = $('<div>').addClass('alert alert-success').text('Inscrição realizada com sucesso!');
    $(this).find('.alert').remove();
    $(this).append(divMessage);
    incrementerProgressBar();
  });

  $('#inscricao-form').on('ajax:error', function(status, data) {
    response = JSON.parse(data.responseText);
    if (!response || response == '') {
      var divMessage = $('<div>').addClass('alert alert-danger').text('Falha ao realizar inscrição, tente novamente mais tarde!');
    } else {
      var message = '';
      for (var key in response) {
        if (key == 'base') {
          message += response[key] + '<br>';
        } else {
          message += '<strong>' + key  + '</strong> - ' + response[key] + '<br>';
        }
      }
      var divMessage = $('<div>').addClass('alert alert-warning').html(message);
    }
    $(this).find('.alert').remove();
    $(this).append(divMessage);
  });
});