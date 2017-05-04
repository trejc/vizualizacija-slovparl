 
import java.util.Map;

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
class Politik {
  String id;
  String ime;
  String priimek;
  String datum_rojstva;
  String datum_smrti;
  String kraj_rojstva;
  String drzava_rojstva;
  PStranka stranka;
  XML XMLperson;
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
  }
  
  public String get_id() {
    return ime + priimek + datum_rojstva.substring(0, 4);
  }
  
  public String toString(){
    return this.XMLperson.toString();
  }
 
}
public boolean naloziPolitike(boolean debug, HashMap<String, PStranka> stranke){
    neuvrsceno = new  HashMap<String, Politik>();
    Politik tmp = null;
    XML xml = loadXML("SlovParl/SlovParl.xml");
    
    XML[] particDesc = xml.getChild("teiHeader").getChild("profileDesc").getChild("particDesc").getChildren("listPerson");
    XML[] izvZako = particDesc[1].getChildren("person");
    XML[] predstav =  particDesc[2].getChildren("person");;
    
  
    for(XML person : izvZako) {
      tmp = new Politik(person);
      if(debug)System.out.println(tmp+"\n\n");
      tmp.id = person.getString("xml:id");
         
      for(XML affil : person.getChildren("affiliation")){
        String ref = affil.getString("ref");
        if( ref != null){
         
          if(stranke.containsKey(ref)){
             if(debug ||true )println("Politik ima stranko: " + ref ); 
            stranke.get(ref).politiki.put(tmp.id, tmp);
          }else{
             neuvrsceno.put(tmp.id, tmp);
          }
        }
      
      }
      
      
    }
    for(XML person : predstav) {
      tmp = new Politik(person);
      if(debug)System.out.println(tmp+"\n\n");
      tmp.id = person.getString("xml:id");
      
      
      for(XML affil : person.getChildren("affiliation")){
        String ref = affil.getString("ref");
        if( ref != null){
          
          if(stranke.containsKey(ref)){
            if(debug ||true )println("Politik ima stranko: " + ref ); 
            stranke.get(ref).politiki.put(tmp.id, tmp);
          }else{
            neuvrsceno.put(tmp.id, tmp);
          }
        }
      
      }
 
    }
 
    return true;
}

HashMap<String, Politik> neuvrsceno;
HashMap<String, PStranka> stranke;

void setup() {
  size(800, 600);
  background(250);
  stranke = new HashMap<String, PStranka>();
  
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

  println("število strank:" + stranke.size());
  if( naloziPolitike(false,stranke)) System.out.println("nalaganje politikov koncano!\nŠtevilo neuvrščenih elementov: " + neuvrsceno.size());
}

void draw() {
 
}