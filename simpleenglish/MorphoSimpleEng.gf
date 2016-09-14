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
     
  mkPron : (i,me,my,mine : Str) -> Number -> Person -> Gender -> 
    {s : NPCase => Str ; sp : Case => Str ; a : Agr} =
     \i,me,my,mine,n,p,g -> {
     s = table {
       NCase Nom => i ;
       NPAcc => me ;
       NPNomPoss => mine ;
       NCase Gen => my
       } ;
     a = toAgr n p g ;
     sp = table {
       Nom => mine ;
       _ => genitiveS mine
       }
   } ;

} ;

