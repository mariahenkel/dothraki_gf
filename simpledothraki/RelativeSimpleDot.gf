--# -path=.:../simpleabstract

concrete RelativeSimpleDot of RelativeSimple = CatSimpleDot ** open ResDot in {

  flags optimize=all_subs ;

  lin

    RelVP rp vp = {
    	s = \\t,a,p,anim,n => let vf = (tapaToVForm t a p (Ag P3 n)) in 
		rp.s!(anToQuForm anim n)!Nom ++ 
		case <t,a> of {
			<Present,Anter> => "ray" ; 		-- the perfect tense marker
			_ => []		
		} ++
		case p of {
			Pos => []  ;
			Neg => "vos" 
		} ++
		vp.s!vf ++ vp.compl ;
    } ;
    
    RelSlash rp clsl = {
    	s = \\t,a,p,anim,n => rp.s!(anToQuForm anim n)!clsl.objCase ++ clsl.s!t!a!p ++ clsl.subj
    } ;

    IdRP = { s = table {
		QAnim Sg => table {
			Nom => "fin" ;
			Acc => "fines" ;
			Gen => "fini" ;
			All => "finnaan" ;
			Abl => "finnoon"
		} ;
		QAnim Pl => table {
			Nom => "fini" ;
			Acc => "finis" ;
			Gen => "fini" ;
			All => "finea" ;
			Abl => "finoa"			
		} ;
		QInanim => table {
			Nom => "fini" ;
			Acc => "fin" ;
			Gen => "fini" ;
			All => "finaan" ;
			Abl => "finoon"
		}
    }} ;

}
