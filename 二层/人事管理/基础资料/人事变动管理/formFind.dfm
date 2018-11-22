object frmFind: TfrmFind
  Left = 442
  Top = 442
  BorderStyle = bsDialog
  Caption = #26597#35810#26465#20214#35774#32622
  ClientHeight = 416
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 1
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 386
    Width = 512
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 163
      Top = 2
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 278
      Top = 2
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 1
    Width = 512
    Height = 385
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 0
      Width = 511
      Height = 385
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 0
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 511
        Height = 385
        Align = alClient
        DataSource = DataSource1
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'FieldName'
            Footers = <>
            Visible = False
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'FieldCaption'
            Footers = <>
            ReadOnly = True
            Width = 105
          end
          item
            EditButtons = <>
            FieldName = 'FieldKind'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'Oper'
            Footers = <>
            Width = 49
          end
          item
            AlwaysShowEditButton = True
            AutoDropDown = True
            EditButtons = <>
            FieldName = 'Condvalu'
            Footers = <>
            Width = 113
            OnEditButtonClick = DBGridEh1Columns4EditButtonClick
          end
          item
            EditButtons = <>
            FieldName = 'Condvalu2'
            Footers = <>
            Width = 113
          end
          item
            EditButtons = <>
            FieldName = 'FieldDataType'
            Footers = <>
            Visible = False
          end>
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 1
      Height = 385
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 135
        Height = 385
        Align = alLeft
        ItemHeight = 13
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 136
        Top = 112
        Width = 25
        Height = 25
        Caption = '>>'
        TabOrder = 1
      end
      object BitBtn2: TBitBtn
        Left = 136
        Top = 160
        Width = 25
        Height = 25
        Caption = '<<'
        TabOrder = 2
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 336
    Top = 160
  end
  object ADOQuery1: TADOQuery
    Connection = DM.cn_change
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'declare @tb table([FieldName] varChar(20),[FieldDataType] varcha' +
        'r(15),[FieldKind] tinyint,[FieldCaption] nvarchar(50),[Oper] var' +
        'char(15),[Condvalu] varchar(50),[Condvalu2] varchar(50)) --'#21019#24314#34920#21464#37327
      'select * from @tb')
    Left = 336
    Top = 104
    object ADOQuery1FieldCaption: TWideStringField
      DisplayLabel = #26465#20214#21517
      FieldName = 'FieldCaption'
      Size = 50
    end
    object ADOQuery1FieldKind: TWordField
      FieldName = 'FieldKind'
      Visible = False
    end
    object ADOQuery1Oper: TStringField
      DisplayLabel = #36816#31639#31526
      FieldName = 'Oper'
      Size = 15
    end
    object ADOQuery1Condvalu: TStringField
      DisplayLabel = #26465#20214#20540
      FieldName = 'Condvalu'
      OnSetText = ADOQuery1CondvaluSetText
      Size = 50
    end
    object ADOQuery1Condvalu2: TStringField
      DisplayLabel = #26465#20214#20540'2'
      FieldName = 'Condvalu2'
      OnSetText = ADOQuery1Condvalu2SetText
      Size = 50
    end
    object ADOQuery1FieldDataType: TStringField
      FieldName = 'FieldDataType'
      Size = 15
    end
    object ADOQuery1FieldName: TStringField
      DisplayLabel = #23383#27573#21517
      FieldName = 'FieldName'
      Visible = False
    end
  end
end
