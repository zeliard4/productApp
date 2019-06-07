package commands

import grails.validation.Validateable

class ListProductsCommand implements Validateable {

    Integer       offset = 0
    Integer       max    = 10

    static constraints = {
        offset  nullable: true
        max     nullable: true
    }

}
