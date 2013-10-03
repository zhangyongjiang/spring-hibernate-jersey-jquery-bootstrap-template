package common.geo;

public class Box {
    private Location location;
    private Location size;

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public Location getSize() {
        return size;
    }

    public void setSize(Location size) {
        this.size = size;
    }
    
    public Location minValue() {
        return new Location(location);
    }
    
    public Location maxValue() {
        Location loc = new Location();
        loc.setX(this.location.getX() + this.size.getX());
        loc.setY(this.location.getY() + this.size.getY());
        return loc;
    }
    
    public static Box getBox(Location location, Location size) {
        Box box = new Box();
        box.setSize(new Location(size));
        Location boxloc = new Location(location);
        box.setLocation(boxloc);
        
        if((location.getX() % size.getX()) != 0) {
            int x = (boxloc.getX() / size.getX()) * size.getX();
            if(location.getX() < 0) {
                x -= size.getX();
            }
            boxloc.setX(x);
        }
        
        if((location.getY() % size.getY()) != 0) {
            int y = (boxloc.getY() / size.getY()) * size.getY();
            if(location.getY() < 0) {
                y -= size.getY();
            }
            boxloc.setY(y);
        }
        
        return box;
    }
    
    @Override
    public String toString() {
        return "location: " + location.toString() + ", size: " + size.toString();
    }
    
    public static void main(String[] args) {
        Location size = new Location(3, 3);
        for(int x = -15; x<15; x++) {
            for(int y = -15; y<15; y++) {
                Location loc = new Location(x, y);
                Box box = getBox(loc, size);
                System.out.println(x + "\t" + y + "\t" + box);
            }
        }
    }
}
