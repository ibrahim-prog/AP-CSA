ArrayList<Country> countries = new ArrayList<Country>();
Table table;
PImage map1;
// https://raw.githubusercontent.com/ibrahim-prog/AP-CSA/main/Equimap.jpg

void setup() {
  size(displayWidth, displayHeight);
  background(0, 0, 125);  
  map1 = loadImage("https://raw.githubusercontent.com/ibrahim-prog/AP-CSA/main/Equimap.jpg");
  map1.resize(width, 0);
  table = loadTable("https://raw.githubusercontent.com/ibrahim-prog/AP-CSA/main/COVID-19%20Coronavirus%20-%20Sheet3%20(2).csv");
  //table = loadTable("https://raw.githubusercontent.com/ibrahim-prog/AP-CSA/main/COVID-19%20Coronavirus.csv");
  makeCountries(100);
  updateMap();
}

void draw() {
  // if (mousePressed == true)
  
}

void makeCountries(int n) {
  for (int i = 1; i < n; i++)
  {
    String name = table.getString(i, 0);
    int pop = table.getInt(i, 3); 
    int tC = table.getInt(i, 5);
    int tD = table.getInt(i, 6);
    float dP = table.getFloat(i, 9);
    float lat = table.getFloat(i, 10);
    float longitude = table.getFloat(i, 11);
    countries.add( new Country(name, pop, tC, tD, dP, lat, longitude));
  }
}
   
void updateMap() {
  image(map1, 0, 0);
  fill(0);
  textSize(35);
  text("Click on a dot to view COVID-related statistics for that country! ", displayWidth/2 - 300, 50);

  for (Country c: countries)
  {
    /*float lat = table.getFloat(i, 10);
    float longitude = table.getFloat(i, 11);
    float x = map(longitude, -180, 180, 0, map1.width);
    float y = map(lat, 90, -90, 0, map1.height);
    */
    fill(0);
    ellipse(c.x, c.y, 5, 5);
    textSize(15);
    text(c.name, c.x, c.y);
    if (c.selected)
    {
      fill(255);
      rect(c.x + 10, c.y + 15, 250, 100);
      fill(0);
      textSize(15);
      text("Country: ", c.x + 15, c.y + 35); 
      text(c.name, c.x + 75, c.y + 35);
      
      text("Pop: ", c.x + 15, c.y + 50 );
      text(c.population, c.x + 75, c.y + 50);
      
      text("Total Cases: ", c.x + 15, c.y + 65 );
      text(c.totalCases, c.x + 125, c.y + 65);
      
      text("Total Deaths:", c.x + 15, c.y + 80);
      text(c.totalDeaths, c.x + 125, c.y + 80);
      
      text("Death Percentage (%): ", c.x + 15, c.y + 95);
      text(c.deathPercent, c.x + 155, c.y + 95);
      
      textSize(15);
      
    }
  }
}
  
  
void mousePressed() {
  for (Country c: countries)
  {
    c.selected = false;
    if (dist(mouseX, mouseY, c.x, c.y) < 3)
    {
      c.selected = true;
      
    }
    
  }
  updateMap();
}
      
      
 
  
//}
