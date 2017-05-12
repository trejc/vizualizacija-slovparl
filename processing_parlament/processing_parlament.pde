 
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
      
      HashMap<String, Integer> besede = data.besede.get(datum);
      
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
        println("texty:" + text_y + " y:" + y + " dafak:" + (y - radius - 10) + " bool:" + (text_y > y - radius - 10));
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
static class BesFrek{
  String beseda;
  String datum;
  long pojavitve;
  long besDoDatuma;
  
  public BesFrek(String dat, long besDoDatuma1, String bs){
    datum = dat;
    besDoDatuma = besDoDatuma1;
    beseda = bs;
    pojavitve = 1;
  }
  public void povecaj(){
    pojavitve++;
  }
  public String toString(){
    return datum+", " + beseda + ", "+ besDoDatuma+", "+ pojavitve; 
  }
   
}
static class HrambaBesed{
  String beseda;
  HashMap<String, Long> vseBesedeNaDatum;
  HashMap<String, Long> pojavitveBesedeNaDatum;
  public HrambaBesed(String beseda,String datum){
    this.beseda=beseda;
    vseBesedeNaDatum = new HashMap<String, Long>();
    pojavitveBesedeNaDatum = new HashMap<String, Long>();
    dodajDatum(datum);
    initVseBesede(datum);
  }
  public void dodajPojavitev(String datum){
    povecajBesedeNaDatum(datum);
    povecajPojavitev(datum);
  }
  public void dodajNovo(String datum){
    dodajDatum(datum);
    initVseBesede(datum);
  }
  public void povecajBesedeNaDatum(String datum){
    vseBesedeNaDatum.put(datum, vseBesedeNaDatum.get(datum)+1);
  }
  public void povecajPojavitev(String datum){
    pojavitveBesedeNaDatum.put(datum, pojavitveBesedeNaDatum.get(datum)+1);
  }
  public void dodajDatum(String datum){
    vseBesedeNaDatum.put(datum, new Long(1));
  }
  public void initVseBesede(String datum){
     vseBesedeNaDatum.put(datum, new Long(1));
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
float[][] barveBesed;
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
  
  barveBesed = new float[PStranka.zanimiveBesede.size()][3];
  for(int i = 0; i < barveBesed.length; i++) {
    barveBesed[i] = new float[]{random(255), random(255), random(255)};
  }
  try{
     preberiSeje();
  }catch (Exception e) {
    e.printStackTrace();
  }
  
  testStevilaBesed();
  
  //besede po strankah
  if(false){
    for(String stra1: stranke.keySet()){
      println("[BESEDE] "+ stra1+":");
      for(String datum: stranke.get(stra1).UrejeniDatumiBesed){
        
        if(false){
          for(String beseda: stranke.get(stra1).besede.get(datum).keySet()){
            print("["+ beseda +", "+  stranke.get(stra1).besede.get(datum).get(beseda)+"] ");
          }
          println();
        }
        
      }
    }
  }
 
  for(String stra1: stranke.keySet()){
    for(String datum:  new TreeSet<String>(stranke.get(stra1).stBesed.keySet()) ){
      print(" ["+datum+"]");
      //Long [] stBesed = stranke.get(stra1).stBesed.get(datum);
      //println("[" +stra1+"; STBESED: " + stBesed[0] +", " + stBesed[1]+"]; ");
      long[] aa = stranke.get(stra1).dobiStBesedNaDatum(datum);
      println("[" +stra1+"; STBESED: " + aa[0] +", " + aa[1]+"]; ::");
      for(String beseda: stranke.get(stra1).vseBesedeNaDatum(datum)){
        BesFrek bs = stranke.get(stra1).frekvencaBesed.get(datum).get(beseda);
        long[] aa2 =  stranke.get(stra1).dobiFrekBesedeNaDatum(datum, beseda);
        println("   "+ bs + "|| "+ aa2[0] + ", "+ aa2[1] + " ");
      }
      
      println();
      
    }
    
  }
  
   for(String stra1: stranke.keySet()){
   }
  
  for(Node n : graph.nodes) {
    n.radius = n.data.politiki.size() + 30;
  }
  long preracVelikost = stVnosovDatumov * Long.BYTES *2 + stVnosovDatumov * 15;
  println("stVnosov števila besed: " + stVnosovDatumov +" >> " +preracVelikost+ "B");
  
  println(new Test());
 
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