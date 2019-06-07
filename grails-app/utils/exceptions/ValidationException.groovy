package exceptions

import org.springframework.context.MessageSource
import org.springframework.context.i18n.LocaleContextHolder


class ValidationException extends RuntimeException {

    private List<String> messages

    ValidationException(List<String> messages) {
        super()
        this.messages = Collections.unmodifiableList(messages) }

    List<String> getValidationErrorCodes(){ return this.messages }

    String getMessage(){ return this.messages.toString() }

}
