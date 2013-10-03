package common.geo.google;

import java.io.InputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.io.IOUtils;

import common.geo.GeoService;
import common.geo.Geocode;
import common.geo.PostalAddress;
import common.geo.PostalAddressParser;
import common.util.JacksonUtil;

public class GoogleGeoService implements GeoService {

	@Override
    public PostalAddress geo(String location) throws Exception {
		Geocode geocode = new Geocode();
		String url = "http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=" + URLEncoder.encode(location);
		InputStream input = new URL(url).openStream();
        String content = IOUtils.toString(input );
        input.close();
	
		HashMap<String, Object> map = JacksonUtil.getObjectMapper().readValue(content, JacksonUtil.getTypeRef());
		List results = (List) map.get("results");
		map = (HashMap<String, Object>) results.get(0);
		
		String[] formattedAddress = map.get("formatted_address").toString().replaceAll(", ", ",").split(",");
		String street = formattedAddress[0];
		String city = formattedAddress[1];
		String state = formattedAddress[2].split(" ")[0];
		
		PostalAddress postalAddress = PostalAddressParser.parse(street, city, state);
		
        try {
            String zip = formattedAddress[2].split(" ")[1];
            postalAddress.setZipcode(zip);
        }
        catch (Exception e) {
            System.out.println("no zipcode found for " + location);
        }
		
		postalAddress.setGeocode(geocode);
		
		map = (HashMap<String, Object>) map.get("geometry");
		map = (HashMap<String, Object>) map.get("location");
		geocode.setLatitude(Float.parseFloat(map.get("lat").toString()));
		geocode.setLongitude(Float.parseFloat(map.get("lng").toString()));
	    return postalAddress;
    }

	public static void main(String[] args) throws Exception {
//        PostalAddress geo = new GoogleGeoService().geo("1365 Todd Street, ca 94040");
        PostalAddress geo = new GoogleGeoService().geo("boston,ma");
        System.out.println(geo + "\n" + geo.getCity() + "\n" + geo.getState() + "\n" + geo.getZipcode() + "\n" + geo.getGeocode());
    }
}
