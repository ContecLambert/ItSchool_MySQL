select * from ibgo;
select * from product;
--��ǰ ���̺� ����
create table product(
code number(4) CONSTRAINT product_pk PRIMARY KEY,
name varchar(15) not null,
company varchar(15),
price number(4),
qty number default 0
);
--��ǰ ���̺� ������ �Է�
insert into product(code, name,company,price) values(100,'�����','����',2100);
insert into product(code,name,company,price) values(101,'�������','����',1800);
insert into product(code, name, company,price) values(102,'�ٳ�������','����',1800);
insert into product(code, name, company,price) values(103,'���ڿ���','���',1900);
commit; 
--�԰� ���̺� ����
create table ibgo(
ibgo_no number(4) constraint ibgo_pk primary key,
code number(4) constraint ibgo_fk references product(code),
ibgo_date date default sysdate,
ibgo_qty number
);
--�԰� ������ ����
create sequence ibgo_seq
start with 799
increment by 1
nocycle
nocache;
--�԰� ���̺� ������ �Է�
insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty) 
    values(1, 100, to_char(sysdate,'yyyy.mm.dd'), 50);
insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty) 
    values(ibgo_seq.nextval, 101, to_char(sysdate,'yyyy.mm.dd'), 30);
insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty) 
    values(ibgo_seq.nextval, 102, to_char(sysdate,'yyyy.mm.dd'), 30);
insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty) 
    values(ibgo_seq.nextval, 103, to_char(sysdate,'yyyy.mm.dd'), 30);
--�Ǹ� ���̺� ����
create table panmae(
panmae_no number(4) constraint panmae_pk primary key,
code number(4) constraint code_fk references product(code),
panmae_date date default sysdate,
panmae_qty number
);
--�Ǹ� ������ ����
create sequence panmae_seq
start with 1999
increment by 1
nocycle
nocache;
--�Ǹ� ���̺� ������ �Է�
insert into panmae(panmae_no, code, panmae_date, panmae_qty)
  values(panmae_seq.nextval, 100, to_char(sysdate,'yyyy.mm.dd'), 20);
insert into panmae(panmae_no, code, panmae_date, panmae_qty)
  values(panmae_seq.nextval, 101, to_char(sysdate,'yyyy.mm.dd'), 10);
insert into panmae(panmae_no, code, panmae_date, panmae_qty)
  values(panmae_seq.nextval, 102, to_char(sysdate,'yyyy.mm.dd'), 13);
insert into panmae(panmae_no, code, panmae_date, panmae_qty)
  values(panmae_seq.nextval, 103, to_char(sysdate,'yyyy.mm.dd'), 11);
  
--�Է�Ʈ����(�԰����̺� ��ǰ�� �ԷµǾ��� �� ������ ����)  
create or replace trigger product_insert 
after insert on ibgo                    
for each row
begin
    update product set qty = :new.ibgo_qty + qty 
    where code = :new.code;
end;

--�԰����̺�(code�� 100�� ��ǰ 20�� �԰�)
insert into ibgo(ibgo_no, code, ibgo_qty)
values(IBGO_SEQ.nextval, 100, 180);

  
select * from product;
----�Է�Ʈ����(�԰����̺� ��ǰ�� �ԷµǾ��� �� ������ ����)  
create or replace trigger product_decrease 
after INSERT on panmae                    
for each row
begin
    update product set qty =qty - :new.panmae_qty
    where code = :new.code;
end;
--
----�԰����̺�(code�� 100�� ��ǰ 10�� �Ǹ�)
insert into panmae(panmae_no, code, panmae_qty)
values(panmae_SEQ.nextval, 100, 50);

select * from product;