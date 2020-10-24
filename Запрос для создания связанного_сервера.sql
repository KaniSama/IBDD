USE [��1811_�����];
GO

/* ���������� ���������� ������� */
EXEC sp_addlinkedserver
	@server = '10.0.10.250\SQLEXPRESS',
	@srvproduct = 'SQL Server';
GO

/* �������� �������� ��������� ��� ��������� ��������� �������� ������ �� �������� ������� */
CREATE PROCEDURE remote_viewTables @TABLE_NAME NVARCHAR(50)
AS
	SELECT 		DATA_TYPE AS '��� ������',
				Cols.COLUMN_NAME AS '�������� �������',
				Keys.COLUMN_NAME AS '��������� ����'
	FROM 		[10.0.10.250\SQLEXPRESS].[Avto_servis].INFORMATION_SCHEMA.COLUMNS Cols
				LEFT JOIN
				[10.0.10.250\SQLEXPRESS].[Avto_servis].INFORMATION_SCHEMA.KEY_COLUMN_USAGE Keys 
	ON 			Cols.COLUMN_NAME = Keys.COLUMN_NAME
	WHERE 		Cols.TABLE_NAME = @TABLE_NAME;
GO

/* �������� ��������� ������ ������. !!����� ����� ����� �� ��������� ������� ����� ������� ������� � ����� �� ����������!! */
EXEC remote_viewTables @TABLE_NAME = 'Client';
EXEC remote_viewTables @TABLE_NAME = 'product';

GO


/**//**/
/* ����������� ������ � ��������� ������� �� ��������� ������ � ��������� �������. !!������� ������ ���� ��� �������!! */
INSERT INTO [��1811_�����].[dbo].[Client]
	SELECT * FROM [10.0.10.250\SQLEXPRESS].[Avto_servis].dbo.Client;
INSERT INTO [��1811_�����].[dbo].[product]
	SELECT * FROM [10.0.10.250\SQLEXPRESS].[Avto_servis].dbo.product;

/* �������� ����������� ����������� ������ */
SELECT * FROM [10.0.10.250\SQLEXPRESS].[Avto_servis].[dbo].[product];
SELECT * FROM product;