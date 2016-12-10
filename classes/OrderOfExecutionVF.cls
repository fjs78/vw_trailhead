public class OrderOfExecutionVF {
    public String hello {get;set;}
    
    public OrderOfExecutionVF() {
        hello = 'Mike';
        System.debug('===In constructor===@' + System.now() );
    }
    
    public void theActionMethod() {
        hello = 'John';
        System.debug('===In theActionMethod===@' + System.now() );
    }

}