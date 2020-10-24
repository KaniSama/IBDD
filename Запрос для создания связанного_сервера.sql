USE [ИС1811_ГИБДД];
GO

/* Добавление связанного сервера */
EXEC sp_addlinkedserver
	@server = '10.0.10.250\SQLEXPRESS',
	@srvproduct = 'SQL Server';
GO

/* Создание хранимой процедуры для упрощения просмотра структур таблиц на удалённом сервере */
CREATE PROCEDURE remote_viewTables @TABLE_NAME NVARCHAR(50)
AS
	SELECT 		DATA_TYPE AS 'Тип данных',
				Cols.COLUMN_NAME AS 'Название столбца',
				Keys.COLUMN_NAME AS 'Первичный ключ'
	FROM 		[10.0.10.250\SQLEXPRESS].[Avto_servis].INFORMATION_SCHEMA.COLUMNS Cols
				LEFT JOIN
				[10.0.10.250\SQLEXPRESS].[Avto_servis].INFORMATION_SCHEMA.KEY_COLUMN_USAGE Keys 
	ON 			Cols.COLUMN_NAME = Keys.COLUMN_NAME
	WHERE 		Cols.TABLE_NAME = @TABLE_NAME;
GO

/* Просмотр структуры нужных таблиц. !!После этого этапа на локальном сервере нужно создать таблицы с такой же структурой!! */
EXEC remote_viewTables @TABLE_NAME = 'Client';
EXEC remote_viewTables @TABLE_NAME = 'product';

GO


/**//**/
/* Копирование данных с удалённого сервера на локальный сервер в созданные таблицы. !!ТАБЛИЦЫ ДОЛЖНЫ БЫТЬ УЖЕ СОЗДАНЫ!! */
INSERT INTO [ИС1811_ГИБДД].[dbo].[Client]
	SELECT * FROM [10.0.10.250\SQLEXPRESS].[Avto_servis].dbo.Client;
INSERT INTO [ИС1811_ГИБДД].[dbo].[product]
	SELECT * FROM [10.0.10.250\SQLEXPRESS].[Avto_servis].dbo.product;

/* Проверка правильного копирования данных */
SELECT * FROM [10.0.10.250\SQLEXPRESS].[Avto_servis].[dbo].[product];
SELECT * FROM product;