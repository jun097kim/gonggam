# Gonggam

Gonggam은 Spring 애플리케이션에 공통적으로 적용할 수 있는 관리자 모듈입니다. 이 모듈은 4가지 주요 기능 (사용자 관리, 접근권한 관리, 공통코드 관리, 메뉴 관리)을 포함합니다.

## Overview

- **관리자 로그인** - 관리자 페이지에 접근 권한이 있는 사용자는 로그인할 수 있습니다.

<img src="https://user-images.githubusercontent.com/16279779/58849860-175b8b00-86c7-11e9-952b-a290fec9fa36.png" width="430" alt="gonggam-01-admin-login">

- **사용자 관리** - 사용자를 그룹별로 관리할 수 있습니다.

<img src="https://user-images.githubusercontent.com/16279779/58849861-175b8b00-86c7-11e9-955d-b64d16abf630.png" width="430" alt="gonggam-02-admin-user"> <img src="https://user-images.githubusercontent.com/16279779/58849862-175b8b00-86c7-11e9-899e-27124a2feb30.png" width="430" alt="gonggam-03-admin-user-create">

- **그룹 관리** - 사용자 그룹을 생성할 수 있습니다.

<img src="https://user-images.githubusercontent.com/16279779/58849863-175b8b00-86c7-11e9-84bc-6aed88ad8b4d.png" width="430" alt="gonggam-04-admin-group"> <img src="https://user-images.githubusercontent.com/16279779/58849864-17f42180-86c7-11e9-9835-f7f0118b7ef6.png" width="430" alt="gonggam-05-admin-group-create">

- **접근권한 관리** - URL에 접근할 수 있는 그룹 목록을 관리할 수 있습니다.

<img src="https://user-images.githubusercontent.com/16279779/58849865-17f42180-86c7-11e9-8c8f-5b2bc25a37da.png" width="430" alt="gonggam-06-admin-role"> <img src="https://user-images.githubusercontent.com/16279779/58849866-17f42180-86c7-11e9-9827-9a131b3af6e9.png" width="430" alt="gonggam-07-admin-role-create">

- **공통코드 관리** - 공통코드 그룹을 생성하고, 공통코드를 그룹별로 관리할 수 있습니다.

<img src="https://user-images.githubusercontent.com/16279779/58849868-17f42180-86c7-11e9-8500-ff3f9e1b8bb0.png" width="430" alt="gonggam-08-admin-code"> <img src="https://user-images.githubusercontent.com/16279779/58849870-188cb800-86c7-11e9-81c6-1d1b126d9323.png" width="430" alt="gonggam-10-admin-code-create">

- **메뉴 관리** - 트리 구조의 UI를 조작하여 무제한 Depth의 메뉴를 생성할 수 있습니다.

<img src="https://user-images.githubusercontent.com/16279779/58849871-188cb800-86c7-11e9-9602-473e9817f83e.png" width="430" alt="gonggam-11-admin-menu">

- **사용자 페이지** - 관리자 페이지에서 등록한 메뉴를 출력합니다.

<img src="https://user-images.githubusercontent.com/16279779/58849774-a6b46e80-86c6-11e9-9ef3-05cbcf80d927.png" width="430" alt="gonggam-12-public">

## Dependency

Gonggam has the dependencies for the following libraries:

| Lombok   | Oracle Database |
| -------- | --------------- |
| 1.16.20+ | 11g             |
