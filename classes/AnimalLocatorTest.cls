@isTest
public class AnimalLocatorTest {
	@isTest
    static void TestAnimalLocator() {        
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        HttpResponse response;// = AnimalLocator.getAnimalNameById(2);
        // Verify that the response received contains fake values
        //String contentType = response.getHeader('Content-Type');
        //System.assert(contentType == 'application/json');
        String actualValue = AnimalLocator.getAnimalNameById(2);
        //System.debug(response.getBody());
        //String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        String expectedValue = 'bear';
        System.assertEquals(actualValue, expectedValue);
        //System.assertEquals(200, response.getStatusCode());
    }
}