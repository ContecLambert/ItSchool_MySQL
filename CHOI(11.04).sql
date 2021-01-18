select * from user_objects;

select * from user_tables;

NULL 규칙을 논리적으로 접근하면 이해하기 어려운 부분이 있다.
우리는 NULL 문제에 있어서는 논리적 측면으로 바라보지 말고 데이터베이스 고유의 규칙으로 
바라봐야 할 것 같다.
규칙은 이해의 대상이라기보다 지켜야 할 대상이다.
NULL 값은 특별한 규칙을 따르고 있다는 것을 명심하자.

- NULL 사칙연산 결과는 NULL이다.

SELECT NULL+3 FROM DUAL;

- 비교 연산자 (=,>,<,>=,<=, !=) 사용 시 NULL 과 비교시 결과는? null
기준금액 : 100, 목표 금액 : 100
기준금액 100, 목표 금액 : NULL
기준금액 : null, 목표금액 : null

SELECT * FROM 실적 WHERE 기준금액 > 목표금액;

- 집계 함수 (sum, avg, max, min)에 null 값이 있는 경우
=> 집계 함수는 null 값이 있는 행은 제외하고 계산한다.

주문 금액
100
null
200
=> sum(100+200) = 300


- 문자열 결합에서 null = > 길이가 0인 문자열과 동일하게 인식한다.
select null || 'abc' from dual;
select null || 3 from dual;
select null || 'ABC' || 3 from dual;

- 논리연산자 (and, or, not)
null and TRUE => 둘다 참일때만 참. => null
null or TRUE => 둘 중 하나만 참이여도 참. => TRUE
null or FALSE  => NULL
not null => NULL

-데이터베이스에서 데이터 무결성 강화하기 위해 선언전 제약 조건을 사용한다.
SQL은 테이블 데이터 규칙을 명시하는 방식으로 여러 제약 조건을 제공한다.
INSERT, UPDATE, DELETE 작업이 일어날때 모든 제약 조건이 검사된다. 
이런 제약조건을 위반하면 해당 작업은 진행되지 않은닫.
5가지 제약조건
 1)NOT NULL : 이 컬럼에는 NULL이 아닌 값만 입력된다.
 2)UNIQUE : 특정 필드에 중복 값이 입력 되는 것을 방지한다. 
            PRIMARY KET 제약조건과 달리 UNIQUE 제약 조건은 NULL을 허용한다.
 3)PRIMARY KEY : 테이블에 있는 각 행(레코드)를 유일하게 식별한다.
                 UNIQUE + NOT NULL 제약 조건이다.
 4)FOREIGN KEY : 한 테이블에 있는 외래키는 다른 테이블(부모 테이블)에 있는 기본 키가 된다.
 5)CHECK : 설정된 특정 값만 입력 되게 한다.
 6)DEFAULT : 기본값을 정의한다.
 
- 페이징 처리
SELECT *
FROM
    (
        SELECT
            ROWNUM AS RNUM, T1.*
        FROM
            TB_STUDENT T1
    )
WHERE
    RNUM BETWEEN 11 AND 20;

SELECT *
FROM
    (
        SELECT 
            ROWNUM AS RNUM, T1.*
        FROM
            TB_STUDENT T1
        WHERE
            ROWNUM <= 20
    )
WHERE
    11 <= RNUM;

















