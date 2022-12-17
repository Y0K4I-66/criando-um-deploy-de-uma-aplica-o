echo "criando as imagens ......"

docker build -t williancms/projeto-backend:1.0 backend/.
docker build -t williancms/projeto-database:1.0 database/.

echo "realizando o push das imagens ......."

docker push williancms/projeto-backend:1.0
docker push williancms/projeto-database:1.0

echo "Criando serviços no cluster kubernetes ..."

kubctl apply -f ./services.yml

echo "Criando os deployments......."

kubectl apply -f ./deployment.yml