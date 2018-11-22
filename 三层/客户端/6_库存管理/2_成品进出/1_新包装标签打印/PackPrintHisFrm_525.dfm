inherited frmPackPrintHis_525: TfrmPackPrintHis_525
  Caption = #26631#31614#25171#21360#21382#21490
  ClientHeight = 632
  ClientWidth = 948
  ExplicitWidth = 964
  ExplicitHeight = 671
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 948
    Height = 632
    ExplicitWidth = 948
    ExplicitHeight = 632
    inherited pnlDisplayMain: TPanel
      Width = 948
      Height = 632
      ExplicitWidth = 948
      ExplicitHeight = 632
      inherited pnlChildMain: TPanel
        Width = 946
        Height = 630
        ExplicitWidth = 946
        ExplicitHeight = 630
        inherited pnlEhMainDisplay: TPanel
          Width = 944
          Height = 599
          ExplicitWidth = 944
          ExplicitHeight = 599
          inherited ehMain: TDBGridEh
            Width = 942
            Height = 597
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 944
          ExplicitWidth = 944
          inherited lblFilter: TLabel
            Left = 333
            Top = 7
            ExplicitLeft = 333
            ExplicitTop = 7
          end
          object lbl1: TLabel [1]
            Left = 600
            Top = 8
            Width = 36
            Height = 13
            Caption = #26102#38388#65306
          end
          object lbl2: TLabel [2]
            Left = 768
            Top = 8
            Width = 12
            Height = 13
            Caption = #33267
          end
          inherited btnQry: TBitBtn
            Visible = False
          end
          inherited btnZD: TBitBtn
            Visible = False
          end
          inherited edtFliter: TEdit
            Left = 390
            Top = 3
            ExplicitLeft = 390
            ExplicitTop = 3
          end
          inherited btnAuthDispatch: TBitBtn
            Visible = False
          end
          object dtp1: TDateTimePicker
            Left = 639
            Top = 4
            Width = 113
            Height = 21
            Date = 42755.000000000000000000
            Time = 42755.000000000000000000
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 8
          end
          object dtp2: TDateTimePicker
            Left = 792
            Top = 4
            Width = 113
            Height = 21
            Date = 42755.999988425930000000
            Time = 42755.999988425930000000
            ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
            TabOrder = 9
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      ';DECLARE @T TABLE (ParamID int NOT NULL PRIMARY KEY, ParamName v' +
      'archar(100));'#13#10'INSERT INTO @T '#13#10'SELECT ParamID,ParamName from Pa' +
      'ck_PrintTypeDef WHERE PackID = :PPackID;'#13#10'DECLARE @SQL NVARCHAR(' +
      '4000)'#13#10'SET @SQL = N'#39#39';'#13#10#13#10'SET @SQL = STUFF((SELECT N'#39','#39' + '#39'MIN(C' +
      'ASE ParamID WHEN '#39' + CAST(ParamID AS VARCHAR(10)) + '#39' THEN Param' +
      'Value END) AS '#39' + QUOTENAME(ParamName) FROM @T'#13#10' FOR XML PATH('#39#39 +
      ')),1,1,N'#39#39')'#13#10' '#13#10'SET @SQL = '#39'SELECT PM.Rkey AS ['#26631#31614'ID],PM.FLowNo A' +
      'S ['#27969#27700#21495'],PM.PrintTime AS ['#25171#21360#26085#26399'], '#39' + @SQL + '#39' FROM Pack_PrintMain' +
      ' PM inner JOIN Pack_PrintDetail PD ON PM.Rkey = PD.MainRkey WHER' +
      'E PM.PackID = :PPackID AND PM.PrintTime BETWEEN :T1 AND :T2 GROU' +
      'P BY PM.Rkey,PM.FlowNo,PM.PrintTime '#39#13#10'EXEC SP_EXECUTESQL @SQL'
    Params = <
      item
        DataType = ftUnknown
        Name = 'PPackID'
        ParamType = ptUnknown
      end>
  end
end
