--# -path=.

abstract QuestionSimple = CatSimple ** {

-- A question can be formed from a clause ('yes-no question') or
-- with an interrogative.

  fun
    QuestCl     : Cl -> QCl ;            -- does John walk

}
