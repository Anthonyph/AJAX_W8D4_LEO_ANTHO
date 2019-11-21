# Bienvenue sur le REPO de Antho et Léo

N'oublie pas le bundle install des familles et le rails db:drop db:create db:migrate db:seed.
le lien Heroku est le suivant : http://caramail.herokuapp.com/
Bonne correction

<h2>1. Introduction</h2>

<p>Pour ce projet, nous allons te demander de faire un <em>Email Viewer</em> qui n'est ni plus ni moins qu'une version ultra basique de Gmail. Globalement l'appli affichera une seule et unique page avec 2 colonnes :</p>

<ul>
  <li>Une colonne contenant la liste des emails en base ;</li>
  <li>Une colonne affichant le contenu de l'email sur lequel l'utilisateur vient de cliquer.</li>
</ul>

<h2>2. Le projet</h2>
<h3>2.1. Une appli Rails</h3>
<p>Pour te simplifier la vie, tu vas continuer sur l'application Rails d'hier (la <code>to do list</code>) : cela t'évitera de refaire les manipulations et branchements habituels (que tu connais à présent par coeur). <br>
Crées un model <code>email</code> ayant des attributs <code>object</code> (string), et <code>body</code> (text). On ira pas tellement plus loin pour le back, après tout on bosse sur AJAX là ! Fais-toi un petit seed pour mettre en base quelques emails.</p>

<p>Maintenant root ton projet sur <code>email#index</code>, et génère le controller et la view qui correspondent. On va pouvoir bosser !</p>

<h3>2.2. La view index de base</h3>
<p>Pour commencer, tu vas créer un grand tableau sur 2 colonnes :</p>
<ul>
  <li>Une colonne "Liste des emails" qui affichera l'objet de chaque email présent en base ;</li>
  <li>Une colonne "Email sélectionné" qui sera vide au chargement de la page mais qui affichera le contenu (à terme) de l'email sélectionné.</li>
</ul>

<p>N'hésite pas à utiliser Bootstrap pour avoir un visuel pas trop moche sur toute ton app !</p>

<h3>2.3. Premier niveau d'AJAX : l'ajout d'un email</h3>
<p>On commence par une fonction AJAX que tu connais bien : la création d'un nouvel email. Ici on fait ultra simple :</p>

<ul>
  <li>Tu vas créer un bouton "recevoir un email" juste au dessus de ton tableau ;</li>
  <li>Lorsqu'il sera cliqué, ce bouton fera un appel en POST vers une méthode <code>create</code> du controller <code>emails</code> qui va créer un nouvel email en base via Faker (comme ça, pas besoin de saisir toi-même le contenu) ;</li>
  <li>Tout cela doit avoir lieu en AJAX pour que le nouvel email s'affiche, à la suite des autres et sans rechargement.</li>
</ul>

<h3>2.4. Deuxième niveau d'AJAX : afficher un email</h3>
<p>Maintenant, tu vas changer chaque objet d'email (le texte) en un lien HTML : ce lien doit rediriger vers une page <code>show</code> basique de l'email (affichant l'objet en haut, contenu en dessous).</p>

<p>Une fois cela fait, tu vas passer ce lien en AJAX : au lieu d'ouvrir la page <code>show</code> via une redirection d'URL, je veux que cela exécute un fichier JS qui va afficher le contenu de l'email dans la colonne de droite. Le rendu visuel sera simple :</p>
<ul>
  <li>L'objet de l'email sera en gros, en haut de la colonne de droite ;</li>
  <li>Le corps de l'email sera en taille normale, juste en dessous ;</li>
  <li>Sous le corps d'email, il y aura 2 boutons (inactifs pour le moment) : "Supprimer" et "Marquer comme non-lu"</li>
</ul>

<h3>2.5. Troisième niveau d'AJAX : la suppression d'un email</h3>
<p>Pas besoin de plus d'info, si ? Il faut tout simplement que le bouton "Supprimer" fonctionne bien en AJAX. L'email doit disparaître des 2 colonnes.</p>

<h3>2.6. Quatrième niveau d'AJAX : email lu/non-lu</h3>
<p>On va à présent gérer la notion de lu/non-lu. Fais une migration qui rajoute l'attribut <code>read</code> à la table <code>emails</code> : c'est un booléen qui vaut <code>false</code> initialement et doit passer à <code>true</code> si l'email est lu. Met à jour ton seed si besoin pour prendre en compte cet attribut.</p>
<p>Voici comment cet attribut doit fonctionner pour l'utilisateur de ton Gmail-like :</p>

<ul>
  <li>Lorsqu'il clique sur l'objet d'un email et que le contenu de celui-ci s'affiche, l'email doit passer en lu à la fois en BDD et visuellement sur le front de la colonne de gauche (par exemple la couleur de fond de l'objet change ou son nom passe de gras à normal).</li>
  <li>L'utilisateur peut remettre l'email en "non-lu" grâce au bouton "Marquer comme non-lu". Cela modifie son statut en BDD ainsi que son affichage visuel sur la colonne de gauche (par exemple la couleur de fond de l'objet revient à la normale).</li>
</ul>

<p>Une fois que tu as fait marcher cela, essaye d'implémenter une fonctionnalité sympa : si on clique sur le bouton "marquer comme non-lu", le bouton devient alors "marquer comme lu" et permet de repasser le statut de l'email à "lu".</p>

<h3>2.7 Ultime niveau d'AJAX : l'appel en JQuery/JS</h3>
<p>Ton Email-Viewer est ultra-cool si tu as réussi à lui implémenter tout ça. Mais on peut aller encore un niveau au dessus ! En effet, pour afficher un email, tu dois pour le moment cliquer sur un lien qui est le texte de l'objet. Mais Gmail fait mieux : il t'affiche le contenu de ton email si tu cliques n'importe où dans la case qui encadre l'objet de l'email.</p>

<p>Pour faire cela, il faut être capable de mettre un détecteur JS de clic sur la case puis de déclencher, via JavaScript, une requête AJAX. C'est un peu le niveau du dessus de la checkbox qu'on a vu précédemment !</p>

<p>Je vais te laisser chercher comment faire cela, car c'est complètement bonus. Mais voilà déjà plusieurs ressources qui vont te guider :</p>

<ul>
  <li><a href="https://medium.freecodecamp.org/here-is-the-most-popular-ways-to-make-an-http-request-in-javascript-954ce8c95aaa" target="_blank">Cette ressource liste les différents façons</a> de faire une requête HTTP en JavaScript/AJAX ;</li>
  <li><a href="https://stackoverflow.com/questions/8567114/how-to-make-an-ajax-call-without-jquery" target="_blank">Ce thread StackOverflow</a> explique une partie de la syntaxe ;</li>
  <li><a href="https://medium.freecodecamp.org/a-practical-es6-guide-on-how-to-perform-http-requests-using-the-fetch-api-594c3d91a547" target="_blank">Ici, on présente la méthode fetch()</a> qui peut être une solution.</li>
</ul>

<p>Je te laisse chercher comment faire. Rappelle toi simplement que dans notre cas, nous souhaitons avoir du JavaScript en réponse à notre requête AJAX, pas du JSON, ni de l'HTML, ni du texte.</p>

<h2>3. Rendu attendu</h2>
<p>Un repo GitHub avec une app Rails complète, fonctionnelle et déployée en production sur Heroku.</p>

