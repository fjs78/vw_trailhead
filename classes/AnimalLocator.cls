public class AnimalLocator {
    public static String getAnimalNameById(Integer theid) {        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String theAnimalName = '';
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + theid);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            JSONParser parser = JSON.createParser(response.getBody());
            while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
                (parser.getText() == 'Name')) {
                    parser.nextToken();
                    theAnimalName = parser.getText();
                }
            }
        } 
        return theAnimalName;
 	}
}