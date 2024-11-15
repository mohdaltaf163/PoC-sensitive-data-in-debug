import { LightningElement } from 'lwc';
import logSensitiveDataAntiPatterns from '@salesforce/apex/SensitiveDataLogger.logSensitiveDataAntiPatterns';
import logHttpResponseAntiPatterns from '@salesforce/apex/SensitiveDataLogger.logHttpResponseAntiPatterns';
import logDatabaseQueryResultsAntiPatterns from '@salesforce/apex/SensitiveDataLogger.logDatabaseQueryResultsAntiPatterns';
import logInputParametersAntiPatterns from '@salesforce/apex/SensitiveDataLogger.logInputParametersAntiPatterns';
import logEntireObjectAntiPatterns from '@salesforce/apex/SensitiveDataLogger.logEntireObjectAntiPatterns';
import logSensitiveDataSecurePatterns from '@salesforce/apex/SensitiveDataLogger.logSensitiveDataSecurePatterns';
import logHttpResponseSecurePatterns from '@salesforce/apex/SensitiveDataLogger.logHttpResponseSecurePatterns';
import logDatabaseQueryResultsSecurePatterns from '@salesforce/apex/SensitiveDataLogger.logDatabaseQueryResultsSecurePatterns';
import logInputParametersSecurePatterns from '@salesforce/apex/SensitiveDataLogger.logInputParametersSecurePatterns';
import logEntireObjectSecurePatterns from '@salesforce/apex/SensitiveDataLogger.logEntireObjectSecurePatterns';

export default class SensitiveDataLogger extends LightningElement {
    logAntiPatterns() {
        logSensitiveDataAntiPatterns()
            .then(() => {
                console.log('Logged sensitive data anti-patterns');
            })
            .catch(error => {
                console.error('Error logging sensitive data anti-patterns', error);
            });

        logHttpResponseAntiPatterns()
            .then(() => {
                console.log('Logged HTTP response anti-patterns');
            })
            .catch(error => {
                console.error('Error logging HTTP response anti-patterns', error);
            });

        logDatabaseQueryResultsAntiPatterns()
            .then(() => {
                console.log('Logged database query results anti-patterns');
            })
            .catch(error => {
                console.error('Error logging database query results anti-patterns', error);
            });

        logInputParametersAntiPatterns('user123', 'P@ssw0rd!', '1234-5678-9876-5432', '123-45-6789')
            .then(() => {
                console.log('Logged input parameters anti-patterns');
            })
            .catch(error => {
                console.error('Error logging input parameters anti-patterns', error);
            });

        logEntireObjectAntiPatterns()
            .then(() => {
                console.log('Logged entire object anti-patterns');
            })
            .catch(error => {
                console.error('Error logging entire object anti-patterns', error);
            });
    }

    logSecurePatterns() {
        logSensitiveDataSecurePatterns()
            .then(() => {
                console.log('Logged sensitive data secure patterns');
            })
            .catch(error => {
                console.error('Error logging sensitive data secure patterns', error);
            });

        logHttpResponseSecurePatterns()
            .then(() => {
                console.log('Logged HTTP response secure patterns');
            })
            .catch(error => {
                console.error('Error logging HTTP response secure patterns', error);
            });

        logDatabaseQueryResultsSecurePatterns()
            .then(() => {
                console.log('Logged database query results secure patterns');
            })
            .catch(error => {
                console.error('Error logging database query results secure patterns', error);
            });

        logInputParametersSecurePatterns('user123', 'P@ssw0rd!', '1234-5678-9876-5432', '123-45-6789')
            .then(() => {
                console.log('Logged input parameters secure patterns');
            })
            .catch(error => {
                console.error('Error logging input parameters secure patterns', error);
            });

        logEntireObjectSecurePatterns()
            .then(() => {
                console.log('Logged entire object secure patterns');
            })
            .catch(error => {
                console.error('Error logging entire object secure patterns', error);
            });
    }
}