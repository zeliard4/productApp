package validators

import productApp.Product

class ProductValidator extends Validator {

    void validateProductName(String name){
        withDepthControl {
            if (name == null || name == '' || name == 'undefined') errorMessages << "product.name.invalid"
            else if (Product.findByName(name)) errorMessages << "product.name.exists" } }

    void validateProductUpdateName(Product product, String name){
        withDepthControl {
            if (name == null || name == '' || name == 'undefined') errorMessages << "product.name.invalid"
            else{
                Product other = Product.findByName(name)
                if (other)
                    if (other.name != product.name ) errorMessages << "product.name.exists" } } }

    void validateProduct(Product product){
        withDepthControl {
            if (!product) errorMessages << "product.invalidProduct" } }

    void validateProductPrice(Float price){
        withDepthControl {
            if (price == null || price == 0) errorMessages << "product.price.nullOrZero"
            else if (price < 0) errorMessages << "product.price.negative" } }


}
