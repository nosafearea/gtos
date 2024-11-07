echo "kune:kune:N" > CREATEUSERS.TXT
docker run --name RattyDAVE20.04 \
           --privileged=true \
           -p 3389:3389 \
           -e TZ="Europe/London" \
           -v ${PWD}/CREATEUSERS.TXT:/root/createusers.txt \
           -dit --restart unless-stopped \
           rattydave/docker-ubuntu-xrdp-mate-custom
