select * from ibgo;
select * from product;
--상품 테이블 생성
create table product(
code number(4) CONSTRAINT product_pk PRIMARY KEY,
name varchar(15) not null,
company varchar(15),
price number(4),
qty number default 0
);
--상품 테이블 데이터 입력
insert into product(code, name,company,price) values(100,'흰우유','서울',2100);
insert into product(code,name,company,price) values(101,'딸기우유','남양',1800);
insert into product(code, name, company,price) values(102,'바나나우유','남양',1800);
insert into product(code, name, company,price) values(103,'초코우유','상길',1900);
commit; 
--입고 테이블 생성
create table ibgo(
ibgo_no number(4) constraint ibgo_pk primary key,
code number(4) constraint ibgo_fk references product(code),
ibgo_date date default sysdate,
ibgo_qty number
);
--입고 시퀀스 생성
create sequence ibgo_seq
start with 799
increment by 1
nocycle
nocache;
--입고 테이블 데이터 입력
insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty) 
    values(1, 100, to_char(sysdate,'yyyy.mm.dd'), 50);
insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty) 
    values(ibgo_seq.nextval, 101, to_char(sysdate,'yyyy.mm.dd'), 30);
insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty) 
    values(ibgo_seq.nextval, 102, to_char(sysdate,'yyyy.mm.dd'), 30);
insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty) 
    values(ibgo_seq.nextval, 103, to_char(sysdate,'yyyy.mm.dd'), 30);
--판매 테이블 생성
create table panmae(
panmae_no number(4) constraint panmae_pk primary key,
code number(4) constraint code_fk references product(code),
panmae_date date default sysdate,
panmae_qty number
);
--판매 시퀀스 생성
create sequence panmae_seq
start with 1999
increment by 1
nocycle
nocache;
--판매 테이블 데이터 입력
insert into panmae(panmae_no, code, panmae_date, panmae_qty)
  values(panmae_seq.nextval, 100, to_char(sysdate,'yyyy.mm.dd'), 20);
insert into panmae(panmae_no, code, panmae_date, panmae_qty)
  values(panmae_seq.nextval, 101, to_char(sysdate,'yyyy.mm.dd'), 10);
insert into panmae(panmae_no, code, panmae_date, panmae_qty)
  values(panmae_seq.nextval, 102, to_char(sysdate,'yyyy.mm.dd'), 13);
insert into panmae(panmae_no, code, panmae_date, panmae_qty)
  values(panmae_seq.nextval, 103, to_char(sysdate,'yyyy.mm.dd'), 11);
  
--입력트리거(입고테이블에 상품이 입력되었을 때 재고수량 증가)  
create or replace trigger product_insert 
after insert on ibgo                    
for each row
begin
    update product set qty = :new.ibgo_qty + qty 
    where code = :new.code;
end;

--입고테이블(code가 100인 상품 20개 입고)
insert into ibgo(ibgo_no, code, ibgo_qty)
values(IBGO_SEQ.nextval, 100, 180);

  
select * from product;
----입력트리거(입고테이블에 상품이 입력되었을 때 재고수량 증가)  
create or replace trigger product_decrease 
after INSERT on panmae                    
for each row
begin
    update product set qty =qty - :new.panmae_qty
    where code = :new.code;
end;
--
----입고테이블(code가 100인 상품 10개 판매)
insert into panmae(panmae_no, code, panmae_qty)
values(panmae_SEQ.nextval, 100, 50);

select * from product;