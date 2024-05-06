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
8. [📑 개선사항](#-개선사항)
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
|   |JDBC|SpringBoot|
|---|---|---|
|JAVA|`JAVA 11`|`JAVA 17`|
|IDE|Eclipse|IntelliJ, STS4|
|Framework| |Springboot(3.1.10)|
|DataBase|Oracle DB(ojdbc8)|Oracle DB(ojdbc8)|
|ORM| |Mybatis|
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

<h3>JDBC(수정필요)</h3>
<details>
  <summary><b>1. 로그인 및 회원가입 [배지현] </b> (👈 Click)</summary>
  <br>
  <div markdown="1">
    <h3>회원가입</h3>
    <ul>
      <li>사원번호 입력 후 조회 버튼 클릭 시 idCheck.jsp가 새 창으로 열리고 사원번호는 8자, 비밀번호와 비밀번호 확인은 6자 이상 10자 이내로 입력할 수 있다.</li>
      <li>사원번호/비밀번호/비밀번호확인 미입력과 약관 동의 미체크 시 회원가입이 불가능하다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/bd2728bd-c550-4442-b36b-fe012eb6548f" alt="signUp.jsp">
      <li>조회 시 입력한 사원번호의 값이 넘어오며, 2가지 조건 통과 시 회원가입이 가능하다.</li>
      ⓐ Employee 회사 직원 테이블에 있어야 한다.<br>
      ⓑ Member 회원 테이블에 없어야 한다.<br>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/1ec30bc9-418d-4df1-b0db-5f354d8cc91a" alt="idCheck.jsp">
      <li>signIn.jsp 의 prevCheckTextBox()의 유효성 검사를 통과 후 Form을 전송한다.
</li>
    </ul>
    <br>
    <h3>로그인</h3>
    <ul>
      <li>입력한 로그인의 데이터가 Member 테이블에 존재 시 로그인을 성공한다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/49596e83-12e7-4f83-a2df-6bf69543c8e6" alt="signIn.jsp">
      <li>MemberDAO의 selectMemberInfo 에서 session에 저장할 member_id와 employeeName을 받아온다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/c97fa763-8114-4908-876d-2cda8b7827f5" alt="signInOk.jsp">
      <li>로그인 성공 시 메인화면의 상단에 로그인한 사람의 정보가 뜬다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/e6fc04de-824f-48a3-a6ed-dd47792e32bd" alt="header.jsp">
    </ul>
  </div>
</details>

<details>
  <summary><b>2. 공지사항</b> </summary>
  <br>
  <div markdown="1">
    <h3>공지사항목록</h3>
    <ul>
      <li>공지사항 목록을 조회할 수 있으며 해당 페이지는 페이징 처리가 되어 있다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/c43ede80-d3c6-4831-b9b1-2fb2c7166654" alt="공지사항 리스트">
      <li>공지사항 항목을 클릭 시 세부내용을 조회하고 윗글, 아랫글을 통해 다른 글로 이동할 수 있다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/483fc0ea-2299-4377-8cc9-d91192cd6fa7" alt="공지사항 세부내용">
      <li>공지사항 목록에서 등록 버튼 클릭 시 등록화면으로 넘어가며 하단 등록 버튼을 통해 등록할 수 있다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/43ce8595-74b5-45ea-913f-0e9b8b347da1" alt="공지사항 등록">
    </ul>
  </div>
</details>

<details>
  <summary><b>3. 재고조회</b> </summary>
  <div markdown="1">
    <ul>
      <li>자재/제품 재고 조회는 자재/제품의 재고를 조회할 수 있으며 해당 페이지는 페이징 처리가 되어 있다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/f0505eac-ead6-4c8f-9187-4f005faafd31" alt="재고조회">
    </ul>
  </div>
</details>

<details>
  <summary><b>4. 생산</b> </summary>
  <div markdown="1">
    <ul>
       <li>생산계획등록</li>
        <ul>
          <li>제품 생산을 위해 작업계획을 등록할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/1f544834-d190-43c6-85dc-9c2a66df11d7" alt="생산계획등록">
        </ul>
      <li>생산작업관리</li>
        <ul>
          <li>제품명, 제품코드, 생산시작날짜, 생산종료날짜를 선택해 검색할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/c66671cb-65fe-4758-9850-0df3430b2348" alt="생산작업관리 검색바">
          <li>검색해 나온 결과를 이용해 당일작업을 등록하거나 진행상태와 생산종료날짜를 수정할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/af3f7b04-8bf2-47a5-948d-6a77c9dce24e" alt="생산작업관리 실행">
            <ul>
              <li>진행상태 및 생산종료날짜 수정</li>
              <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/0a67b0b3-169f-49cb-8561-490d5ea8571e" alt="생산작업관리 진행상태 수정" width="500">
              <li>prompt 창을 이용한 당일작업등록</li>
              <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/118ff79a-0930-46ff-8780-9294dc528795" alt="생산작업관리 당일작업등록" width="500">
            </ul>
        </ul>
      <li>생산불량조회</li>
        <ul>
          <li>생산작업관리에서 당일작업등록 시 불량수량을 입력할 경우 생산 불량현황에서 확인이 가능하다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/c658228c-565f-47de-a451-f56e066b845d" alt="생산불량조회">
        </ul>
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

<h3>SpringBoot(수정필요)</h3>
<details>
  <summary><b>1. 로그인 및 회원가입</b> </summary>
  <div markdown="1">
    <ul>
      <li><h3>로그인</h3></li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/ba7943ac-d81d-4a13-8ca3-9bd09789faa2" alt="로그인"  width="700">
      <li><h3>회원가입</h3></li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/73dee87d-1bfa-4837-aa02-4171348dc80a" alt="회원가입"  width="700">
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
      <li><h3>전체BOM관리와 세부 BOM관리</h3></li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/05d06c1a-8260-43ba-8e51-e2dc20b494a8" alt="전체BOM관리와 세부 BOM관리"  width="700">
      <li><h3>BOM등록</h3></li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/59230383-3ea3-4638-9442-5bde6986a272" alt="BOM등록"  width="700">
    </ul>
  </div>
</details>
<details>
  <summary><b>4. 입출고</b> </summary>
  <div markdown="1">
    <ul>
      <li><h3>입출고 등록</h3></li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/d03ea3be-84a7-453c-a965-df54db62a1a1" alt="입고등록"  width="700">
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/ab0cdfa6-af1b-450c-94b0-504f10e3a3e1" alt="출고등록"  width="700">
      <li><h3>입출고 수정</h3></li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/2b6f85d9-56df-42fd-91ac-6b8b294a18e2" alt="출고수정(1)"  width="700">
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/c9c53963-d464-4496-b3b4-5ef73248fd28" alt="출고수정(2)"  width="700">
      <li><h3>입출고 조회</h3></li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/7ad3ba37-f4c8-4573-aa75-617d033adc0b" alt="입고현황"  width="700">
    </ul>
  </div>
</details>

<br><br>

<h3>JDBC와 SpringBoot의 차이점(수정필요)</h3>

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
[[🖥 JDBC 구동영상]](https://drive.google.com/file/d/1YabD7sza3Jy5C5ptHmdqlSYdouQcwrK5/view?usp=sharing)
<br>
[[💻 SpringBoot 구동영상]]()
<br><br>

## 📑 개선사항
### [JDBC]
   - 로그인 및 회원가입<br>
      ⓐ 접근 제한 추가<br>
      ⓑ 회원가입 내 윈도우창이 아닌 모달창을 활용해 구현<br>

   - 재고 조회<br>
      ⓐ 검색 기능의 세분화<br>
      
   - 생산<br>
      ⓐ 당일작업등록을 prompt가 아닌 모달창을 활용해 구현<br>
      ⓑ 당일작업등록한 내역 조회 및 수정 기능 추가<br>
      
   - BOM관리<br>
      ⓐ BOM 등록 시 자재 목록에서의 자재 검색과 자재 추가를 prompt가 아닌 모달창을 활용해 구현<br>

   - 입출고<br>
      ⓐ 페이징 처리<br>

      


<br><br>

