function addToCart(productId) {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "${pageContext.request.contextPath}/addToCart", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert("Mahsulot savatchaga qo'shildi!");
        }
    };
    xhr.send("productId=" + productId);
}