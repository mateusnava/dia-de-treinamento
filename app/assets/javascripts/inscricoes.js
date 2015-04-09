$(document).on("page:change", function(e) {
  $("#inscricao-form").on("ajax:before", function() {
    $(this).find("button").attr("disabled", "disabled");
  });

  $("#inscricao-form").on("ajax:complete", function() {
    $(this).find("button").removeAttr("disabled");
  });

  $("#inscricao-form").on("ajax:success", function() {
    $(this).find("input:not([disabled])").val("");
    var divMessage = $("<div>").addClass("alert alert-success").text("Inscrição realizada com sucesso!");
    $(this).append(divMessage);
  });

  $("#inscricao-form").on("ajax:error", function() {
    var divMessage = $("<div>").addClass("alert alert-danger").text("Falha ao realizar inscrição, tente novamente mais tarde!");
    $(this).append(divMessage);
  });
});