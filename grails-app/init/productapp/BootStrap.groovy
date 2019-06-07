package productapp

class BootStrap {

    def environmentService

    def init = { servletContext ->
        environmentService.fillDatabase()
    }
    def destroy = {
    }
}
