window.addEventListener('load', function(){ 
  let input = document.getElementById('item-price');
  const addTax = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  input.addEventListener('keyup', function() {
    const price = input.value
    const tax = price * 0.1
    const p = price - tax
    
    addTax.innerHTML = Math.floor(tax)
    profit.innerHTML = Math.floor(p)
  });
}) 
