object fm_demo: Tfm_demo
  OldCreateOrder = False
  Left = 220
  Top = 335
  Height = 150
  Width = 215
  object ds_source: TDataSource
    AutoEdit = False
    DataSet = qry_adoqry
    Left = 146
    Top = 29
  end
  object qry_adoqry: TADOQuery
    Connection = cn_adocon
    CursorType = ctStatic
    AfterDelete = qry_adoqryAfterDelete
    OnDeleteError = qry_adoqryDeleteError
    OnPostError = qry_adoqryPostError
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'select unit_code '#21333#20301#20195#30721',unit_name '#21333#20301#21517#31216',prod '#29983#20135#21333#20301',purch '#37319#36141#21333#20301',stock ' +
        #23384#36135#21333#20301',quote '#25253#20215#21333#20301'  from data0002')
    Left = 82
    Top = 29
  end
  object cn_adocon: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 18
    Top = 31
  end
end
