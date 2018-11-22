object sfrm: Tsfrm
  Left = 298
  Top = 146
  Width = 928
  Height = 480
  Caption = #20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 912
    Height = 444
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ppath'
        Title.Caption = #36335#24452
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pname'
        Title.Caption = #31243#24207#21517
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vertext'
        Title.Caption = #29256#26412
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'filename'
        Title.Caption = #26085#24535#25991#20214#21517
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'filesize'
        Title.Caption = #26085#24535#22823#23567
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'linestr'
        Title.Caption = #26085#24535#26377#25928#20869#23481
        Width = 400
        Visible = True
      end>
  end
  object ADOQuery1: TADOQuery
    Connection = dm.aconn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT programs.ppath, programs.pname, programs.vertext, filelis' +
        't.filename, filelist.filesize, data.linestr'
      
        'FROM programs INNER JOIN (filelist INNER JOIN data ON filelist.I' +
        'D = data.fromfile) ON programs.ID = filelist.frompath;')
    Left = 103
    Top = 13
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 169
    Top = 15
  end
end
