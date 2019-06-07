package validators

import exceptions.ValidationException

public class Validator {

    public List<String> errorMessages
    public int depth = 0

    Validator() { errorMessages = [] }

    void withDepthControl(Closure c) throws ValidationException {
        depth++
        c.call()
        depth--

        if (errorMessages && depth == 0) throw new ValidationException(errorMessages) }

    def getValidationErrorCodes(Closure c){
        try { c.call(this) }
        catch ( ValidationException ve ) { return ve.getValidationErrorCodes() }
        return true }

}
