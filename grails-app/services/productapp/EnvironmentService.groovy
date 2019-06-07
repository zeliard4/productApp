package productapp

import grails.gorm.transactions.Transactional
import productApp.Product
import productApp.Role
import productApp.User
import productApp.UserRole

@Transactional
class EnvironmentService {

    private static createRoles(){
        println "Creating roles ..."
        Role role = new Role(authority: 'ROLE_ADMIN', description: 'Admin role').save(flush:true)
        Role role2 = new Role(authority: 'ROLE_USER', description: 'User role').save(flush:true) }

    private static createUsers() {
        println "Creating users ... "
        User admin = new User(username: "admin@admin.com", password: "admin123")
        admin.save(flush:true)
        UserRole.create(admin, Role.findByAuthority('ROLE_ADMIN'))


        User user = new User(username: "user@user.com", password: "user123")
        user.save(flush:true)
        UserRole.create(user, Role.findByAuthority('ROLE_USER')) }

    private static createProducts(){
        println "Creating products ... "
        List<Product> products = [
        new Product(
                name: "Water Pistol",
                description: "Water not included",
                available:true,
                price:99.99),
        new Product(
                name: "Space Shuttle",
                description: "Sold without kerosene",
                available:true,
                price:150000000.00),
        new Product(
                name: "Zeta Reticuli Alien Slave",
                description: "English friendly",
                available:true,
                price:1000.55),
        new Product(
                name: "Fragger Nerd",
                description: "Born to frag",
                available:true,
                price:1),
        new Product(
                name: "Caravel",
                description: "Y del trueno al son violento, y del viento al rebramar",
                available:true,
                price:258),
        new Product(
                name: "Explosive Bubble Gum",
                description: "12 Megatons, planet destroyer",
                available:true,
                price:5000000) ]
        products.each{it.save()}
    }

    void fillDatabase(){
        println "Filling database ... "
        createRoles()
        createUsers()
        createProducts()}
}
