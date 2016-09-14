--# -path=.:../abstractsimple:../common:prelude

concrete GrammarSimpleEng of GrammarSimple = 
  NounSimpleEng, 
  VerbSimpleEng, 
  SentenceSimpleEng,
  PhraseSimpleEng,
  TextX - [Pol,PPos,PNeg],
  StructuralSimpleEng,
  IdiomSimpleEng,
  TenseX - [Pol,PPos,PNeg]
  ** open ResSimpleEng, Prelude in {

flags startcat = Phr ; unlexer = text ; lexer = text ;

lin
  PPos = {s = [] ; p = CPos} ;
  PNeg = {s = [] ; p = CNeg True} ; -- contracted: don't


} ;
