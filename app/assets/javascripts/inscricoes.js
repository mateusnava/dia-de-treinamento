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
    $(this).find(".alert").remove();
    $(this).append(divMessage);
  });

  $("#inscricao-form").on("ajax:error", function(status, data) {
    response = JSON.parse(data.responseText).base;
    if (response == "") {
      var divMessage = $("<div>").addClass("alert alert-danger").text("Falha ao realizar inscrição, tente novamente mais tarde!");
    } else {
      var divMessage = $("<div>").addClass("alert alert-warning").text(response);
    }
    $(this).find(".alert").remove();
    $(this).append(divMessage);
  });
});