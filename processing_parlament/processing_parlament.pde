 
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

public void preberiSeje(){
 /*
   Datumsko naraščajoče preberi po 1 XML 
 */
  String folderPath =  "SlovParl/Sk-11-ana";
  
   String [] imenaDatotek = getFileNames();
  //imenaDatotek.length
  print("0%");
  for(int i = 0; i < imenaDatotek.length; i++){
    //println(folderPath+"/"+imenaDatotek[i]);
    XML xml = loadXML(folderPath+"/"+imenaDatotek[i]);
    XML body = xml.getChild("text").getChild("body");
    
    Politik.prestejBesede(body, imenaDatotek[i].substring(0,10), imenaDatotek[i].substring(imenaDatotek[i].length()-11,imenaDatotek[i].length()-7), politiki);
    if(Math.round((i/imenaDatotek.length)*10) == 5 ) print("50%");
    else System.out.print("=");
  }
  println("100%");
  for(String key : politiki.keySet()){
       politiki.get(key).UrejeniDatumi = new TreeSet<String>(politiki.get(key).StBesedNaSejo.keySet());
  }
  println("purging");
  long t0 = System.currentTimeMillis();
  for(String key : stranke.keySet()){
      stranke.get(key).precistiGrupe(Math.round(3));
  }
  for(Thread t : sortingThreads){
    try{
      t.join();
    }catch (InterruptedException e) {
      e.printStackTrace();
    }
    
  }
  println("purge done, trajalo je: " + (System.currentTimeMillis()-t0) + " ms");
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
  /*nov način določanja barv!
  barveBesed = new float[PStranka.zanimiveBesede.size()][3];
  for(int i = 0; i < barveBesed.length; i++) {
    barveBesed[i] = new float[]{random(255), random(255), random(255)};
  }
  */
  println("branje sej ...");
  preberiSeje();
  
  //testStevilaBesed();
  if(true){
    println("printanje vseh besed ...");
    for(String stra1: stranke.keySet()){
      //HashMap<String, Integer>
      ArrayList<GrupaBesed> grupe = stranke.get(stra1).grupeBesed;
      for(GrupaBesed gBe: grupe){
        println(gBe.labelGrupe);
        for(String datum : new TreeSet<String>(gBe.besede.keySet()) ){
          print(stra1 +"] "+ datum + ": ");
          println(gBe.vsePojavitve(datum));
          int top = 5;
          for(String beseda : gBe.besede.get(datum).keySet()){
            if(top == 0) break;
            top--;
            println("    "+ beseda + ", " + gBe.besede.get(datum).get(beseda));
          }
          
        }
      }
    }
  }
  println("vse besede: " + GrupaBesed.vseBesede);
  println("pociscene besede: " + GrupaBesed.pocisceneBesede);
  println("max pojavitev: " + GrupaBesed.max);
  for(Node n : graph.nodes) {
    n.radius = n.data.politiki.size() + 30;
  }

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