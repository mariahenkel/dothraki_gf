# dothraki_gf
Building a resource grammar for Dothraki. Please note that this project is still under construction.

More information about Grammatical Framework: [http://www.grammaticalframework.org/](http://www.grammaticalframework.org/)

Documentation of this project: [https://github.com/mahen2/dothraki_gf/tree/master/documentation](https://github.com/mahen2/dothraki_gf/tree/master/documentation)

Dothraki Nouns Mindmap: [http://text2mindmap.com/B7b25jR](http://text2mindmap.com/B7b25jR)

The code in folders simpleapi, simpleabstract and simpleenglish is taken from the Grammatical Framework Resource Grammar Library available [here](http://www.grammaticalframework.org/download/index.html). It is used  in our project under the provisions of the GNU Lesser General Public License.



### TO DO

* ~~rename files, restructure~~ (not yet!)
* more test cases for epenthesis
* ~~idiomatic dothraki application grammar~~
* DOCUMENTATION (ongoing)


### DONE

* fix bug regarding noun declination (selection of animate nouns depending on vowels)
* complete noun declination
* vary verbs (only stab_v2 was being used)
* verb declination for both stem-options
* update English version
* negative verbs/sentences
* tenses
* Python Vocabulary Script
* personal pronouns (I/you/he/we/they/it -- anha/yer/me/kisha/yeri/mori)
* demonstrative pronouns (this/that -- jin/haz/rek)
* transitive verbs should assign case to their object(s)
* expletive constructions ("there is ..." -- " ... vekha") [fairly easy]
* intransitive verbs
* Phr and Text categories from abstract RGL
* ray (already) for perfect tense
* prepositions and Adv (adverbial phrases such as "on the mountain", "behind the house")
* zero copula sentences ("the queen is a warrior" -- "khaleesi lajak") [fairly easy] 
* adjectives [medium/difficult?] 
* relative clauses [difficult?]
* python script: 3 files - dictdot, dicteng, dictionary
* python script: replace spaces in variable names
* vtr to V2 and V3, v to V and V2
* relativizing objects
* mkN : Str -> Str -> Animacy -> N
* PN: proper names
* passive voice 
* "can" and "must"
* the warrior is hot
* translate vocabulary
* check dictionary with EngDict of resource grammar library
