 
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
  HashMap<String, Besede> besede;
  long kumulativaBesedDoDatuma = 0;
  public Politik() {
    stranka = null;
    besede = new HashMap<String, Besede>();
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
    this.XMLperson = null;
    StBesedNaSejo = new HashMap<String,  Long[]>  ();
     besede = new HashMap<String, Besede>();
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
    //println("DATUM: " + datum + ", StSeje: " + stSeje);
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
                String beseda = w.getContent();
                if(tmp1.besede.containsKey(beseda) ){
                  tmp1.besede.get(beseda).pojavitve++;
                }else {
                  tmp1.besede.put(beseda, new Besede(beseda));
                }
                 PStranka tStr =  tmp1.stranka;
                 if(tStr != null){
                    tStr.obdelajBesedo(datum, w.getString("lemma"), w.getContent());
                 }
                 
              }
              }catch(Exception e) {
                println("error [obdelajBesedo]  ob klicu " + " who: " + who);
                
                CRASH_APP();
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
