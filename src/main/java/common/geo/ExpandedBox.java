package common.geo;

public class ExpandedBox extends Box {
    private Location overlap;

    public Location minValue() {
        Location loc = new Location();
        loc.setX(getLocation().getX() - overlap.getX());
        loc.setY(getLocation().getY() - overlap.getY());
        return loc;
    }
    
    public Location maxValue() {
        Location loc = new Location();
        loc.setX(getLocation().getX() + overlap.getX() + getSize().getX());
        loc.setY(getLocation().getY() + overlap.getY() + getSize().getY());
        return loc;
    }

    public Location getOverlap() {
        return overlap;
    }

    public void setOverlap(Location overlap) {
        this.overlap = overlap;
    }
    
    @Override
    public String toString() {
        return super.toString() + ", overlap: " + overlap;
    }
    
    public Location getExpandedSize() {
        Location size = new Location(getSize());
        size.setX(size.getX() + overlap.getX());
        size.setY(size.getY() + overlap.getY());
        return size;
    }
    
    public static ExpandedBox getExpandedBox(Location location, Location size, Location overlap) {
        Box box = Box.getBox(location, size);
        ExpandedBox expanded = new ExpandedBox();
        expanded.setLocation(box.getLocation());
        expanded.setSize(box.getSize());
        expanded.setOverlap(overlap);
        return expanded;
    }
    
    public static void main(String[] args) {
        Location size = new Location(3, 3);
        Location overlap = new Location(1, 1);
        for(int x = -15; x<15; x++) {
            for(int y = -15; y<15; y++) {
                Location loc = new Location(x, y);
                ExpandedBox box = getExpandedBox(loc, size, overlap);
                System.out.println(x + "\t" + y + "\t" + box);
                System.out.println("min: " + box.minValue());
                System.out.println("max: " + box.maxValue());
                System.out.println();
            }
        }
    }
}
