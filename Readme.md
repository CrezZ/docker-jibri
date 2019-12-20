#JIBRI for Jitsi recording

For record in the JITSI you need JIBRI. This is headless Chrome with selenium driver, which hidden view all participants and record any flows. It r


If you want to run JIBRI on a separate from JITSI host, port 5222 from JITSI needs to be expose:
```
 ports:
    - 5222:5222
```
Don`t forget protect this port by iptables or TLS/SSL.

Standart docker start for JIBRI
Warning: do not use single quotas "'" in password - it worked incorrect inside selenium.

```
docker run -e JIBRI_DOMAIN='mcu.youserver.ru' -e JIBRI_SECRET=321321321321 -e JIBRI_AUTH="123123123123" -e PROSODY_HOST=my.jitsi.host.or.docker.name crezz/docker-jibri-2019
```

or via docker compose

```
version: '3'
services:
  jibri:
    image: crezz/docker-jibri-2019
    environment:
      - JIBRI_AUTH='123123123123'
      - JIBRI_SECRET='123123123123'
      - PROSODY_HOST=my.jitsi.host.or.docker.name
      - JIBRI_DOMAIN=mcu.myserver.ru
      - RECORD_PATH=/tmp/record
    volumes:
      - /tmp:/tmp/record
      - /dev/shm:/dev/shm
    cap_add:
       - SYS_ADMIN
       - NET_BIND_SERVICE
    devices:
      - /dev/snd:/dev/snd

```

#Copy files after finish recording

After finish file /etc/jitsi/jibri/finalize_recording.sh is called with file path. You can map it to new script to upload files to anythere.





It required >2Gb RAM!
