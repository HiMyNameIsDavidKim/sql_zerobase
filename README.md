# SQL (제로베이스 강의)

## `[데이터 베이스]`

### [Database 정의]
* 여러 사람이 공유하여 사용할 목적으로 체계화해 통합, 관리하는 데이터의 집합체.
* DBMS: DB를 관리해주는 서비스
* RDB: 관계형 DB, 저장된 데이터 사이에 관계가 있다.
* SQL: DB에서 데이터를 정의, 조작, 제어하기 위해 사용하는 언어.
<br><br>

### [SQL 구성]
* DDL: 데이터 정의(Definition) 언어 (CREATE, ALTER, DROP)
* DML: 데이터 조작(Manipulation) 언어 (INSERT, UPDATE, DELETE, SELECT)
* DCL: 데이터 제어(Control) 언어 (GRANT, REVOKE, COMMIT, ROLLBACK)
* 데이터 사이언스의 경우 DML을 많이 사용하고 특히 SELECT가 중요.
* 터미널에서 시작
    * mysql -u root -p
<br><br>

### [Database 관리]
* DB 목록 확인
    * show databases;
* DB 생성
    * create database testdb;
    * show databases;
* DB 사용
    * use testdb;
* DB 삭제
    * drop database testdb;
    * show databases;
<br><br>

### [User 관리]
* user 조회
    * use mysql;
    * select host, user from user;
* user 생성
    * 로컬
        * create user 'username'@'localhost' identified by 'password';
        * 여기서 username 이랑 password 알아서 수정
        * select host, user from user;
    * 외부
        * create user 'username'@'%' identified by 'password';
        * 여기서 username 이랑 password 알아서 수정
        * select host, user from user;
* user 삭제
    * drop user 'username'@'localhost';
<br><br>

### [User 권한 관리]
* 사전 작업
    * create database testdb;
    * use mysql;
    * create user 'noma'@'localhost' identified by '1234';
* 모든 권한 목록 확인
    * show grants for 'noma'@'localhost';
* 특정 DB의 모든 권한 부여
    * grant all on testdb.* to 'noma'@'localhost';
* 안보일 때 새로고침
    * flush privileges;
* 특정 DB의 모든 권한 삭제
    * revoke all on testdb.* from 'noma'@'localhost';
<br><br>



## `[Table]`
* DB 안에서 데이터가 저장되는 형태. row와 column로 구성된 데이터 모음.
<br><br>

### [테이블 생성]
* 사전 설정
    * create database zerobase default character set utf8mb4;
* 테이블 생성
    * create table mytable(id int, name varchar(16));
    * show tables;
* 테이블 정보 확인
    * desc mytable;
    * (컬럼 별로 디스크립션 출력)
<br><br>

### [테이블 변경, 삭제]
* 테이블 이름 변경
    * alter table mytable rename person;
    * show tables;
* 컬럼 추가
    * alter table person add column agee double;
    * desc person;
* 컬럼 데이터 타입 수정
    * alter table person modify column agee int;
    * desc person;
* 컬럼 이름 수정
    * alter table person change column agee age int;
    * desc person;
* 컬럼 삭제
    * alter table person drop column age;
    * desc person;
* 테이블 삭제
    * drop table person;
    * show tables;
<br><br>



## `[MySQL 기초 문법]`
<br><br>

### [INSERT 문법]
* 데이터 추가 명령어
* 입력한 컬럼 이름 순서와 값의 순서가 일치해야함.
* insert into 외우기
* 사전 설정
    * use zerobase;
    * create table person(id int, name varchar(16), age int, sex char);
    * desc person;
* 데이터 추가
    * insert into person (id, name, age, sex)
    * values (1, '이효리', 43, 'F');
    * select * from person;
* 모든 컬럼을 다 넣는다면 컬럼명 생략 가능
    * insert into person values
    * (2, '이상순', 48, 'M');
    * select * from person;
<br><br>

### [SELECT 문법]
* 데이터 조회 명령어
* select * from table 외우기
* 데이터 조회
    * select name, age, sex from person;
    * select * from person;
<br><br>

### [WHERE 문법]
* 특정 조건에 만족하는 것 조회
* where 사용 조회
    * select * from person where sex='F';
<br><br>

### [UPDATE 문법]
* 데이터 수정 명령어
* update table set 수정사항 외우기
* 데이터 수정
    * update person set age=23 where name='이효리';
    * select * from person where name='이효리';
<br><br>

### [DELETE 문법]
* 데이터 삭제 명령어
* delete from 외우기
* 데이터 삭제
    * delete from person where name='이상순';
    * select * from person;
<br><br>

### [실습 준비]
* 테이블 생성
    * create table celeb
    * (
        ID int not null auto_increment primary key, 
        NAME varchar(32) not null default '',
        BIRTHDAY date,
        AGE int,
        SEX char(1),
        JOB_TITLE varchar(32),
        AGENCY varchar(32)
        );
* desc celeb;
* 데이터 입력
    * INSERT INTO celeb VALUES (1, '아이유', '1993-05-16', 29, 'F', '가수, 텔런트', 'EDAM엔터테이먼트');
    INSERT INTO celeb VALUES (2, '이미주', '1994-09-23', 28, 'F', '가수', '울림엔터테이먼트');
    INSERT INTO celeb VALUES (3, '송강', '1994-04-23', 28, 'M', '텔런트', '나무엑터스');
    INSERT INTO celeb VALUES (4, '강동원', '1981-01-18', 41, 'M', '영화배우, 텔런트', 'YG엔터테이먼트') ;
    INSERT INTO celeb VALUES (5, '유재석', '1972-08-14', 50, 'M', 'MC, 개그맨', '안테나');
    INSERT INTO celeb VALUES (6, '차승원', '1970-06-07', 48, 'M', '영화배우, 모델', 'YG엔터테이먼트');
    INSERT INTO celeb VALUES (7, '이수현', '1999-05-04', 23, 'F', '가수', 'YG엔터테이먼트');
* select * from celeb;
<br><br>

### [ORDER BY 문법]
* select 문에서 특정 컬럼을 기준으로 정렬
* ASC(ascending)은 오름차순 정렬
* DESC(descending)은 내림차순 정렬
* 기본 값은 ASC 오름차순
* 정렬해서 가져오기
    * select age, name from celeb order by age asc;
    * select age, name from celeb order by age desc;
    * select age, name from celeb order by age, name;
    * select age, name from celeb order by age desc, name asc;
<br><br>

### [Comparision operators]
* 비교 연산자
* 같다(=), 같지 않다(<>, !=)
* 초과 미만(>), 이상 이하(>=)
* 비교 연산자 사용
    * select name, age from celeb where age=29 order by age;
    * select name, age from celeb where age!=29 order by age;
    * select name, age from celeb where age<>29 order by age;
    * select name, age from celeb where age>29 order by age;
    * select name, age from celeb where age<29 order by age;
    * select name, age from celeb where age>=29 order by age;
    * select name, age from celeb where age<=29 order by age;
<br><br>

### [Logical operators]
* 논리 연산자
* 결과를 bool로 리턴
* AND, OR
* NOT: 조건 만족하지 않을때 TRUE
* BETWEEN: 조건값이 범위 사이에 있을때 TRUE
* IN: 조건값이 목록에 있으면 TRUE
* LIKE: 조건값이 패턴에 맞으면 TRUE
* AND가 OR보다 먼저 적용
* 괄호 사용하면 우선순위 수정 가능
* AND, OR 사용
    * select * from celeb where age=29 and sex='F';
    * select * from celeb where sex='M' and age>40 order by name desc;
    * select * from celeb where age<25 or age>30 order by age;
    * select * from celeb where (age<29 and sex='F') or (age>30 and sex='M') order by age, sex;
    * select * from celeb where (agency='YG엔터테이먼트' or agency='나무엑터스') and age<30;
* NOT 사용
    * select * from celeb where not sex='F';
    * select * from celeb where (agency='YG엔터테이먼트' and not sex='M') or (job_title='가수' and not agency='YG엔터테이먼트');
    * select * from celeb where (birthday>19901231 and not sex='F') or (birthday<19800101 and not agency='안테나');
* BETWEEN 사용
    * select * from celeb where age between 20 and 40;
    * 범위는 이상, 이하로 해당 숫자 포함이며, and로 대체 가능
    * select * from celeb where age>=20 and age<=40;
    * not 같이 사용하려면 between 앞에 적은 컬럼보다 앞에 not
    * select * from celeb where (not birthday between 19800101 and 19951231 and sex='F') or (agency='YG엔터테이먼트' and not age between 20 and 45);
* IN 사용
    * select * from celeb where age in (28, 48);
    * or로 대체 가능
    * select * from celeb where age=28 or age=48;
    * select * from celeb where not agency in ('나무액터스', '안테나', '울림엔터테이먼트') and (sex='F' or age>=45);
* LIKE 사용
    * select * from celeb where agency like 'YG엔터테이먼트';
    * =로 대체 가능
    * select * from celeb where agency='YG엔터테이먼트';
    * 퍼센트 (%)
    * 원하는 부분이 일치하는 데이터
    * select * from celeb where agency like 'YG%';
    * select * from celeb where agency like '%엔터테이먼트';
    * select * from celeb where job_title like '%가수%';
    * 언더바 (_)
    * 두번째 글자가 G 인 데이터
    * select * from celeb where agency like '_G%';
    * 가 로 시작하고 최소 2글자 이상인 데이터
    * select * from celeb where job_title like '가_%';
    * 영 으로 시작하고 모델로 끝나는 데이터
    * select * from celeb where job_title like '영%모델';
    * 영화배우, 텔런트 병행 데이터
    * select * from celeb where job_title like '%영화배우%' and job_title like '%텔런트%';
    * 직업이 하나 이상, 영화배우 혹은 텔런트가 아닌 데이터
    * select * from celeb where job_title like '%,%' and not (job_title like '%영화배우%' or job_title like '%텔런트%');
<br><br>

### [UNION 문법]
* 여러개 SQL문을 합쳐서 하나의 SQL문으로 만들기
* 컬럼의 개수가 반드시 같아야 한다.
* 컬럼의 종류가 달라도 괜찮은데 개수는 같아야 한다.
* UNION: 중복된 값을 제거하여 리턴
* UNION ALL: 중복된 값도 모두 리턴
* 실습환경 구축
    * create table test1 (no int);
    * create table test2 (no int);
    * insert into test1 values (1);
    * insert into test1 values (2);
    * insert into test1 values (3);
    * insert into test2 values (5);
    * insert into test2 values (6);
    * insert into test2 values (3);
* UNION 사용
    * select * from test1 union all select * from test2;
    * select * from test1 union select * from test2;
    * select * from celeb where sex='F' union all select * from celeb where agency ='YG엔터테이먼트';
    * select * from celeb where sex='F' union select * from celeb where agency ='YG엔터테이먼트';
<br><br>

### [JOIN 문법]
* 두개 이상의 테이블을 결합하는 것
* table1 join table2 on 조건 외우기
* INNER JOIN: 교집합
* LEFT JOIN: 왼쪽 + 교집합
* RIGHT JOIN: 교집합 + 오른쪽
* FULL OUTER JOIN: 합집합
* SELF JOIN: 결과는 이너 조인이랑 동일
* LEFT와 RIGHT 특징
    * 교집합이 아닌 데이터는 NULL로 채워서 나옴
    * 레프트는 왼쪽이 먼저 표시, 교집합이 이어서 표시
    * 라이트는 교집합이 먼저 표시, 오른쪽이 이어서 표시
* FULL OUTER JOIN 특징
    * mysql에서는 사용 불가
    * 순서는 왼쪽 먼저 표시, 교집합 이어서 표시, 오른쪽 이어서 표시
* 실습환경 구축
    * create table snl_show (ID int not null auto_increment primary key, SEASON int not null, EPISODE int not null, BROADCAST_DATE date, HOST varchar(32) not null);
    * desc snl_show;
    * INSERT INTO snl_show VALUES (1, 8, 7, '2020-09-05', '강동원');
    INSERT INTO snl_show VALUES (2, 8, 8, '2020-09-12', '유재석');
    INSERT INTO snl_show VALUES (3, 8, 9, '2020-09-19', '차승원') ;
    INSERT INTO snl_show VALUES (4, 8, 10, '2020-09-26', '이수현');
    INSERT INTO snl_show VALUES (5, 9, 1, '2021-09-04', '이병헌') ;
    INSERT INTO snL_show VALUES (6, 9, 2, '2021-09-11', '하지원') ;
    INSERT INTO snl_show VALUES (7, 9, 3, '2021-09-18', '제시');
    INSERT INTO snl_show VALUES (8, 9, 4, '2021-09-25', '조정석');
    INSERT INTO snl_show VALUES (9, 9, 5, '2021-10-02', '조여정') ;
    INSERT INTO snl_show VALUES (10, 9, 6, '2021-10-09', '옥주현');
    * select * from snl_show;
* JOIN 사용
    * select celeb.id, celeb.name, snl_show.id, snl_show.host from celeb inner join snl_show on celeb.name=snl_show.host;
    * select celeb.id, celeb.name, snl_show.id, snl_show.host from celeb left join snl_show on celeb.name=snl_show.host;
    * select celeb.id, celeb.name, snl_show.id, snl_show.host from celeb right join snl_show on celeb.name=snl_show.host;
    * select celeb.id, celeb.name, snl_show.id, snl_show.host from celeb left join snl_show on celeb.name=snl_show.host union select celeb.id, celeb.name, snl_show.id, snl_show.host from celeb right join snl_show on celeb.name=snl_show.host;
* SELF JOIN 사용
    * 쿼리에서는 생략 가능. 알아서 돌아간다.
    * from 뒤에 테이블을 2개 다 적어야 한다.
    * select celeb.id, celeb.name, snl_show.id, snl_show.host from celeb, snl_show where celeb.name=snl_show.host;
    * select celeb.name, celeb.job_title from celeb, snl_show where celeb.name=snl_show.host and celeb.agency='안테나';
    * select celeb.name, celeb.age, celeb.job_title, snl_show.season, snl_show.episode from celeb, snl_show where celeb.name=snl_show.host and ((not celeb.job_title like '%영화배우%' and celeb.agency='YG엔터테이먼트') or (celeb.age>=40 and agency!='YG엔터테이먼트'));
    * select snl_show.id, snl_show.season, snl_show.episode, celeb.name, celeb.job_title from snl_show, celeb where snl_show.host=celeb.name;
    * select snl_show.host from snl_show, celeb where snl_show.host=celeb.name and (snl_show.episode in (7, 9, 10) or celeb.agency like 'YG______') and broadcast_date>='20200915';
<br><br>

### [CONCAT 문법]
* 여러 문자열을 하나로 합치거나 연결
* CONCAT 사용
    * select concat('concat', ' ', 'test')
    * select concat('이름:', name) from celeb;
<br><br>

### [ALIAS 문법]
* 컬럼이나 테이블 이름에 별칭 생성
* as라고 사용하면 되는데 생략도 가능
* ALIAS 사용
    * select name as '이름' from celeb;
    * select name as '이름', agency as '소속사' from celeb;
    * select concat(name, ': ', job_title) as profile from celeb;
    * select s.season, s.episode, c.name, c.job_title from celeb as c, snl_show as s where c.name=s.host;
    * select concat(s.season, '-', s.episode, '(', s.broadcast_date, ')') as '방송정보', concat (c.name, '(', c.job_title, ')') as '출연자정보' from celeb as c, snl_show as s where c.name=s.host;
    * select concat(s.season, '-', s.episode, '(', s.broadcast_date, ')') as '방송정보', concat (c.name, '(', c.job_title, ')') as '출연자정보' from celeb c, snl_show s where c.name=s.host;
<br><br>

### [DISTINCT 문법]
* 검색한 결과의 중복 제거
* select 바로 뒤에 넣기
* DISTINCT 사용
    * select distinct agency from celeb;
    * select sex, job_title from celeb where job_title like '%가수%';
    * select distinct sex, job_title from celeb where job_title like '%가수%';
<br><br>

### [LIMIT 문법]
* 검색결과를 정렬된 순으로 주어진 숫자만큼의 행만 조회
* 가장 마지막에 적어서 사용
* LIMIT 사용
    * select * from celeb limit 3;
    * select * from celeb order by age limit 4;
<br><br>



## `[AWS RDS]`

### [AWS RDS 정의]
* Amazon Web Service, Relational Database Service
* 클라우드 상에 데이터베이스를 구축
<br><br>

### [AWS RDS 생성]
* 회원가입
    * AWS 들어가서 회원가입
    * 개인으로 선택
    * 리전은 대한민국 선택
    * 서포트 플랜 선택 (무료 버전)
* MySQL RDS 생성
    * AWS 관리 콘솔 -> 왼쪽 상단 서비스 선택
    * 데이터베이스 - RDS 클릭
    * 데이터베이스 생성 누르기
    * 표준 생성 선택
    * MySQL 선택
    * 템플릿은 프리티어로 선택
    * DB 인스턴스 식별자는 그대로 사용
    * 마스터 사용자 이름 입력 (예시, root)
    * 마스터 암호 입력 (예시, root)
    * 프리티어로 사용 가능한 클래스 선택
    * 버스터블 클래스(t 클래스 포함) 선택
    * 스토리지 SSD로 선택
    * 스토리지 자동 조정은 반드시 비활성화
    * 나머지는 기본으로 선택
    * 연결 설정은 모두 기본값, 퍼블릭 액세스는 예 선택
    * 퍼블릭 액세스 가능은 외부에서 연결 가능하도록 하는 것
    * 보안 그룹, 포트 모두 기본
    * 데이터베이스 인증은 암호 인증 (test 위한 것. 주의.)
    * 추가구성 모두 기본값, 백업은 자동 백업 비활성화 선택
    * 모니터링 비활성화
    * 유지관리 모두 기본값, 삭제 방지는 활성화
    * 데이터베이스 생성
    * 상태가 사용 가능이 되면 생성 완료
* AWS RDS 외부 접속
    * AWS 관리 콘솔 -> 왼쪽 상단 서비스 선택
    * 데이터베이스 - RDS 클릭
    * Amazon RDS의 데이터베이스 클릭
    * 생성된 데이터베이스 클릭
    * 연결 및 보안
        * VPC 보안 그룹 클릭
        * 보안 그룹 ID 클릭
        * 인바운드 규칙 편집
        * 규칙 추가
        * MySQL/Aurora 선택, AnywhereIPv4 선택
        * 규칙 저장 클릭
        * 외부 접근 권한 발급 완료
<br><br>

### [AWS RDS 사용]
* AWS RDS 접속
    * AWS 관리 콘솔 -> 왼쪽 상단 서비스 선택
    * 데이터베이스 - RDS 클릭
    * Amazon RDS의 데이터베이스 클릭
    * 생성된 데이터베이스 클릭
    * 연결 및 보안
    * 엔드포인트, 포트 복사 해놓기
    * (터미널)
    * mysql -h <엔드포인트> -P <포트> -u <마스터 사용자 이름> -p
    * 마스터 암호 입력
    * show databases;
    * use mysql
    * select host, user from user;
* AWS RDS 중지
    * AWS 관리 콘솔 -> 왼쪽 상단 서비스 선택
    * 데이터베이스 - RDS 클릭
    * Amazon RDS의 데이터베이스 클릭
    * 중지하려는 데이터베이스 목록 체크
    * 작업 버튼 -> 중지 클릭
    * 스냅샷 아니오, 중지합니다 클릭
    * 시간이 많이 걸림
    * 7일 중지되고 자동으로 다시 시작되니 주의
* AWS RDS 시작
    * AWS 관리 콘솔 -> 왼쪽 상단 서비스 선택
    * 데이터베이스 - RDS 클릭
    * Amazon RDS의 데이터베이스 클릭
    * 시작하려는 데이터베이스 클릭
    * 오른쪽 상단에 작업 -> 시작 클릭
    * 시간이 많이 걸림
<br><br>



## `[SQL File]`

### [SQL File 정의]
* sql 확장자
* SQL 쿼리를 모아놓은 파일
* 쿼리를 한번에 실행시킬 수 있음
* 실습 환경
    * 깃허브-로컬 레포지토리 하나 파기
    * vscode로 해당 폴더 실행
    * test01.sql 파일 하나 생성
<br><br>

### [SQL File 실행]
* mysql 안에서 실행
    * source </path/filename.sql>
    * source 대신 `\.` 사용 가능
    * 경로가 같다면 <filename.sql>만 쓰기 가능
    * 실행 해보기
        * mysql -u root -p zerobase (데이터베이스로 바로 접속)
        * source test01.sql
        * desc police_station;
* mysql 밖에서 실행
    * 괄호 여는 꺾새(<) 사용
    * mysql -u root -p zerobase < test02.sql
    * desc crime_status;
<br><br>

### [데이터베이스 백업]
* mysqldump 명령어
* 괄호 닫는 꺾새(>) 사용
* 백업 완료되면 파일이 하나 생성 된다.
* 백업한 파일을 실행하면 그 시점으로 복구 가능
* 백업 해보기
    * mysqldump -u root -p zerobase > zerobase.sql
    * 이걸 source로 사용 가능
* AWS RDS 서비스에서 백업
    * AWS 관리 콘솔 -> 왼쪽 상단 서비스 선택
    * 데이터베이스 - RDS 클릭
    * Amazon RDS의 데이터베이스 클릭
    * 데이터베이스 중지라면 시작으로 만들기
    * 연결 및 보안에서 엔드포인트, 포트 확인
    * mysql -h <엔드포인트> -P <포트> -u <마스터 사용자 이름> -p
    * 마스터 암호 입력
    * show databases;
    * use zerobase;
    * source zerobase.sql
    * show tables;
<br><br>

### [테이블 백업]
* mysqldump 명령어
* 백업 해보기
    * mysqldump -u root -p zerobase celeb > celeb.sql
    * 이걸 source로 사용 가능
<br><br>

### [테이블 스키마 백업]
* 데이터 없이 테이블 생성 쿼리만 백업 가능
* mysqldump 뒤에 -d 넣어서 사용
* 백업 해보기
    * mysqldump -d -u root -p zerobase snl_show > snl.sql
<br><br>



## `[파이썬 with MySQL]`

### [mysql 접속]
* !pip install mysql-connector-python
* import mysql.connector 확인
* 접속 많으면 안되니 그때 그때 종료하기
* 파이썬에서 mysql 접속
    * mydb = mysql.connector.connect(
        host = 'localhost',
        user = 'root',
        password = 'root'
    )
    * mydb.close()
* 데이터베이스 지정해서 접속
    * mydb = mysql.connector.connect(
            host = 'localhost',
            user = 'root',
            password = 'root',
            database = 'zerobase',
        )
    * mydb.close()
<br><br>

### [쿼리 실행]
* 테이블 생성
    * excute 안에 똑같이 쿼리 치기
    * mydb = mysql.connector.connect(
            host = 'localhost',
            user = 'root',
            password = 'root',
            database = 'zerobase',
        )
    * cur = mydb.cursor()
    * cur.execute('create table sql_file (id int, filename varchar(16))')
    * mydb.close()
    * 터미널 mysql 접속
    * desc sql_file;
* 테이블 삭제
    * excute 안에 똑같이 쿼리 치기
    * mydb = mysql.connector.connect(
            host = 'localhost',
            user = 'root',
            password = 'root',
            database = 'zerobase',
        )
    * cur = mydb.cursor()
    * cur.execute('drop table sql_file')
    * mydb.close()
    * 터미널 mysql 접속
    * desc sql_file;
* sql 파일 실행
    * 실행은 open().read() 함수 사용
    * mydb = mysql.connector.connect(
            host = 'localhost',
            user = 'root',
            password = 'root',
            database = 'zerobase',
        )
    * cur = mydb.cursor()
    * sql = open('test03.sql').read()
    * cur.execute(sql)
    * mydb.close()
    * 터미널 mysql 접속
    * desc sql_file;
* sql 파일에 쿼리가 많은 경우 실행법
    * multi=True로 변경
    * for문 돌리면서 패치 만들고 커밋
    * mydb = mysql.connector.connect(
            host = 'localhost',
            user = 'root',
            password = 'root',
            database = 'zerobase',
        )
    * cur = mydb.cursor()
    * sql = open('test04.sql').read()
    * for i in cur.execute(sql, multi=True):
        if i.with_rows:
            print(i.fetchall())
        else:
            print(i.statement)
    * mydb.commit()
    * mydb.close()
    * 터미널 mysql 접속
    * desc sql_file;
<br><br>

### [Fetch All]
* 데이터를 가져온 경우에는 변수에 데이터를 담을 수 있음.
* 결과값을 변수에 모두 담을 때 사용
* fetch all 사용
    * cur = mydb.cursor(buffered=True)
    * cur.execute('select * from sql_file')
    * result = cur.fetchall()
    * 프린트 해보기
* 판다스로 읽기
    * df = pd.DataFrame(result)
    * df.head()
<br><br>

### [csv 파일 사용]
* csv 파일 데이터를 파이썬을 활용해 insert
* police_station.csv 파일 읽기
    * df = pd.read_csv('police_station.csv')
    * df.read()
* 파이썬 활용해 insert
    * sql = 'insert into police_station values (%s, %s)'
    * print('### INSERT ###')
    * for i, row in df.iterrows():
        cur.execute(sql, tuple(row))
        print(tuple(row))
        mydb.commit()
* 한글이 깨지는 경우
    * pd.read_csv() 파라미터에 encoding='euc-kr' 추가
<br><br>



## `[MySQL 기초 문법 2]`

### [PRIMARY KEY 문법]
* 기본 키
* 테이블의 각 레코드를 식별
* 중복 없는 고유값 포함
* NULL 불가능
* 테이블 당 하나의 기본키를 가짐
* 컬럼 하나를 PRIMARY KEY로 지정 가능
* 여러 컬럼을 하나의 PRIMARY KEY로 지정 가능
* 한개의 컬럼을 설정
    * 마지막 줄에 무엇을 키로 할건지 선언
    * create table persons (pid int not null, name varchar(16), age int, sex char, primary key (pid));
    * desc persons;
    * 키값에 PRI라고 적혀 있는 것이 PRIMARY KEY
* 여러개의 컬럼을 설정
    * 마지막 줄에 키를 2개 선언
    * create table animal (name varchar(16) not null, type varchar(16) not null, age int, primary key (name, type));
    * desc animal;
* PRIMARY KEY 삭제
    * alter drop을 사용
    * alter table persons drop primary key;
    * desc persons;
    * alter table animal drop primary key;
    * desc animal;
* 이미 생성된 테이블에 PRIMARY KEY 설정
    * alter add를 사용
    * alter table persons add primary key (pid);
    * desc persons;
    * alter table animal add primary key (name, type);
    * desc animal;
* CONSTRAINT 문법으로 설정
    * alter table animal add constraint PK_animal Key (name, type);
    * desc animal;
<br><br>

### [FOREIGN KEY 문법]
* 외래 키
* 테이블과 다른 테이블을 연결
* FOREIGN KEY로 지정된 컬럼은 연결할 테이블의 기본키가 된다.
* 지금 테이블의 PRIMARY KEY는 따로 있다.
* 다른 테이블의 PRIMARY KEY를 참조해서 FOREIGN KEY 컬럼을 만드는 것이다.
* 한 테이블에 2개 있을 수도 있다.
* CONSTRAINT 문법으로 FOREIGN KEY 설정
    * create table orders (oid int not null, order_no varchar(16), pid int, primary key (oid), constraint FK_persons foreign key (pid) references persons(pid));
    * desc orders;
    * 키에 MUL 표시가 생김
* CONSTRAINT 생략하고 FOREIGN KEY 설정
    * create table job (jid int not null, name varchar(16), pid int, primary key (jid), foreign key (pid) references persons(pid));
* FOREIGN KEY 삭제
    * alter drop을 사용
    * alter table orders drop foreign key FK_persons;
    * 삭제 하더라도 키에 MUL 표시는 그대로 있다.
    * 레퍼런스 관계만 깨지는 것
    * show create table orders; 에서 확인 가능
* 생성된 테이블에 FOREIGN KEY 설정
    * alter table orders add foreign key (pid) references persons(pid);
    * desc orders;
    * show create table orders;
* 추가 예제
    * select count(distinct name) from police_station;
    * select count(distinct police_station) from crime_status;
    * select distinct name from police_station limit 3;
    * select distinct police_station from crime_status limit 3;
    * select c.police_station, p.name from crime_status c, police_station p where p.name like concat('서울', c.police_station, '경찰서') group by c.police_station, p.name;
    * alter table police_station add primary key (name);
    * desc police_station;
    * alter table crime_status add column reference varchar(16);
    * alter table crime_status add foreign key (reference) references police_station(name);
    * update crime_status c, police_station p set c.reference=p.name where p.name like concat('서울', c.police_station, '경찰서');
    * select distinct police_station, reference from crime_status;
    * 이제 두 테이블은 연결되었다.
    * crime_status가 police_station을 참조한다.
    * 두 테이블을 조인할 때에는 FOREIGN KEY 기준으로 하면 된다.
    * select c.police_station, p.address from crime_status c, police_station p where c.reference=p.name group by c.police_station;
<br><br>

### [집계함수 개념]
* 여러 컬럼 혹은 전체 컬럼으로부터 하나의 결과값을 반환하는 함수
* COUNT: 총 갯수를 계산
* SUM: 합계를 계산
* AVG: 평균을 계산
* MIN: 최소값을 찾아 리턴
* MAX: 최대값을 찾아 리턴
* FIRST: 첫번째 값을 리턴
* LAST: 마지막 값을 리턴
* 명령어 뒤에 괄호를 붙여서 컬럼을 지정한다.
<br><br>

### [COUNT 문법]
* 총 갯수를 계산
    * select count(*) from police_station;
* 중복 제거한 결과 계산
    * DISTINCT 사용
    * select count(distinct police_station) from crime_status;
    * select count(distinct crime_type) from crime_status;
<br><br>

### [SUM 문법]
* 숫자 컬럼의 합계를 계산
    * select sum(case_number) from crime_status where status_type='발생';
    * raw data를 확인하고 싶으면 집계함수만 빼고 검색하면 된다.
    * select case_number from crime_status where status_type='발생';
<br><br>

### [AVG 문법]
* 숫자 컬럼의 평균을 계산
    * select avg(case_number) from crime_status where crime_type like '폭력' and status_type='검거';
    * select avg(case_number) from crime_status where police_station like '중부' and status_type='발생';
<br><br>

### [MIN 문법]
* 최소값을 찾아 리턴
    * select min(case_number) from crime_status where crime_type like '강도' and status_type='발생';
    * select min(case_number) from crime_status where police_station like '중부' and status_type='검거';
<br><br>

### [MAX 문법]
* 최대값을 찾아 리턴
    * select max(case_number) from crime_status where crime_type like '살인' and status_type='검거';
    * select max(case_number) from crime_status where police_station like '강남' and status_type='발생';
<br><br>

### [GROUP BY 문법]
* 그룹화하여 데이터를 조회
* 집계함수를 활용하여 함께 사용하는 편
* ORDER BY와 함께 쓸 때는 GROUP BY를 먼저 쓴다.
* 그룹화 조회
    * select police_station from crime_status group by police_station order by police_station limit 5;
* DISTICT를 사용하면 ORDER BY는 사용 불가
    * select distinct police_station from crime_status limit 5;
* SUM과 같이 사용
    * 경찰서 별로 범죄 발생 수 합
    * select police_station, sum(case_number) 발생건수 from crime_status where status_type like '발생' group by police_station order by 발생건수 desc;
* AVG와 같이 사용
    * 경찰서 별로 범죄 검거 수 평균
    * select police_station, avg(case_number) 평균검거건수 from crime_status where status_type like '검거' group by police_station order by 평균검거건수 desc;
* 다른 종류 행 2개 출력
    * (정보: status_type는 2개 뿐)
    * select police_station, status_type, avg(case_number) from crime_status group by police_station, status_type;
<br><br>

### [HAVING 문법]
* 집계함수의 조건문
* 조건에 집계함수를 쓰면 WHERE 대신 HAVING 사용
* SUM과 함께 사용
    * select police_station, sum(case_number) cnt from crime_status where status_type like '발생' group by police_station having cnt > 4000;
* AVG와 함께 사용
    * select police_station, avg(case_number) cnt from crime_status where (crime_type like '폭력' or crime_type like '절도') and status_type like '발생' group by police_station having cnt >= 2000;
<br><br>

### [SCALAR 함수 개념]
* 입력값을 기준으로 단일 값을 반환
* UCASE: 영문을 대문자로 변환
* LCASE: 영문을 소문자로 변환
* MID: 문자열 일부분을 반환
* LENGTH: 문자열의 길이를 반환
* ROUND: 지정한 자리에서 숫자를 반올림
* NOW: 현재 날짜 및 시간을 반환
* FORMAT: 숫자를 천단위 콤마가 있는 형식으로 변환
<br><br>

### [UCASE, LCASE 문법]
* 영문을 대문자로, 소문자로 변환
* 예제
    * select ucase(menu), price from sandwich where price > 15;
    * select lcase(menu), price from sandwich where price < 5;
<br><br>

### [MID 문법]
* 문자열 일부분을 반환
* MID(문자, A번, B개)으로 사용
* A번 위치부터 B개를 가져온다.
* 예제
    * select mid('This is mid test', 1, 4);
    * select mid('This is mid test', 6, 5);
    * select mid('This is mid test', -4, 4);
    * select mid('This is mid test', -8, 3);
    * select mid(cafe, 6, 4) from sandwich where ranking = 11;
    * select mid(cafe, -4, 4) from sandwich where ranking = 11;
<br><br>

### [LENGTH 문법]
* 문자열의 길이를 반환
* 예제
    * select length('This is len test');
    * select length('');
    * select length(' ');
    * select length(null);
    * select length(address), address from sandwich where ranking<=3;
<br><br>

### [ROUND 문법]
* 지정한 자리에서 숫자를 반올림
* ROUND(숫자, 반올림 위치)로 사용
* 반올림 위치 비워두면 0에서 반올림
* 예제
    * select round(315.625);
    * select round(315.625, 0);
    * select round(315.625, 1);
    * select round(315.625, -1);
    * select ranking, price, round(price) from sandwich order by ranking desc limit 3;
<br><br>

### [NOW 문법]
* 현재 날짜 및 시간을 반환
* 예제
    * select now();
<br><br>

### [FORMAT 문법]
* 숫자를 천단위 콤마가 있는 형식으로 변환
* FORMAT(숫자, 표시할 소수점 위치)로 사용
* ROUND에 천단위 콤마 기능까지 더한 함수
* ROUND는 숫자를 리턴하지만 FORMAT은 스트링을 리턴하니 주의
* 예제
    * select format(12345.6789, 0);
    * select format(12345.6789, 2);
    * select format(12345.6789, 10);
    * select format(price, 0) from sandwich where round(price, 1)>=2;
<br><br>



## `[MySQL 서브쿼리]`

### [서브쿼리 개념]
* 하나의 SQL문 안에 포함되어 있는 또 다른 SQL문
* 큰 SQL문을 메인쿼리, 포함된 SQL문을 서브쿼리라고 한다.
* 괄호로 묶어서 사용
* 단일 행 혹은 복수 행 비교 연산자와 함께 사용 가능
* 서브쿼리에서는 ORDER BY 사용 불가
* 메인쿼리가 서브쿼리를 포함하는 종속적인 관계
    * 서브쿼리는 메인쿼리의 컬럼 사용 가능
    * 메인쿼리는 서브쿼리의 컬럼 사용 불가
* 종류
    * 스칼라 서브쿼리: SELECT 절에 사용
    * 인라인 뷰: FROM 절에 사용
    * 중첩(nested) 서브쿼리: WHERE 절에 사용
<br><br>

### [스칼라 서브쿼리 문법]
* SELECT 절에 사용
* 결과는 하나의 컬럼만 반환하게 해야한다.
* SELECT 절에는 원래 컬럼이 온다.
* 컬럼 한개 대신 이 스칼라 서브쿼리를 사용하는 것
* 예제
    * select case_number, (select avg(case_number) from crime_status where crime_type like '강도' and status_type like '검거') avg from crime_status where police_station like '은평' and crime_type like '강도' and status_type like '검거';
<br><br>

### [인라인 뷰 문법]
* FROM 절에 사용
* FROM 절에는 원래 테이블이 온다.
* 인라인 뷰 서브쿼리가 실행된 결과를 테이블로 사용하는 것
* 예제
    * select c.police_station, c.crime_type, c.case_number from crime_status c, (select police_station, max(case_number) cnt from crime_status where status_type like '발생' group by police_station) m where c.police_station=m.police_station and c.case_number=m.cnt;
<br><br>

### [중첩 서브쿼리 문법]
* WHERE 절에 사용
* 중첩 서브쿼리 종류
    * single row: 하나의 결과값을 검색
    * multiple row: 하나 이상의 결과값을 검색
    * multiple column: 하나 이상의 컬럼을 검색
* single row 예제
    * 대부분 비교연산자와 사용할 때 결과값이 하나여야 한다.
    * 이럴 때 single row 사용
    * 따로 문법이 있는건 아니고 조건문으로 1개로 제한하기
    * select name from celeb where name=(select host from snl_show where id=1);
* multiple row 예제
    * IN과 사용할 때 결과값은 여러개 가능
    * 이럴 때 multiple row 사용
    * select host from snl_show where host in (select name from celeb where job_title like '%영화배우%');
    * EXISTS와 사용하는 경우
    * select name from police_station p where exists (select police_station from crime_status c where p.name=c.reference and case_number>2000);
    * ANY와 사용하는 경우
    * select name from celeb where name=any (select host from snl_show);
    * ALL과 사용하는 경우
    * select name from celeb where name=all (select host from snl_show where id=1);
* multiple column 예제
    * WHERE 절에서 컬럼과 컬럼들을 IN과 사용할 때 사용
    * select name, sex, agency from celeb where (sex, agency) in (select sex, agency from celeb where name='강동원');
<br><br>



## `[실전 팁]`
* 테이블 불러올 때는 ESC 밑에 백틱 사용
* 스트링 사용할 때는 엔터 옆에 따옴표 사용
* 완성된 쿼리문 서브쿼리로 사용하기
    * 쿼리문을 with tb as () 로 감싼다.
    * 다음 쿼리에서 테이블을 불러오듯 from에서 tb를 사용하면 된다.
* where 조건절은 주석처리 쉽게 True먼저 걸고 and로 묶는다.
    * where True
        and col1 is not null
        and col2 is not null
* select 에서도 주석처리 쉽게 마지막 값도 ,를 붙여준다.
* 조건에 따라 값 부여하기
    * case
        when (조건1) then (조건1 해당할 때 결과)
        when (조건2) then (조건2 해당할 때 결과)
        else (모두 해당하지 않을 때 결과)
    end as level
<br><br>



