--# -path=.:../simpleabstract


concrete NounSimpleDot of NounSimple = CatSimpleDot ** open MorphoSimpleDot, ResDot, Prelude in {
	
	lin
		DetCN det n =
			{s = n.s!det.n ; agr = Pers3 det.n} ;
			
		IndefArt, DefArt = {s = []} ;
		
		NumSg = {n = Sg} ;
		NumPl = {n = Pl} ;
		
		DetQuant q num = {n = num.n} ;
		
		UseN n = n ; 

}