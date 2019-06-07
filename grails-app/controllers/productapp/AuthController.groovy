package productapp

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

class AuthController {

    def springSecurityService

    @Secured(['permitAll'])
    def login() {
        def config = SpringSecurityUtils.securityConfig
        if (springSecurityService.isLoggedIn()) {
            if (springSecurityService.getCurrentUser().getAuthorities().any{ it.authority == "ROLE_ADMIN"})
                redirect uri: config.successHandler.defaultTargetUrlForAdmin
            else redirect uri: config.successHandler.defaultTargetUrlForUser }
        else{
            if (params.fail == 'true') { flash.message = "Invalid login" }
            render view:"login"} }

    @Secured(['permitAll'])
    def logout(){ redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl }

}
