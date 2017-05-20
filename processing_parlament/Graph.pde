class DatumSlider {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax;
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;
  
  public DatumSlider (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight/2 + 1;
    loose = l;
  }
  
  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }
  
  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }
  
  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }
  
  void render(String datum) {
    fill(255);
    stroke(0);
    rect(xpos, ypos + 6, swidth, sheight - 12);
    if (over || locked) {
      fill(75);
    } else {
      fill(200);
    }
    rect(spos, ypos, sheight/2, sheight);
    fill(255);
    textSize(12);
    text(datum, spos - textWidth(datum)/2, ypos + 35);
  }
  
  float getPos() {
    return spos * ratio;
  }
  
  float getProc() {
    return (this.getPos() - this.xpos) / (swidth + sheight);
  }
}
static class XMLUtils{
  static boolean a_type(XML file, String atrValue){
    return file.getString("type").equals(atrValue);
  }
  static String a_who(XML file){
    String who = file.getString("who");
    who = who.substring(1,who.length());
    return who;
  }
}
class Camera {
  float x, y, zoom;
  
  public Camera(float x, float y) {
    this.x = x;
    this.y = y;
    zoom = 1.0f;
  }
}
class Edge {
  Node endpoint1, endpoint2;
  float distance;
  
  public Edge(Node e1, Node e2) {
    endpoint1 = e1;
    endpoint2 = e2;
    
    distance = e1.distanceToNode(e2);
    
    e1.edges.add(this);
    e2.edges.add(this);
  }
  
  public Node getOppositeNode(Node n) {
    if(endpoint1.equals(n))
      return endpoint2;
    else if(endpoint2.equals(n))
      return endpoint1;
    
    return null;
  }
  
  public void render() {
    stroke(255);
    line(endpoint1.x, endpoint1.y, endpoint2.x, endpoint2.y);
    noStroke();
  }
}
class Node {
  float x, y;
  float radius;
  PStranka data;
  ArrayList<Edge> edges;
  boolean drawable;
  String datum_prikaza;
  float text_y;
  
  public Node(float x, float y, PStranka s) {
    this.x = x;
    this.y = y;
    this.data = s;
    text_y = 0;
    datum_prikaza = null;
    
    radius = 30;
    edges = new ArrayList<Edge>();
  }
  
  public float distanceToNode(Node n) {
    return (float)Math.sqrt(Math.pow(this.x - n.x, 2) + Math.pow(this.y - n.y, 2));
  }
  
  public boolean isOverlapping(Node n) {
    return this.distanceToNode(n) - this.radius - n.radius < 0;
  }
  
  public boolean isOverlapping(Node n, float radius) {
    return this.distanceToNode(n) - radius*2 < 0;
  }
  
  public void shift(float dx, float dy) {
    x += (dx * 0.35f);
    y += (dy * 0.35f);
  }
  
  public void render(Camera cam, String datum) {
    String s;
    s = data.imeStranke("init", datum);
    
    if(s != null) {
      drawable = true;
      ellipseMode(RADIUS);
      fill(150,150,150);
      ellipse(x, y, radius, radius);
      
      HashMap<String, Integer> besede = null; //tole ni več prav način data.besede.get(datum);
      //Potrebno bo obdelati grupe besed
      ArrayList<GrupaBesed> grupeBesed = data.grupeBesed;
      long vseBesede = 0;
      if(grupeBesed != null && grupeBesed.size() > 0){
        for(GrupaBesed gB: grupeBesed){
          vseBesede+=gB.vsePojavitve(datum); //prišteje se vse pojavitve besed za vsako grupo
        }
        
        int brightness_diff = 55;
        float start = 0;
        for(GrupaBesed gB: grupeBesed){
            besede = gB.besede.get(datum);
            int[] barva = barve_grup.get(gB.labelGrupe);
            int shift_barve = 0;
            if(besede != null) {
              for(String beseda : besede.keySet()) {
                float percentage = TWO_PI*float(besede.get(beseda))/float(int(vseBesede));
                
                colorMode(HSB, 360, 100, 100);
                fill(barva[0], barva[1], barva[2] - grupe_besed.get(gB.labelGrupe).get(beseda)*5);
                arc(x, y, radius, radius, start, start + percentage);
                colorMode(RGB, 255, 255, 255);
                
                start += percentage;
                shift_barve += brightness_diff/besede.size();
              }
            //dobi procent gB od vseh besed
            //dobi procent besed gB znotraj procenta gB
          }
        }
        
        if(sq(mouseX-(x*cam.zoom+cam.x)) + sq(mouseY-(y*cam.zoom+cam.y)) <= sq(radius*cam.zoom)) {
          if(text_y < radius + 10) text_y += 4;
          s = data.imeStranke("yes", datum);
          textSize(6);
          start = 0;
          for(GrupaBesed gB: grupeBesed) {
            besede = gB.besede.get(datum);
            if(besede != null) {
              for(String beseda : besede.keySet()) {
                float percentage = TWO_PI*float(besede.get(beseda))/float(int(vseBesede));
                if(percentage == TWO_PI) {
                  fill(255, 255, 255);
                  text(beseda, x - textWidth(beseda)/2, y + textAscent()/2);
                }else {
                  float angle = atan2(mouseY - (y*cam.zoom+cam.y), mouseX - (x*cam.zoom+cam.x));
                  angle = angle < 0 ?  TWO_PI+angle : angle;
                   println(start + " %:" + percentage + " /:" + angle);
                  if(angle >= start && angle <= start + percentage) {
                    pushMatrix();
                    textSize(6);
                    translate(x, y);
                    rotate(start + percentage/2);
                    fill(255, 255, 255);
                    
                    float deg = degrees(start + percentage/2);
                    if(deg >= 130.0f && deg <= 230) {
                      pushMatrix();
                      rotate(PI);
                      textAlign(RIGHT);
                      text(beseda , -8, textAscent()/4);
                      textAlign(LEFT);
                      popMatrix();
                    }else {
                      text(beseda , 8, textAscent()/4);
                    }
                    popMatrix();
                  }
                }
                
                start += percentage;
              }
            }
          }
        }else {
          textSize(14);
          if(text_y > 0) text_y -= 1;
        }
          
        textSize(14);
        fill(255,255,255);
        text(s, (x - textWidth(s)/2), (y - text_y + textAscent()/2));
      }
     }else {
      drawable = false;
    }
  }
}
class Graph {
  ArrayList<Node> nodes;
  ArrayList<Edge> edges;
  
  public Graph() {
    nodes = new ArrayList<Node>();
    edges = new ArrayList<Edge>();
  }
  
  public void separateNodes(float minDistance) {
    Node n1, n2;
    PVector v1, v2;
    float distance, strength;
    int dx, dy, dx1, dy1, dx2, dy2;
    
    float k = 25000.0f;
    float maxAcceleration = 15.0f;
    
    for(int i = 0; i < nodes.size(); i++) {
      n1 = nodes.get(i);
      for(int j = 0; j < nodes.size(); j++) {
        n2 = nodes.get(j);
        if(i != j && n1.isOverlapping(n2, minDistance) && n1.drawable && n2.drawable) {
          v1 = new PVector(n1.x, n1.y);
          v2 = new PVector(n2.x, n2.y);
          
          PVector d = v2.sub(v1);
          
          if(d.mag() == 0) {
            d = new PVector((float)Math.random()*2-1 , (float)Math.random()*2-1);
          }
          
          distance = Math.max(d.mag(), 1.0f);
          strength = Math.min(k/(distance * distance), maxAcceleration);
          
          d.normalize();
          dx = Math.round(d.x * strength);
          dy = Math.round(d.y * strength);
          
          dx1 = -dx/2;
          dx2 = dx + dx1;
          
          dy1 = -dy/2;
          dy2 = dy + dy1;
          
          n1.shift(dx1, dy1);
          n2.shift(dx2, dy2);
        }
      }
    }
  }
}
class Legend{
  int xPos;
  int yPos; 
  int titleSIze;
  int grSize;
  int width;
  int height;
  private int vertPad = 5;
  private int horPad = 5;
  
  HashMap<String,int[]> lokalneBarve;
  public Legend(){
    width = 10;
    height=10;
    xPos = 0;
    yPos = 0;
    titleSIze=10;
    grSize = 7;
    lokalneBarve = new HashMap<String,int[]>();
  }
  public Legend(int x, int y, int ts, int gs){
    xPos=x;
    yPos=y;
    titleSIze = ts;
    grSize = gs;
    lokalneBarve = new HashMap<String,int[]>();
    width = 10;
    height=10;
  }
  public void setup(){
    pushMatrix();
      textSize(titleSIze);
      width=Math.round(textWidth("LEGENDA:"))+horPad*2;
      height=Math.round(textAscent())+vertPad*2;
      println(width + " || " + height);
    popMatrix();
    for(String labelGrupe : barve_grup.keySet()){
      lokalneBarve.put(Character.toUpperCase(labelGrupe.charAt(0))+labelGrupe.substring(1, labelGrupe.length()), barve_grup.get(labelGrupe));  
    }
    println(lokalneBarve.keySet());
  }
  
  public void render(){
    pushMatrix();
      //ozadje legende
      translate(xPos,yPos);
      fill(255,200);
      rect(0,0,width,height);
      pushMatrix();
        translate(horPad,vertPad);
        textSize(titleSIze);
        fill(0);
        text("LEGENDA:",0 ,0);
      popMatrix();
    popMatrix();

  }

}