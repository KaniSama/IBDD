USE [��1811_�����];
GO

CREATE TABLE [dbo].[������] (
	������_����� INT NOT NULL PRIMARY KEY,
	������_���� DATE NOT NULL,
	������_��� VARCHAR(6) NOT NULL,
	������_ID INT NOT NULL,
	������_���������� FLOAT NOT NULL,
	������_������������� DATE NOT NULL,
	������������� VARCHAR NOT NULL,
	�������� TEXT NOT NULL,
	����_�������� NVARCHAR(50) NOT NULL,
	�������� FLOAT NOT NULL
);
GO

CREATE TABLE [dbo].[������] (
	������_ID INT NOT NULL PRIMARY KEY,
	������_�������� VARCHAR(69) NOT NULL,
	������_��������� FLOAT NOT NULL,
	������_�������������� FLOAT NOT NULL
);
GO

CREATE TABLE [dbo].[������] (
	������_��� INT NOT NULL PRIMARY KEY,
	������_��� INT NOT NULL,
	������_������ FLOAT NOT NULL
);
GO

ALTER TABLE [dbo].[product]
ADD ������_��� INT NULL;

/**//**//**//**//**//**//**/

GO

/* 1 */
SELECT Client.��� AS ������, ������.������_ID AS ������, ������.������_��������� AS �����, ������.��������
FROM Client INNER JOIN ������ ON Client.��� = ������.������_��� INNER JOIN ������
	ON ������.������_ID = ������.������_ID AND ������.�������� < ������.������_���������;

GO

/* 2 */
SELECT * FROM ������ INNER JOIN ������
	ON CONVERT(INT, DATEDIFF(hour,  ������.������_����, GETDATE()) - ������.������_��������������) / 24 = 3 AND ������.������_������������� IS NULL
WHERE ������.������_ID = ������.������_ID;

GO

/* 3 */
SELECT * FROM ������ WHERE ������_�������������� > 730.001;

GO

/* 4 */
DECLARE @Start DATE, @End DATE;
SET @Start = '2020-01-20'; SET @End = '2020-09-15';
SELECT * FROM ������ WHERE ������.������_���� >= @Start AND (������.������_������������� <= @End OR ������.������_������������� IS NULL);

GO

/* 5 */
SELECT * FROM product WHERE [������������ ������] LIKE '�������� ����� Dexos%';

GO
/* TRIGGER */
CREATE TRIGGER [dbo].[a_tUpdatePrice]
ON [dbo].[product]
AFTER UPDATE
AS

	IF UPDATE(������_���)
	BEGIN
		DECLARE @table table(	[������������ ������] [nvarchar](100),
								[������� �����������] [nvarchar](255),
								[�������������] [nvarchar](100),
								[�������?] [char](3),
								[����] [decimal](10, 2),
								[������_���] [int]		);

		UPDATE dbo.product SET product.���� = ����
			OUTPUT inserted.[������������ ������], inserted.[������� �����������], inserted.�������������, inserted.[�������?], inserted.����, inserted.������_��� INTO @table
			WHERE (product.������_��� IS NOT NULL);

		UPDATE dbo.product SET product.���� = product.���� - product.����*(SELECT DISTINCT ������.������_������ FROM product, ������ WHERE product.������_���=������.������_���)*.01
			FROM product, @table WHERE product.[������������ ������] IN (SELECT [������������ ������] FROM @table WHERE [������������ ������] IS NOT NULL) ;
	END

GO

/* �������� ������ �������� */
UPDATE dbo.product SET product.������_��� = 2 WHERE product.[������������ ������] = '�������� ����� Dexos 2 95599405';