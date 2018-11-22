object frmMain: TfrmMain
  Left = 198
  Top = 145
  Width = 1017
  Height = 653
  Caption = #38598#22242#25253#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 424
    Top = 8
    object N01: TMenuItem
      Caption = #20986#20837#24211#25253#34920
      ImageIndex = 0
      object N1: TMenuItem
        Tag = 1
        Caption = #20986#24211#26126#32454#26597#35810
        OnClick = N1Click
      end
      object N2: TMenuItem
        Tag = 2
        Caption = #20986#24211#27719#24635#26597#35810
        ImageIndex = 0
        OnClick = N1Click
      end
      object N_Separate0: TMenuItem
        Caption = '-'
      end
      object N3: TMenuItem
        Tag = 3
        Caption = #20837#24211#26126#32454#26597#35810
        OnClick = N1Click
      end
    end
    object N03: TMenuItem
      Caption = #24211#23384#25253#34920
      ImageIndex = 0
      object N4: TMenuItem
        Tag = 4
        Caption = #24211#23384#26126#32454#26597#35810
        OnClick = N1Click
      end
      object N5: TMenuItem
        Tag = 5
        Caption = #24211#23384#27719#24635#26597#35810
        ImageIndex = 0
        OnClick = N1Click
      end
    end
    object N04: TMenuItem
      Caption = #22312#36884#25253#34920
      ImageIndex = 0
      object N6: TMenuItem
        Tag = 6
        Caption = #22312#36884#26126#32454#26597#35810
        OnClick = N1Click
      end
    end
    object N05: TMenuItem
      Caption = #20379#24212#21830#20449#24687
      object N7: TMenuItem
        Tag = 7
        Caption = #20379#24212#21830#20449#24687#26597#35810
        OnClick = N1Click
      end
    end
    object N06: TMenuItem
      Caption = #26448#26009#20449#24687
      object N8: TMenuItem
        Tag = 8
        Caption = #26448#26009#20449#24687#26597#35810
        OnClick = N1Click
      end
    end
    object N07: TMenuItem
      Caption = #35831#36141#25253#34920
      object N9: TMenuItem
        Tag = 9
        Caption = #29983#20135#29289#26009#35831#36141#26597#35810
        OnClick = N1Click
      end
      object N10: TMenuItem
        Tag = 10
        Caption = #38750#29983#20135#29289#26009#35831#36141#26597#35810
        OnClick = N1Click
      end
    end
    object N08: TMenuItem
      Caption = #37319#36141#25253#34920
      object N11: TMenuItem
        Tag = 11
        Caption = #29983#20135#29289#26009#37319#36141#26597#35810'('#20934#26102#20132#20184#29575')'
        OnClick = N1Click
      end
      object N12: TMenuItem
        Tag = 12
        Caption = #38750#29983#20135#29289#26009#37319#36141#26597#35810'('#20934#26102#20132#20184#29575')'
        OnClick = N1Click
      end
      object N_Separate1: TMenuItem
        Caption = '-'
      end
      object N13: TMenuItem
        Tag = 13
        Caption = 'Cost Down '#20449#24687#26597#35810
        OnClick = N1Click
      end
    end
    object N99: TMenuItem
      Caption = #36864#20986
      OnClick = N99Click
    end
  end
  object adoConn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=wisdompcb_public;Da' +
      'ta Source=172.18.12.2;Use Procedure for Prepare=1;Auto Translate' +
      '=True;Packet Size=4096;Workstation ID=PC-20150130VGBU;Use Encryp' +
      'tion for Data=False;Tag with column collation when possible=Fals' +
      'e'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 424
    Top = 64
  end
end
