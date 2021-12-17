// Exemple de JavaScript de démarrage pour désactiver les soumissions de formulaire en cas de champs invalides
(function () {
  'use strict'

  // Récupérer tous les formulaires auxquels nous voulons appliquer des styles de validation Bootstrap personnalisés.
  var forms = document.querySelectorAll('.needs-validation')

  // Boucler sur eux et empêcher la soumission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})();
function func_total(num) {
  var qty = Number($('#qty'+num).val());
  var price = Number($("#price" + num).val());
  var total = qty * price;
  $("#total" + num).html(total);
  grand_total();
}
function grand_total() {
var sum = 0;
$(".total").each(function(){
  sum += Number($(this).text());
});
$("#g_total").html(sum);
}
grand_total();