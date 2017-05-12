
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
    return true;
  }
  public final void AddWord(String datum, String word){
    //preveri, če beseda spada v grupo
    if(!preveriBesedo(word)) return;
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
        int oldNum = novDatum.get(word);
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
    
      if(!stBesed.containsKey(datum)){
        //Na ta datum še ni bilo besed!
        //datumi gredo po vrsti!
        //kumulativa besed = kumbesed + stbesed iz prejsnjega datuma
        kumulativaBesed += besedePrejDatum;
        Long[] tmp1 = {new Long(kumulativaBesed),new Long(1)};
        besedePrejDatum = 1; //v primeru, da je samo 1 beseda na ta datum
        stBesed.put(datum, tmp1);
        
        //HashMap<String, HashMap<String,BesFrek> >();
         HashMap<String,BesFrek> tmp22 = new  HashMap<String,BesFrek>();
         tmp22.put(normiranaBeseda, new BesFrek(datum,kumulativaBesed, normiranaBeseda));
        frekvencaBesed.put(datum, tmp22);
       // println(this.getID() +": " + "stBesed na datum " + datum + ": " + frekvencaBesed.get(datum).size() + " Prvič na datum: " + normiranaBeseda );
       //HRAMBABESED
    
      }else{
        //Na ta datum so že bile besede. Prištej to besedo
        Long[] tmp1 = {new Long(kumulativaBesed),  stBesed.get(datum)[1] + new Long(1)};
        //println(this.getID() +"], "+datum +" :  stBesed.get(datum)[1] :" + stBesed.get(datum)[1]);
        besedePrejDatum = stBesed.get(datum)[1] + 1; 
        stBesed.put(datum, tmp1);
        if(!frekvencaBesed.get(datum).containsKey(normiranaBeseda)){
          //Ta beseda je na ta datum prvič
          HashMap<String,BesFrek> tmp22 =  frekvencaBesed.get(datum);
          tmp22.put(normiranaBeseda, new BesFrek(datum,kumulativaBesed, normiranaBeseda));
          frekvencaBesed.put(datum, tmp22);
         // println(this.getID() +": " + "stBesed na datum " + datum + ": " + frekvencaBesed.get(datum).size() + " Dodajam BES: " + normiranaBeseda );
        }else{
          //beseda je že bla za ta datum
          BesFrek a = frekvencaBesed.get(datum).get(normiranaBeseda);
          a.povecaj();
          //println(this.getID() +": " + "stBesed na datum " + datum + ": " + frekvencaBesed.get(datum).size() + ", BES: " + normiranaBeseda + " frek besede: " + a.pojavitve +"\n   "+ frekvencaBesed.get(datum).keySet() );
        }
      }
      if(normiranaBeseda.equals("proti") && zanimivaBesednaZveza != -1 && false) {
        bZ+="****ZANIMIVA BES ZVEZA:>>>>>" +datum +": "+ beseda;
        zanimivaBesednaZveza = 5;
      }else if ( zanimivaBesednaZveza == -1)  zanimivaBesednaZveza = 0;
     
      if(! (PStranka.zanimiveBesede.containsKey(normiranaBeseda) || normiranaBeseda.substring(normiranaBeseda.length()-3,normiranaBeseda.length()).equals("ost")) ) return;
      try{
        if(!this.besede.containsKey(datum)){
         // println("[obdelajBesedo] datum " +datum_Seja + "še ni v bazi 'besede'" );
          HashMap<String,Integer> trBeseda = new HashMap<String,Integer>();
          trBeseda.put(normiranaBeseda, 1);
          this.besede.put(datum, trBeseda);
        }else if(! besede.get(datum).containsKey(normiranaBeseda)){
          //za ta datum-štSeje že so besede, samo 'normiranaBeseda' se je zgodila 
          //prvič
         // println("[obdelajBesedo] besede " +normiranaBeseda + "še ni v bazi 'besede' za datum " + datum_Seja );
          besede.get(datum).put(normiranaBeseda, 1);
        }else{
          //beseda se je za ta datum-štSeje že pojavila
          besede.get(datum).put(normiranaBeseda,  besede.get(datum).get(normiranaBeseda) + 1);
        }
      }catch(Exception e){
        println("error [obdelajBesedo]  ob klicu " +datum + ", " + normiranaBeseda +" this.besede= " + this.besede);
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
static class Besede{
  String beseda;
  long pojavitve;
  public Besede(String b){
    beseda = b;
    pojavitve = 1;
  }
}//PStranka
