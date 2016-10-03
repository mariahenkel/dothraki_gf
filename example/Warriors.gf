abstract Warriors = {
	flags startcat = Sentence ;
	cat
		Comment; Actor; SpecActor ; Action; Prop ; TrAction ; Detr; Location ; Pol ; Temp ; Sentence ; RelActor ;
	fun
		Act : SpecActor -> Action -> Comment ;
		
		Relation : TrAction -> SpecActor -> Action ;
		
		Locate : Action -> Location -> Action ;

		Describe : Actor -> Prop -> Actor ;
		
		Exist : SpecActor -> Comment ;
		
		Passive : TrAction -> Action ;
		PassiveBy : TrAction -> SpecActor -> Action ;
		
		Spec : Detr -> Actor -> SpecActor ;
		
		Rel : Actor -> Action -> Temp -> Pol -> Actor ;

		RelObj : Actor -> TrAction -> Temp -> Pol -> SpecActor -> Actor;

		Zero : SpecActor -> SpecActor -> Comment ;


		The, This, That, These, Those : Detr ;
        Warrior, Queen, Woman, Rider, Goat, Turtle, Mom, Rabbit, Cheese : Actor ;   -- should the cheese be an actor? :D
        I, YouSg, YouPol, We, It, YouPl, They : SpecActor ;
        Drogo : SpecActor ;
		Stab, Meet, Protect, Kiss, Heal, Respect : TrAction; 
		Stink : Action ;
		Mountain, Sea, Tree : Location ;

		Hot, Broken : Prop ;
		
		Pos, Neg : Pol ;
		Pres, Past, Fut, PresPerf : Temp ;
		
		Say : Comment -> Pol -> Temp -> Sentence ;

}