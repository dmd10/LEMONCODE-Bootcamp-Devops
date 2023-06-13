## Ejercicios GitHub Actions

### Ejercicio 1. Crea un workflow CI para el proyecto de frontend

Copia el directorio [.start-code/hangman-front](../04-github-actions/.start-code/hangman-front) en el directorio raíz del proyecto. Después crea un nuevo workflow, que se disparé cuando exista una nueva pull request, y que ejecute las siguientes oeraciones:

* Build del proyecto de front
* Ejecutar los unit tests

### Ejercicio 2. Crea un workflow CD para el proyecto de frontend

Crea un nuevo workflow que se dispare manualment y que cree una nueva imagen de Docker y lo publique en el siguiente [registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)


### Ejercicio 3. Crea un workflow que ejecute tests e2e

Crea un workflow que se ejecute de la manera que elijas y que ejecute los tests usando [Docker Compose](https://docs.docker.com/compose/gettingstarted/) o [Cypress action](https://github.com/cypress-io/github-action).