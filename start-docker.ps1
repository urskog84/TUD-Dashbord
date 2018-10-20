$continer = docker build . -q
$has,$id = $continer.Split(":")
docker run -p 8080:8080 -it $id