--# -path=.:../simpleabstract

concrete NounSimpleEng of NounSimple = CatSimpleEng ** open MorphoSimpleEng, ResSimpleEng, Prelude in {

  flags optimize=all_subs ;

  lin
    DetCN det cn = {
      s = \\c => det.s ++ cn.s ! det.n ! npcase2case c ; 
      a = agrgP3 det.n cn.g
      } ;
    UsePron p = p ;
    UsePN pn = {s = \\c => pn.s ! npcase2case c ; a = agrgP3 Sg pn.g} ;

	  
    DetQuant quant num = {
      s  = quant.s ! num.hasCard ! num.n ++ num.s ! Nom;
      sp = \\c => case num.hasCard of {
                     False => quant.sp ! num.hasCard ! num.n ! c ++ num.s ! Nom ;
                     True  => quant.s  ! num.hasCard ! num.n     ++ num.s ! npcase2case c
                  } ;
      n  = num.n ;
      hasNum = num.hasCard
      } ;

    PossPron p = {
      s = \\_,_ => p.s ! NCase Gen ;
      sp = \\_,_,c => p.sp ! npcase2case c
      } ;

    NumSg = {s = \\c => []; n = Sg ; hasCard = False} ;
    NumPl = {s = \\c => []; n = Pl ; hasCard = False} ;

	
    DefArt = {
      s  = \\hasCard,n => artDef ;
      sp = \\hasCard,n => case <n,hasCard> of {
        <Sg,False> => table { NCase Gen => "its"; _ => "it" } ;
        <Pl,False> => table { NCase Nom => "they"; NPAcc => "them"; _ => "theirs" } ;
        _          => \\c => artDef
        }
      } ;

    IndefArt = {
      s = \\hasCard,n => case <n,hasCard> of {
        <Sg,False> => artIndef ;
        _          => []
        } ;
      sp = \\hasCard,n => case <n,hasCard> of {
        <Sg,False> => table {NCase Gen => "one's"; _ => "one" };
        <Pl,False> => table {NCase Gen => "ones'"; _ => "ones" } ;
        _          => \\c => []
        }
      } ;

    MassNP cn = {
      s = \\c => cn.s ! Sg ! npcase2case c ;
      a = agrP3 Sg
      } ;

    UseN n = n ;
    AdvCN cn ad = {s = \\n,c => cn.s ! n ! c ++ ad.s ; g = cn.g} ;
    
    RelCN cn rs = {
      s = \\n,c => cn.s ! n ! c ++ rs.s ! agrgP3 n cn.g ;
      g = cn.g
    } ;
    
    AdjCN ap cn = {
      s = \\n,c => preOrPost ap.isPre (ap.s ! agrgP3 n cn.g) (cn.s ! n ! c) ;
      g = cn.g
    } ;

}
