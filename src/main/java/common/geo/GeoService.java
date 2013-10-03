package common.geo;

public interface GeoService {
    PostalAddress geo(String location) throws Exception;
}
