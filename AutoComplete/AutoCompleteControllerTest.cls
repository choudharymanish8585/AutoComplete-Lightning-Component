@isTest
public with sharing class AutoCompleteControllerTest {
    @TestSetup
    static void makeData(){
        Account acc = new Account(Name='Salesforce');
        insert acc;
    }

    @isTest
    public static void testGetRecords(){
        List<SObject> accounts = AutoCompleteController.getRecords('sales', 'Account', 'Id', 'Name', null, 10);
        System.assertEquals(1, accounts.size());
        accounts = AutoCompleteController.getRecords('abc', 'Account', 'Id', 'Name', '', 100);
        System.assertEquals(0, accounts.size());
    }
}
