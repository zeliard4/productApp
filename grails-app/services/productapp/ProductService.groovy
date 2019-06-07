package productapp

import grails.gorm.transactions.Transactional
import productApp.Product

class ProductService {

    @Transactional(readOnly = true)
    List<Product> list(Map params) {
        return Product.createCriteria().list(
                max:params.max,
                offset:params.offset){} }

    @Transactional
    Product createProduct(String name, String description, Boolean available, Float price){
        println "Creating product ... "
        Product product = new Product(
                name:name,
                description:description,
                available:available,
                price:price ).save(flush:true)
        product }

    @Transactional
    Product updateProduct(Product product, String name, String description, Boolean available, Float price){
        println "Updating product ... "
        product.name = name
        product.description = description
        product.available = available
        product.price = price
        product.save(flush:true)
        product }

    @Transactional
    deleteProduct(Product product){
        println "Deleting product ... "
        product.delete(flush:true) }

}
