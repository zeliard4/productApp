package commands

import grails.validation.Validateable
import validators.ProductValidator

class CreateProductCommand implements Validateable {

    String      name
    String      description
    Boolean     available   = true
    Float       price

    static constraints = {
        name            nullable: true, validator: validateName
        description     nullable: true
        available       nullable: true
        price           nullable: true, validator: validatePrice }

    static final validateName = { String name, CreateProductCommand command ->
        new ProductValidator().getValidationErrorCodes { ProductValidator v -> v.validateProductName(name) } }

    static final validatePrice = { Float price, CreateProductCommand command ->
        new ProductValidator().getValidationErrorCodes { ProductValidator v -> v.validateProductPrice(price) } }

}
