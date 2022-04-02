USE TravelAgency

--�������� ������
   --�������� IF EXISTS �������� ������� � 2016 ������ SQL Server
   DROP TABLE IF EXISTS �ustomers;
   DROP TABLE IF EXISTS InfoCustomers;
   DROP TABLE IF EXISTS �ountries;
   DROP TABLE IF EXISTS �ities;
   DROP TABLE IF EXISTS Tours;
   DROP TABLE IF EXISTS Contracts;

   --�������� ������� � ���������
   CREATE TABLE �ustomers (
        �ustomerID  INT IDENTITY(1,1) CONSTRAINT PK_�ustomerID PRIMARY KEY,
        FIO    VARCHAR(200),
		Email VARCHAR(100),
   );

   SELECT *
   FROM �ustomers
   INSERT INTO �ustomers 
     VALUES
            ('������� �.�.','Aleksin@mail.ru'),
            ('�������� �.�.','Gorbunov@gmail.com'),
            ('�������� �.�','KSimonova@bk.ru'),
            ('����������� �.�.','Dormidont@mail.ru')
   
   GO


   --�������� ������� � ����������� � ��������
   CREATE TABLE InfoCustomers (
        InfoCustomersID   INT IDENTITY(1,1) CONSTRAINT PK_InfoCustomersID PRIMARY KEY,
        �ustomerID    INT,
		Gender  VARCHAR(20),
		DateOfBirth   DATE,
		Document    VARCHAR(100),
		DocumentNumber  INT,
		DocumentSeries  INT,
		IssuedByWhom  VARCHAR(200),
		DateOfIssue DATE,
   );

   SELECT *
   FROM InfoCustomers
   INSERT INTO InfoCustomers
     VALUES
            ( 1, '�������', '19900813', '�������', 5017, 234567, '��������� ���� ������', '20110906'),
            ( 2, '�������', '19950321', '�������', 1309, 123456, '��������� ���� �������', '20160420'),
            ( 3, '�������', '19881201', '�������', 9637, 768495, '��������� ���� �����������', '20090108'),
            ( 4, '�������', '19800108', '�������', 9304, 097836, '��������� ���� ������-��-����', '20010201')

  GO


   --���������� ����������� �������� ����� (FOREIGN KEY)
   ALTER TABLE InfoCustomers ADD CONSTRAINT FK_�ustomers
   FOREIGN KEY (�ustomerID) 
        REFERENCES �ustomers (�ustomerID)
        ON DELETE SET DEFAULT
        ON UPDATE NO ACTION;

   GO


      --�������� ������� �� ��������
   CREATE TABLE �ountries (
        �ountryID   INT IDENTITY(1,1) CONSTRAINT PK_�ountryID PRIMARY KEY,
        �ountryName  VARCHAR(100),
		�urrency    VARCHAR(100),
		DescriptionCountry  TEXT,
		LanguageCountry  VARCHAR(100),
   )

   SELECT *
   FROM �ountries
   INSERT INTO �ountries
     VALUES
            ( '���������', '���� ����������', '��������� - ���� �� ����� �������� ���� ��������, ������� �������� ������������� �������������� 
			��������� ������� ��� � ������ �����, ���������� ������, �����, ����� � ���������� ��������� ����� ���������. ����� ������� 
			�������� ����������� �������, ����������� ������ ���� ����������� ��������, ������������� ���� � ������ �������� �������. 
			��������� - ������ ������������ ������������, ��� ����� ����� ����������� ������ ����� ������������� ������������: �������� 
			������������� ������, ��������� ����� � ����������� ��������� ���������. �� ������� �������� ��������� - ��� ����������� 
			��������� ���������� ����� � ��������, ����� ��� � ��������� �������� ������. ', '����������� ����'),

            ( '�������', '����', '������� - ���� �� ����� �������� � ���������� ����� ������ � ���������� �������� � ������������ 
			���������� ���������. ��� �������� ���������� �������� � ������� ���������� ���������, ������������ ������������ � 
			�������������� ���������, ������� � ������� ������ � ���������� ������. ������� ���������� ������������ ������������ 
			����������: �� �������� ������������� ��������� ��������� �� ����������� ���������������, �� ������ ������ ���� �� 
			�������������������� ������ �������, �� ���������� ����� �������� �� ������������� � ������� ���������. ��� �����������, 
			����������� � ���������� ������, ������� �������� ����� ���������� ������������� ������������ � ����.', '����������� ����'),

            ( '������', '����', '������ - ��� ���� �� ����� ���������� � �������������� ���� � ����. ��� ����� ���� �� ����� �������� 
			� ������������� ���������� � ������, ����� ������� � ���� ���� �������� �������, �������� � ���������, ������������� ����� 
			������ � ������� ����������� �����. ��� ���� ������ ������ �� ��������. Ÿ ������������ ������ � ��������� �������� �� 
			������������ ��������, �������������� �������� �� ���� ����, ���� �������� � ��������� � ���������� �����. ��, ������� �����, 
			�� ����� �������� ��� ������ �� � ������ �����������, ����������� ����, ������� ����� � ������ ���������. ', '����������� ����'),

            ( '����������', '����', '���������� - ���� �� ����� �������������� � "������" ����� ������, ���������� ������� � ����������� 
			����� �������. ��� ����������� ������������ ��������, ���������� ������� � ��������� �������, ���������� ����� ������� ����� 
			���������, ��������� � ������. �����-�� ������� ������-������� �������, ������ ���������� - ����������� ����������� ������, 
			������� �� ��� ������ ������ ���� �� ������������� �����. ��������� ����� ������������ � �������������� �������� ����� �� ����� 
			���������� ������������� ����������� ������. ', '������������� ����')

  GO


         --�������� ������� � ��������
   CREATE TABLE �ities (
        �ityID   INT IDENTITY(1,1) CONSTRAINT PK_�ityID PRIMARY KEY,
        �ountryID  INT,
		�ityName    VARCHAR(100),
		Hotel  VARCHAR(200),
   );

   SELECT *
   FROM �ities
   INSERT INTO �ities
     VALUES
            ( 1, '��������', 'Hampton Inn Columbus/Taylorsville'),
            ( 2, '�����', 'Best Western Paris Inn'),
            ( 3, '���', 'Best Western Paris Inn'),
            ( 4, '���������', 'Park Inn by Radisson Amsterdam City West')

  GO

      --���������� ����������� �������� ����� (FOREIGN KEY)
   ALTER TABLE �ities ADD CONSTRAINT FK_�ities
   FOREIGN KEY (�ountryID) 
        REFERENCES �ountries (�ountryID)
        ON DELETE SET DEFAULT
        ON UPDATE NO ACTION;
  GO

         --�������� ������� � ������
   CREATE TABLE Tours (
        TourID   INT IDENTITY(1,1) CONSTRAINT PK_TourID PRIMARY KEY,
        �ustomerID  INT,
		�ountryID   INT,
		�ityID  INT,
		StartOfTheJourney DATE,
		EndOfTheJourney DATE,
		TourPrice MONEY,
   );

   SELECT *
   FROM Tours
   INSERT INTO Tours
     VALUES
            (  1, 1, 1, '20210627', '20210710', 70750),
            (  2, 2, 2, '20210701', '20210715', 84300),
            (  3, 3, 3, '20210703', '20210710', 66850),
            (  4, 4, 4, '20210629', '20210708', 72300)

  GO

         --���������� ����������� �������� ����� (FOREIGN KEY)
   ALTER TABLE Tours ADD CONSTRAINT FK_Tours1
   FOREIGN KEY (�ustomerID) 
        REFERENCES �ustomers (�ustomerID)
        ON DELETE SET DEFAULT
        ON UPDATE NO ACTION;

  GO
            --���������� ����������� �������� ����� (FOREIGN KEY)
   ALTER TABLE Tours ADD CONSTRAINT FK_Tours2
   FOREIGN KEY (�ountryID) 
        REFERENCES �ountries (�ountryID)
        ON DELETE SET DEFAULT
        ON UPDATE NO ACTION;

  GO
               --���������� ����������� �������� ����� (FOREIGN KEY)
   ALTER TABLE Tours ADD CONSTRAINT FK_Tours3
   FOREIGN KEY (�ityID) 
        REFERENCES �ities (�ityID)
        ON DELETE SET DEFAULT
        ON UPDATE NO ACTION;

  GO
            --�������� ������� � ����������
   CREATE TABLE Contracts (
        ContractID   INT IDENTITY(1,1) CONSTRAINT PK_ContractID PRIMARY KEY,
        TourID  INT,
   );

   SELECT *
   FROM Contracts
   INSERT INTO Contracts
     VALUES
            ( 1),
            ( 2),
            ( 3),
            ( 4)
  GO

                  --���������� ����������� �������� ����� (FOREIGN KEY)
   ALTER TABLE Contracts ADD CONSTRAINT FK_Contracts
   FOREIGN KEY (TourID) 
        REFERENCES Tours (TourID)
        ON DELETE SET DEFAULT
        ON UPDATE NO ACTION;
  GO

