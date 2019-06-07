package productapp

import exceptions.ValidationException
import grails.converters.JSON
import productApp.User

class ExceptionHandlerController {

    def messageSource
    def springSecurityService

    private Locale getUserLocale(){
        User currentUser =	springSecurityService.currentUser
        if (currentUser) if (currentUser.locale) {
            def userLocale = currentUser.locale.split('_')
            return new Locale(userLocale[0], userLocale[1]) }
        else{ return new Locale("en","US") } }

    String getI18Message (String code) {
        try { return messageSource.getMessage(code,null, getUserLocale()) }
        catch (all) { return messageSource.getMessage("default.error.notHandled",null, getUserLocale()) } }

    List <String> getCommandErrorMessages(def command){
        List <String> errorMessages = []
        if (command.hasErrors()) command.errors.allErrors.collect() { error ->
            errorMessages << getI18Message(error.code) }
        return errorMessages }

    //Unhandled error message for 500 internal errors
    private String getUnhandledErrorMessage(){
        return messageSource.getMessage("default.error.notHandled",null, getUserLocale()) }

    private void handleException (final ValidationException exception) {
        render ([success:false,messages:exception.getValidationErrorCodes().collect() { String code ->
            return getI18Message(code) }] as JSON) }

    private void handleException (final Exception exception) {
        render([success: false, errors: [getUnhandledErrorMessage()]] as JSON) }

}
