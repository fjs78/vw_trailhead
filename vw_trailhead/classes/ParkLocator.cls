public class ParkLocator {
    public static List<String> country(String con) {
        ParkService.ParksImplPort parks = new  ParkService.ParksImplPort();
        return parks.byCountry(con);        
    }
}