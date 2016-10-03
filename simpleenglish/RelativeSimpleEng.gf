--# -path=.:../simpleabstract

concrete RelativeSimpleEng of RelativeSimple = CatSimpleEng ** open ResSimpleEng in {

  flags optimize=all_subs ;

  lin

    RelVP rp vp = {
      s = \\t,ant,b,ag => 
        let 
          agr = case rp.a of {
            RNoAg => ag ;
            RAg a => a
            } ;
          cl = mkClause (rp.s ! RC (fromAgr agr).g npNom) agr vp
        in
        cl.s ! t ! ant ! b ! oDir ;
      c = npNom
      } ;

    RelSlash rp slash = {
      s = \\t,a,p,agr => 
          slash.c2 ++ rp.s ! RPrep (fromAgr agr).g ++ slash.s ! t ! a ! p ! oDir ;
      c = NPAcc
      } ;

    IdRP = 
     { s = table {
        RC _ (NCase Gen) | RC _ NPNomPoss => "whose" ; 
        RC Neutr _  => "which" ;
        RC _ NPAcc    => "whom" ;
        RC _ (NCase Nom)    => "who" ;
        RPrep Neutr => "which" ;
        RPrep _     => "whom"
        } ;
      a = RNoAg
      } ;

}
