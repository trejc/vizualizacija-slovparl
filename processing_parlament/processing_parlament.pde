 
import java.util.Map;
import java.io.*;
import java.util.*;

public String [] getFileNames(){
  String [] imenaDatotek  = {
    "1990-05-07-ZbZdruDel-s001-01.xml",
    "1990-05-08-ZbZdruDel-s001-02.xml",
    "1990-05-09-ZbZdruDel-s001-03.xml",
    "1990-06-13-ZbZdruDel-s002-01.xml",
    "1990-06-14-ZbZdruDel-s002-02.xml",
    "1990-07-02-ZbZdruDel-s003-01.xml",
    "1990-07-18-ZbZdruDel-s004-01.xml",
    "1990-07-19-ZbZdruDel-s004-02.xml",
    "1990-07-30-ZbZdruDel-s004-03.xml",
    "1990-07-31-ZbZdruDel-s004-04.xml",
    "1990-09-27-ZbZdruDel-s005-01.xml",
    "1990-09-28-ZbZdruDel-s005-02.xml",
    "1990-10-04-ZbZdruDel-s006-01.xml",
    "1990-10-12-ZbZdruDel-s007-01.xml",
    "1990-10-25-ZbZdruDel-s008-01.xml",
    "1990-10-30-ZbZdruDel-s008-02.xml",
    "1990-11-08-ZbZdruDel-s009-01.xml",
    "1990-11-20-ZbZdruDel-s010-01.xml",
    "1990-11-21-ZbZdruDel-s010-02.xml",
    "1990-11-27-ZbZdruDel-s010-03.xml",
    "1990-12-05-ZbZdruDel-s011-01.xml",
    "1990-12-06-ZbZdruDel-s011-02.xml",
    "1990-12-11-ZbZdruDel-s011-03.xml",
    "1990-12-19-ZbZdruDel-s011-04.xml",
    "1990-12-19-ZbZdruDel-s012-01.xml",
    "1990-12-20-ZbZdruDel-s012-02.xml",
    "1990-12-26-ZbZdruDel-s012-03.xml",
    "1990-12-27-ZbZdruDel-s012-04.xml",
    "1991-01-23-ZbZdruDel-s013-01.xml",
    "1991-01-24-ZbZdruDel-s013-02.xml",
    "1991-01-30-ZbZdruDel-s013-03.xml",
    "1991-02-20-ZbZdruDel-s014-01.xml",
    "1991-03-05-ZbZdruDel-s015-01.xml",
    "1991-03-06-ZbZdruDel-s015-02.xml",
    "1991-03-07-ZbZdruDel-s015-03.xml",
    "1991-03-14-ZbZdruDel-s016-01.xml",
    "1991-03-19-ZbZdruDel-s017-01.xml",
    "1991-03-27-ZbZdruDel-s018-01.xml",
    "1991-03-28-ZbZdruDel-s018-02.xml",
    "1991-03-29-ZbZdruDel-s018-03.xml",
    "1991-04-17-ZbZdruDel-s019-01.xml",
    "1991-04-18-ZbZdruDel-s019-02.xml",
    "1991-05-09-ZbZdruDel-s021-01.xml",
    "1991-05-15-ZbZdruDel-s021-02.xml",
    "1991-05-21-ZbZdruDel-s022-01.xml",
    "1991-05-22-ZbZdruDel-s022-02.xml",
    "1991-05-30-ZbZdruDel-s021-03.xml",
    "1991-06-03-ZbZdruDel-s021-04.xml",
    "1991-06-05-ZbZdruDel-s021-05.xml",
    "1991-06-12-ZbZdruDel-s023-01.xml",
    "1991-06-19-ZbZdruDel-s024-01.xml",
    "1991-07-17-ZbZdruDel-s025-01.xml",
    "1991-07-18-ZbZdruDel-s025-02.xml",
    "1991-07-30-ZbZdruDel-s026-01.xml",
    "1991-07-31-ZbZdruDel-s026-02.xml",
    "1991-07-31-ZbZdruDel-s027-01.xml",
    "1991-08-28-ZbZdruDel-s028-01.xml",
    "1991-08-29-ZbZdruDel-s028-02.xml",
    "1991-09-11-ZbZdruDel-s029-01.xml",
    "1991-09-12-ZbZdruDel-s029-02.xml",
    "1991-09-18-ZbZdruDel-s029-03.xml",
    "1991-09-26-ZbZdruDel-s030-01.xml",
    "1991-10-03-ZbZdruDel-s030-02.xml",
    "1991-10-07-ZbZdruDel-s031-01.xml",
    "1991-10-08-ZbZdruDel-s031-02.xml",
    "1991-10-09-ZbZdruDel-s030-03.xml",
    "1991-10-23-ZbZdruDel-s032-01.xml",
    "1991-10-24-ZbZdruDel-s032-02.xml",
    "1991-10-30-ZbZdruDel-s032-03.xml",
    "1991-11-13-ZbZdruDel-s033-01.xml",
    "1991-11-20-ZbZdruDel-s032-04.xml",
    "1991-11-20-ZbZdruDel-s034-01.xml",
    "1991-11-21-ZbZdruDel-s034-02.xml",
    "1991-12-11-ZbZdruDel-s035-01.xml",
    "1991-12-17-ZbZdruDel-s036-01.xml",
    "1991-12-18-ZbZdruDel-s036-02.xml",
    "1991-12-20-ZbZdruDel-s036-03.xml",
    "1991-12-23-ZbZdruDel-s036-04.xml",
    "1991-12-23-ZbZdruDel-s037-01.xml",
    "1991-12-27-ZbZdruDel-s036-05.xml",
    "1992-01-15-ZbZdruDel-s036-06.xml",
    "1992-01-16-ZbZdruDel-s038-01.xml",
    "1992-01-22-ZbZdruDel-s036-07.xml",
    "1992-01-22-ZbZdruDel-s038-02.xml",
    "1992-02-12-ZbZdruDel-s036-08.xml",
    "1992-02-12-ZbZdruDel-s038-03.xml",
    "1992-03-04-ZbZdruDel-s039-01.xml",
    "1992-03-05-ZbZdruDel-s039-02.xml",
    "1992-03-11-ZbZdruDel-s040-01.xml",
    "1992-03-19-ZbZdruDel-s041-01.xml",
    "1992-03-25-ZbZdruDel-s040-02.xml",
    "1992-03-27-ZbZdruDel-s040-03.xml",
    "1992-03-27-ZbZdruDel-s041-02.xml",
    "1992-03-30-ZbZdruDel-s040-04.xml",
    "1992-04-08-ZbZdruDel-s042-01.xml",
    "1992-04-22-ZbZdruDel-s043-01.xml",
    "1992-05-13-ZbZdruDel-s044-01.xml",
    "1992-05-14-ZbZdruDel-s044-02.xml",
    "1992-06-10-ZbZdruDel-s045-01.xml",
    "1992-06-11-ZbZdruDel-s045-02.xml",
    "1992-06-17-ZbZdruDel-s045-03.xml",
    "1992-07-01-ZbZdruDel-s046-01.xml",
    "1992-07-16-ZbZdruDel-s047-01.xml",
    "1992-07-22-ZbZdruDel-s048-01.xml",
    "1992-07-23-ZbZdruDel-s048-02.xml",
    "1992-07-29-ZbZdruDel-s046-02.xml",
    "1992-07-29-ZbZdruDel-s048-03.xml",
    "1992-07-29-ZbZdruDel-s049-01.xml",
    "1992-07-30-ZbZdruDel-s046-03.xml",
    "1992-07-30-ZbZdruDel-s049-02.xml",
    "1992-09-09-ZbZdruDel-s050-01.xml",
    "1992-09-10-ZbZdruDel-s049-03.xml",
    "1992-09-10-ZbZdruDel-s050-02.xml",
    "1992-09-23-ZbZdruDel-s052-01.xml",
    "1992-09-24-ZbZdruDel-s046-04.xml",
    "1992-09-29-ZbZdruDel-s052-02.xml",
    "1992-10-07-ZbZdruDel-s049-04.xml",
    "1992-10-07-ZbZdruDel-s052-03.xml",
    "1992-10-07-ZbZdruDel-s053-01.xml",
    "1992-10-08-ZbZdruDel-s053-02.xml",
    "1992-10-14-ZbZdruDel-s053-03.xml",
    "1992-10-14-ZbZdruDel-s054-01.xml",
    "1992-10-28-ZbZdruDel-s055-01.xml",
    "1992-10-29-ZbZdruDel-s055-02.xml",
    "1992-11-04-ZbZdruDel-s055-03.xml",
    "1992-11-05-ZbZdruDel-s055-04.xml",
    "1992-11-11-ZbZdruDel-s055-05.xml",
    "1992-11-11-ZbZdruDel-s056-01.xml",
    "1992-11-18-ZbZdruDel-s055-06.xml",
    "1992-11-18-ZbZdruDel-s056-02.xml",
    "1992-11-26-ZbZdruDel-s055-07.xml",
    "1992-11-26-ZbZdruDel-s056-03.xml"
    };
  return imenaDatotek;
}


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
    sposMax = xpos + swidth - sheight/2;
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
    x += (dx * 0.4f);
    y += (dy * 0.4f);
  }
  
  void render(Camera cam, String datum) {
    String s;
    if(cam.zoom < 2.0f) {
      s = data.imeStranke("init", datum);
      textSize(14);
    }else {
      s = data.imeStranke("yes", datum);
      textSize(6);
    }
    
    if(s != null) {
      drawable = true;
      ellipseMode(RADIUS);
      fill(255,255,255);
      ellipse(x, y, radius, radius);
      fill(0,0,0);
      text(s, (x - textWidth(s)/2), (y + textAscent()/2));
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


static class PStranka {
  XML[] orgNames;
  HashMap<String, Politik> politiki;
  //<datum-stseje,<beseda, stPonovitev>>
  HashMap<String, HashMap<String,Integer>> besede;
  SortedSet<String> UrejeniDatumiBesed = null;
  String id;
  public PStranka() {
    politiki = new HashMap<String, Politik>();
    besede = new HashMap<String, HashMap<String,Integer>>();
  }
  
  public PStranka(XML[] orgNames) {
    this.orgNames = orgNames;
    besede = new HashMap<String, HashMap<String,Integer>>();
    politiki = new HashMap<String, Politik>();
  }
  
  public void dodaj_podatke_iz_xml(XML xml) {
    this.orgNames = xml.getChildren("orgName");

  }
  public String getID(){
    if(this.id != null) return this.id;
    else return "stranka nima IDja";
  }

  static int zanimivaBesednaZveza = 0;
  static String bZ = "";
  static HashMap<String, Integer> zanimiveBesede = new HashMap<String, Integer> ();

  static void zanimivo(String beseda){
    PStranka.zanimiveBesede.put(beseda, 1);
  }
  public void obdelajBesedo(String datum_Seja, String normiranaBeseda, String beseda ){
      //println("Obdelava besede: "+ normiranaBeseda);
      if(zanimivaBesednaZveza > 0){
        bZ+= " "+ beseda;
        zanimivaBesednaZveza--;
      }else if(!bZ.equals("")) {
        zanimivaBesednaZveza = -1;
        println(bZ);
        bZ = "";
      }
      if(normiranaBeseda.length() <= 3 ) return;
      if(normiranaBeseda.equals("biti")) return;
      if(normiranaBeseda.equals("proti") && zanimivaBesednaZveza != -1) {
        bZ+="****ZANIMIVA BES ZVEZA:>>>>>" +datum_Seja +": "+ beseda;
        zanimivaBesednaZveza = 5;
      }else if ( zanimivaBesednaZveza == -1)  zanimivaBesednaZveza = 0;
     
      if(! (PStranka.zanimiveBesede.containsKey(normiranaBeseda) || normiranaBeseda.substring(normiranaBeseda.length()-3,normiranaBeseda.length()).equals("ost")) ) return;
      try{
        if(!this.besede.containsKey(datum_Seja)){
          //za ta datum-štSeje še ni bilo nobene besede
         // println("[obdelajBesedo] datum " +datum_Seja + "še ni v bazi 'besede'" );
          HashMap<String,Integer> trBeseda = new HashMap<String,Integer>();
          trBeseda.put(normiranaBeseda, 1);
          this.besede.put(datum_Seja, trBeseda);
        }else if(! besede.get(datum_Seja).containsKey(normiranaBeseda)){
          //za ta datum-štSeje že so besede, samo 'normiranaBeseda' se je zgodila 
          //prvič
         // println("[obdelajBesedo] besede " +normiranaBeseda + "še ni v bazi 'besede' za datum " + datum_Seja );
          besede.get(datum_Seja).put(normiranaBeseda, 1);
        }else{
          //beseda se je za ta datum-štSeje že pojavila
          besede.get(datum_Seja).put(normiranaBeseda,  besede.get(datum_Seja).get(normiranaBeseda) + 1);
        }
      }catch(Exception e){
        println("error [obdelajBesedo]  ob klicu " +datum_Seja + ", " + normiranaBeseda +" this.besede= " + this.besede);
        e.printStackTrace();
      } 
  }
  
  public String imeStranke(String full, String datum) { 
    int leto = Integer.parseInt(datum.substring(0, 4));
    int mesec = Integer.parseInt(datum.substring(5, 7));
    int dan = Integer.parseInt(datum.substring(8));
    
    for(XML orgName : orgNames) {
      if(orgName.getString("full") != null) {
        if(orgName.getString("full").equals(full)) {
          if(orgName.getString("from") != null) {
            String from_datum = orgName.getString("from");
            int from_leto = Integer.parseInt(from_datum.substring(0, 4));
            int from_mesec = Integer.parseInt(from_datum.substring(5, 7));
            int from_dan = from_datum.length() > 8 ? Integer.parseInt(from_datum.substring(8)) : 1;
            
            if(from_leto < leto) {
              return orgName.getContent();
            }else if(from_leto == leto) {
              if(from_mesec < mesec) {
                return orgName.getContent();
              }else if(from_mesec == mesec) {
                if(from_dan < dan) {
                  return orgName.getContent();
                }
              }
            }
          }else if(orgName.getString("to") != null) {
            String to_datum = orgName.getString("to");
            int to_leto = Integer.parseInt(to_datum.substring(0, 4));
            int to_mesec = Integer.parseInt(to_datum.substring(5, 7));
            int to_dan = to_datum.length() > 8 ? Integer.parseInt(to_datum.substring(8)) : 1;
            
            if(to_leto > leto) {
              return orgName.getContent();
            }else if(to_leto == leto) {
              if(to_mesec > mesec) {
                return orgName.getContent();
              }else if(to_mesec == mesec) {
                if(to_dan > dan) {
                  return orgName.getContent();
                }
              }
            }
          }else {
            return orgName.getContent();
          }
        }
      }else {
        if(full.equals("init")) {
          return orgName.getParent().getString("xml:id").substring(3);
        }else {
          return orgName.getContent();
        }
      }
    }
    
    return null;
  }
}


static class Politik {
  String id;
  String ime;
  String priimek;
  String datum_rojstva;
  String datum_smrti;
  String kraj_rojstva;
  String drzava_rojstva;
  PStranka stranka;
  XML XMLperson;

  //hashmap <datumSeje-štSeje, [kumulativaBesedDoDatuma, besedeTeGaGovora] >
  HashMap<String, Long[]>  StBesedNaSejo;
  SortedSet<String> UrejeniDatumi = null;
  long kumulativaBesedDoDatuma = 0;

  public Politik() {
    stranka = null;
  }
  
  public Politik(String ime, String priimek, String datum_rojstva, String datum_smrti, String kraj_rojstva, String drzava_rojstva, PStranka stranka) {
    this.ime = ime;
    this.priimek = priimek;
    this.datum_rojstva = datum_rojstva;
    this.datum_smrti = datum_smrti;
    this.kraj_rojstva = kraj_rojstva;
    this.drzava_rojstva = drzava_rojstva;
    this.stranka = stranka;
    this.id = this.get_id();
  }
  
  public Politik(XML XMLdata){
    this.stranka = null;
    this.XMLperson = XMLdata;
    StBesedNaSejo = new HashMap<String,  Long[]>  ();
  }
  
  public static class ImaZeStrankoException extends Exception{
    static long stNapak = 0;
    public ImaZeStrankoException(String msg){
      super(msg);
      stNapak++;
    }
  }

  public String get_id() {
    return ime + priimek + datum_rojstva.substring(0, 4);
  }
  
  public String toString(){
    return this.id;
  } 

  public static void uvrstiVStranko(XML person,  HashMap<String, PStranka> stranke, HashMap<String, Politik> politiki) throws ImaZeStrankoException{
      Politik tmp = new Politik(person);
      tmp.id = person.getString("xml:id");
      for(XML affil : person.getChildren("affiliation")){
          String ref = affil.getString("ref");
          //---> To še poglej if(tmp.stranka != null) throw new Politik.ImaZeStrankoException("Politik " + tmp.id + " že ima stranko!");
          if( ref != null){
            ref = ref.substring(1,ref.length());
            //println("REF: " + ref ); 
            if(stranke.containsKey(ref)){
              tmp.stranka = stranke.get(ref);
              tmp.stranka.politiki.put(tmp.id, tmp);
               
            }
            politiki.put(tmp.id, tmp); //vsi politiki, tudi ti ki niso v strankah
          }
      }

  }

  public static boolean naloziPolitike(XML xml, HashMap<String, PStranka> stranke, HashMap<String, Politik> politiki){
      
      Politik tmp = null;
     
      
      XML[] particDesc = xml.getChild("teiHeader").getChild("profileDesc").getChild("particDesc").getChildren("listPerson");
      XML[] izvZako = particDesc[1].getChildren("person");
      XML[] predstav =  particDesc[2].getChildren("person");;
      
     
        for(XML person : izvZako) {
          try{
            Politik.uvrstiVStranko(  person,    stranke, politiki);
          }catch (Exception e) {
            e.printStackTrace();
          }
          
        }
        for(XML person : predstav) {
          try{
            Politik.uvrstiVStranko(  person,    stranke, politiki);
          }catch (Exception e) {
            e.printStackTrace();
          }
    
        }
      
  
      return true;
  }

  public static void prestejBesede(XML sejaBody, String datum, String stSeje, HashMap<String, Politik> politiki){
    /*
      V XML 'seja' so vsi govori seje. Pojdi skozi vse govore, preštej besede in 
      jih dodaj politiku pod štSeje,DatumSeje.
      Predpostavi, da se metoda kliče datumsko naraščajoče
      'seja' vsebuje elemenre 
      <body> -- top level trenutno
        <timeline> - čas
        <div type="preface">
        <div type="sp"> - začetek govora osebe 
          <note ... type="speaker"> - ime govornika
          <u ... who="#IDpolitika"   ...> - celotni povezani govor
            <s> - stavek
              <w> - beseda
              <pc> - ločilo
    */
    println("DATUM: " + datum + ", StSeje: " + stSeje);
    //      <IDpolitika, stBesedSeje>
    HashMap<String, Long> lokalnaKumulativa = new HashMap<String, Long>();
     
    for(XML sp: sejaBody.getChildren("div")){
      
      if(XMLUtils.a_type(sp,"sp")){
         for(XML u : sp.getChildren("u")){
           long besedeTeGaGovora = 0;
           String who = XMLUtils.a_who(u);
 
           for(XML s : u.getChildren("s")){
             XML[] wr = s.getChildren("w");
             besedeTeGaGovora+= wr.length;
             
            for(XML w: wr){
              //za vsako besedo govora
              try{
              Politik tmp1 = politiki.get(who);
              if(tmp1 != null){
                 PStranka tStr =  tmp1.stranka;
                 if(tStr != null){
                    tStr.obdelajBesedo(datum+"-"+stSeje, w.getString("lemma"), w.getContent());
                 }
                 

              }
              }catch(Exception e) {
                println("error [obdelajBesedo]  ob klicu " + " who: " + who);
                e.printStackTrace();
                 
              }
            } 
             
           }
          
           if(! lokalnaKumulativa.containsKey(who)){
              lokalnaKumulativa.put(who, besedeTeGaGovora);
          }else{
              lokalnaKumulativa.put(who, lokalnaKumulativa.get(who) + besedeTeGaGovora);
          }
         }
      }
    }
     
    HashMap<String, Long[]> stNaDatum = null;
    Politik govorec = null;
    long lokKum = 0;
    for(String key : lokalnaKumulativa.keySet()){
      lokKum = lokalnaKumulativa.get(key);
      govorec = politiki.get(key);
      if(govorec != null){
        Long[] stBesed = {govorec.kumulativaBesedDoDatuma, lokKum}; 
        govorec.StBesedNaSejo.put(datum+"-"+stSeje, stBesed);
        govorec.kumulativaBesedDoDatuma += lokKum;
      }
    }
    
    /*
      Konec datuma, naslednja datoteka je naslednji datum
    */


  }

  public void izpisiStevilaBesedPoDatumu(){
    /*
      Izpiši tabelo [Datum, stKumulativnihBesed, StBesedSeje] in ga vrni

    */
    //hashmap <datumSeje,<štSeje, [kumulativaBesedDoDatuma, besedeTeGaGovora] >
    //HashMap<String, Long[]> >  StBesedNaSejo
    
    if(this.UrejeniDatumi == null ) return;
    print(""+this.id + ";  stranka: ");
    if(this.stranka != null) println(this.stranka.getID());
    else println("Oseba nima stranke");

    for (String datum : this.UrejeniDatumi) { 
      Long[] stB = StBesedNaSejo.get(datum);
      println("  ["+ datum + ", " + stB[0] + ", " + stB[1] + "]" );
      
    }
 
    println("==========================\n");
 
  }

}


public void preberiSeje(){
 /*
   Datumsko naraščajoče preberi po 1 XML 
 */
  String folderPath =  "SlovParl/Sk-11-ana";
  
   String [] imenaDatotek = getFileNames();

  //imenaDatotek.length
  for(int i = 0; i < imenaDatotek.length; i++){
    println(folderPath+"/"+imenaDatotek[i]);

    XML xml = loadXML(folderPath+"/"+imenaDatotek[i]);
    XML body = xml.getChild("text").getChild("body");
    try{

    Politik.prestejBesede(body, imenaDatotek[i].substring(0,10), imenaDatotek[i].substring(imenaDatotek[i].length()-11,imenaDatotek[i].length()-7), politiki);

    }catch (Exception e) {
      e.printStackTrace();
    }

  }
  for(String key : politiki.keySet()){
       politiki.get(key).UrejeniDatumi = new TreeSet<String>(politiki.get(key).StBesedNaSejo.keySet());
  }
  for(String key : stranke.keySet()){
       stranke.get(key).UrejeniDatumiBesed =  new TreeSet<String>(stranke.get(key).besede.keySet());
  }

  println("done");
}

public void testStevilaBesed(){

    for(String key : politiki.keySet()){
      politiki.get(key).izpisiStevilaBesedPoDatumu();
      stVnosovDatumov += politiki.get(key).StBesedNaSejo.size();
    }
}

HashMap<String, Politik> politiki;
HashMap<String, PStranka> stranke;
ArrayList<String> datumi;
String datum_prikaza;
Camera camera;
Graph graph;
DatumSlider slider;

long stVnosovDatumov = 0;

void setup() {
  size(800, 600);
  stranke = new HashMap<String, PStranka>();
  politiki = new  HashMap<String, Politik>();
  datumi = new ArrayList<String>();
  camera = new Camera(0.0, 0.0);
  graph = new Graph();
  slider = new DatumSlider(50, 20, 700, 20, 6);
  
  String prev_datum = null;
  for(String file : getFileNames()) {
    String datum = file.substring(0, 10);
    if(prev_datum == null || !datum.equals(prev_datum)) {
      datumi.add(datum);
    }
    
    prev_datum = datum;
  }

  XML xml = loadXML("SlovParl/SlovParl.xml");
  
  XML[] listi_organizacij = xml.getChild("teiHeader").getChild("profileDesc").getChild("particDesc").getChildren("listOrg");
  for(XML lo : listi_organizacij) {
    if(lo.getChild("head").getContent().equals("Seznam političnih organizacij v Sloveniji")) {
      XML[] listi_politicnih_organizacij = lo.getChildren("listOrg");
      for(XML lpo : listi_politicnih_organizacij) {
        if(lpo.getChild("head").getContent().equals("Politične stranke")) {
          XML[] list_strank = lpo.getChildren("org");
          for(XML stranka : list_strank) {
            PStranka s = new PStranka();
            s.dodaj_podatke_iz_xml(stranka);
            stranke.put(stranka.getString("xml:id"), s);
            s.id = stranka.getString("xml:id");
            graph.nodes.add(new Node(300.0f + (float)Math.random()*5.0f, 300.0f + (float)Math.random()*5.0f, s));
          }
        }
      }
    }
  }
  
  println(stranke.keySet());
  println("število strank:" + stranke.size());

  if( Politik.naloziPolitike(xml,stranke,politiki)) System.out.println("nalaganje politikov koncano!\nŠtevilo neuvrščenih elementov: " + politiki.size());
  if(Politik.ImaZeStrankoException.stNapak > 0){ 
    println("št politikov z več strankami: " + Politik.ImaZeStrankoException.stNapak);
    //double a = 1/0;
  }
  
  PStranka.zanimivo("vojska");
  PStranka.zanimivo("obramba");
  PStranka.zanimivo("brezposelnost");
  PStranka.zanimivo("banka");
  PStranka.zanimivo("Jugoslavija");
  PStranka.zanimivo("JNA");
  PStranka.zanimivo("Armada");
  PStranka.zanimivo("armada");
  PStranka.zanimivo("JLA");
  PStranka.zanimivo("ljudstvo");
  PStranka.zanimivo("narod");
  PStranka.zanimivo("sovražnik");

  try{
     preberiSeje();
  }catch (Exception e) {
    e.printStackTrace();
    
  }
  

  testStevilaBesed();
  //besede po strankah
  for(String stra1: stranke.keySet()){
     println("[BESEDE] "+ stra1+":");
    for(String datum: stranke.get(stra1).UrejeniDatumiBesed){
      print(" ["+datum+"]");
      for(String beseda: stranke.get(stra1).besede.get(datum).keySet()){
        print("["+ beseda +", "+  stranke.get(stra1).besede.get(datum).get(beseda)+"] ");
      }
      println();
    }
  }


  long preracVelikost = stVnosovDatumov * Long.BYTES *2 + stVnosovDatumov * 15;
  println("stVnosov števila besed: " + stVnosovDatumov +" >> " +preracVelikost+ "B");
 
}

static void CRASH_APP(){
  double a = 1/0;
}

void update() {
  graph.separateNodes(100);
  slider.update();
  datum_prikaza = datumi.get(int(slider.getProc() * datumi.size()));
}

void draw() {
  update();
  
  pushMatrix();
  translate(camera.x, camera.y);
  scale(camera.zoom);
  
  background(105);
  noStroke();
  smooth();
  
  for(Node n : graph.nodes) {
    n.render(camera, datum_prikaza);
  }
  
  popMatrix();
  slider.render(datum_prikaza);
}

void mouseWheel(MouseEvent event) {
  camera.x -= mouseX;
  camera.y -= mouseY;
  float delta = event.getCount() < 0 ? 1.05 : event.getCount() > 0 ? 1.0/1.05 : 1.0;
  camera.zoom *= delta;
  camera.x *= delta;
  camera.y *= delta;
  camera.x += mouseX;
  camera.y += mouseY;
}

void mousePressed() {
  if(slider.overEvent())
    slider.locked = true;
}

void mouseDragged(MouseEvent event) {
  if(!slider.locked) {
    camera.x += mouseX - pmouseX;
    camera.y += mouseY - pmouseY;
  }
}