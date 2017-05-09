 
import java.util.Map;
import java.io.*;
import java.util.*;

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
class PStranka {
  XML[] orgNames;
  HashMap<String, Politik> politiki;
  
  public PStranka() {
    politiki = new HashMap<String, Politik>();
  }
  
  public PStranka(XML[] orgNames) {
    this.orgNames = orgNames;
    
    politiki = new HashMap<String, Politik>();
  }
  
  public void dodaj_podatke_iz_xml(XML xml) {
    this.orgNames = xml.getChildren("orgName");
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

  //hashmap <datumSeje,<štSeje, [kumulativaBesedDoDatuma, besedeTeGaGovora] >
  HashMap<String, HashMap<String, Long[]> >  StBesedNaSejo;

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
    this.XMLperson = XMLdata;
    StBesedNaSejo = new HashMap<String, HashMap <String, Long[]> > ();
  }
  
  public String get_id() {
    return ime + priimek + datum_rojstva.substring(0, 4);
  }
  
  public String toString(){
    return this.XMLperson.toString();
  } 

  public static void uvrstiVStranko(XML person,  HashMap<String, PStranka> stranke, HashMap<String, Politik> politiki){
      Politik tmp = new Politik(person);
      tmp.id = person.getString("xml:id");
      for(XML affil : person.getChildren("affiliation")){
          String ref = affil.getString("ref");
          
          if( ref != null){
            ref = ref.substring(1,ref.length());
            println("REF: " + ref ); 
            if(stranke.containsKey(ref)){
              
              stranke.get(ref).politiki.put(tmp.id, tmp);
              
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
        Politik.uvrstiVStranko(  person,    stranke, politiki);
        
        
      }
      for(XML person : predstav) {
        Politik.uvrstiVStranko(  person,    stranke, politiki);
  
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
            // for (XML w : wr) print (w.getContent() + " ");
             //println();
           }
           //println(who + ", Besed: " + besedeTeGaGovora);
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
      if(govorec == null){
        continue;
      }

      //hashmap < datumSeje,<štSeje, [kumulativaBesedDoDatuma, besedeTeGaGovora] >>
      stNaDatum = new HashMap<String, Long[]>();
      Long[] stBesed = {govorec.kumulativaBesedDoDatuma, lokKum};
      stNaDatum.put(stSeje, stBesed);
      govorec.StBesedNaSejo.put(datum, stNaDatum);
      govorec.kumulativaBesedDoDatuma += lokalnaKumulativa.get(key);

      //println(key+": " + lokKum);
      //println(key+": " +  Arrays.toString(govorec.StBesedNaSejo.get(datum).get(stSeje)));
    }
    /*
      Konec datuma, naslednja datoteka je naslednji datum
    */


  }

  public dobiStevilaBesedPoDatumu(){
    /*
      Naredi tabelo [Datum, stKumulativnihBesed, StBesedSeje] in ga vrni
      
    */

    println("Ta funkcija še ne dela");
  }

}

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
  for(int i = 0; i < imenaDatotek.length; i++){
    println(folderPath+"/"+imenaDatotek[i]);

    XML xml = loadXML(folderPath+"/"+imenaDatotek[i]);
    XML body = xml.getChild("text").getChild("body");
 
    Politik.prestejBesede(body, imenaDatotek[i].substring(0,10), imenaDatotek[i].substring(imenaDatotek[i].length()-11,imenaDatotek[i].length()-7), politiki);


  }
  println("done");
}

  

HashMap<String, Politik> politiki;
HashMap<String, PStranka> stranke;
 

void setup() {
  size(800, 600);
  background(250);
  stranke = new HashMap<String, PStranka>();
  politiki = new  HashMap<String, Politik>();

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
          }
        }
      }
    }
  }


  println(stranke.keySet());
  println("število strank:" + stranke.size());
  
  if( Politik.naloziPolitike(xml,stranke,politiki)) System.out.println("nalaganje politikov koncano!\nŠtevilo neuvrščenih elementov: " + politiki.size());
  try{
     preberiSeje();
  }catch (Exception e) {
    e.printStackTrace();
    println(e);
  }
  
}

void draw() {
  
}


