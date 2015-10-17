Turbolinks.enableProgressBar();

$(document).on('page:change', function(e) {
  $('[data-form-submit]').on('change', function() {
    $(this).parents('form:first').submit();
  });
});