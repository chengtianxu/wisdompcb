inherited frmBaseOperator_Mod531: TfrmBaseOperator_Mod531
  Caption = 'frmBaseOperator_Mod531'
  ClientHeight = 554
  ClientWidth = 796
  ExplicitWidth = 812
  ExplicitHeight = 593
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDisplay: TPanel
    Left = 0
    Top = 0
    Width = 796
    Height = 554
    Align = alClient
    TabOrder = 0
  end
  object UpdateSQL1: TUpdateSQL
    DeleteSQL.Strings = (
      'DECLARE @TagArr varchar(max)'
      'SET @TagArr = :TagIDArr'
      ''
      'if object_id('#39'tempdb..#tempTable531'#39') is not null '
      'Begin'
      '    drop table #tempTable531'
      'End'
      ''
      'CREATE TABLE #tempTable531'
      '('
      '    rkey int'
      ') '
      ''
      'DECLARE @i    INT '
      'DECLARE @len  INT '
      'SET @i = 1 '
      'WHILE @i < LEN(@TagArr + '#39','#39')'
      'BEGIN'
      '    INSERT #tempTable531'
      
        '    SELECT SUBSTRING(@TagArr + '#39','#39', @i, CHARINDEX('#39','#39', @TagArr +' +
        ' '#39','#39', @i) -@i)'
      '    '
      '    SET @i = CHARINDEX('#39','#39', @TagArr + '#39','#39', @i) + 1'
      'END '
      ''
      
        'DECLARE @T TABLE (ParamID int NOT NULL PRIMARY KEY, ParamName va' +
        'rchar(100))'
      'INSERT INTO @T '
      'SELECT PD.ParamID,PD.ParamName from Pack_PrintTypeDef PD'
      'INNER JOIN Pack_PrintMain PM ON PM.PackID = PD.PackID'
      'inner JOIN #tempTable531 on #tempTable531.rkey = PM.rkey'
      'GROUP BY PD.ParamID,PD.ParamName'
      ''
      'DECLARE @SQL NVARCHAR(max)'
      'SET @SQL = N'#39#39
      ''
      
        'SET @SQL = STUFF((SELECT N'#39','#39' + '#39'MIN(CASE ParamID WHEN '#39' + CAST(' +
        'ParamID AS VARCHAR(10)) + '#39' THEN ParamValue END) AS '#39' + QUOTENAM' +
        'E(ParamName) FROM @T'
      ' FOR XML PATH('#39#39')),1,1,N'#39#39')'
      ' '
      
        'SET @SQL = '#39'SELECT PM.Rkey AS ['#26631#31614'ID],PM.PrintTime AS ['#25171#21360#26085#26399'],PT.R' +
        'eportFile AS ['#26631#31614#21517#31216'],CASE PT.PackType WHEN 0 THEN '#39#39#22806#31665#39#39' WHEN 1 T' +
        'HEN '#39#39#20869#31665#39#39' END AS ['#20869#22806#31665'],  '#39' + @SQL + '#39' FROM Pack_PrintMain PM in' +
        'ner JOIN Pack_PrintDetail PD ON PM.IDKey = PD.MainIDkey '
      'inner join Pack_PrintType PT on PT.PackID = PM.PackID'
      'inner join #tempTable531 on #tempTable531.rkey = PM.Rkey'
      
        'GROUP BY PM.Rkey,PM.FlowNo,PM.PrintTime, PT.ReportFile,PT.PackTy' +
        'pe '#39
      'EXEC SP_EXECUTESQL @SQL')
    Left = 568
    Top = 16
  end
end
