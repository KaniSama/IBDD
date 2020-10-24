USE [ИС1811_ГИБДД];
GO

CREATE TABLE [dbo].[Заказы] (
	Заказы_Номер INT NOT NULL PRIMARY KEY,
	Заказы_Дата DATE NOT NULL,
	Клиент_Код VARCHAR(6) NOT NULL,
	Услуги_ID INT NOT NULL,
	Услуги_Количество FLOAT NOT NULL,
	Заказы_ДатаОкончания DATE NOT NULL,
	Ответственный VARCHAR NOT NULL,
	Описание TEXT NOT NULL,
	Авто_ГосНомер NVARCHAR(50) NOT NULL,
	Оплачено FLOAT NOT NULL
);
GO

CREATE TABLE [dbo].[Услуги] (
	Услуги_ID INT NOT NULL PRIMARY KEY,
	Услуги_Название VARCHAR(69) NOT NULL,
	Услуги_Стоимость FLOAT NOT NULL,
	Услуги_СрокВыполнения FLOAT NOT NULL
);
GO

CREATE TABLE [dbo].[Скидка] (
	Скидка_Код INT NOT NULL PRIMARY KEY,
	Скидка_Вид INT NOT NULL,
	Скидка_Размер FLOAT NOT NULL
);
GO

ALTER TABLE [dbo].[product]
ADD Скидка_Код INT NULL;

/**//**//**//**//**//**//**/

GO

/* 1 */
SELECT Client.Код AS Клиент, Заказы.Услуги_ID AS Услуга, Услуги.Услуги_Стоимость AS Сумма, Заказы.Оплачено
FROM Client INNER JOIN Заказы ON Client.Код = Заказы.Клиент_Код INNER JOIN Услуги
	ON Заказы.Услуги_ID = Услуги.Услуги_ID AND Заказы.Оплачено < Услуги.Услуги_Стоимость;

GO

/* 2 */
SELECT * FROM Заказы INNER JOIN Услуги
	ON CONVERT(INT, DATEDIFF(hour,  Заказы.Заказы_Дата, GETDATE()) - Услуги.Услуги_СрокВыполнения) / 24 = 3 AND Заказы.Заказы_ДатаОкончания IS NULL
WHERE Заказы.Услуги_ID = Услуги.Услуги_ID;

GO

/* 3 */
SELECT * FROM Услуги WHERE Услуги_СрокВыполнения > 730.001;

GO

/* 4 */
DECLARE @Start DATE, @End DATE;
SET @Start = '2020-01-20'; SET @End = '2020-09-15';
SELECT * FROM Заказы WHERE Заказы.Заказы_Дата >= @Start AND (Заказы.Заказы_ДатаОкончания <= @End OR Заказы.Заказы_ДатаОкончания IS NULL);

GO

/* 5 */
SELECT * FROM product WHERE [Наименование товара] LIKE 'Моторное масло Dexos%';

GO
/* TRIGGER */
CREATE TRIGGER [dbo].[a_tUpdatePrice]
ON [dbo].[product]
AFTER UPDATE
AS

	IF UPDATE(Скидка_Код)
	BEGIN
		DECLARE @table table(	[Наименование товара] [nvarchar](100),
								[Главное изображение] [nvarchar](255),
								[Производитель] [nvarchar](100),
								[Активен?] [char](3),
								[Цена] [decimal](10, 2),
								[Скидка_Код] [int]		);

		UPDATE dbo.product SET product.Цена = Цена
			OUTPUT inserted.[Наименование товара], inserted.[Главное изображение], inserted.Производитель, inserted.[Активен?], inserted.Цена, inserted.Скидка_Код INTO @table
			WHERE (product.Скидка_Код IS NOT NULL);

		UPDATE dbo.product SET product.Цена = product.Цена - product.Цена*(SELECT DISTINCT Скидка.Скидка_Размер FROM product, Скидка WHERE product.Скидка_Код=Скидка.Скидка_Код)*.01
			FROM product, @table WHERE product.[Наименование товара] IN (SELECT [Наименование товара] FROM @table WHERE [Наименование товара] IS NOT NULL) ;
	END

GO

/* Проверка работы триггера */
UPDATE dbo.product SET product.Скидка_Код = 2 WHERE product.[Наименование товара] = 'Моторное масло Dexos 2 95599405';