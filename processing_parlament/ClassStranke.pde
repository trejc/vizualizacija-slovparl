
static class GrupaBesed{
  String labelGrupe;
  int stevecBessed;
  String prejDatum;
  //      <datum, <beseda, stPojavitev> >
  HashMap<String, HashMap<String, Integer> > besede;
  public GrupaBesed(String label){
    labelGrupe = label;
    stevecBessed = 0;
    besede = new HashMap<String, HashMap<String, Integer> >();
    prejDatum = null;
  }
  public final HashMap<String, Integer> kopiraj(  HashMap<String, Integer> source){
    HashMap<String, Integer> novHM = new   HashMap<String, Integer>();
    for(String stBeseda : source.keySet()){
      novHM.put(stBeseda, source.get(stBeseda));
    }
    return novHM;
  } 
  public final void setPrejDatum(String d){
    prejDatum=d;
  }
  public final boolean jeDatum(String datum){
    return besede.containsKey(datum);
  }
  public final boolean imaBesedo(String datum, String beseda){
    return jeDatum(datum) && besede.get(datum).containsKey(beseda);
  }
  public boolean preveriBesedo(String beseda){
    if(beseda.equals("biti")) return false;
    if(beseda.equals("gospodarstvo")) return false;
    if(beseda.length() <= 3 ) return false;
    if(beseda.substring(beseda.length()-3, beseda.length()).equals("ost")) return false; 
    return false;
  }
  public final void AddWord(String datum, String word){
    //preveri, če beseda spada v grupo
    if(!preveriBesedo(word)) return;
    try{
      if(imaBesedo(datum, word)){
        //za datum obstaja beseda
        int oldNum = besede.get(datum).get(word);
        besede.get(datum).put(word, oldNum+1);
        stevecBessed++;
      }else if(jeDatum(datum)){
        //za datum ni besede -> še nikoli ni bila
        besede.get(datum).put(word, 1);
        stevecBessed++;
      }else{
        
        //ni datuma, postavi datum
        if(prejDatum != null  && jeDatum(prejDatum)){
          //obstaja prejšnji datum
          HashMap<String, Integer> novDatum =  kopiraj(besede.get(prejDatum));
          int oldNum = novDatum.containsKey(word) ? novDatum.get(word) : 0;
          novDatum.put(word, oldNum+1);
          stevecBessed++;
          besede.put(datum, novDatum);
          prejDatum = datum;
        }else{
          //prvič govorijo oz ni preš. datuma
          HashMap<String, Integer> novDatum = new HashMap<String, Integer>();
          novDatum.put(word, 1);
          stevecBessed++;
          besede.put(datum, novDatum);
          prejDatum = datum;
        }
      }
    } catch (Exception e) {
       println("error [AddWord]  ob klicu " + " datum: " + datum);
      
      CRASH_APP();
    }
  }
}
static class PStranka {
  XML[] orgNames;
  
  HashMap<String, Politik> politiki;
  //  <beseda, (beseda <datum,pojavitve> <datum, besedenadatum)>
  HashMap<String, HrambaBesed> besedeStranke;
  //<datum,<beseda, (datum, beseda, frekvencaBesede, vseBesede)> >
  HashMap<String, HashMap<String,BesFrek> > frekvencaBesed;
  //<datum-stseje,[štBesedDoDatuma, štBesedNaTaDatum]>
  HashMap<String, Long[]> stBesed;
   
  ArrayList<GrupaBesed> grupeBesed;
  public void dodajGrupe(GrupaBesed... grupe ){
    for(GrupaBesed grupa : grupe){
      grupeBesed.add(grupa);
    }
  }
  long kumulativaBesed = 0;
  //št besed prejšnega datuma
  long besedePrejDatum = 0;
  //<datum-stseje,<beseda, stPonovitev>>
  HashMap<String, HashMap<String,Integer>> besede;
  SortedSet<String> UrejeniDatumiBesed = null;
  String id;
  public PStranka() {
    politiki = new HashMap<String, Politik>();
    besede = new HashMap<String, HashMap<String,Integer>>();
    stBesed = new HashMap<String, Long[]>();
    frekvencaBesed = new HashMap<String, HashMap<String,BesFrek> >();
    besedeStranke = new HashMap<String, HrambaBesed>();
    grupeBesed = new ArrayList<GrupaBesed>();
    dodajGrupe(new GrupaBesed("test"),new GrupaBesed("test"));
  }
  
  public HashMap<String, Integer> besedeNaDatum(String datum){
    return this.besede.get(datum);
  }
  
  public PStranka(XML[] orgNames) {
    this.orgNames = orgNames;
    besede = new HashMap<String, HashMap<String,Integer>>();
    politiki = new HashMap<String, Politik>();
    stBesed = new HashMap<String, Long[]>();
    frekvencaBesed = new HashMap<String, HashMap<String,BesFrek> >();
    besedeStranke = new HashMap<String, HrambaBesed>();
    grupeBesed = new ArrayList<GrupaBesed>();
    dodajGrupe(new GrupaBesed("test"),new GrupaBesed("test"));
  }
  
  public void dodaj_podatke_iz_xml(XML xml) {
    this.orgNames = xml.getChildren("orgName");
  }
  
  public String getID(){
    if(this.id != null) return this.id;
    else return "stranka nima IDja";
  }
  public long [] dobiStBesedNaDatum(String datum){
    Long[] tmp = stBesed.get(datum);
    return new long[]{tmp[0], tmp[1]};
  }
  public SortedSet<String> vsiDatumiBesed(){
    return new TreeSet<String>(frekvencaBesed.keySet());
  }
  public SortedSet<String> vseBesedeNaDatum(String datum){
    return new TreeSet<String>(frekvencaBesed.get(datum).keySet());
  }
  public long [] dobiFrekBesedeNaDatum(String datum, String beseda){
     BesFrek bs = frekvencaBesed.get(datum).get(beseda);
    return new long[] {bs.besDoDatuma ,bs.pojavitve};
  }
  static int zanimivaBesednaZveza = 0;
  static String bZ = "";
  static HashMap<String, Integer> zanimiveBesede = new HashMap<String, Integer> ();
  static void zanimivo(String beseda){
    PStranka.zanimiveBesede.put(beseda, 1);
  }
  public void obdelajBesedo(String datum, String normiranaBeseda, String beseda ){
      for(GrupaBesed gr: grupeBesed){
        gr.AddWord(datum, beseda);
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
static class Besede{
  String beseda;
  long pojavitve;
  public Besede(String b){
    beseda = b;
    pojavitve = 1;
  }
}//PStranka
