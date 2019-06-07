package productapp

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class UserController {

    def index() { render view:"index" }
}
