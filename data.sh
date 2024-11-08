echo "Download ngrok"
wget -q https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
tar -xvzf ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
chmod +x ngrok
read -p "Paste Ngrok Authtoken: " CRP
./ngrok authtoken $CRP 
./ngrok tcp 3389 >/dev/null 2>&1 >/dev/null &

sleep 5

echo "kunes:kunes:N" > CREATEUSERS.TXT
docker run --name RattyDAVE20.04 \
           --privileged=true \
           -p 3389:3389 \
           -e TZ="Europe/London" \
           -v ${PWD}/CREATEUSERS.TXT:/root/createusers.txt \
           -dit --restart unless-stopped \
           fookam/7719:8344

curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
