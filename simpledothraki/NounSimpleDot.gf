--# -path=.:../simpleabstract


concrete NounSimpleDot of NounSimple = CatSimpleDot ** open MorphoSimpleDot, ResDot, Prelude in {
	
	lin
		DetCN det n =
			{s = n.s!det.n ; agr = Pers3 det.n} ;
			
		UsePron pron = {
			s = pron.s ;
			agr = case pron.p of {
				P2 => Pers2 ;
				P1 => Pers1 pron.n ;
				P3 => Pers3 pron.n
			} 
		} ;
			
		IndefArt, DefArt = {s = []} ;
		
		NumSg = {n = Sg} ;
		NumPl = {n = Pl} ;
		
		DetQuant q num = {n = num.n} ;
		
		UseN n = n ; 

}