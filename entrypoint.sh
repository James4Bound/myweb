cd /v4bin
if [ "$VER" = "latest" ]; then
  wget -O v4ray http://storage.googleapis.com/v2ray-docker/v2ray 
  wget http://storage.googleapis.com/v2ray-docker/v2ctl
  wget http://storage.googleapis.com/v2ray-docker/geoip.dat
  wget http://storage.googleapis.com/v2ray-docker/geosite.dat
else
  wget -O v4ray.zip http://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip
  unzip v4ray.zip 
  mv /v4bin/v2ray-v$VER-linux-64/v2ray ./v4ray
  mv /v4bin/v2ray-v$VER-linux-64/v2ctl .
  mv /v4bin/v2ray-v$VER-linux-64/geoip.dat .
  mv /v4bin/v2ray-v$VER-linux-64/geosite.dat .
fi

chmod +x v4ray
chmod +x v2ctl

#echo -e -n "$CONFIG_JSON1" > config.json
#echo -e -n "$PORT" >> config.json
#echo -e -n "$CONFIG_JSON2" >> config.json
#echo -e -n "$UUID" >> config.json
#echo -e -n "$CONFIG_JSON3" >> config.json

sed -i "s/66666/$PORT/g" config.json
sed -i "s/your_uuid/$UUID/g" config.json

./v4ray
