function post (){
  const price = document.getElementById("item-price")
  addEventListener("input", () => {
      const InputPrice = price.value
      const PriceTax = document.getElementById("add-tax-price")
      const Tax = 0.1
      PriceTax.innerHTML = Math.floor(price.value*Tax)
      const PriceProfit = document.getElementById("profit")
      PriceProfit.innerHTML = price.value-PriceTax.innerHTML
  });
};

window.addEventListener("load", post);