public class Notes {
	//-----------------
    //The equality operator (==) performs case-insensitive string comparisons, 
	//so there is no need to convert the string to lower case first. 
	//This means that passing in 'ca' or 'Ca' will satisfy the equality condition with the string literal 'CA'.
	//-----------------
	//
	//You can save up to 3 MB of Apex code in each org. Test classes annotated with @isTest don’t count toward this limit.
	//-----------------
	//Even though test data rolls back, no separate database is used for testing. As a result, for some sObjects that have fields with unique constraints, inserting duplicate sObject records results in an error.
	//-----------------
	//Test methods don’t send emails.
	//-----------------
	//Test methods can’t make callouts to external services. You can use mock callouts in tests.
	//-----------------
	//SOSL searches performed in a test return empty results. To ensure predictable results, use Test.setFixedSearchResults() to define the records to be returned by the search.
    
    
}