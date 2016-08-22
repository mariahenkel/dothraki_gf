resource ParadigmsDot = open ResDot in {
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
		mkN = \s,a -> {
			
		} ;
}