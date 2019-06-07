package productapp

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ExceptionHandlerControllerSpec extends Specification implements ControllerUnitTest<ExceptionHandlerController> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
