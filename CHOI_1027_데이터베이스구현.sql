--도서대여 테이블 삭제
drop table book_reservation;
--도서대여 테이블 생성
create table book_reservation(
    lentno varchar2(6) not null primary key,
    custname varchar2(20),
    bookno varchar2(3),
    outdate date,
    indate date,
    status char(1)
);
--대여번호 시퀀스 삭제
drop sequence reservation_lentno_seq;
--대여번호(lentno) 시퀀스 생성
create SEQUENCE reservation_lentno_seq
start with 0
increment by 1
MINVALUE -1
nocycle nocache;

select reservation_lentno_seq.nextval from dual;

--도서 대여 테이블 데이터 입력
insert into book_reservation (lentno,custname,bookno,outdate,status)
    values (reservation_lentno_seq.nextval,'김한국',101,'20171201',1); 
    
insert into book_reservation (lentno,custname,bookno,outdate,status)
    values (reservation_lentno_seq.nextval,'진선미',102,'20171204',2);
    
insert into book_reservation (lentno,custname,bookno,outdate,status)
    values (reservation_lentno_seq.nextval,'장소미',201,'20171001',1);
    
insert into book_reservation (lentno,custname,bookno,outdate,status)
    values (reservation_lentno_seq.nextval,'최소망',103,'20171109',1);
    
insert into book_reservation (lentno,custname,bookno,outdate,status)
    values (reservation_lentno_seq.nextval,'이동국',301,'20171224',2);
    
insert into book_reservation (lentno,custname,bookno,outdate,status)
    values (reservation_lentno_seq.nextval,'이소라',105,'20171208',2);
--출력
select * from book_reservation;


--도서정보 테이블 삭제
drop table book_info;
--도서정보 테이블 생성
create table book_info(
    bookno number(4) not null primary key,
    author char(20),
    bookname char(20)
);
--도서정보 테이블 데이터 입력
insert into book_info (bookno,author,bookname)
    values (101,'박작가','시스템분석');
insert into book_info (bookno,author,bookname)
    values (102,'김작가','전산개론');
insert into book_info (bookno,author,bookname)
    values (103,'이작가','마케팅개론');
insert into book_info (bookno,author,bookname)
    values (105,'황작가','사회학');
insert into book_info (bookno,author,bookname)
    values (201,'최작가','역사학');
insert into book_info (bookno,author,bookname)
    values (301,'오작가','전산영어');
    
update book_reservation set indate = '20171204' where lentno = 1;
update book_reservation set indate = '20180105' where lentno = 3;
--출력
select * from book_info;

drop view info_reservation_view ;

create view info_reservation_view 
as
select r.lentno 대여번호, r.custname 대여자,i.bookname 도서명,r.outdate 대여일, indate 반납일
from book_info i , book_reservation r
where i.bookno = r.bookno;

select * from info_reservation_view;

create index IDX_bookname_index on book_info(bookname);

SELECT TABLE_NAME,INDEX_NAME, COLUMN_NAME FROM USER_IND_COLUMNS WHERE TABLE_NAME IN('BOOK_INFO');
