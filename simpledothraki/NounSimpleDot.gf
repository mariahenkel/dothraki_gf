--# -path=.:../simpleabstract


concrete NounSimpleDot of NounSimple = CatSimpleDot ** open MorphoSimpleDot, ResDot, ParamX, Prelude in {
	
	lin
		DetCN det noun =
			{s = \\c => det.s!noun.a!c ++ noun.s!det.n!c ++ det.post; agr = Ag noun.p det.n } ;
			
		UsePron pron = pron ;
   		UsePN pn = {s = pn.s ; agr = Ag P3 Sg} ;
			
		IndefArt, DefArt = {s = \\_,_ => []; post = []} ;
		
		NumSg = {s = [] ; n = Sg} ;
		NumPl = {s = [] ; n = Pl} ;
		
		PossPron p = {
			s = \\_,_ => [] ;
      		post = p.s!Gen
      	} ;

		DetQuant q num = {
			s = table {
				Anim => \\c => q.s!(QAnim num.n)!c ++ num.s;
				Inanim => \\c => q.s!QInanim!c ++ num.s
			} ;
			--s = \\_,_ => case num.n of {
			--	Sg => "s";
			--	Pl => "p"
			--} ++ num.s;
			n = num.n ;
			post = q.post 
		} ;
		
		UseN n = n ; 
    	AdvCN cn ad = {s = \\n,c => cn.s ! n ! c ++ ad.s ; a = cn.a ; p = cn.p } ;
	    RelCN cn rs = {
	      s = \\n,c => cn.s ! n ! c ++ rs.s ! cn.a ! n ;
	      a = cn.a ;
	      p = cn.p ;
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