package commands

import grails.validation.Validateable
import productApp.Product
import validators.ProductValidator

class DeleteProductCommand implements Validateable {

    Product     product

    static constraints = { product         nullable: true, validator: validateProduct }

    static final validateProduct = { Product product, DeleteProductCommand command ->
        new ProductValidator().getValidationErrorCodes { ProductValidator v -> v.validateProduct(product) } }

}
