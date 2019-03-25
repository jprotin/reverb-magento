if [ "$1" = '' ] || [ "$1" = '--help' ]; then
    echo " ==================================================== "
    echo "                     HIPAY'S HELPER                 "
    echo " ==================================================== "
    echo "      - init        : Build images and run containers (Delete existing volumes)"
    echo "      - restart     : Run all containers if they already exist"
    echo "      - logs        : Show all containers logs continually"
    echo ""
elif [ "$1" = 'init' ]; then
    if [ -f ./bin/env/env ]; then
        docker-compose stop
        docker-compose rm -fv
        sudo rm -Rf db-data/ web-mg1/
        docker-compose build --no-cache
        docker-compose up -d
    else
        echo "Env file does not exist"
    fi
elif [ "$1" = 'restart' ]; then
    docker-compose restart
elif [ "$1" = 'logs' ]; then
    docker-compose logs -f
fi