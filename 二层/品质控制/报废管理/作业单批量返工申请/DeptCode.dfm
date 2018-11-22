object Frm_DeptCode: TFrm_DeptCode
  Left = 291
  Top = 283
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23457#25209#37096#38376#26597#25214
  ClientHeight = 588
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 547
    Width = 688
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 261
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 348
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 341
    Top = 16
    Width = 329
    Height = 525
    Caption = 'Panel3'
    TabOrder = 1
    object DBGrid2: TDBGrid
      Left = 1
      Top = 37
      Width = 327
      Height = 487
      Align = alClient
      DataSource = DataSource2
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = DBGrid2TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'USER_LOGIN_NAME'
          Title.Caption = #24037#21495
          Width = 185
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USER_FULL_NAME'
          Title.Caption = #22995#21517
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RKEY'
          Width = 3
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 327
      Height = 36
      Align = alTop
      Caption = 'Panel4'
      TabOrder = 1
      object Label2: TLabel
        Left = 146
        Top = 8
        Width = 33
        Height = 13
        Caption = #24037#21495' '
      end
      object Label4: TLabel
        Left = 39
        Top = 11
        Width = 33
        Height = 13
        Caption = #24037#21495' '
      end
      object Edit1: TEdit
        Left = 79
        Top = 7
        Width = 153
        Height = 21
        TabOrder = 0
        OnChange = Edit1Change
      end
      object BitBtn2: TBitBtn
        Left = 239
        Top = 6
        Width = 21
        Height = 22
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
    end
  end
  object Panel5: TPanel
    Left = 11
    Top = 16
    Width = 329
    Height = 525
    Caption = 'Panel5'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 39
      Width = 327
      Height = 485
      Align = alClient
      DataSource = DataSource1
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DEPT_CODE'
          Title.Caption = #37096#38376#20195#30721
          Width = 148
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEPT_NAME'
          Title.Caption = #37096#38376#21517#31216
          Width = 137
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 327
      Height = 38
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 32
        Top = 13
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #37096#38376#20195#30721
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object MaskEdit1: TMaskEdit
        Left = 89
        Top = 8
        Width = 153
        Height = 21
        TabOrder = 0
        OnChange = MaskEdit1Change
      end
      object BitBtn1: TBitBtn
        Left = 247
        Top = 6
        Width = 25
        Height = 25
        Hint = #21047#26032
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
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
    end
  end
  object DataSource1: TDataSource
    DataSet = ads34
    Left = 96
    Top = 215
  end
  object ads34: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ads34AfterScroll
    CommandText = 
      'SELECT rkey,DEPT_CODE, DEPT_NAME'#13#10'FROM dbo.Data0034'#13#10'WHERE TTYPE' +
      ' = '#39'4'#39
    Parameters = <>
    Prepared = True
    Left = 180
    Top = 230
    object ads34rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads34DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ads34DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object ADODataSet1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT     dbo.Data0073.USER_FULL_NAME, dbo.Data0073.USER_LOGIN_' +
      'NAME, dbo.Data0005.EMPLOYEE_ID, dbo.Data0073.RKEY'#13#10'FROM         ' +
      'dbo.Data0073 INNER JOIN'#13#10'                      dbo.Data0005 ON d' +
      'bo.Data0073.EMPLOYEE_PTR = dbo.Data0005.RKEY'#13#10'WHERE     (dbo.Dat' +
      'a0073.ACTIVE_FLAG = 0) and Data0005.EMPLOYEE_ID = :rkey34'
    IndexFieldNames = 'EMPLOYEE_ID'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey34'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 236
    Top = 184
    object ADODataSet1USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADODataSet1USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADODataSet1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADODataSet1EMPLOYEE_ID: TIntegerField
      FieldName = 'EMPLOYEE_ID'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADODataSet1
    Left = 256
    Top = 280
  end
end
