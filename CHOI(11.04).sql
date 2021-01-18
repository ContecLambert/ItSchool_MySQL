select * from user_objects;

select * from user_tables;

NULL ��Ģ�� �������� �����ϸ� �����ϱ� ����� �κ��� �ִ�.
�츮�� NULL ������ �־�� ���� �������� �ٶ��� ���� �����ͺ��̽� ������ ��Ģ���� 
�ٶ���� �� �� ����.
��Ģ�� ������ ����̶�⺸�� ���Ѿ� �� ����̴�.
NULL ���� Ư���� ��Ģ�� ������ �ִٴ� ���� �������.

- NULL ��Ģ���� ����� NULL�̴�.

SELECT NULL+3 FROM DUAL;

- �� ������ (=,>,<,>=,<=, !=) ��� �� NULL �� �񱳽� �����? null
���رݾ� : 100, ��ǥ �ݾ� : 100
���رݾ� 100, ��ǥ �ݾ� : NULL
���رݾ� : null, ��ǥ�ݾ� : null

SELECT * FROM ���� WHERE ���رݾ� > ��ǥ�ݾ�;

- ���� �Լ� (sum, avg, max, min)�� null ���� �ִ� ���
=> ���� �Լ��� null ���� �ִ� ���� �����ϰ� ����Ѵ�.

�ֹ� �ݾ�
100
null
200
=> sum(100+200) = 300


- ���ڿ� ���տ��� null = > ���̰� 0�� ���ڿ��� �����ϰ� �ν��Ѵ�.
select null || 'abc' from dual;
select null || 3 from dual;
select null || 'ABC' || 3 from dual;

- �������� (and, or, not)
null and TRUE => �Ѵ� ���϶��� ��. => null
null or TRUE => �� �� �ϳ��� ���̿��� ��. => TRUE
null or FALSE  => NULL
not null => NULL

-�����ͺ��̽����� ������ ���Ἲ ��ȭ�ϱ� ���� ������ ���� ������ ����Ѵ�.
SQL�� ���̺� ������ ��Ģ�� ����ϴ� ������� ���� ���� ������ �����Ѵ�.
INSERT, UPDATE, DELETE �۾��� �Ͼ�� ��� ���� ������ �˻�ȴ�. 
�̷� ���������� �����ϸ� �ش� �۾��� ������� ������.
5���� ��������
 1)NOT NULL : �� �÷����� NULL�� �ƴ� ���� �Էµȴ�.
 2)UNIQUE : Ư�� �ʵ忡 �ߺ� ���� �Է� �Ǵ� ���� �����Ѵ�. 
            PRIMARY KET �������ǰ� �޸� UNIQUE ���� ������ NULL�� ����Ѵ�.
 3)PRIMARY KEY : ���̺� �ִ� �� ��(���ڵ�)�� �����ϰ� �ĺ��Ѵ�.
                 UNIQUE + NOT NULL ���� �����̴�.
 4)FOREIGN KEY : �� ���̺� �ִ� �ܷ�Ű�� �ٸ� ���̺�(�θ� ���̺�)�� �ִ� �⺻ Ű�� �ȴ�.
 5)CHECK : ������ Ư�� ���� �Է� �ǰ� �Ѵ�.
 6)DEFAULT : �⺻���� �����Ѵ�.
 
- ����¡ ó��
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

















