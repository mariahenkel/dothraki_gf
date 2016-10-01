### Introduction
Grammatical Framework (GF) is a functional programming language, created in 1998 (Ranta, 2011) and designed to write (natural) language grammars. Since GF is “working from a language-independent representation of meaning” (Wikipedia, 2016) it can be used to generate or parse text in different languages at the same time. One of its functions is to translate between languages. 
Since GF uses a symbolic approach to process and translate language, in many cases its translations are more precise than those of statistical tools we use in everyday life (Brown & Frederking, 1995). For example, the “Google Translate” service (Google, 2016) will produce ungrammatical sentences as soon as the input is too complicated while the GF translator (Grammatical Framework, 2016a) has no problems producing a correct translation (see Table 1). 

Table 1

This also means, that GF – other than Google Translate – depends on a large knowledge base of predefined grammar rules to achieve high-quality language processing: Its own standard library, the GF Resource Grammar Library, covers more than 38 different languages (Ranta, 2015) and is still growing (although many of them are not yet complete). In 2010, it already consisted of more than 500,000 lines of code (Ranta, 2011). As Grammatical Framework is an open-source project, and still under development, everyone is invited to use it or even help further develop it. For example, by adding languages to the library, which is the aim of the project described in this paper. 
Our goal is to write a GF resource grammar for the Dothraki language and, eventually, be able to add it to the GF Resource Grammar Library. The work described in this paper is meant to lay a foundation for this goal (see Chapter 2.1).
It is a constructed language, developed by the language creator and writer David J. Peterson (Peterson, 2016a). The Dothraki are a fictional race of nomadic horse warriors in the “A Song of Ice and Fire” book series by George R. R. Martin (Martin, 2016). As the series was adapted for television by the television network HBO, the language bits found in Martin’s books had to be extended to a fully functional language (Peterson, 2016b): The Dothraki language. Today, it has a vocabulary of over 3,000 words (Tongues of Ice and Fire Wiki, 2016). We will show a few examples of the Dothraki language grammar in this paper, but more information can be found in the book “Living Language Dothraki” (Peterson, 2014), on Peterson’s blog (2016b) and on the Tongues of Ice and Fire Wiki (2016) among many other sources.
This paper aims to serve as a short documentation and explanation of our project. It will cover the project aim and scope, general information regarding the project as well as its structure and explanations of sample functions and the corresponding Dothraki grammar rules (Chapter 2). We will also discuss problems and limitations and briefly describe future plans before we summarize and evaluate the project in its current state and our experience while working on it (Chapter 4).


### The Project
#### General Information
#### Program Structure and Functions
#### Examples

### Discussion
#### Limitations
#### Outlook
#### Conclusion

### References
Brown, R., & Frederking, R. (1995). Applying statistical English language modeling to symbolic machine translation. In Proceedings of the sixth international conference on theoretical and methodological issues in machine translation (TMI-95) (pp. 221-239).
Google (2016). Google Translate. Retrieved from https://translate.google.com/
Grammatical Framework (2016a). Translation with GF: Powered by multilingual grammars. Retrieved from http://www.grammaticalframework.org/demos/translation.html
Grammatical Framework (2016b). GF Resource Grammar Library: Synopsis. Retrieved from http://www.grammaticalframework.org/lib/doc/synopsis.html
Martin, G. R. R. (2016). Bibliography. Retrieved from http://www.georgerrmartin.com/bibliography/
Peterson, D. J. (2014). Living Language Dothraki: A Conversational Language Course Based on the Hit Original HBO Series Game of Thrones. New York: Living Language.
Peterson, D. J. (2016a). The Art of Language Invention. Retrieved from http://www.artoflanguageinvention.com/
Peterson, D. J. (2016b). About Dothraki. Retrieved from http://www.dothraki.com/about-dothraki/
Ranta, A. (2011). Grammatical Framework: Programming with Multilingual Grammars. Stanford: CSLI Publications.
Ranta, A. (2015). The Status of the GF Resource Grammar Library. Grammatical Framework. Retrieved from http://www.grammaticalframework.org/lib/doc/status.html
Tongues of Ice and Fire Wiki (2016). Vocabulary. Retrieved from http://wiki.dothraki.org/Vocabulary
Wikipedia (2016). Grammatical Framework. Retrieved from https://en.wikipedia.org/wiki/Grammatical_Framework
