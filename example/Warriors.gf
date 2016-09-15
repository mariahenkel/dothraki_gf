abstract Warriors = {
	flags startcat = Comment;
	cat
		Comment; Actor; SpecActor ; Action; Detr; Location ;
	fun
		Relation : SpecActor -> Action -> SpecActor -> Comment ;
		
		Locate : SpecActor -> Action -> SpecActor -> Location -> Comment ;
		
		Exist : SpecActor -> Comment ;
		
		Spec : Detr -> Actor -> SpecActor ;

		The, This, That, These, Those : Detr ;

        Warrior, Queen, Woman, Rider, Goat, Turtle, Mom, Rabbit, Cheese : Actor ;
        
        I, YouSg, YouPol, We, It, YouPl, They : SpecActor ;
	
		Stab, Meet, Protect, Kiss, Heal, Respect : Action; 

		Mountain, Sea, Tree : Location ;

}