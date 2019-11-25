# 당근마켓 웹 개발 과제 챌린지 - Ruby On Rails 

programmers의 과제 테스트는 코드를 제출하면 자동으로 서버를 구성하여 실행해 볼 수 있는 환경을 제공합니다. 

아래 내용을 확인하여 프로젝트를 구성하고 코드를 제출해 주세요.

## Docker 설치 및 개발 환경 설정

### Docker 설치
- 개발 환경은 docker로 구성하여 제공됩니다. 
- docker가 이미 설치 되어있다면 다음으로 넘어가세요.
- 사용중이신 os에 맞게 docker-for-desktop을 다운로드/설치 합니다.
  - mac: https://download.docker.com/mac/stable/Docker.dmg
  - windows: https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe

### 개발용 서버 실행
```
$ docker-compose up -d mysql-server 
$ docker-compose run shell
   # bundle install
   # yarn install
   # rake db:create db:migrate db:seed
   # exit
$ docker-compose up -d server
$ docker-compose up -d webpacker
```

### 개발용 서버 주소
> http://localhost:5000 

## 실행 및 제출 시 주의사항

- Port 번호는 **PORT 환경 변수** 또는 **5000** 을 사용해야 합니다.

- programmers에서 과제 실행 및 제출 시에는 `RAILS_ENV` 는 **production** 으로 실행 됩니다.

- 저장소에 루트 디렉토리에 `Gemfile` 과 `config.ru` 파일이 포함되어 있어야 합니다.

- `Procfile` 파일이 반드시 저장소의 루트 디렉토리에 있어야 하며, 다음과 같이 서버 프로세스를 실행하기 위한 `web` 과 DB 마이그레이션을 위한 `migrate` 가 정의되어 있어야 합니다.

  ```
  web: bundle exec rails server -p $PORT
  migrate: bin/rake db:migrate
  ```

- puma web server와 같이 사용하는 경우,

  Gemfile 파일에 `gem 'puma'` 을 추가하고 application 저장소의 root 디렉토리에 `Procfile` 파일을 생성하고 Puma를 웹 프로세스의 서버로 설정해야 합니다.

  다음은 `Pipfile` 의 예시 입니다.  `web`에 프로젝트의 진입 명령어를 명시해주어야 합니다.

  ```
  web: bundle exec puma -t 5:5 -p ${PORT:-5000} -e ${RACK_ENV:-production}
  ```

- stdout으로 출력된 로그는 화면에 표시됩니다.

- programmers에서 실행된 서버는 최대 10분 뒤에는 자동으로 종료됩니다.



## 실행 및 제출 방법

1.  **본인의 github 계정**의 **private** 저장소를 생성해서 과제를 **master** 브랜치에 push 해주세요.

     > **주의!**: 저장소가 public으로 되어 있는 경우에는 programmers에서 과제를 실행/제출할 수 없습니다.

2. github 저장소 페이지의 **Setting > Collaborators** 에서 [programmers-gitbot](https://github.com/programmers-gitbot) 을 Collaborator로 추가 해주세요.

3. 실행시 github 저장소의 url을 입력하시고 **[빌드(build)]** 버튼을 누르면 자동으로 서버를 구성하여 실행 합니다. 실행 후에는 **[최종 제출]** 버튼이 활성화되어 과제를 제출 할 수 있습니다.

4. **[최종 제출] 하면 테스트가 종료되며, 이후 다시 제출이 불가능하니 충분히 실행을 해보시고 제출하시기 바랍니다!!**

   > **주의!**: [최종 제출] 되면 제출 당시의 master 브랜치의 commit으로 제출이 고정되므로 제출 이후 저장소에 commit을 push 해도 제출물에는 반영되지 않습니다.



## 에러 로그 발생 시 참고사항

- git fetch failed! please check your repository.

  > 잘못된 저장소 주소를 입력하거나 force commit으로 해당 commit이 없어진 경우 발생합니다.

- -----> Unable to select a buildpack

  > 저장소 root 디렉토리에 `Gemfile` 이나 `config.ru` 파일을 찾을 수 없습니다. 저장소에 해당 파일을 확인해주세요.

- ERROR: connect ECONNREFUSED 127.0.0.1:3306

  > MySQL host를 찾을 수 없습니다. MySQL host는 *MYSQL_ROOT_HOST* 환경변수 혹은 "mysql-server" 이여야 합니다.

  > **주의!**: programmers에서 과제 실행 시 MySQL host는 127.0.0.1(localhost)가 아니라 *mysql-server*임을 유의해주세요.

- ERROR: Access denied for user 'root'@'172.17.0.3' (using password: YES)

  > MySQL 유저 혹은 비밀번호를 잘못 입력했습니다. 유저는 *MYSQL_USER* 환경 변수 혹은 "root", 비밀번호는 *MYSQL_ROOT_PASSWORD* 환경 변수 혹은 "password" 이여야 합니다.

  > **주의!**: 이 로그에서 나오는 ip 주소를 고정으로 사용하지 마세요. MySQL host의 ip 주소는 동적으로 변할 수 있습니다.

- ERROR: Unknown database

  > database를 찾을 수 없습니다. database는 *MYSQL_DATABASE* 환경 변수 혹은 "my_database" 이여야 합니다.

- Proc entrypoint migrate does not exist. Please check your Procfile

  > 저장소 root 디렉토리에 Procfile 파일을 찾을 수 없거나 Procfile의 migrate가 정의되어 있지 않은 경우 발생합니다. 

- 페이지가 작동하지 않습니다.

  > 서버 실행에 실패했거나 서버가 실행된지 10분이 지나 종료되었습니다. Procfile의 web을 확인하여 서버 실행의 이상이 없는지 확인하세요. 이상이 없으면 [초기화] 후 다시 실행하세요.



## 원격 서버 시스템 및 프레임워크

실행하거나 제출된 application은 원격 서버에서 다음과 같은 시스템 및 프레임워크 환경에서 실행됩니다.

```
OS 버전: ubuntu 16.04
메모리 제한: 1024 MiB
MySQL 버전: 8.0.17
ruby 버전: 2.6.2
bunder 버전: 2.0.1
yarn 버전: 1.12.3
```
