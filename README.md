# Custom PMD rule [debug method]

Using secrets (such as passwords, API keys, sensitive personal information, etc.) in System.debug() statements can lead to several security risks and potential misuses, including: (compliance, data breach, unauthorised access, internal threats etc.)

* Logs accessible to unauthorised users; can lead to sensitive data being exposed.
* Developers or operations team who has access to logs can see the sensitive data of the users.
* sensitive data in logs can unintentionally be shared outside the organization or across departments.
* Logging sensitive information violates data protection regulations such as GDPR.

**Examples of Sensitive data:**

* password
* key
* apikey
* accesskey
* s3accesskey
* pass
* pwd
* ftp
* aws
* config
* credentials
* cred
* encrypt
* token
* refreshtoken
* access
* secret
* secretkey
* privatekey
* s3secretkey
* aws_access_key_id
* pii
* ssn
* passport
* hash

**Working PoC Code**

https://git.soma.salesforce.com/mabdulraheem/sensitive-data-in-debug/tree/Demo-POC-Code/sensitive-data-in-debug/force-app/main/default

Please find the link to the detailed quip doc to work with the PoC code: [Demo PoC - Sensitive data in debug logs](https://salesforce.quip.com/PmflAianLyjw)

**Identified Patterns to flag:**
*  Example of anti-patterns (bad practices) for logging sensitive data directly in debug method.
* Example of anti-patterns (bad practices) for logging input parameters.
* Example of anti-patterns (bad practices) for logging HTTP responses.
* Example of anti-patterns (bad practices) for logging database query results.
* Example of anti-patterns (bad practices) for logging an entire object containing sensitive information.
------------------------------------------------------------------------------------------------------------------------------------------------------
**Docs:**
AvoidSensitiveDataLoggedInDebugMethod[](#avoidsensitivedataloggedindebugmethod)
**Violation:**
   Sensitive data logged in debug method.

**Priority:** Medium (3)
**Description:**
   This rule identifies instances where sensitive data is logged using debug statements in the source code. Logging sensitive information such as passwords, credit card numbers, personal identification numbers, or other confidential data can lead to security vulnerabilities if log files are accessed by unauthorized individuals. Sensitive data should be handled and stored securely, and it should never be logged in plain text using system.debug method. Instead, use secure logging practices that mask or exclude sensitive information. Refer to the [OWASP Logging Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html) for more guidance.
**Example(s):**


