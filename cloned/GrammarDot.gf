--# -path=.:../abstract:../common:prelude

concrete GrammarDot of Grammar = 
  NounDot, 
  VerbDot, 
  AdjectiveDot,
  AdverbDot,
  NumeralDot,
  SentenceDot,
  QuestionDot,
  RelativeDot,
  ConjunctionDot,
  PhraseDot,
  TextX - [Pol,PPos,PNeg],
  StructuralDot,
  IdiomDot,
  TenseX - [Pol,PPos,PNeg]
  ** open ResDot, Prelude in {

flags startcat = Phr ; unlexer = text ; lexer = text ;

lin
  PPos = {s = [] ; p = CPos} ;
  PNeg = {s = [] ; p = CNeg True} ; -- contracted: don't


} ;
