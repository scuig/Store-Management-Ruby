
$("#products a.add_fields").
  data("association-insertion-position", 'before').
  data("association-insertion-node", 'this');

$('#products').on('cocoon:after-insert',
     function() {
         $(".project-product-fields a.add_fields").
             data("association-insertion-position", 'before').
             data("association-insertion-node", 'this');
         $('.project-product-fields').on('cocoon:after-insert',
              function() {
                $(this).children("#product_from_list").remove();
                $(this).children("a.add_fields").hide();
              });
     });
