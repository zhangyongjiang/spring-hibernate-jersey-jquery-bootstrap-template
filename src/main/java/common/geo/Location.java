package common.geo;

public class Location {
    private int x;
    private int y;

    public Location() {
    }
    
    public Location(int x, int y) {
        this.x = x;
        this.y = y;
    }
    
    public Location(Location loc) {
        this(loc.getX(), loc.getY());
    }
    
    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }
    
    public float getFloatY() {
        return y;
    }

    public float getFloatX() {
        return x;
    }

    public void setY(int y) {
        this.y = y;
    }

    @Override
    public String toString() {
        return x + " - " + y;
    }
}
