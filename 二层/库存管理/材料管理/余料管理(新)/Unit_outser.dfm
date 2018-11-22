object Form_outser: TForm_outser
  Left = 382
  Top = 268
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20313#26009#20986#20179#24211#23384#26597#35810
  ClientHeight = 478
  ClientWidth = 870
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 870
    Height = 440
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = N8Click
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'MAT_CODE'
        Title.Color = clRed
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mat_desc'
        Width = 245
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LEN_SIZE'
        Title.Caption = #32428#21521
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WEI_SIZE'
        Title.Caption = #32463#21521
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARK'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PeiLiaoDan'
        Title.Caption = #37197#26009#21333
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 38
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 186
      Top = 15
      Width = 52
      Height = 13
      Caption = #20313#26009#32534#21495
    end
    object key15: TLabel
      Left = 423
      Top = 16
      Width = 169
      Height = 13
      Caption = #27880#65306#27492#22788#21482#26174#31034#24050#23457#26680#30340#20313#26009
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 5
      Top = 4
      Width = 60
      Height = 30
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkClose
    end
    object BitBtn2: TBitBtn
      Left = 374
      Top = 9
      Width = 25
      Height = 25
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
    object Edit1: TEdit
      Left = 245
      Top = 10
      Width = 121
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 2
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
    end
    object BitBtn3: TBitBtn
      Left = 88
      Top = 4
      Width = 60
      Height = 29
      Caption = #20986#20179
      TabOrder = 3
      OnClick = N8Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000000000777770FFFFFFFFF0777770F8888888F0777770FFFFFFFFF0
        777770F888888FF0777770FFFFFFFFF0777770F8888888F0777770FFFFFFFFF0
        7777744444444444777774444444444477177777777777777717777777777771
        7177777777777771177777777777777111777777777777777777}
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 224
    Top = 112
    object N8: TMenuItem
      Caption = #20986#20179
      OnClick = N8Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 461
    Top = 153
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'v_key15'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'v_key16'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'SELECT distinct dbo.Data0017.INV_DESCRIPTION, dbo.DATA0556.MAT_C' +
        'ODE,'
      
        '      dbo.DATA0556.WEI_SIZE, dbo.DATA0556.LEN_SIZE,dbo.DATA0556.' +
        'rkey, '
      
        '      dbo.DATA0556.QUAN_ON_HAND,data0556.REMARK,data0556.mat_des' +
        'c,dbo.DATA0556.PeiLiaoDan'
      'FROM dbo.DATA0556 INNER JOIN'
      '      dbo.Data0017 ON dbo.DATA0556.RKEY17 = dbo.Data0017.RKEY'
      '      inner join data0557 on data0556.rkey=data0557.d556_ptr'
      '      inner join data0558 on data0557.d558_ptr=data0558.rkey'
      'where data0556.quan_on_hand>0'
      ' and data0556.Status=1'
      ' and data0558.rkey15=:v_key15'
      ' and data0558.rkey16=:v_key16')
    Left = 521
    Top = 145
    object ADOQuery1MAT_CODE: TStringField
      DisplayLabel = #20313#26009#32534#21495
      FieldName = 'MAT_CODE'
      Size = 25
    end
    object ADOQuery1INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOQuery1WEI_SIZE: TBCDField
      DisplayLabel = #20313#26009#23485#24230
      FieldName = 'WEI_SIZE'
      Precision = 6
      Size = 2
    end
    object ADOQuery1LEN_SIZE: TBCDField
      DisplayLabel = #20313#26009#38271#24230
      FieldName = 'LEN_SIZE'
      Precision = 6
      Size = 2
    end
    object ADOQuery1QUAN_ON_HAND: TIntegerField
      DisplayLabel = #20313#26009#24635#24211#23384
      FieldName = 'QUAN_ON_HAND'
    end
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1REMARK: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'REMARK'
      Size = 50
    end
    object ADOQuery1mat_desc: TStringField
      DisplayLabel = #20313#26009#35268#26684
      FieldName = 'mat_desc'
      Size = 80
    end
    object ADOQuery1PeiLiaoDan: TStringField
      FieldName = 'PeiLiaoDan'
      Size = 220
    end
  end
end
