if [-z "$1" ]; then
	echo "erreur: mettre en parametre le nom du projet"
	echo "Usage: $0 nom_du_projet"
	exit 1
fi

PROJECT_NAME=$1

echo "creation du projet : $PROJECT_NAME"

# Créer le dossier du projet
mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

npm init -y
mkdir tests

touch tsconfig.json
touch .gitignore
echo "node_modules/" > .gitignore

mkdir src
mkdir src/entity
mkdir src/migration
touch src/data-source.ts
touch src/index.ts

npm install typescript @types/node concurrently nodemon ts-node --save-dev
npm install typeorm reflect-metadata --save
npm install express @types/express --save

echo "{" >> tsconfig.json
echo "	\"compilerOptions\": {" >> tsconfig.json
echo "		\"outDir\": \"dist\"," >> tsconfig.json
echo "		\"rootDir\": \"src\"," >> tsconfig.json
echo "		\"emitDecoratorMetadata\": true," >> tsconfig.json
echo "		\"experimentalDecorators\": true," >> tsconfig.json
echo "		\"allowSyntheticDefaultImports\": true" >> tsconfig.json
echo "	}" >> tsconfig.json
echo "}" >> tsconfig.json
echo "Projet $PROJECT_NAME créé avec succès."
