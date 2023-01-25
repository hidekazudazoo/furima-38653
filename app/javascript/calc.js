function calc() {

  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const commission = Math.floor(price.value / 10);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${commission}`;
    const profit = price.value - commission;
    const Profit = document.getElementById("profit");
    Profit.innerHTML = `${profit}`;
  });
};

window.addEventListener('load', calc);
