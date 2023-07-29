import "@hotwired/turbo-rails"
import "controllers"
  
  $(document).on('click', '#generateShoppingListBtn', function (event) {
    event.preventDefault();
    
    var selectedInventoryId = $('#inventorySelect').val();
    if (selectedInventoryId > 0) {
      window.location.href = '/generate_shopping_list?recipe_id=' + recipeId + '&inventory_id=' + selectedInventoryId;
    } else {
      alert('Please select an inventory.');
    }
  });
  