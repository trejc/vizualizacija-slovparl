class PStranka {
  String ime;
  String kratica_imena;
  String datum_ustanovitve;
  String datum_konca;
  HashMap<String, Politik> politiki;
  
  public PStranka() {
    politiki = new HashMap<String, Politik>();
  }
  
  public PStranka(String ime, String kratica_imena, String datum_ustanovitve, String datum_konca) {
    this.ime = ime;
    this.kratica_imena = kratica_imena;
    this.datum_ustanovitve = datum_ustanovitve;
    this.datum_konca = datum_konca;
    
    politiki = new HashMap<String, Politik>();
  }
  
  public void dodaj_podatke_iz_xml(XML xml) {
    XML state = xml.getChild("state");
    if(state != null) {
      this.datum_ustanovitve = state.getString("from");
      this.datum_konca = state.getString("to");
      for(XML s_ime : xml.getChildren("orgName")) {
        if(s_ime.getString("full").equals("yes")) {
          this.ime = s_ime.getContent();
        }else if(s_ime.getString("full").equals("init")) {
          this.kratica_imena = s_ime.getContent();
        }
      }
    }else {

    }
  }
}


class Politik {
  String ime;
  String priimek;
  String datum_rojstva;
  String datum_smrti;
  String kraj_rojstva;
  String drzava_rojstva;
  PStranka stranka;
  
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
  }
  
  public String get_id() {
    return ime + priimek + datum_rojstva.substring(0, 4);
  }
}


HashMap<String, PStranka> stranke;

void setup() {
  size(800, 600);
  background(250);
  
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
            if(Integer.parseInt(s.datum_ustanovitve.substring(0, 4)) < 1993) {
              
            }
          }
        }
      }
    }
  }
  
}

void draw() {
  
}