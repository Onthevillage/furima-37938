function price (){
    const itemPrice  = document.getElementById("item-price");
    itemPrice.addEventListener("keyup", () => {
        const price = itemPrice.value
        const taxPrice = document.getElementById("add-tax-price");
        taxPrice.innerHTML = Math.floor(price * 0.1);
        const profit = document.getElementById("profit");
        profit.innerHTML = Math.floor(price * 0.9);
    });        
  };
  
  window.addEventListener('load', price);
  