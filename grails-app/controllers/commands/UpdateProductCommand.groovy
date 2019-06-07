package commands

import grails.validation.Validateable
import productApp.Product
import validators.ProductValidator

class UpdateProductCommand implements Validateable {

    Product     product
    String      name
    String      description
    Boolean     available   = true
    Float       price

    static constraints = {
        product         nullable: true, validator: validateProduct
        name            nullable: true, validator: validateName
        description     nullable: true
        available       nullable: true
        price           nullable: true, validator: validatePrice }

    static final validateProduct = { Product product, UpdateProductCommand command ->
        new ProductValidator().getValidationErrorCodes { ProductValidator v -> v.validateProduct(product) } }

    static final validateName = { String name, UpdateProductCommand command ->
        if(command.product) new ProductValidator().getValidationErrorCodes { ProductValidator v -> v.validateProductUpdateName(command.product, name) } }

    static final validatePrice = { Float price, UpdateProductCommand command ->
        new ProductValidator().getValidationErrorCodes { ProductValidator v -> v.validateProductPrice(price) } }

}
