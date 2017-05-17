
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
}
class Node {
  float x, y;
  float radius;
  PStranka data;
  ArrayList<Edge> edges;
  boolean drawable;
  
  public Node(float x, float y, PStranka s) {
    this.x = x;
    this.y = y;
    this.data = s;
    text_y = 0;
    
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
  
  float text_y;
  void render(Camera cam, String datum) {
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
      if(grupeBesed != null && grupeBesed.size() >0 ){
        for(GrupaBesed gB: grupeBesed){
          vseBesede+=gB.vsePojavitve(datum); //prišteje se vse pojavitve besed za vsako grupo
        }
        for(GrupaBesed gB: grupeBesed){
          //dobi procent gB od vseh besed
          //dobi procent besed gB znotraj procenta gB
          
        }

      }
      //println("Vse pojavitve besed za str " + data.getID() +":  " +vseBesede);

      if(besede != null) {
        int vsota = 0;
        for(int st : besede.values()) {
          vsota += st;
        }
        
        int i = 0;
        float start = 0;
        for(String beseda : besede.keySet()) {
          float percentage = TWO_PI*float(besede.get(beseda))/float(vsota);
          //println("stranka:" + this.data.imeStranke("init", datum) + " b:" + beseda + " %:" + percentage + " v:" + vsota + " st:" + besede.get(beseda));
          
          int barva = 0;
          for(int j = 0; j < beseda.length(); j++) {
            barva += beseda.charAt(j);
          }
          fill(barva*17%255, barva*13%255, barva*11%255, 95);
          arc(x, y, radius, radius, start, start + percentage);
          i = (i+13)%255;
          start += percentage;
          
          if(sq(mouseX-(x*cam.zoom+cam.x)) + sq(mouseY-(y*cam.zoom+cam.y)) <= sq(radius*cam.zoom)) {
            if(start == TWO_PI && start-percentage == 0) {
              fill(255, 255, 255);
              text(beseda, x - textWidth(beseda)/2, y + textAscent()/2);
            }else {
              float angle = atan2(mouseY - (y*cam.zoom+cam.y), mouseX - (x*cam.zoom+cam.x));
              angle = angle < 0 ?  TWO_PI+angle : angle;
              if(angle >= start - percentage && angle <= start) {
                pushMatrix();
                textSize(6);
                translate(x, y);
                rotate(start - percentage/2);
                fill(255, 255, 255);
                text(beseda, 8, textAscent()/4);
                popMatrix();
              }
            }
          }
        }
      }
      
      if(sq(mouseX-(x*cam.zoom+cam.x)) + sq(mouseY-(y*cam.zoom+cam.y)) <= sq(radius*cam.zoom)) {
        //println("texty:" + text_y + " y:" + y + " dafak:" + (y - radius - 10) + " bool:" + (text_y > y - radius - 10));
        if(text_y < radius + 10) text_y += 4;
        s = data.imeStranke("yes", datum);
        textSize(6);
      }else {
        textSize(14);
        if(text_y > 0) text_y -= 1;
      }
      
      textSize(14);
      fill(255,255,255);
      text(s, (x - textWidth(s)/2), (y - text_y + textAscent()/2));
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
