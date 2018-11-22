if not exists (SELECT syscolumns.id
                   FROM sysobjects INNER JOIN
                        syscolumns ON sysobjects.id = syscolumns.id
                   WHERE (sysobjects.name = 'Data0085') AND (syscolumns.name = N'QuoteType'))
   ALTER TABLE [Data0085] ADD [QuoteType] [int] NULL DEFAULT 0
 
GO

if not exists (SELECT syscolumns.id
                   FROM sysobjects INNER JOIN
                        syscolumns ON sysobjects.id = syscolumns.id
                   WHERE (sysobjects.name = 'Data0432') AND (syscolumns.name = N'TypeMark'))

   ALTER TABLE [Data0432] ADD  [TypeMark] [int] NULL 
 
GO

if not(exists (SELECT syscolumns.id AS Expr3
		FROM sysobjects INNER JOIN
		      syscolumns ON sysobjects.id = syscolumns.id
		WHERE (sysobjects.name = N'data0085') AND 
		      (syscolumns.name = N'BasePricePtr')))
   ALTER  TABLE [Data0085] ADD [BasePricePtr] [int] NULL 
go