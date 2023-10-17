
function getWishlistFromStorage() {
    const wishlistJSON = localStorage.getItem('wishlist');
    return wishlistJSON ? JSON.parse(wishlistJSON) : [];
}

function saveWishlistToStorage(wishlist) {
    const wishlistJSON = JSON.stringify(wishlist);
    localStorage.setItem('wishlist', wishlistJSON);
}

export function addToWishlist(product) {
    const wishlist = getWishlistFromStorage();
  
    const isProductInWishlist = wishlist.some((item) => item.id === product.id);
    if (isProductInWishlist) {
      return { type:'warning', message:'Product is already in the wishlist.'}
    } else {
      wishlist.push(product);
      saveWishlistToStorage(wishlist);
      return { type:'success', message:'Product added to the wishlist.'};
    }
  }

export function removeFromWishlist(productId) {
    const wishlist = getWishlistFromStorage();
    const index = wishlist.findIndex(item => item.id === productId);
    if (index !== -1) {
        wishlist.splice(index, 1);
        saveWishlistToStorage(wishlist);
    }
}

export function getWishlist() {
    return getWishlistFromStorage();
}