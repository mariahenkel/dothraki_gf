abstract Warriors = {
	flags startcat = Sentence ;
	cat
		Comment; Actor; SpecActor ; Action; TrAction ; Detr; Location ; Pol ; Temp ; Sentence ; RelActor ;
	fun
		Act : SpecActor -> Action -> Comment ;
		
		Relation : TrAction -> SpecActor -> Action ;
		
		Locate : Action -> Location -> Action ;
		
		Exist : SpecActor -> Comment ;
		
		Spec : Detr -> Actor -> SpecActor ;
		
		Rel : Actor -> Action -> Temp -> Pol -> Actor ;

		Zero : SpecActor -> SpecActor -> Comment ;


		The, This, That, These, Those : Detr ;
        Warrior, Queen, Woman, Rider, Goat, Turtle, Mom, Rabbit, Cheese : Actor ;   -- should the cheese be an actor? :D
        I, YouSg, YouPol, We, It, YouPl, They : SpecActor ;
		Stab, Meet, Protect, Kiss, Heal, Respect : TrAction; 
		Stink : Action ;
		Mountain, Sea, Tree : Location ;
		
		Pos, Neg : Pol ;
		Pres, Past, Fut, PresPerf : Temp ;
		
		Say : Comment -> Pol -> Temp -> Sentence ;

}