docker images |awk '$2=="<none>" {print $3}'|xargs docker rmi -f
