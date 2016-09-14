--# -path=.:../simpleabstract:../common:prelude

concrete GrammarSimpleDot of GrammarSimple =
  NounSimpleDot, 
  VerbSimpleDot, 
  SentenceSimpleDot,
  PhraseSimpleDot,
  TextX,
  StructuralSimpleDot,
  IdiomSimpleDot,
  TenseX
  ** open ResDot, Prelude in {
	flags startcat = Phr ; unlexer = text ; lexer = text ;
}