const pay = () => {
  const payjp = Payjp('pk_test_846aaf683977a22a765d0e8f')
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#card-number');
  expiryElement.mount('#card-exp-month','#card-exp-year');
  cvcElement.mount('#card-cvc');

  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log('test発火')
  });
};

window.addEventListener("load", pay);