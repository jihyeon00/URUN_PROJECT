<h1 align="center">
  <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/c54209aa-86d9-41ae-b71f-5db89a881e0e" width="400">
</h1>

## 📌 목차
1. [🖥️ 프로젝트 개요](#-프로젝트-개요)
2. [🧑‍🤝‍🧑 멤버 구성](#-멤버-구성)
3. [📕 주요기능](#-주요기능)
4. [🔧 아키텍처](#-아키텍처)
5. [🏗️ ERD](#-ERD)
6. [📃 화면설계](#-화면설계)
7. [🎞 구동영상](#-구동영상)
8. [🗨️ 자체평가의견](#-자체평가의견)
<br><br>

## 🖥️ 프로젝트 개요
### :calendar: 개발기간
  <h4>- JDBC : 2024년 1월 29일 ~ 2월 14일 </h4>
  <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/4f8f74a4-524d-4abf-865d-c899c1a12244" alt="JDBC 일정표">
  <h4>- SpringBoot : 2024년 3월 11일 ~ 3월 19일</h4>
  <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/d8a39adc-dbc2-4848-b195-6dd963a8ced1" alt="SpringBoot 일정표">
    
### 🔖프로젝트 주제
  - 대상: 운동화를 생산하고 제조하는 회사
  - 용도: 운동화 생산 DATA를 기반으로 한 웹 프로그램 개발 (SCM)
  - 선정 이유: 매트리스, 신발, 의류 등의 주제를 생각했으며, 그 중 생산 DATA를 보다 쉽게 이용할 수 있는 운동화를 선정
### 📁프로젝트 구현 내용
  - 운동화 생산 계획과 당일 작업, BOM, 입출고 등 생산 관리에 필요한 기능과 비지니스 로직 구현
### ⚙️ 개발환경 및 도구
|-|JDBC|SpringBoot|
|---|---|---|
|JAVA|`JAVA 11`|`JAVA 17`|
|IDE|Eclipse|IntelliJ, STS4|
|Framework|-|Springboot(3.1.10)|
|DataBase|Oracle DB(ojdbc8)|Oracle DB(ojdbc8)|
|ORM|-|Mybatis|
|DevOps|Git, GitHub|Maven, Git, GitHub|
|Tools|Discord, GoogleDrive, StarUML, Figma|Discord, GoogleDrive, StarUML, Figma|
  
## 🧑‍🤝‍🧑 멤버 구성
### JDBC
|팀원명|프로필|담당업무|
|---|---|---|
|[배지현(팀장)](https://github.com/jihyeon00)|<p align="center"><img src="https://avatars.githubusercontent.com/u/120089047?v=4" width="100"></p>|로그인, 회원가입, BOM관리, 공지사항, 재고관리|
|[이시연(팀원)](https://github.com/sieoh)|<p align="center"><img src="https://avatars.githubusercontent.com/u/151722461?v=4" width="100"></p>|생산관리, 입출고관리|

### SpringBoot
|팀원명|프로필|담당업무|
|---|---|---|
|[배지현(팀장)](https://github.com/jihyeon00)|<p align="center"><img src="https://avatars.githubusercontent.com/u/120089047?v=4" width="100"></p>|로그인, 회원가입, BOM관리|
|[이시연(팀원)](https://github.com/sieoh)|<p align="center"><img src="https://avatars.githubusercontent.com/u/151722461?v=4" width="100"></p>|생산관리, 입출고관리|

<br><br>

## 📕 주요기능
운동화를 생산하고 제조하는 업체에서 사용하는 SCM 시스템 프로그램을 제공한다.

<h3>JDBC</h3>
<details>
  <summary><b>1. 로그인 및 회원가입</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>

<details>
  <summary><b>2. 공지사항</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>

<details>
  <summary><b>3. 재고조회</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>

<details>
  <summary><b>4. 생산</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>
<details>
  <summary><b>5. BOM관리</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>
<details>
  <summary><b>6. 입출고</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>

<br><br>

<h3>SpringBoot</h3>
<details>
  <summary><b>1. 로그인 및 회원가입</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>
<details>
  <summary><b>2. 생산</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>
<details>
  <summary><b>3. BOM관리</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>
<details>
  <summary><b>4. 입출고</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>

<br><br>

<h3>JDBC와 SpringBoot의 차이점</h3>

<details>
  <summary><b>1. 로그인 및 회원가입</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>
<details>
  <summary><b>2. 생산</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>
<details>
  <summary><b>3. BOM관리</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>
<details>
  <summary><b>4. 입출고</b> </summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>

<br><br>

## 🔧 아키텍처
 <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/b72c51ab-8661-45f4-a747-c5dea4aceada" alt="JDBC 아키텍처">
 <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/9aab7a74-b39e-4e99-b08e-ba35816f3d1b" alt="SpringBoot 아키텍처">
<br><br>

## 🏗️ ERD
![URUN_ERD](https://github.com/jihyeon00/CNR_FURNITURE/assets/120089047/bb66929b-7efc-48ac-84dc-e00471c0a577)
<br><br>

## 📃 화면설계
[Figma 확인하기](https://www.figma.com/file/qdclA9y7siy4rawtx1Cq02/URUN-%EC%83%9D%EC%82%B0-%EB%8D%B0%EC%9D%B4%ED%84%B0-%EC%9B%B9-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8?type=design&node-id=0%3A1&mode=design&t=5uWlYIOIstjV8ADu-1)
![URUN_FIGMA_화면설계](https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/3a3fa17f-5419-4fb8-ae27-88882162b3f2)
<br><br>

## 🎞 구동영상
[[JDBC 구동영상]](https://drive.google.com/file/d/1YabD7sza3Jy5C5ptHmdqlSYdouQcwrK5/view?usp=sharing)
<br>
[[SpringBoot 구동영상]]()
<br><br>

## 🗨️ 자체평가의견
### [좋은점]
   - 피그마를 활용해 화면 설계의 완성도를 높일 수 있었다.
   - 깃을 이용하여 협업해 이해도를 높일 수 있었다.
   - 생산 관리를 이해할 수 있던 좋은 경험이었다.

### [아쉬운점]
   - 설계에 시간을 많이 쏟게 되면서 개발 기간이 짧았던 것이 아쉬웠다.

### [JDBC의 개선사항]
   - 로그인 및 회원가입
      ⓐ 접근 제한 추가<br>
      ⓑ 회원가입 내 윈도우창이 아닌 모달창을 활용해 구현<br>

   - 재고 조회
      ⓐ 검색 기능의 세분화<br>
      
   - 생산
      ⓐ 당일작업등록을 prompt가 아닌 모달창을 활용해 구현<br>
      ⓑ 당일작업등록한 내역 조회 및 수정 기능 추가<br>
      
   - BOM관리
      ⓐ BOM 등록 시 자재 목록에서의 자재 검색과 자재 추가를 prompt가 아닌 모달창을 활용해 구현<br>

   - 입출고
      ⓐ 페이징 처리<br>

      


<br><br>

