public class SensitiveDataLogger {
    // sensitive data
    private static String username = 'user123';
    private static String password = 'P@ssw0rd!';
    private static String creditCard = '1234-5678-9876-5432';
    private static String ssn = '123-45-6789';

    // HTTP response containing sensitive data
    public class MockHttpResponse {
        public String body;
        public Integer statusCode;
    }

    // Database query result containing sensitive data
    public class MockDatabaseRecord {
        public String username;
        public String password;
        public String creditCard;
        public String ssn;
    }

    // Object containing sensitive information
    public class SensitiveObject {
        public String username;
        public String password;
        public String creditCard;
        public String ssn;

        public SensitiveObject(String username, String password, String creditCard, String ssn) {
            this.username = username;
            this.password = password;
            this.creditCard = creditCard;
            this.ssn = ssn;
        }
    }

    // Example of Insecure-patterns (bad practices) for logging sensitive data
    @AuraEnabled
    public static void logSensitiveDataAntiPatterns() {
        // Logging sensitive data directly (Insecure-pattern)
        System.debug('Anti-Pattern 1: Username: ' + username + ', Password: ' + password);
        System.debug('Anti-Pattern 2: Credit Card: ' + creditCard);
        System.debug('Anti-Pattern 3: SSN: ' + ssn);
    }

    // Example of Insecure-patterns (bad practices) for logging HTTP responses
    @AuraEnabled
    public static void logHttpResponseAntiPatterns() {
        MockHttpResponse response = new MockHttpResponse();
        response.body = '{"username":"user123","password":"P@ssw0rd!","creditCard":"1234-5678-9876-5432","ssn":"123-45-6789"}';
        response.statusCode = 200;

        // Logging the entire HTTP response body directly (anti-pattern)
        System.debug('Anti-Pattern: HTTP Response Body: ' + response.body);
    }

    // Example of anti-patterns (bad practices) for logging database query results
    @AuraEnabled
    public static void logDatabaseQueryResultsAntiPatterns() {
        MockDatabaseRecord record = new MockDatabaseRecord();
        record.username = 'user123';
        record.password = 'P@ssw0rd!';
        record.creditCard = '1234-5678-9876-5432';
        record.ssn = '123-45-6789';

        // Logging the entire database record directly (anti-pattern)
        System.debug('Anti-Pattern: Database Record: ' + JSON.serialize(record));
    }

    // Example of Insecure-patterns (bad practices) for logging input parameters
    @AuraEnabled
    public static void logInputParametersAntiPatterns(String username, String password, String creditCard, String ssn) {
        // Logging sensitive input parameters directly (anti-pattern)
        System.debug('Anti-Pattern: Input Parameters: Username: ' + username + ', Password: ' + password + ', Credit Card: ' + creditCard + ', SSN: ' + ssn);
    }

    // Example of Insecure-patterns (bad practices) for logging an entire object containing sensitive information
    @AuraEnabled
    public static void logEntireObjectAntiPatterns() {
        SensitiveObject sensitiveObject = new SensitiveObject(username, password, creditCard, ssn);

        // Logging the entire object directly (Insecure-pattern)
        System.debug('Anti-Pattern: Sensitive Object: ' + JSON.serialize(sensitiveObject));
    }

    // Example of secure patterns (good practices) for logging sensitive data
    @AuraEnabled
    public static void logSensitiveDataSecurePatterns() {
        // Avoid logging sensitive data directly
        System.debug('Secure Pattern 1: User attempted to log in with a username and password.');
        
        // Redacting sensitive information
        System.debug('Secure Pattern 2: Username: ' + username + ', Password: [REDACTED]');
        
        // Logging masked credit card information
        String maskedCreditCard = maskCreditCard(creditCard);
        System.debug('Secure Pattern 3: Credit Card: ' + maskedCreditCard);
        
        // Logging masked SSN
        String maskedSSN = maskSSN(ssn);
        System.debug('Secure Pattern 4: SSN: ' + maskedSSN);
    }

    // Example of secure patterns (good practices) for logging HTTP responses
    @AuraEnabled
    public static void logHttpResponseSecurePatterns() {
        MockHttpResponse response = new MockHttpResponse();
        response.body = '{"username":"user123","password":"P@ssw0rd!","creditCard":"1234-5678-9876-5432","ssn":"123-45-6789"}';
        response.statusCode = 200;

        // Parse the response body
        Map<String, Object> responseBody = (Map<String, Object>) JSON.deserializeUntyped(response.body);

        // Avoid logging sensitive data directly
        System.debug('Secure Pattern: Received HTTP response with status code: ' + response.statusCode);

        // Redact sensitive information before logging
        responseBody.put('password', '[REDACTED]');
        responseBody.put('creditCard', maskCreditCard(responseBody.get('creditCard')));
        responseBody.put('ssn', maskSSN(responseBody.get('ssn')));

        System.debug('Secure Pattern: HTTP Response Body: ' + JSON.serialize(responseBody));
    }

    // Example of secure patterns (good practices) for logging database query results
    @AuraEnabled
    public static void logDatabaseQueryResultsSecurePatterns() {
        MockDatabaseRecord record = new MockDatabaseRecord();
        record.username = 'user123';
        record.password = 'P@ssw0rd!';
        record.creditCard = '1234-5678-9876-5432';
        record.ssn = '123-45-6789';

        // Redact sensitive information before logging
        record.password = '[REDACTED]';
        record.creditCard = maskCreditCard(record.creditCard);
        record.ssn = maskSSN(record.ssn);

        System.debug('Secure Pattern: Database Record: ' + JSON.serialize(record));
    }

    // Example of secure patterns (good practices) for logging input parameters
    @AuraEnabled
    public static void logInputParametersSecurePatterns(String username, String password, String creditCard, String ssn) {
        // Avoid logging sensitive input parameters directly
        System.debug('Secure Pattern: Input Parameters: Username: ' + username + ', Password: [REDACTED], Credit Card: ' + maskCreditCard(creditCard) + ', SSN: ' + maskSSN(ssn));
    }

    // Example of secure patterns (good practices) for logging an entire object containing sensitive information
    @AuraEnabled
    public static void logEntireObjectSecurePatterns() {
        SensitiveObject sensitiveObject = new SensitiveObject(username, password, creditCard, ssn);

        // Redact sensitive information before logging
        sensitiveObject.password = '[REDACTED]';
        sensitiveObject.creditCard = maskCreditCard(sensitiveObject.creditCard);
        sensitiveObject.ssn = maskSSN(sensitiveObject.ssn);

        System.debug('Secure Pattern: Sensitive Object: ' + JSON.serialize(sensitiveObject));
    }

    private static String maskCreditCard(Object creditCard) {
        String cc = (String) creditCard;
        return cc.substring(0, 4) + '-****-****-' + cc.substring(cc.length() - 4);
    }

    private static String maskSSN(Object ssn) {
        String s = (String) ssn;
        return '***-**-' + s.substring(s.length() - 4);
    }
}
