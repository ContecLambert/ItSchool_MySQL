--�����뿩 ���̺� ����
drop table book_reservation;
--�����뿩 ���̺� ����
create table book_reservation(
    lentno varchar2(6) not null primary key,
    custname varchar2(20),
    bookno varchar2(3),
    outdate date,
    indate date,
    status char(1)
);
--�뿩��ȣ ������ ����
drop sequence reservation_lentno_seq;
--�뿩��ȣ(lentno) ������ ����
create SEQUENCE reservation_lentno_seq
start with 0
increment by 1
MINVALUE -1
nocycle nocache;

select reservation_lentno_seq.nextval from dual;

--���� �뿩 ���̺� ������ �Է�
insert into book_reservation (lentno,custname,bookno,outdate,status)
    values (reservation_lentno_seq.nextval,'���ѱ�',101,'20171201',1); 
    
insert into book_reservation (lentno,custname,bookno,outdate,status)
    values (reservation_lentno_seq.nextval,'������',102,'20171204',2);
    
insert into book_reservation (lentno,custname,bookno,outdate,status)
    values (reservation_lentno_seq.nextval,'��ҹ�',201,'20171001',1);
    
insert into book_reservation (lentno,custname,bookno,outdate,status)
    values (reservation_lentno_seq.nextval,'�ּҸ�',103,'20171109',1);
    
insert into book_reservation (lentno,custname,bookno,outdate,status)
    values (reservation_lentno_seq.nextval,'�̵���',301,'20171224',2);
    
insert into book_reservation (lentno,custname,bookno,outdate,status)
    values (reservation_lentno_seq.nextval,'�̼Ҷ�',105,'20171208',2);
--���
select * from book_reservation;


--�������� ���̺� ����
drop table book_info;
--�������� ���̺� ����
create table book_info(
    bookno number(4) not null primary key,
    author char(20),
    bookname char(20)
);
--�������� ���̺� ������ �Է�
insert into book_info (bookno,author,bookname)
    values (101,'���۰�','�ý��ۺм�');
insert into book_info (bookno,author,bookname)
    values (102,'���۰�','���갳��');
insert into book_info (bookno,author,bookname)
    values (103,'���۰�','�����ð���');
insert into book_info (bookno,author,bookname)
    values (105,'Ȳ�۰�','��ȸ��');
insert into book_info (bookno,author,bookname)
    values (201,'���۰�','������');
insert into book_info (bookno,author,bookname)
    values (301,'���۰�','���꿵��');
    
update book_reservation set indate = '20171204' where lentno = 1;
update book_reservation set indate = '20180105' where lentno = 3;
--���
select * from book_info;

drop view info_reservation_view ;

create view info_reservation_view 
as
select r.lentno �뿩��ȣ, r.custname �뿩��,i.bookname ������,r.outdate �뿩��, indate �ݳ���
from book_info i , book_reservation r
where i.bookno = r.bookno;

select * from info_reservation_view;

create index IDX_bookname_index on book_info(bookname);

SELECT TABLE_NAME,INDEX_NAME, COLUMN_NAME FROM USER_IND_COLUMNS WHERE TABLE_NAME IN('BOOK_INFO');
