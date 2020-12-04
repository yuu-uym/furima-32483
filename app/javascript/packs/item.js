window.addEventListener('load', function(){
const itemPrice = document.getElementById("item-price")
const addTaxPrice = document.getElementById("add-tax-price")
const profit = document.getElementById("profit")

itemPrice.addEventListener('change', function(){
  let tax = itemPrice.value * 0.1
  let profitOutput = itemPrice.value - tax
  addTaxPrice.innerHTML = tax
  profit.innerHTML = profitOutput
})
})