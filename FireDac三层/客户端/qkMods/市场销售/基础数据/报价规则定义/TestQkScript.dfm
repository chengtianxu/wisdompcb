object frmqkScriptTest: TfrmqkScriptTest
  Left = 0
  Top = 0
  Caption = 'frmqkScriptTest'
  ClientHeight = 652
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 889
    Height = 652
    ActivePage = ts2
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
      object mmo1: TMemo
        Left = 0
        Top = 3
        Width = 799
        Height = 510
        Lines.Strings = (
          'uses'
          'qkImport,Dialogs,TestQkScript;'
          ''
          'function qstr(astr: string): string;'
          'begin'
          'result := '#39#39#39#39'+astr+'#39#39#39#39';'
          'end;'
          'function TB(ATableName,X,Y: string): string;'
          'var'
          '  LSql: string;'
          '  LDs: TFDMemTable;'
          'begin'
          
            '  LSql := '#39'SELECT gBase_2DTable_Detail.TValue FROM gBase_2DTable' +
            ' '#39' +'
          
            '          '#39' INNER JOIN gBase_2DTable_Detail on gBase_2DTable.IDK' +
            'ey = gBase_2DTable_Detail.Parent_Ptr'#39' +'
          '          '#39' WHERE gBase_2DTable.TName = '#39'+ qstr(ATableName) +'
          '          '#39' AND gBase_2DTable_Detail.X = '#39' + qstr(x) +'
          '          '#39' AND gBase_2DTable_Detail.Y = '#39' + qstr(y);'
          ''
          '  LDs := TFDMemTable.Create(frmqkScriptTest);'
          '//Result := LSql;'
          '//exit;'
          '  try'
          '   if SqlOpen(frmqkScriptTest.mt1,LSql) then'
          '    begin'
          '  frmqkScriptTest.mt2.data := frmqkScriptTest.mt1.data;'
          
            '      Result := frmqkScriptTest.mt1.FieldByName('#39'TValue'#39').AsStri' +
            'ng;'
          '   end else'
          '      Exit;'
          '  finally'
          '   LDs.Free;'
          '  end;'
          ''
          'end;'
          ''
          'begin'
          'ShowMessage(TB('#39#24037#31243#36153#39','#39#20108#38454'HDI'#26495'-'#38169#23380#39','#39'12'#39'));'
          'end.')
        TabOrder = 0
      end
      object btn1: TButton
        Left = 344
        Top = 552
        Width = 75
        Height = 25
        Caption = 'btn1'
        TabOrder = 1
        OnClick = btn1Click
      end
      object grd1: TDBGrid
        Left = 568
        Top = 416
        Width = 320
        Height = 120
        DataSource = ds2
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object btn2: TButton
        Left = 624
        Top = 520
        Width = 75
        Height = 25
        Caption = 'btn2'
        TabOrder = 0
        OnClick = btn2Click
      end
      object mmo2: TMemo
        Left = 3
        Top = 3
        Width = 574
        Height = 598
        TabOrder = 1
      end
    end
  end
  object mt1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 308
    Top = 400
  end
  object mt2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 620
    Top = 584
  end
  object ds2: TDataSource
    DataSet = mt2
    Left = 700
    Top = 568
  end
end
