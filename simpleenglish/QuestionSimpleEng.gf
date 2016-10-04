--# -path=.:../simpleabstract

concrete QuestionSimpleEng of QuestionSimple = CatSimpleEng ** open ResSimpleEng, Prelude in {

  flags optimize=all_subs ;

  lin

    QuestCl cl = {
      s = \\t,a,p => 
            let cls = cl.s ! t ! a ! p 
            in table {
              QDir   => cls ! OQuest ;
              QIndir => "if" ++ cls ! oDir ----
              } ---- "whether" in ExtEng
      } ;


}
