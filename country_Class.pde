public class Country {
  private String name;
  private int population;
  private int totalCases;
  private int totalDeaths;
  private float deathPercent;
  private float lat;
  private float longitude;
  private float x;
  private float y;
  private boolean selected;
  
  public Country(String name, int population, int totalCases, int totalDeaths, float deathPercent, float lat, float longitude)
  {
    this.name = name;
    this.population = population;
    this.totalCases = totalCases;
    this.totalDeaths = totalDeaths;
    this.deathPercent = deathPercent;
    this.lat = lat;
    this.longitude = longitude;
    this.x = map(longitude, -180, 180, 0, map1.width);
    this.y = map(lat, 90, -90, 0, map1.height);
    this.selected = false;
    
  }
  
  /*
  public void display() {
    rect();
  }
  */
    
}


  
  
  
