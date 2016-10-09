--# -path=.:../simpleabstract


concrete NounSimpleDot of NounSimple = CatSimpleDot ** open MorphoSimpleDot, ResDot, ParamX, Prelude in {
	
	lin
		DetCN det noun =
			{s = \\c => det.s!noun.a!c ++ noun.s!det.n!c ++ det.s2; agr = Ag P3 det.n } ;
			
		UsePron pron = pron ;
   		UsePN pn = {s = pn.s ; agr = Ag P3 Sg} ;
			

		IndefArt, DefArt = {s = \\_,_ => []; s2 = []} ;
		
		NumSg = {s = [] ; n = Sg} ;
		NumPl = {s = [] ; n = Pl} ;
		
		PossPron p = {
			s = \\_,_ => [] ;
      		s2 = p.s!Gen
      	} ;

		DetQuant q num = {
			s = \\a,c => case a of {
				Anim => q.s!(QAnim num.n)!c ;
				Inanim => q.s!QInanim!c
			} ++ num.s ;
			n = num.n ;
			s2 = q.s2
		} ;
		
		UseN n = n ; 
    	AdvCN cn ad = {s = \\n,c => cn.s ! n ! c ++ ad.s ; a = cn.a ; p = cn.p } ;
	    RelCN cn rs = {
	      s = \\n,c => cn.s ! n ! c ++ rs.s ! cn.a ! n ;
	      a = cn.a ;
	    } ;

	    AdjCN ap cn = {
	    	s = \\n => table {
	    		Nom => cn.s!n!Nom ++ ap.s!n!ANom ;
	    		x => cn.s!n!x ++ ap.s!n!AOther
	    	} ;
	    	a = cn.a ;
	    	p = cn.p ;
	    } ;

}