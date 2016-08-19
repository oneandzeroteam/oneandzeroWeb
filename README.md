하나와영 웹페이지 프로젝트  
==============

[![Build Status](https://travis-ci.org/oneandzeroteam/oneandzeroWeb.svg?branch=master)](https://travis-ci.org/oneandzeroteam/oneandzeroWeb) [![Code Climate](https://codeclimate.com/github/oneandzeroteam/oneandzeroWeb/badges/gpa.svg)](https://codeclimate.com/github/oneandzeroteam/oneandzeroWeb)



## 프로젝트 설명
하나와영 웹페이지를 위한 Rails 프로젝트입니다

## Get Started

이 프로젝트는 Ruby 2.3.0 or higher, Rails 5.0.0 이 사용되었습니다.
Homebrew를 사용한다면, 

```
brew install rbenv ruby-build
rbenv install 2.3.0
rbenv global 2.3.0
ruby -v

gem install rails -v 5.0.0
```

데이터베이스 마이그레이션과 서버를 시작할려면, 
```
sh reset_db.sh 
rails server
```
##Front End Guide

  사용된 사진들은 모두 public/assets/images에 저장되어 있습니다.
운영진 사진과 랜딩페이지 사진은 /pics에, 
사용된 로고들과 패비콘은 /logo_icon에, 
기존 템플릿 icon들은 /art에 있습니다.

  페이지 수정을 위해서는 app/views에 들어가시면 됩니다.
/admin에는 admin계정을 위한 각종 도구 페이지가 있습니다.
/layouts에는 패비콘과 사이드바, 하단메뉴가 정의되어 있습니다.
/members에는 alumni, member 페이지가 있습니다.
/pages에는 landing page(index.html.erb), about, chairman's greeting, 개인정보 취급 방침 등이 있습니다.
/posts에는 테크 블로그와 새 글 쓰기 페이지가 있습니다.
/projects에는 프로젝트 페이지가 있습니다.
/timeline에는 타임라인 페이지가 있습니다.

## Configuration 
- TODO


## Services

### TODO




## Database
* Database creation

* Database initialization



## Deployment instructions

### Environment Variables

이 프로젝트는 [bkeepers/dotenv](https://github.com/bkeepers/dotenv) 로 환경변수를 관리합니다.

프로젝트 루트에 `.env` 파일을 만들고 다음과 같은 변수들을 선언해줘야 합니다.
```
RECAPTCHA_PUBLIC_KEY
RECAPTCHA_PRIVATE_KEY
SECRET_KEY_BASE
```

### Githook

이 프로젝트는 [Github Webhook](https://github.com/oneandzeroteam/github-webhook) 프로젝트로 웹훅을 받아 디플로이됩니다

```
require "octokit"
client = Octokit::Client.new(:login => '깃헙_아이디', :password => '깃헙_비밀번호')

repo = "oneandzeroteam/oneandzeroWeb"
callback_url = "yourdomain.com/github_webhooks"
webhook_secret = "a_gr34t_s3cr3t"  # Must be set after that in ENV['GITHUB_WEBHOOK_SECRET']

# Create the WebHook
client.subscribe "https://github.com/#{repo}/events/push.json", callback_url, webhook_secret
```

더 자세한 서버 설정 방법은 [이 프로젝트](https://github.com/ssaunier/github_webhook)의 README를 참고하세요

### Email Server
- TODO 

## Dependencies

- [plataformatec/devise](https://github.com/plataformatec/devise)
- [bkeepers/dotenv](https://github.com/bkeepers/dotenv) 
- [ambethia/recaptcha](https://github.com/ambethia/recaptcha)

모든 라이브러리는 루비의 다음 명령어로 설치가 가능합니다

```
bundle install
```

## Contributions

모든 코드나 기여는 환영합니다.  

버그리포트, 기능추가 요청은 이슈트레커를 이용하거나 직접 풀 리퀘스트를 날려주시면 됩니다.

하나와영 회원이라면 [하니외영 Github](https://github.com/oneandzeroteam) 에 가입함에 따라 저장소에 대한 권한이 부여됩니다

## People

- 승주 : nicholaskim94@gmail.com
- 재영 : pjo901018@naver.com
- 창재 : chongjea93@gmail.com
- 가람 : skekrkfka@gmail.com
- 영택 : plaque5@naver.com
- 대한 : kdh5852@gmail.com
- 영정 : youngjung01@naver.com


## Licence

위 프로젝트는 MIT 라이센스의 적용을 받습니다. 하나와영 또는 하나와영 웹팀은 소프트웨어에 관해서 아무런 책임을 지지 않습니다.

The MIT License (MIT)
Copyright (c) 2016 One and Zero.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

