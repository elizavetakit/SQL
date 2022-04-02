USE TravelAgency

--Удаление таблиц
   --Параметр IF EXISTS доступен начиная с 2016 версии SQL Server
   DROP TABLE IF EXISTS Сustomers;
   DROP TABLE IF EXISTS InfoCustomers;
   DROP TABLE IF EXISTS Сountries;
   DROP TABLE IF EXISTS Сities;
   DROP TABLE IF EXISTS Tours;
   DROP TABLE IF EXISTS Contracts;

   --Создание таблицы с клиентами
   CREATE TABLE Сustomers (
        СustomerID  INT IDENTITY(1,1) CONSTRAINT PK_СustomerID PRIMARY KEY,
        FIO    VARCHAR(200),
		Email VARCHAR(100),
   );

   SELECT *
   FROM Сustomers
   INSERT INTO Сustomers 
     VALUES
            ('Алексин В.В.','Aleksin@mail.ru'),
            ('Горбунов Д.Д.','Gorbunov@gmail.com'),
            ('Симонова К.Р','KSimonova@bk.ru'),
            ('Дормитотова К.С.','Dormidont@mail.ru')
   
   GO


   --Создание таблицы с информацией о клиентах
   CREATE TABLE InfoCustomers (
        InfoCustomersID   INT IDENTITY(1,1) CONSTRAINT PK_InfoCustomersID PRIMARY KEY,
        СustomerID    INT,
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
            ( 1, 'мужской', '19900813', 'паспорт', 5017, 234567, 'Отделение УФМС Москва', '20110906'),
            ( 2, 'мужской', '19950321', 'паспорт', 1309, 123456, 'Отделение УФМС Саратов', '20160420'),
            ( 3, 'женский', '19881201', 'паспорт', 9637, 768495, 'Отделение УФМС Новосибирск', '20090108'),
            ( 4, 'женский', '19800108', 'паспорт', 9304, 097836, 'Отделение УФМС Ростов-на-Дону', '20010201')

  GO


   --Добавление ограничения внешнего ключа (FOREIGN KEY)
   ALTER TABLE InfoCustomers ADD CONSTRAINT FK_Сustomers
   FOREIGN KEY (СustomerID) 
        REFERENCES Сustomers (СustomerID)
        ON DELETE SET DEFAULT
        ON UPDATE NO ACTION;

   GO


      --Создание таблицы со странами
   CREATE TABLE Сountries (
        СountryID   INT IDENTITY(1,1) CONSTRAINT PK_СountryID PRIMARY KEY,
        СountryName  VARCHAR(100),
		Сurrency    VARCHAR(100),
		DescriptionCountry  TEXT,
		LanguageCountry  VARCHAR(100),
   )

   SELECT *
   FROM Сountries
   INSERT INTO Сountries
     VALUES
            ( 'Шотландия', 'Фунт стерлингов', 'Шотландия - одно из самых красивых мест Британии, которое славится великолепными драматическими 
			пейзажами суровых гор и зелёных долин, живописных холмов, полей, лесов и изрезанной береговой линии побережья. Здесь история 
			окружает практически повсюду, приоткрывая завесы тайн легендарных сражений, романтических руин и старых каменных церквей. 
			Шотландия - страна потрясающего разнообразия, где можно найти практически полный набор туристических аттракционов: красивые 
			средневековые города, сказочные замки и красивейшие природные ландшафты. Но главная изюминка Шотландии - это одиночество 
			отдалённых вересковых болот и островов, диких гор и уединённых песчаных пляжей. ', 'Шотландский язык'),

            ( 'Франция', 'Евро', 'Франция - одна из самых красивых и интересных стран Европы с богатейшей историей и великолепным 
			культурным наследием. Она славится живописной природой и уютными старинными городками, современными мегаполисами и 
			фешенебельными курортами, музеями с мировым именем и изысканной кухней. Франция предлагает удивительное разнообразие 
			ландшафтов: от сурового океанического побережья Нормандии до субтропиков Средиземноморья, от горных вершин Альп до 
			сельскохозяйственных угодий Эльзаса, от лавандовых полей Прованса до виноградников и пастбищ Бургундии. Это невероятная, 
			романтичная и самобытная страна, которая является самым популярным туристическим направлением в мире.', 'Французский язык'),

            ( 'Италия', 'Евро', 'Италия - это одно из самых уникальных и очаровательных мест в мире. Она имеет одни из самых красивых 
			и разнообразных ландшафтов в Европе, самый большой в мире клад сокровищ истории, культуры и искусства, благоприятный тёплый 
			климат и вкусную аутентичную кухню. При этом Италия совсем не идеальна. Её исторические города и древности страдают от 
			современного развития, инфраструктура работает на своём пике, есть проблемы в экономике и социальной сфере. Но, побывав здесь, 
			Вы точно полюбите эту страну за её буйный темперамент, бесшабашный нрав, вкусную кухню и особую атмосферу. ', 'Итальянский язык'),

            ( 'Нидерланды', 'Евро', 'Нидерланды - одна из самых густонаселённых и "ровных" стран Европы, укреплённая дамбами и пронизанная 
			сетью каналов. Это государство пасторальных пейзажей, живописных деревнь и спокойных городов, особняками среди которых стоят 
			Амстердам, Роттердам и Утрехт. Когда-то великая военно-морская держава, теперь Нидерланды - современная европейская страна, 
			которая всё ещё играет важную роль на международной арене. Благодаря своей компактности и гостеприимству является одним из самых 
			популярных туристических направлений Европы. ', 'Нидерландский язык')

  GO


         --Создание таблицы с городами
   CREATE TABLE Сities (
        СityID   INT IDENTITY(1,1) CONSTRAINT PK_СityID PRIMARY KEY,
        СountryID  INT,
		СityName    VARCHAR(100),
		Hotel  VARCHAR(200),
   );

   SELECT *
   FROM Сities
   INSERT INTO Сities
     VALUES
            ( 1, 'Эдинбург', 'Hampton Inn Columbus/Taylorsville'),
            ( 2, 'Париж', 'Best Western Paris Inn'),
            ( 3, 'Рим', 'Best Western Paris Inn'),
            ( 4, 'Амстердам', 'Park Inn by Radisson Amsterdam City West')

  GO

      --Добавление ограничения внешнего ключа (FOREIGN KEY)
   ALTER TABLE Сities ADD CONSTRAINT FK_Сities
   FOREIGN KEY (СountryID) 
        REFERENCES Сountries (СountryID)
        ON DELETE SET DEFAULT
        ON UPDATE NO ACTION;
  GO

         --Создание таблицы с турами
   CREATE TABLE Tours (
        TourID   INT IDENTITY(1,1) CONSTRAINT PK_TourID PRIMARY KEY,
        СustomerID  INT,
		СountryID   INT,
		СityID  INT,
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

         --Добавление ограничения внешнего ключа (FOREIGN KEY)
   ALTER TABLE Tours ADD CONSTRAINT FK_Tours1
   FOREIGN KEY (СustomerID) 
        REFERENCES Сustomers (СustomerID)
        ON DELETE SET DEFAULT
        ON UPDATE NO ACTION;

  GO
            --Добавление ограничения внешнего ключа (FOREIGN KEY)
   ALTER TABLE Tours ADD CONSTRAINT FK_Tours2
   FOREIGN KEY (СountryID) 
        REFERENCES Сountries (СountryID)
        ON DELETE SET DEFAULT
        ON UPDATE NO ACTION;

  GO
               --Добавление ограничения внешнего ключа (FOREIGN KEY)
   ALTER TABLE Tours ADD CONSTRAINT FK_Tours3
   FOREIGN KEY (СityID) 
        REFERENCES Сities (СityID)
        ON DELETE SET DEFAULT
        ON UPDATE NO ACTION;

  GO
            --Создание таблицы с договорами
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

                  --Добавление ограничения внешнего ключа (FOREIGN KEY)
   ALTER TABLE Contracts ADD CONSTRAINT FK_Contracts
   FOREIGN KEY (TourID) 
        REFERENCES Tours (TourID)
        ON DELETE SET DEFAULT
        ON UPDATE NO ACTION;
  GO

