package productApp

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import validators.ProductValidator

@EqualsAndHashCode(includes='name')
@ToString(includes='name', includeNames=true, includePackage=false)
class Product {

    Long        id
    Date        dateCreated
    Date        lastUpdated

    String      name
    String      description
    Boolean     available
    Float       price

    static constraints = {
        name            nullable:false
        description     nullable:true, size:0..15000
        available       nullable:false
        price           nullable:false
    }

}
