
function getCartContentFromStorage() {
    const cartContentJSON = localStorage.getItem('cart');
    return cartContentJSON ? JSON.parse(cartContentJSON) : [];
}

export function saveCartContentToStorage(cartContent) {
    const cartContentJSON = JSON.stringify(cartContent);
    localStorage.setItem('cart', cartContentJSON);
}

export function addToCart(product) {
    const cartContent = getCartContentFromStorage();
    const existingProduct = cartContent.find((item) => item.id === product.id);

    if (existingProduct) {
        existingProduct.quantity += 1;
    } else {
        cartContent.push({ ...product, quantity: 1 });
    }

    saveCartContentToStorage(cartContent);
}

export function removeFromCart(productId) {
    const cartContent = getCartContentFromStorage();
    const index = cartContent.findIndex(item => item.id === productId);
    if (index !== -1) {
        cartContent.splice(index, 1);
        saveCartContentToStorage(cartContent);
    }
}

export function getCartItemCount() {
    const cartContent = getCartContentFromStorage();
    return cartContent.length;
}

export function getCartlist() {
    return getCartContentFromStorage();
}

export function getCartTotalPrice() {
    const cartContent = getCartContentFromStorage();
    const totalPrice = cartContent.reduce((total, item) => {
        const itemTotal = Number(item.price) * item.quantity;
        return total + itemTotal;
      }, 0);
    
      // Return the total price with two decimal places
      return totalPrice.toFixed(2);
}