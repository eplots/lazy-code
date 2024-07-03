#!/usr/bin/env bash

echo 'Checking if Hugo Docker development server is running...'
echo 'If nothing happens after this, start the development server using:'
echo 'docker run -p 1313:1313 --rm -v /opt/containers/hugo/site/:/src --name hugo klakegg/hugo:0.111-3-ext-alpine server'

if [ -n "$(docker ps -f "name=hugo" -f "status=running" -q )" ]; then
    while true; do
        read -p "Do you want to build the website? " yn
        case $yn in
            [Yy]* ) docker exec -it hugo hugo build; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done

    while true; do
        read -p "Do you want to upload the website? " yn
        case $yn in
            [Yy]* ) scp -q -r /opt/containers/hugo/site/public/* websrv:/home/eplots/eplots.xyz/blog/static/; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
    echo "Done!"
fi
