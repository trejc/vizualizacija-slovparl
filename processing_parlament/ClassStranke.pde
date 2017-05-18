import java.awt.Color;
static boolean THREAD = true;
public static ArrayList<Thread> sortingThreads = new  ArrayList<Thread>();
static class GrupaBesed{
  String labelGrupe;
  int stevecBessed;
  String prejDatum;
  static long vseBesede=0;
  static long pocisceneBesede=0;
  static long avg = 0;
  static int max = 0;
  int lokalMax = 0;
  static int sorting = 0;
  int sortingLokal = 0;
  Color barva;
  //      <datum, <beseda, stPojavitev> >
  TreeMap<String, HashMap<String, Integer> > besede;
  // <datum, frekvence vseh besed  vključno z datumom>
  TreeMap<String, Long> pojNaDatum;
  public GrupaBesed(String label){
    labelGrupe = label;
    stevecBessed = 0;
    besede = new TreeMap<String, HashMap<String, Integer> >();
    pojNaDatum = new  TreeMap<String, Long>();
    prejDatum = null;
    barva = Color.gray;
  }
  public GrupaBesed(String label, Color bar){
    this(label);
    barva = bar;
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
  boolean a = true;
  public final void purgeLessThan(int frek){
    if(besede.size() == 0) return;
    HashMap<String,Boolean> wordsToPurge = new HashMap<String,Boolean>();
    HashMap<String,Integer> tmo1 =  besDoDatuma(besede.lastKey());
    if(tmo1 != null) {
      for(String bsda :tmo1.keySet()){
        if ((tmo1.get(bsda)) < frek){
          wordsToPurge.put(bsda,true);
        }
      } 
    }
    Iterator datI = besede.entrySet().iterator();
    while (datI.hasNext()) {
         Map.Entry pair = (Map.Entry)datI.next();
        String dat = (String) pair.getKey();
        Iterator besI =((HashMap) pair.getValue()).entrySet().iterator();
        while (besI.hasNext()) {
            Map.Entry pair2 = (Map.Entry)besI.next();
            String bes = (String) pair2.getKey();
            if (wordsToPurge.containsKey(bes)){
                besI.remove();
                pocisceneBesede++;  
            }
        }
    }
    wordsToPurge=null;
  }
  public boolean preveriBesedo(String beseda){
    HashMap<String, Boolean> grupa = grupe_besed.get(this.labelGrupe);
    if(grupa != null) {
      if(grupa.containsKey(beseda)) {
        return true;
      }
    }
    return false;
  }
  public final void AddWord(String datum, String word){
    //preveri, če beseda spada v grupo
    if(!preveriBesedo(word)) return;
    try{
      if(imaBesedo(datum, word)){
        //za datum obstaja beseda
        int oldNum = besede.get(datum).get(word);
        if(max < oldNum+1) max = oldNum+1;
        if(lokalMax < oldNum+1) lokalMax = oldNum+1;
        besede.get(datum).put(word, oldNum+1);
      }else if(jeDatum(datum)){
        //za datum ni besede -> še nikoli ni bila
        besede.get(datum).put(word, 1);
      }else{
        
        //ni datuma, postavi datum
        if(prejDatum != null  && jeDatum(prejDatum)){
          //obstaja prejšnji datum
          HashMap<String, Integer> novDatum =  kopiraj(besede.get(prejDatum));
          int oldNum = novDatum.containsKey(word) ? novDatum.get(word) : 0;
          if(max < oldNum+1) max = oldNum+1;
          if(lokalMax < oldNum+1) lokalMax = oldNum+1;
          novDatum.put(word, oldNum+1);
          besede.put(datum, novDatum);
          prejDatum = datum;
        }else{
          //prvič govorijo oz ni preš. datuma
          HashMap<String, Integer> novDatum = new HashMap<String, Integer>();
          novDatum.put(word, 1);
          besede.put(datum, novDatum);
          prejDatum = datum;
        }
      }
    } catch (Exception e) {
       println("error [AddWord]  ob klicu " + " datum: " + datum);
      
      CRASH_APP();
    }
    //teli števci še niso pravi
    stevecBessed+= besede.get(datum).size();
    vseBesede+=  besede.get(datum).size();
  }
  public final long vsePojavitve(String datum){
    if(!pojNaDatum.containsKey(datum)){
      //Za ta datum št besed še ni izračunano
      long stNaDatum =0;
      if(besede.containsKey(datum)){
        //na ta datum so besede
        HashMap<String, Integer> tmBes = besede.get(datum);
        for(String be: tmBes.keySet()){
          stNaDatum+=tmBes.get(be);
        }
      }
      pojNaDatum.put(datum, new Long(stNaDatum));
    }
    //Za ta datum je št besed že izračunano
    return pojNaDatum.get(datum);
  }
  public final HashMap<String, Integer> besDoDatuma(String datum){
    return besede.containsKey(datum) ? besede.get(datum): null;
  }
  public final void sortAllDates(){
    ArrayList<Thread> lokThreadi = new ArrayList<Thread>();

    for(String dat: besede.keySet()){
      final String datum2 = dat;
      if(THREAD){
        Thread sortT = new Thread(){
                        public void run(){
                           sortDatum(datum2);                          
                        }
                      };
       sortT.start();
       lokThreadi.add(sortT);
      }else{
        sortDatum(datum2);
      }
       

    }

    for(Thread t : lokThreadi){
      try{
        t.join();
      }catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
    //println("End sortiranje: " + sortingLokal);

  }
  public final void sortDatum(String datum){
    
    HashMap<String, Integer> handler = besDoDatuma(datum);
    if(handler != null && handler.size() > 0){
      List<Map.Entry<String, Integer>> list = new LinkedList<Map.Entry<String, Integer>>( handler.entrySet() );
      Collections.sort( list, new Comparator<Map.Entry<String, Integer>>()
        {
            public int compare( Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2 )
            {
                return (o1.getValue()).compareTo( o2.getValue() );
            }
        } );
        HashMap<String, Integer> result = new LinkedHashMap<String, Integer>();
        List<?> shallowCopy = list.subList(0, list.size());
        Collections.reverse(shallowCopy);
        for (Map.Entry<String, Integer> entry : list)
        {
            result.put( entry.getKey(), entry.getValue() );
        }
        besede.put(datum, null);      
        besede.put(datum, result);
    }
  }
  public final Thread threadIt(){
    if(THREAD){
      
      Thread sortT = new Thread(){
                        public void run(){
                            //println("start sorting thread, current: " + GrupaBesed.sorting );
                            sortAllDates();
                        }
                    };
      sortT.start();
       return sortT;
    }else{
      sortAllDates();
      return null;
    }
     
  }
}


static class PStranka {
  XML[] orgNames;
  HashMap<String, Politik> politiki;
  //<datum-stseje,[štBesedDoDatuma, štBesedNaTaDatum]>
  HashMap<String, Long[]> stBesed;
   
  ArrayList<GrupaBesed> grupeBesed;
  public void dodajGrupe(GrupaBesed... grupe ){
    for(GrupaBesed grupa : grupe){
      grupeBesed.add(grupa);
    }
  }
  public void precistiGrupe(int d){
    for(GrupaBesed grupa : grupeBesed){
       grupa.purgeLessThan(d);
     
       //grupa.sortAllDates();
    }
    for(GrupaBesed grupa : grupeBesed){
      sortingThreads.add(grupa.threadIt());
       //grupa.sortAllDates();
    }
   
    System.gc();
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
    grupeBesed = new ArrayList<GrupaBesed>();
    dodajGrupe(new GrupaBesed("gospodarstvo"), new GrupaBesed("liberalizem"), new GrupaBesed("socializem"), new GrupaBesed("obramba"), new GrupaBesed("nacionalizem"));
  }
  public HashMap<String, Integer> besedeNaDatum(String datum){
    return this.besede.get(datum);
  }
  public PStranka(XML[] orgNames) {
    this();
    this.orgNames = orgNames;
  }
  public void dodaj_podatke_iz_xml(XML xml) {
    this.orgNames = xml.getChildren("orgName");
  }
  public String getID(){
    if(this.id != null) return this.id;
    else return "stranka nima IDja";
  }
  public void obdelajBesedo(String datum, String normiranaBeseda, String beseda ){
      for(GrupaBesed gr: grupeBesed){
        gr.AddWord(datum, beseda);
      }
  }
  public String imeStranke(String full, String datum) { 
    for(XML orgName : orgNames) {
      if(orgName.getString("full") != null) {
        if(orgName.getString("full").equals(full)) {
          String from_datum = orgName.getString("from");
          String to_datum = orgName.getString("to");
          if(from_datum != null) {
            if(prviDatumKasnejsi(datum, from_datum)) {
              if(to_datum != null) {
                if(prviDatumKasnejsi(to_datum, datum)) {
                  return orgName.getContent();
                }
              }else {
                return orgName.getContent();
              }
            }
          }else if(to_datum != null) {
            if(prviDatumKasnejsi(to_datum, datum)) {
              return orgName.getContent();
            }else {
              return orgName.getContent();
            }
          }else {
            from_datum = orgName.getString("notBefore");
            to_datum = orgName.getString("notAfter");
            if(from_datum != null) {
              if(prviDatumKasnejsi(datum, from_datum)) {
                if(to_datum != null) {
                  if(prviDatumKasnejsi(to_datum, datum)) {
                    return orgName.getContent();
                  }
                }else {
                  return orgName.getContent();
                }
              }
            }else {
              return orgName.getContent();
            }
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