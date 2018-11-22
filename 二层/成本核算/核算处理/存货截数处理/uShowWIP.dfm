object frmshowWIP: TfrmshowWIP
  Left = 211
  Top = 185
  Width = 864
  Height = 480
  Caption = #24037#24207#22312#21046#21697#32467#23384
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    848
    442)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 856
    Height = 406
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WORK_ORDER_NUMBER'
        Title.Caption = #20316#19994#21333#21495
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Title.Caption = #23458#25143#20195#30721
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_CODE'
        Title.Caption = #24037#24207#20195#30721
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Title.Caption = #24037#24207#21517#31216
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STEP'
        Title.Caption = #27493#39588
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_NO'
        Title.Caption = #38144#21806#35746#21333
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUT_NO'
        Title.Caption = #37197#26009#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Title.Alignment = taRightJustify
        Title.Caption = #25968#37327
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INDATE'
        Title.Caption = #25509#25910#26085#26399
        Width = 103
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 424
    Top = 414
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #30830#23450
    Default = True
    ModalResult = 2
    TabOrder = 1
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 339
    Top = 414
    Width = 64
    Height = 25
    Anchors = [akBottom]
    Caption = #23548#20986
    TabOrder = 2
    OnClick = BitBtn2Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
      DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
      EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
      DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
      70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
  end
  object DataSource1: TDataSource
    DataSet = DM.Qery448
    Left = 176
    Top = 152
  end
end
