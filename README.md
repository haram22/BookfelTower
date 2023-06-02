# BookfelTower
당신의 독서량으로 탑을 쌓아보세요!
(이 프로젝트는 도서 트래킹 앱인 북적북적을 클론코딩하여 각색하는 프로젝트입니다.)

# Document

## 북펠탑/BookfelTower 프로젝트 개요

## 프로젝트 타임라인

2023년 5월 ~ 7월 (3개월)

프로젝트 타임라인은 다음과 같습니다:

- **1주:** 아이템 선정, 파트 나누기, **깃헙,** 그라운드 룰
- **2-3주:** 프론트 개발
- **4-6주:** 프론트 완성
- **7-8주:** 백엔드 및 위젯
- **9-10주:** 디자이너 협업 및 적용
- **11-12주:** 앱 출시

# 앱 MVP 기능

나열된 앱 기능들 중 선순위 기능들만 빼온것입니다. MVP에 들어가야할 기능들입니다.

### [공통]

- 서재/내가 읽고 있는 책 중 제일 최근 책(혹은 다른 규칙 적용 가능)을 2 x 4 가로로 긴 직사각형 위젯을 홈 화면에 고정 노출 한다.
    - 위젯 클릭시 해당 책의 상세페이지로 이동.
- 도서 detail page (상단바 ‘수정’ 워딩 바꾸기), 책 정보 수정과 단어가 겹쳐서 헷갈림
    - 읽고 있는 중일 경우
        - 독서 기간 (시작일만 표시)
        - 독서량 (line progress 바로 표시)
        - 메모
    - 읽고 싶은 책일 경우
        - 기대점수 (line progress 바로 표시)
        - 책 정보
        - 메모
    - 수정
        - 읽은 책으로 변경
            - 독서 기간 변경 가능
            - 평점 수정 가능
        - 읽고 있는 책으로 변경
            - 독서량 (쪽/%)
            - 독서기간 시작일 설정
        - 읽고 싶은 책
            - 기대지수 (1~10)
    - 삭제
- 책 추가/수정 언더 모달 팝업
    - 읽은 책, 읽고 있는 책, 읽고 싶은 책 분류
    - 페이지, 독서기간, 평점

### **[홈]**

- **책 검색하기**
    - **키워드 - 알라딘 API**
    - **직접 책 추가하기**
        - 이미지 등록
        - 제목, 지은이, 출판사 등등…. 직접 입력
    - 공통/저장팝업
- **연도 월 별로 읽은 책 표기**
- **쌓아보기**
    - 페이지 수를 책 두깨로 변환하여 탑 모양으로 쌓기
    
    ![Untitled](Document%204ba4e00231dc4a6e91bff1f99dae924f/Untitled.png)
    
    - 맨 위에 대표 캐릭터와 탑의 총 두께 표기
    - 책 눌렀을 경우 공통/상세페이지로 네비게이션(얇은 책 에 대한 최소 두께를 설정해야할듯)

### **[서재]**

- **전체 책**
- **읽은 책**
- **읽고 있는 책**
    - 책 제목, 이미지, 작가, 내가 준 별점, 시작종료날짜
- 서재 내에 있는 도서 검색
    - 최근 검색어
    - 최근 수정한 도서
        - 이미지, 제목
- 공통/상세페이지

### **[캐릭터]**

- 탑 높이와 연동된 캐릭터 매칭
- 탑 높이에 비례해서 캐릭터 언락

### [기록]

- **나의 메모**
    - 읽은 책 별로 리스트를 만들어 최신 메모를 미리보기로 띄운다
    - 최신 메모의 타임스탬프가 미리보기에 찍혀있다
- 차트 보기
    - 년도 별로 데이터를 구별한다
    - 그래프로 올 해 읽은 월별 책 권수와 ~~페이지 표시~~
        - 그래프의 y 축은 데이터의 최댓값을 기준으로 다이나믹하게 되어있다
        - 그래프의 x축은 홀수 월들만 표기한다
        - 그래프에 터치 인풋을 지원하며 해당 월에 데이터를 표시한다

### [설정]

**유저설정**

- 프로필 변경
    - 닉네임 변경
    - 회원탈퇴
- 로그아웃

**지원**

- FAQ → 노션페이지 웹뷰
- Bug Report → 이메일
- Comment → 구글 폼

**기타**

평점 남기기 → 앱스토어 링크

개발자 소개 → 개발자 연락처, 공식 이메일 등

노션페이지, 네이버 블로그, 인스타그램 링크 → 웹뷰

# 앱 전체 기능

앱의 모든 기능을 나열 하고 선순위와 후순위를 나눈것입니다.

### [공통]

- 도서 detail page (상단바 ‘수정’ 워딩 바꾸기), 책 정보 수정과 단어가 겹쳐서 헷갈림
    - 읽고 있는 중일 경우
        - 독서 기간 (시작일만 표시)
        - 독서량 (line progress 바로 표시)
        - 메모
    - 읽고 싶은 책일 경우
        - 기대점수 (line progress 바로 표시)
        - 책 정보
        - 메모
    - 수정
        - 읽은 책으로 변경
            - 독서 기간 변경 가능
            - 평점 수정 가능
        - 읽고 있는 책으로 변경
            - 독서량 (쪽/%)
            - 독서기간 시작일 설정
        - 읽고 싶은 책
            - 기대지수 (1~10)
    - 삭제
- 책 추가/수정 언더 모달 팝업
    - 읽은 책, 읽고 있는 책, 읽고 싶은 책 분류
    - 페이지, 독서기간, 평점

### **[홈]**

- **책 검색하기**
    - **키워드 - 알라딘 API**
    - **직접 책 추가하기**
        - 이미지 등록
        - 제목, 지은이, 출판사 등등…. 직접 입력
    - 공통/저장팝업
- **연도 월 별로 읽은 책 표기**
- **쌓아보기**
    - 페이지 수를 책 두깨로 변환하여 탑 모양으로 쌓기
    - 맨 위에 대표 캐릭터와 탑의 총 두께 표기
    - 책 눌렀을 경우 공통/상세페이지로 네비게이션(얇은 책 에 대한 최소 두께를 설정해야할듯)

---

**후순위 기능**

- 캡쳐기능 (공유 목적인것 같은데 차라리 공유 기능을 만들던가)
- 카메라 ISBN Scan - 알라딘 API
- 리스트형 보기
    - 그리드 뷰 - 책 표지, 제목, 지은이, 별점
    - 책 눌렀을 경우 상세 페이지로 네비게이션

### **[서재]**

- **전체 책**
- **읽은 책**
- **읽고 있는 책**
    - 책 제목, 이미지, 작가, 내가 준 별점, 시작종료날짜
- 서재 내에 있는 도서 검색
    - 최근 검색어
    - 최근 수정한 도서
        - 이미지, 제목
- 공통/상세페이지

---

**후순위 기능**

- 오늘 읽을 책 추천
    - 읽고 있거나, 읽고 싶은 책 중에서
- 읽고 싶은 책
    - 기대평

### **[캐릭터]**

- 탑 높이와 연동된 캐릭터 매칭
- 탑 높이에 비례해서 캐릭터 언락

---

**후순위 기능**

- 년도 별 구분
- 단계
- 스토어
- 나의 캐릭터

### [기록]

- **나의 메모**
    - 읽은 책 별로 리스트를 만들어 최신 메모를 미리보기로 띄운다
    - 최신 메모의 타임스탬프가 미리보기에 찍혀있다
- 차트 보기
    - 년도 별로 데이터를 구별한다
    - 그래프로 올 해 읽은 월별 책 권수와 ~~페이지 표시~~
        - 그래프의 y 축은 데이터의 최댓값을 기준으로 다이나믹하게 되어있다
        - 그래프의 x축은 홀수 월들만 표기한다
        - 그래프에 터치 인풋을 지원하며 해당 월에 데이터를 표시한다

---

**후순위 기능**

- 권수 + 페이지수 차트

---

### [설정]

**유저설정**

- 프로필 변경
    - 닉네임 변경
    - 회원탈퇴
- 로그아웃

**지원**

- FAQ → 노션페이지 웹뷰
- Bug Report → 이메일
- Comment → 구글 폼

**기타**

평점 남기기 → 앱스토어 링크

개발자 소개 → 개발자 연락처, 공식 이메일 등

노션페이지, 네이버 블로그, 인스타그램 링크 → 웹뷰

---

************후순위************ **기능**

- 컬러테마
- 독서기록 엑셀 내보내기
