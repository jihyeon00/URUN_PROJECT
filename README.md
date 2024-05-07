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

<h3>JDBC</h3>
<details>
  <summary><b>1. 로그인 및 회원가입 [배지현] </b> </summary>
  <br>
  <div markdown="1">
    <h3>회원가입</h3>
    <ul>
      <li>사원번호 입력 후 조회 버튼 클릭 시 idCheck.jsp가 새 창으로 열리고 </li>
      <li>사원번호는 8자, 비밀번호와 비밀번호 확인은 6자 이상 10자 이내로 입력할 수 있다.</li>
      <li>사원번호/비밀번호/비밀번호확인 미입력과 약관 동의 미체크 시 회원가입이 불가능하다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/bd2728bd-c550-4442-b36b-fe012eb6548f" alt="signUp.jsp">
      <li>조회 시 입력한 사원번호의 값이 넘어오며, 2가지 조건 통과 시 회원가입이 가능하다.</li>
      <ul>
        <li>Employee 회사 직원 테이블에 있어야 한다.</li>
        <li>Member 회원 테이블에 없어야 한다.</li>
      </ul>
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
  <summary><b>2. 공지사항 [배지현] </b> </summary>
  <br>
  <div markdown="1">
    <h3>공지사항목록</h3>
    <ul>
      <li>공지사항 목록을 조회할 수 있으며 해당 페이지는 페이징 처리가 되어 있다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/c43ede80-d3c6-4831-b9b1-2fb2c7166654" alt="공지사항 리스트">
    </ul>
    <h3>공지사항 내용</h3>
    <ul>
      <li>공지사항 항목을 클릭 시 세부내용을 조회하고 윗글, 아랫글을 통해 다른 글로 이동할 수 있다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/483fc0ea-2299-4377-8cc9-d91192cd6fa7" alt="공지사항 세부내용">
    </ul>
    <h3>공지사항 등록</h3>
    <ul>
      <li>공지사항 목록에서 등록 버튼 클릭 시 등록화면으로 넘어가며 하단 등록 버튼을 통해 등록할 수 있다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/43ce8595-74b5-45ea-913f-0e9b8b347da1" alt="공지사항 등록">
    </ul>
  </div>
</details>
<details>
  <summary><b>3. 재고조회 [배지현] </b> </summary>
  <div markdown="1">
    <h3>자재/제품 재고조회</h3>
    <br>
    <ul>
      <li>자재/제품의 재고를 조회할 수 있으며 해당 페이지는 페이징 처리가 되어 있다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/f0505eac-ead6-4c8f-9187-4f005faafd31" alt="재고조회">
    </ul>
  </div>
</details>

<details>
  <summary><b>4. 생산 [이시연] </b> </summary>
  <div markdown="1">
    <ul>
      <h3>생산계획등록</h3>
        <ul>
          <li>제품 생산을 위해 작업계획을 등록할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/1f544834-d190-43c6-85dc-9c2a66df11d7" alt="생산계획등록">
        </ul>
      <h3>생산작업관리</h3>
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
      <h3>생산불량조회</h3>
        <ul>
          <li>생산작업관리에서 당일작업등록 시 불량수량을 입력할 경우 생산 불량현황에서 확인이 가능하다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/c658228c-565f-47de-a451-f56e066b845d" alt="생산불량조회">
        </ul>
    </ul>
  </div>
</details>

<details>
  <summary><b>5. BOM관리 [배지현] </b>  </summary>
  <div markdown="1">
    <ul>
      <h3>전체 BOM 관리(allBomManagement.jsp)</h3>
        <ul>
          <li>검색창에 검색하고 싶은 데이터(BOMID, 제품ID, 제품명, 자재명, 컬러, 사이즈)를 입력하여 검색 할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/968c312e-6f80-49de-a99c-0b11cd32e5e8" alt="BOM관리 검색바">
          <li>BOMID(=제품ID)에 따른 자재명(자재수량)을 오라클의 listagg를 이용해 간략히 보여준다.</li>
          <ul>
            <li>또한, 자재명에 쓰여있는 내용을 클릭 할 경우 해당 BOMID의 상세BOM관리 페이지로 이동한다.</li>
          </ul>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/17b7dc99-1e28-42f5-924f-8fe6c3dbc874" alt="전체BOM관리">
        </ul>
       <h3>상세 BOM 관리(oneBomManagement.jsp)</h3>
        <ul>
          <li>get 방식으로 form을 전송하여 BOMID(=제품ID)에 따른 자재목록을 조회할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/edb39535-bd5c-4b18-8125-813057288795" alt="상세BOM관리 조회" width="700">
          <li>post 방식으로 form을 전송하여 deleteOneBomMaterial.jsp를 통해 선택한 자재를 삭제할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/42c48a02-d281-425c-8dd4-8b1b1c4d57ab" alt="상세BOM관리 자재삭제" width="500">
        </ul>
      <h3>BOM 등록(bomRegistration.jsp)</h3>
        <ul>
          <li>상세 BOM 관리의 삭제처럼 deleteOneBomMaterial.jsp를 통해 선택한 자재를 삭제할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/d2027689-3ded-4ffb-9fd4-28cb1907d8d7" alt="BOM등록 자재삭제" width="700">
          <li>추가 버튼 클릭시 prompt를 이용하여 자재를 추가할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/284e4d28-24c5-45ea-a86c-303c6f636926" alt="BOM등록 자재추가" width="700">
        </ul>
    </ul>
  </div>
</details>

<details>
  <summary><b>6. 입출고 [이시연] </b>  </summary>
  <div markdown="1">
    <ul>
      <h3>입/출고 등록</h3>
        <ul>
          <li>예정 정보를 등록하여 입/출고를 등록할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/83d1d6e2-6cf4-4181-bc11-11c3c7cd3331" alt="입/출고 등록" width="500">
        </ul>
       <h3>입/출고 현황 조회</h3>
        <ul>
          <li>위 상단바를 통해 각 진행상태별 현황을 조회할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/d4b87e25-51c1-4c2b-ad59-13ae5850669d" alt="입/출고 현황 조회">
          <li>수정 버튼을 클릭하여 입/출고 내역을 수정할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/af3ab318-5cce-425f-a49e-2c6914c13b3d" alt="입/출고 현황 조회2">
        </ul>
      <h3>입/출고 수정</h3>
        <ul>
          <li>납품완료일, 완료시간, 진행상태, 비고를 입력하여 수정할 수 있다.</li>
          <li>이때, 납품처ID, 제품ID, 납품수량, 납품예정일은 수정할 수 없다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/a23fc66f-5054-4bfa-b534-2173b23e8613" alt="입/출고 수정">
        </ul>
    </ul>
  </div>
</details>

<br>

<h3>SpringBoot</h3>
<details>
  <summary><b>1. 로그인 및 회원가입 [배지현] </b> </summary>
  <br>
  <div markdown="1">
    <h3>회원가입</h3>
    <ul>
      <li>사원번호를 입력하고 focusout 시 중복체크를 진행한다. </li>
      <li>사원번호는 8자, 비밀번호와 비밀번호 확인은 6자 이상 10자 이내로 입력할 수 있다.</li>
      <li>사원번호/비밀번호/비밀번호확인 미입력과 약관 동의 미체크 시 회원가입이 불가능하다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/1a9b5a6e-f93b-4e57-a2e3-8937e9bfa3ff" alt="springBoot_회원가입">
      <li>ajax를 이용해 회원가입을 진행할 수 있도록 한다.</li>
      <ul>
        <li>조회 시 입력한 사원번호의 값이 넘어오며, Member 회원 테이블에 없어야 한다.</li>
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/497e5846-215e-4551-9106-0f3666c26ffe" alt="idCheck">
      </ul>
    </ul>
    <br>
    <h3>로그인</h3>
    <ul>
      <li>입력한 로그인의 데이터가 Member 테이블에 존재 시 로그인을 성공한다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/49596e83-12e7-4f83-a2df-6bf69543c8e6" alt="signIn.jsp">
      <li>jsp:include page 를 이용해 main.jsp → sidebar.jsp → header.jsp 순으로 세션 값을 넘겨주어 메인화면의 상단에 로그인한 사람의 정보가 뜬다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/d2885a64-388d-40ef-8445-b40df0fc9489" alt="jsp:include page">
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/c64dcd10-785d-46a4-9572-6fc62565ec24" alt="header.jsp" width="400">
    </ul>
  </div>
</details>

<details>
  <summary><b>2. 생산 [이시연] </b>  </summary>
  <div markdown="1">
    <ul>
      <h3>생산계획등록</h3>
      <ul>
        <li>제품 생산을 위해 작업계획을 등록할 수 있다.</li>
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/151722461/107cb657-660c-4739-bf2c-bd9b009ee49e" alt="생산계획등록" width="700">
      </ul>
      <h3>생산작업관리</h3>
      <ul>
        <li>제품명, 제품코드, 생산시작날짜, 생산종료날짜를 선택해 검색할 수 있다.</li>
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/c66671cb-65fe-4758-9850-0df3430b2348" alt="생산작업관리 검색바">
        <li>검색해 나온 결과를 이용해 당일작업을 등록하거나 진행상태와 생산종료날짜를 수정할 수 있다.</li>
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/af3f7b04-8bf2-47a5-948d-6a77c9dce24e" alt="생산작업관리 실행">
        <li>진행상태 및 생산종료날짜 수정</li>
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/0a67b0b3-169f-49cb-8561-490d5ea8571e" alt="생산작업관리 진행상태 수정" width="500">
        <li>모달창을 이용한 당일작업등록</li>
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/151722461/a651c953-88ab-4e82-bbc0-c637c367bb0e" alt="생산작업관리 당일작업등록" width="700">
      </ul>
      <h3>생산불량조회</h3>
      <ul>
        <li>생산작업관리에서 당일작업등록 시 불량수량을 입력할 경우 생산 불량현황에서 확인이 가능하다.</li>
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/151722461/bb9c6505-3967-4bd8-83bd-21af6f057aa5" alt="생산불량조회" width="700">
      </ul>
    </ul>
  </div>
</details>
<details>
  <summary><b>3. BOM관리 [배지현] </b> </summary>
  <div markdown="1">
   <ul>
      <h3>전체 BOM 관리(allBomManagement.jsp)</h3>
        <ul>
          <li>검색창에 검색하고 싶은 데이터(BOMID, 제품ID, 제품명, 자재명, 컬러, 사이즈)를 입력하여 검색 할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/968c312e-6f80-49de-a99c-0b11cd32e5e8" alt="BOM관리 검색바">
          <li>BOMID(=제품ID)에 따른 자재명(자재수량)을 오라클의 listagg를 이용해 간략히 보여준다.</li>
          <ul>
            <li>또한, 자재명에 쓰여있는 내용을 클릭 할 경우 해당 BOMID의 상세BOM관리 페이지로 이동한다.</li>
          </ul>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/17b7dc99-1e28-42f5-924f-8fe6c3dbc874" alt="전체BOM관리">
        </ul>
       <h3>상세 BOM 관리(oneBomManagement.jsp)</h3>
        <ul>
          <li>BOMID(=제품ID)에 따른 자재목록을 조회할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/edb39535-bd5c-4b18-8125-813057288795" alt="상세BOM관리 조회" width="700">
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/f15bc6f0-fb43-4349-9b67-557e4bb8d9ba" alt="상세BOM관리 조회" width="500">
          <li>선택한 자재를 삭제할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/98d95e7a-87d2-4893-8c10-8aa96fe7752f" alt="상세BOM관리 자재삭제" width="500">
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/937980dc-84be-42cf-a287-f8bf0775b6ec" alt="상세BOM관리 자재삭제" width="500">
        </ul>
      <h3>BOM 등록(bomRegistration.jsp)</h3>
        <ul>
          <li>제품ID를 검색하지 않을 경우 BOM 내역이 뜨지 않도록 한다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/de4f3f6e-a06e-4e55-aa93-751b7551c4f9" alt="BOM등록 제품검색" width="700">
          <li>제품ID를 검색 시 BOM 내역이 뜨고 삭제 버튼 클릭 시 /materialDelete로 Post 전송을 통해 삭제한다.</li>
          <ul>
            <li>검색을 통해 받은 제품ID의 내역 중 삭제를 원하는 자재ID 의 값을 받아 삭제를 진행한다. </li>
          </ul>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/49c68c38-bc0d-4aee-b0d4-2eb9c6ea7c98" alt="BOM등록 자재삭제" width="700">
          <li>아래 자재 목록 중 추가 하려는 자재의 추가 버튼을 클릭 시 AJAX로 Get요청을 보내 해당 자재의 정보를 보여주고 입력할 수 있는 모달창이 열린다.</li>
          <ul>
            <li>추가수량을 필수로 입력하도록 하며</li>
            <li>추가 버튼 클릭 시 /materialInsert 로 전송하여 자재를 추가한다.</li>
          </ul>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/62bb9e30-8fc8-4699-ba0f-1e33833d2b6a" alt="BOM등록 자재추가" width="700">
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/798d99a8-e9ea-482c-b2dd-2e36d5c0bf41" alt="BOM등록 자재추가 ajax" width="700">
        </ul>
    </ul>
  </div>
</details>

<details>
  <summary><b>4. 입출고 [이시연] </b>  </summary>
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

<br>

<h3>JDBC와 SpringBoot의 차이점</h3>

<details>
  <summary><b>1. 로그인 및 회원가입 [배지현] </b>  </summary>
  <div markdown="1">
    <h3>회원가입</h3>
    <ul>
      <li>JDBC는 사원번호 입력 후 조회 버튼 클릭 시 idCheck.jsp가 새 창으로 열려 중복체크를 진행한다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/bd2728bd-c550-4442-b36b-fe012eb6548f" alt="JDBC_회원가입" width="600">
      <li>SpringBoot는 사원번호를 입력하고 focusout 시 중복체크를 진행한다. </li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/1a9b5a6e-f93b-4e57-a2e3-8937e9bfa3ff" alt="springBoot_회원가입" width="600">
    </ul>
    <h3>로그인</h3>
    <ul>
      <li>JDBC는 MemberDAO의 selectMemberInfo 에서 session에 저장할 member_id와 employeeName을 받아온다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/c97fa763-8114-4908-876d-2cda8b7827f5" alt="JDBC_로그인" width="300">
      <li>SpringBoot는 jsp:include page 를 이용해 main.jsp → sidebar.jsp → header.jsp 순으로 세션 값을 넘겨주어 메인화면의 상단에 로그인한 사람의 정보가 뜬다.</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/1a9b5a6e-f93b-4e57-a2e3-8937e9bfa3ff" alt="springBoot_로그인" width="300">
    </ul>
  </div>
</details>
<details>
  <summary><b>2. 생산 [이시연] </b>  </summary>
  <div markdown="1">
    <ul>
      <li>생산계획등록창을 모달창으로 변경</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/1f544834-d190-43c6-85dc-9c2a66df11d7" alt="생산계획등록" width="300">
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/151722461/087a7554-1f54-4cca-a8be-3f81db1d98f0" alt="화살표"  width="100">
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/151722461/3e0f1fde-8e53-4447-ab2b-0c1a4c6d7880" alt="생산계획등록-모달" width="500">
      <li>작일작업등록을 prompt창을 모달창으로 변경</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/118ff79a-0930-46ff-8780-9294dc528795" alt="생산작업관리 당일작업등록" width="400">
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/151722461/087a7554-1f54-4cca-a8be-3f81db1d98f0" alt="화살표"  width="100">
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/151722461/a651c953-88ab-4e82-bbc0-c637c367bb0e" alt="생산작업관리 당일작업등록" width="400">
    </ul>
  </div>
</details>
<details>
  <summary><b>3. BOM관리 [배지현] </b>  </summary>
  <div markdown="1">
    <h3>상세 BOM 관리(oneBomManagement.jsp)</h3>
      <ul>
        <li>JDBC는 form전송과 삭제 로직을 작성한 deleteOneBomMaterial.jsp를 통해 선택한 자재를 삭제할 수 있다.<</li>
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/42c48a02-d281-425c-8dd4-8b1b1c4d57ab" alt="상세BOM관리 자재삭제" width="500">
        <li>SpringBoot는 Controller를 통해 선택한 자재를 삭제할 수 있다. </li>
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/1a9b5a6e-f93b-4e57-a2e3-8937e9bfa3ff" alt="springBoot_회원가입" width="600">
      </ul>
    <br>
    <h3>BOM 등록(bomRegistration.jsp)</h3>
      <h4>BOMID 에 따른 자재목록</h4>
        <ul>
          <li>JDBC는 BOMID(=제품ID)에 따른 자재목록을 조회하며 한 제품ID의 자재목록을 검색하지 않아도 조회 할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/e2c6ad20-203d-4a73-8e5e-ff2d5c03ce51" alt="JDBC_BOM등록 조회" width="700">
          <li>SpringBoot는 제품ID를 검색하지 않을 경우 BOM 내역이 뜨지 않도록 한다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/de4f3f6e-a06e-4e55-aa93-751b7551c4f9" alt="SPRINGBOOT_BOM등록 조회" width="700">
          <li>상세 BOM 관리의 삭제처럼 deleteOneBomMaterial.jsp를 통해 선택한 자재를 삭제할 수 있다.</li>
          <li>추가 버튼 클릭시 prompt를 이용하여 자재를 추가할 수 있다.</li>
          <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/284e4d28-24c5-45ea-a86c-303c6f636926" alt="BOM등록 자재추가" width="700">
        </ul>
      <h4>자재추가</h4>
      <ul>
        <li>JDBC는 추가 버튼 클릭시 prompt를 이용하여 자재를 추가할 수 있다.</li>
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/284e4d28-24c5-45ea-a86c-303c6f636926" alt="BOM등록 자재추가" width="700">
        <li>SpringBoot는 아래 자재 목록 중 추가 하려는 자재의 추가 버튼을 클릭 시 해당 자재의 정보를 보여주고 입력할 수 있는 모달창이 열린다.</li>
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/62bb9e30-8fc8-4699-ba0f-1e33833d2b6a" alt="SPRINGBOOT_BOM등록 자재추가" width="700">
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/798d99a8-e9ea-482c-b2dd-2e36d5c0bf41" alt="SPRINGBOOT_BOM등록 자재추가 ajax" width="700">
      </ul>
  </div>
</details>
<details>
  <summary><b>4. 입출고 [이시연] </b>  </summary>
  <div markdown="1">
    <ul>
      <li>입/출고 등록창을 모달창으로 변경</li>
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/83d1d6e2-6cf4-4181-bc11-11c3c7cd3331" alt="입/출고 등록" width="300">
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/151722461/087a7554-1f54-4cca-a8be-3f81db1d98f0" alt="화살표"  width="100">
        <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/151722461/b1942753-7ed3-4bbb-8ec3-245aeed77ecd" alt="입/출고 등록-모달" width="400">
      <li>입/출고 수정창을 모달창으로 변경</li>
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/120089047/a23fc66f-5054-4bfa-b534-2173b23e8613" alt="입/출고 수정" width="300">
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/151722461/087a7554-1f54-4cca-a8be-3f81db1d98f0" alt="화살표"  width="100">
      <img src="https://github.com/jihyeon00/URUN_SCM_PROJECT/assets/151722461/e6bae0f3-0e35-4cc7-af17-aeadb5e590b3" alt="입/출고 수정-모달" width="400">
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

