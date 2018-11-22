object frmshowMat: TfrmshowMat
  Left = 99
  Top = 233
  Width = 901
  Height = 480
  Caption = #20179#24211#21407#26448#26009#32467#23384
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    893
    453)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 893
    Height = 401
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
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #26448#26009#20195#21495
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Title.Caption = #26448#26009#21517#31216
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_CODE'
        Title.Caption = #21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_price'
        Title.Alignment = taRightJustify
        Title.Caption = #21333#20215
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Title.Alignment = taRightJustify
        Title.Caption = #25968#37327
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Title.Caption = #20179#24211
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECD_DATE'
        Title.Caption = #26469#26009#26085#26399
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        Title.Caption = #26377#25928#26399
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Title.Caption = #22791#27880
        Width = 80
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 442
    Top = 416
    Width = 67
    Height = 25
    Anchors = [akBottom]
    Caption = #30830#23450
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 344
    Top = 416
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
    DataSet = DM.Qery445
    Left = 152
    Top = 240
  end
end
