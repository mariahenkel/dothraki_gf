--# -path=.:../../prelude


resource MorphoSimpleEng = open Prelude, (Predef=Predef), ResSimpleEng in {

  flags optimize=all ;

--2 Determiners

  oper 

  mkDeterminer : Number -> Str -> 
    {s : Str ; sp : NPCase => Str; n : Number ; hasNum : Bool} = \n,s -> mkDeterminerSpec n s s False ; --- was True!?

  mkDeterminerSpec : Number -> Str -> Str -> Bool ->
    {s : Str ; sp : NPCase => Str; n : Number ; hasNum : Bool} = \n,s,sp,hasNum ->
    {s = s; 
     sp = \\c => regGenitiveS sp ! npcase2case c ;
     n = n ;
     hasNum = hasNum ; --- doesn't matter when s = sp
     } ;

} ;

