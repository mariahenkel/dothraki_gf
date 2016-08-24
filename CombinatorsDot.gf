--# -path=./cloned:.:alltenses:prelude

resource CombinatorsDot = Combinators with 
  (Cat = CatDot),
  (Structural = StructuralDot),
  (Noun = NounDot),
  (Constructors = ConstructorsDot) ;