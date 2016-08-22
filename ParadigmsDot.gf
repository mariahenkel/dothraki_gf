resource ParadigmsDot = open ResDot, CatDot in {
	oper
	-- Declarations
		Animacy : Type ;
		
		animate : Animacy ;
		inanimate : Animacy ;
		
		mkN : Str -> Animacy -> N ;
		
		Animacy = ResDot.Animacy ;
		animate = Anim ;
		inanimate = Inanim ;
		
	-- Implementation
		mkN = \s,a -> lin N ({
			s = table {
				x => s
			} ;
			a = a
		}) ;
}