create table ibgo(
ibgo_no number(4) CONSTRAINT ibgo_pk PRIMARY KEY,
code number(4),
ibgo_date date default sysdate,
ibgo_qty number
);
alter table ibgo
add constraint ibgo_fk foreign key(code) references product(code);
drop sequence ibgo_seq;
drop table ibgo;
create sequence ibgo_seq
start with 799
increment by 1
nocycle
nocache;

insert into ibgo(ibgo_no,code,ibgo_date,ibgo_qty)
values(ibgo_seq.nextval,100,to_char(sysdate,'yyyy.mm.dd'),50);
insert into ibgo(ibgo_no,code,ibgo_date,ibgo_qty)
values(ibgo_seq.nextval,101,to_char(sysdate,'yyyy.mm.dd'),30);
insert into ibgo(ibgo_no,code,ibgo_date,ibgo_qty)
values(ibgo_seq.nextval,102,to_char(sysdate,'yyyy.mm.dd'),30);
insert into ibgo(ibgo_no,code,ibgo_date,ibgo_qty)
values(ibgo_seq.nextval,103,to_char(sysdate,'yyyy.mm.dd'),30);
