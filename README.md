# Projet-Interco

Utilisez ./install pour installer docker et pipework. Vous pouvez aussi installer docker de votre coté si ça ne marche pas ou si vous avez envie. 

Pour l'instant pipework n'est pas utile.

Les fichiers ici représente la zone entreprise. Vous avez la liste des machines dans ListStation3.

Pour lancer les dockers faites ./groupe3, une fois qui vous avez fini fermez tout vos container et réseaux avec ./clean.
Une fois les containers lancé, vous pouvez rentrer dans un container avec "sudo docker attach #NomDuContainer" (box,parfeu,web...)
Pour en sortir utilisez: ctrl + p + q

Une fois que vous avez trouvé les commandes a effectué, vous pouvez les ajouter à la suite dans le fichier NomDuContainer.sh.
Vous pouvez aussi copier des fichiers sur un container avec "sudo docker cp src NomDuContainer:dest", ajoutez cette ligne dans le fichier NomDuCOntainer.sh.
