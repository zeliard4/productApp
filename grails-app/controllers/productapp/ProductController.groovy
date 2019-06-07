package productapp

import commands.CreateProductCommand
import commands.DeleteProductCommand
import commands.ListProductsCommand
import commands.UpdateProductCommand
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import productApp.Product

class ProductController extends ExceptionHandlerController {

    def productService

    //////////////////////////////////////////////////////////////////////////////////////////////////////
    // main renderers
    //////////////////////////////////////////////////////////////////////////////////////////////////////

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def listProducts(){
        render view:'products' }

    @Secured(['ROLE_ADMIN'])
    def createProduct(){
        render view:"create" }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def showProduct(Long id){
        Product product = Product.get(id)
        if (!product) listProducts()
        else{
            render view:'show', model:[ product : Product.get(id)] }}

    //////////////////////////////////////////////////////////////////////////////////////////////////////
    // API methods
    //////////////////////////////////////////////////////////////////////////////////////////////////////

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def list(ListProductsCommand command) {
        List<Product> products = productService.list([
                max:command.max,offset:command.offset*command.max]).collect(){ Product product ->
            return [
                    id          : product.id,
                    name        : product.name,
                    available   : product.available,
                    price       : product.price ] }
        render ([success:true, data:products, total:Product.count()] as JSON) }

    @Secured(['ROLE_ADMIN'])
    def create(CreateProductCommand command){
        try{
            if (command.hasErrors()) render([success: false, errors: getCommandErrorMessages(command)] as JSON)
            else{
                Product product = productService.createProduct(
                        command.name, command.description, command.available, command.price)
                render([success:true, data:[
                        id:product.id,
                        name:product.name]] as JSON) } }
        catch(all){ handleException(all) } }

    @Secured(['ROLE_ADMIN'])
    def update(UpdateProductCommand command){
        try{
            if (command.hasErrors()) render([success: false, errors: getCommandErrorMessages(command)] as JSON)
            else{
                Product product = productService.updateProduct(
                        command.product, command.name, command.description, command.available, command.price)
                render([success:true, data:[
                        id:product.id,
                        name:product.name]] as JSON) } }
        catch(all){ handleException(all) } }

    @Secured(['ROLE_ADMIN'])
    def delete(DeleteProductCommand command){
        try{
            if (command.hasErrors()) render([success: false, errors: getCommandErrorMessages(command)] as JSON)
            else{
                productService.deleteProduct(command.product)
                render([success:true] as JSON) } }
        catch(all){ handleException(all) } }


}
