object frmSelKeyP: TfrmSelKeyP
  Left = 291
  Top = 151
  Width = 882
  Height = 581
  Caption = #36873#25321#20851#38190#23703#20301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 874
    Height = 550
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 872
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbl3: TLabel
        Left = 53
        Top = 11
        Width = 52
        Height = 13
        Caption = #20851#38190#23703#20301
      end
      object edt_KeyP: TEdit
        Left = 108
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object btn_SelKeyP: TButton
        Left = 229
        Top = 8
        Width = 33
        Height = 21
        Caption = '...'
        TabOrder = 1
        OnClick = btn_SelKeyPClick
      end
      object btn_OK: TButton
        Left = 336
        Top = 8
        Width = 65
        Height = 25
        Caption = #30830#23450
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btn_OKClick
      end
      object btn_CLose: TButton
        Left = 416
        Top = 8
        Width = 66
        Height = 25
        Caption = #21462#28040
        TabOrder = 3
        OnClick = btn_CLoseClick
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 42
      Width = 872
      Height = 507
      Align = alClient
      TabOrder = 1
      object pnl4: TPanel
        Left = 265
        Top = 1
        Width = 606
        Height = 505
        Align = alClient
        TabOrder = 0
        object pnl7: TPanel
          Left = 1
          Top = 1
          Width = 604
          Height = 32
          Align = alTop
          TabOrder = 0
          object lbl2: TLabel
            Left = 24
            Top = 8
            Width = 156
            Height = 13
            Caption = #20851#38190#23703#20301#26631#20934#23545#24212#30340#22521#35757#65306
          end
        end
        object ehTrain: TDBGridEh
          Left = 1
          Top = 33
          Width = 604
          Height = 471
          Align = alClient
          DataSource = ds_train
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'Train_topics'
              Footers = <>
              Title.Caption = #22521#35757#20027#39064
              Width = 105
            end
            item
              EditButtons = <>
              FieldName = 'Train_grade'
              Footers = <>
              Title.Caption = #24471#20998
              Width = 40
            end
            item
              EditButtons = <>
              FieldName = 'Train_result'
              Footers = <>
              Title.Caption = #22521#35757#32467#26524
              Width = 58
            end
            item
              EditButtons = <>
              FieldName = 'Train_status'
              Footers = <>
              Title.Caption = #22521#35757#29366#24577
              Width = 58
            end
            item
              EditButtons = <>
              FieldName = 'startT'
              Footers = <>
              Title.Caption = #24320#22987#26102#38388
              Width = 95
            end
            item
              EditButtons = <>
              FieldName = 'endT'
              Footers = <>
              Title.Caption = #32467#26463#26102#38388
              Width = 104
            end
            item
              EditButtons = <>
              FieldName = 'Train_content'
              Footers = <>
              Title.Caption = #22521#35757#20869#23481
              Width = 118
            end>
        end
      end
      object pnl5: TPanel
        Left = 1
        Top = 1
        Width = 264
        Height = 505
        Align = alLeft
        TabOrder = 1
        object pnl6: TPanel
          Left = 1
          Top = 1
          Width = 262
          Height = 32
          Align = alTop
          TabOrder = 0
          object lbl1: TLabel
            Left = 8
            Top = 8
            Width = 91
            Height = 13
            Caption = #20851#38190#23703#20301#26631#20934#65306
          end
          object lbl4: TLabel
            Left = 104
            Top = 8
            Width = 91
            Height = 13
            Caption = #21592#24037#23454#38469#24037#40836#65306
          end
          object lbl5: TLabel
            Left = 232
            Top = 8
            Width = 13
            Height = 13
            Caption = #24180
          end
          object edt_WYear: TEdit
            Left = 192
            Top = 5
            Width = 36
            Height = 21
            Color = clScrollBar
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clInfoText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object ehS: TDBGridEh
          Left = 1
          Top = 33
          Width = 262
          Height = 471
          Align = alClient
          DataSource = ds_s
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'IsSelected'
              Footers = <>
              Title.Caption = #36873#25321
            end
            item
              EditButtons = <>
              FieldName = 'SType'
              Footers = <>
              Title.Caption = #26631#20934#31867#22411
              Width = 58
            end
            item
              EditButtons = <>
              FieldName = 'reqItem'
              Footers = <>
              Title.Caption = #26631#20934#35828#26126
              Width = 175
            end>
        end
      end
    end
  end
  object ds_s: TDataSource
    DataSet = qry_s
    Left = 50
    Top = 203
  end
  object ds_train: TDataSource
    DataSet = qry_train
    Left = 386
    Top = 203
  end
  object qry_s: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'P1'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @TempTable table(IsSelected bit)      '
      '  insert @TempTable'
      '  values (0)'
      ''
      
        ' select  c.IsSelected, case when reqType=0 then '#39#22521#35757#39'  when reqTy' +
        'pe=1 then '#39#24037#40836#39'   when reqType=2  then '#39#23398#21382#39' else '#39#39'   end as STyp' +
        'e, b.reqItem '
      '  from hr_keyposition  a'
      '  inner join  hr_PositionReq b on a.rkey=b.keyid'
      'join @TempTable  c on 1=1'
      '  where  reqType=0 and  b.keyid=:P1')
    Left = 90
    Top = 203
    object qry_sIsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object qry_sSType: TStringField
      FieldName = 'SType'
      ReadOnly = True
      Size = 4
    end
    object wdstrngfld_sreqItem: TWideStringField
      FieldName = 'reqItem'
      Size = 100
    end
  end
  object qry_train: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'P1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'P2'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select Train_topics,'
      
        'convert(varchar(10),startdate,120)+'#39' '#39'+starttime as startT, conv' +
        'ert(varchar(10),enddate,120)+'#39' '#39'+endtime as endT,'
      'Train_grade,Train_result,Train_content,Train_status'
      'from employee_train a '
      'left join datadetail c on a.type_ptr=c.rkey'
      'where   c.item='#39#20851#38190#23703#20301#39'   and  a.employeeid=:P1'
      'and  a.KeyPositionId=:P2')
    Left = 458
    Top = 203
    object qry_trainTrain_topics: TWideStringField
      FieldName = 'Train_topics'
      Size = 50
    end
    object qry_trainstartT: TStringField
      FieldName = 'startT'
      ReadOnly = True
      Size = 31
    end
    object qry_trainendT: TStringField
      FieldName = 'endT'
      ReadOnly = True
      Size = 31
    end
    object qry_trainTrain_grade: TWideStringField
      FieldName = 'Train_grade'
    end
    object qry_trainTrain_result: TWideStringField
      FieldName = 'Train_result'
    end
    object qry_trainTrain_content: TWideStringField
      FieldName = 'Train_content'
      Size = 200
    end
    object qry_trainTrain_status: TIntegerField
      FieldName = 'Train_status'
    end
  end
end
