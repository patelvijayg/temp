docker run -itd --name ubuntu1 ubuntu:16.04
wget https://raw.githubusercontent.com/patelvijayg/temp/master/t2.sh
wget https://raw.githubusercontent.com/patelvijayg/temp/master/t3.sh
docker cp ./t2.sh ubuntu1:/root/
docker cp ./t3.sh ubuntu1:/root/
docker exec -itd ubuntu1 sh /root/t2.sh
docker stop ubuntu1
docker container commit -m "basic copied" ubuntu1 ubuntu1:1
docker start ubuntu1
docker exec -itd ubuntu1 sh /root/t3.sh
docker container commit -m "adavance" ubuntu1 ubuntu1:2
