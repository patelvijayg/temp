docker run -itd --name ubuntu1 ubuntu:14.04
wget https://raw.githubusercontent.com/patelvijayg/temp/master/t1.sh
wget https://raw.githubusercontent.com/patelvijayg/temp/master/t2.sh
wget https://raw.githubusercontent.com/patelvijayg/temp/master/t3.sh
docker cp ./t2.sh ubuntu1:/
docker cp ./t3.sh ubuntu1:/
docker exec -it ubuntu1 /bin/sh -c "chmod +x /t2.sh && /t2.sh"
#docker stop ubuntu1
#docker container commit -m "basic copied" ubuntu1 ubuntu1:1
#docker start ubuntu1
#docker exec -it ubuntu1 /bin/sh -c "chmod +x /root/t3.sh && /root/t3.sh"
#docker container commit -m "adavance" ubuntu1 ubuntu1:2
