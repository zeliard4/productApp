package productapp

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:'auth', action:'login')
        "/login/$action?"(controller: 'auth', action:'login')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
