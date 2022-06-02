function price (){
    const itemPrice  = document.getElementById("item-price");
    itemPrice.addEventListener("keyup", () => {
        const price = itemPrice.ariaValueMax
        const taxPrice = document.getElementById("add-tax-price");
        taxPrice.innerHTML = '${price * 110%}';
    });        
  };add-tax-price
  
  window.addEventListener('load', price);
  