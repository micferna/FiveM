# SpawnLastPos

------ FR ------

Patch d'un bug présent sur :
    https://github.com/esx-framework/es_extended/tree/v1-final

    Le bug :

        Il arrive que le spanw du joueur sois aléatoire, alors que des coordonnées sont bien enregistré en BDD.
        Cette release vous permettra de patch ce bug.

    Start :

        Placez la ressource dans votre dossier ressource -> -> ->
            
            Startez la comme ceci dans votre cfg :
            
                APRES es_extended & mysql-async
                
                    ensure SpawnLastPos 


------ EN ------

Patch of a bug present on:
    https://github.com/esx-framework/es_extended/tree/v1-final

    The bug :

        It happens that the spanw of the player is random, while coordinates are well recorded in your database.
        This release will allow you to patch this bug.

    Start:

        Place the resource in your resource folder -> -> ->
            
            Star it like this in your cfg:

                AFTER es_extended & mysql-async
                
                    ensure SpawnLastPos 