    1  apt-get update
    2* 
    3  apt-get upgrade 
    4  apt-get install docker
    5  apt-get install docker*
    6  apt-get -y install docker*
    7* 
    8  apt-get -y install docker*
    9  apt-get -y install docker
   10  apt-get -y install docker*
   11  apt-get -y install "docker*"
   12  apt-get -y install docker-compose docker-containerd
   14  apt  install docker.io
   15  ip a
   16  service docker status
   18  curl -sL cli.openfaas.com | sudo sh
   19  faas-cli help
   20  git clone https://github.com/openfaas/faas
   22  ./deploy_stack.sh --no-auth
   25  faas-cli deploy -f https://raw.githubusercontent.com/openfaas/faas/master/stack.yml
   26  faas-cli list
   27  faas-cli list --verbose
   28  faas-cli markdown markdown
   29  markdown
   30  faas-cli invoke markdown
   31  uname -a | faas-cli invoke markdown
   32  docker service create -d --name=grafana --publish=3000:3000 --network=func_functions stefanprodan/faas-grafana:4.6.3
   34  faas-cli new --list
   38  faas-cli build -f ./hello-openfaas.yml
   39  faas-cli push -f ./hello-openfaas.yml
   40  docker login
   41  faas-cli deploy -f ./hello-openfaas.yml
   55  faas-cli build -f ./astronaut-finder.yml
   56  faas-cli deploy -f ./astronaut-finder.yml
   57  echo | faas-cli invoke astronaut-finder
   58  docker service logs -f astronaut-finder
   60  faas-cli deploy -f ./astronaut-finder.yml
   61  docker service logs -f astronaut-finder
   63  docker service logs -f astronaut-finder
   64  faas-cli deploy -f ./astronaut-finder.yml
   65  docker service logs -f astronaut-finder
   68  mv first.yml example.yml
   70  faas-cli build -f ./example.yml --parallel=2
   71  faas-cli build -f ./example.yml --filter=second
   73  faas-cli new --list
   80  ENV fprocess="sort"
   81  env fprocess="sort"
   87  git clone https://github.com/nwiizo/workspace_2018
   92  faas-cli build -f sorter.yml   && faas-cli push -f sorter.yml   && faas-cli deploy -f sorter.yml
   93  echo -n '
elephant
zebra
horse
ardvark
monkey'| faas-cli invoke sorter
   96  faas-cli build -f sorter.yml   && faas-cli push -f sorter.yml   && faas-cli deploy -f sorter.yml
  110  l
  112  faas-cli build -f sorter.yml   && faas-cli push -f sorter.yml   && faas-cli deploy -f sorter.yml
  113  echo -n '
elephant
zebra
horse
ardvark
monkey'| faas-cli invoke sorter
  120  faas-cli build -f sorter.yml   && faas-cli push -f sorter.yml   && faas-cli deploy -f sorter.yml
  121  echo -n '
elephant
zebra
horse
ardvark
monkey'| faas-cli invoke sorter
  123  faas-cli build -f sorter.yml   && faas-cli push -f sorter.yml   && faas-cli deploy -f sorter.yml
  125  docker login
  126  docker login --username nwiizo --password-stdin
  127  docker login
  134  echo "" | faas-cli invoke env --query workshop=1
  135  echo "" | curl http://127.0.0.1:8080/function/env --header "X-Output-Mode: json"
  138  kl
  142  l
  156  hello-openfaas/faas-cli build -f hello-openfaas.yml   && faas-cli push -f hello-openfaas.yml   && faas-cli deploy -f hello-openfaas.yml
  158  faas-cli build -f hello-openfaas.yml
  159  faas-cli push -f hello-openfaas.yml
  160  faas-cli deploy -f hello-openfaas.yml
  161  echo | faas-cli invoke hello-openfaas
  162  echo -n "" | faas-cli invoke nodeinfo | faas-cli invoke markdown
  163  echo -n "California is great, it's always sunny there." | faas-cli invoke sentimentanalysis
  166  faas-cli build -f hello-openfaas.yml   && faas-cli push -f hello-openfaas.yml   && faas-cli deploy -f hello-openfaas.yml
  170  docker run -p 4040:4040 -d --name=ngrok --net=func_functions   alexellis2/ngrok-admin http gateway:8080
  171  wget  http://127.0.0.1:4040
  180  faas-cli build -f show-html.yml   && faas-cli push -f show-html.yml   && faas-cli deploy -f show-html.yml
  181  faas-cli push -f show-html.yml
  182  faas-cli deploy -f show-html.yml
  189  cp show-html/handler.py show-html/handler_001.py 
  191  faas-cli build -f show-html.yml   && faas-cli push -f show-html.yml   && faas-cli deploy -f show-html.yml
  192  faas-cli push -f show-html.yml
  193  faas-cli deploy -f show-html.yml
  195  faas-cli build -f show-html.ym
  197  faas-cli build -f show-html.yml
  198  faas-cli push -f show-html.yml
  199  faas-cli deploy -f show-html.yml
  201  faas-cli build -f show-html.yml
  202  faas-cli deploy -f show-html.yml
  203  cp show-html/handler.py show-html/handler_002.py 
  206  faas-cli build -f show-html.yml
  207  faas-cli push -f show-html.yml
  208  faas-cli deploy -f show-html.yml
  209  docker ps
  211  faas-cli build -f show-html.yml
  212  faas-cli push -f show-html.yml
  213  faas-cli deploy -f show-html.yml
  220  bash sync.sh 
  221  faas-cli build -f long-task.yml 
  225  faas-cli build -f long-task.yml 
  226  faas-cli deploy -f long-task.yml 
  228  time bash sync.sh 
  231  time bash sync.sh echo -n "" | faas-cli invoke long-task
  232  echo -n "" | faas-cli invoke long-task
  233  time bash sync.sh 
  235  time bash time.sh 
  236  time bash async.sh.sh 
  237  time bash async.sh
  238  docker service logs -f func_queue-worker
  239  faas-cli store deploy nodeinfo
  240  while [ true ]; do curl -X POST http://localhost:8080/function/nodeinfo; done;
  241  docker service ps nodeinfo
  242  curl -X POST http://localhost:8080/function/nodeinfo
  243  curl -X POST http://127.0.0.1:8080/function/nodeinfo
  244  while [ true ]; do curl -X POST http://127.0.0.1:8080/function/nodeinfo; done;
  245  docker service ps nodeinfo
  265  cp -r * /tmp/workspace_2018/openfaas_workshop/
