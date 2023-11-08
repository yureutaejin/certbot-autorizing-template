# certbot-study Repository  
## Introduction
https 적용 시에 letsencrypt 및 certbot 관련 이슈가 생각보다 많은데, 자료는 구더기가 많아, 몸으로 체득하려고 만든 repo.  
Goal은 `git clone` 및 실행만으로, 어떤 환경 어떤 아키텍쳐든 ssl 인증 딱히 머리 아프게 생각할 필요 없도록 한방에 이루어지고 관리가 필요없도록 하는게 목적  

## Index  
1. letsencrypt, certbot 설치  
2. letsencrypt 인증서 발급
    1. 웹서버
    2. 인증서만 발금
3. certbot 갱신
4. letsencrypt 및 certbot 이관
5. 기타 유용한 certbot 명령어
---
작성 중....


---
## certbot 갱신
분명히 cron에 certbot renew를 등록했음에도 갱신이 안되는 경우를 위해 그냥 아예 cron까지 자동화하여 certbot 갱신과정 등록  
linux 상 root 계정 접속이 필요
1. `setting_cerbot_cron.sh`의 10번째 줄에 있는 cron 주기를 원하는대로 변경
2. `/certbot-renew` 디렉토리를 `root` 디렉토리에 mv (`mv ./certbot-renew /root/certbot-renew`)
3. `sudo bash /root/certbot-renew/setting_certbot_cron.sh`
4. `systemctl status cron`의 출력에서 Tasks가 하나 늘어나면 성공
5. 해당 주기에 도달 시 `certbot_cron_log.log` 에 과정이 기록됨
6. test는 certbot_cron_test.sh 실행