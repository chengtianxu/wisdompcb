unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs,Windows;

type
  TDM = class(TDataModule)
    cn_adocon: TADOConnection;
    ds_source: TDataSource;
    dsADS02: TADODataSet;
    strngfldADS02unit_code: TStringField;
    strngfldADS02unit_name: TStringField;
    strngfldADS02prod: TStringField;
    strngfldADS02purch: TStringField;
    strngfldADS02stock: TStringField;
    strngfldADS02quote: TStringField;
    procedure dsADS02PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure dsADS02AfterDelete(DataSet: TDataSet);
    procedure dsADS02DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}



procedure TDM.dsADS02PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
//  MessageBox(0,'单位重复，无法提交','警告',MB_ICONEXCLAMATION+MB_OK);
//  Abort;
end;

procedure TDM.dsADS02AfterDelete(DataSet: TDataSet);
begin
//   MessageBox(0,'单位删除成功','提示',MB_ICONINFORMATION+MB_OK);
end;

procedure TDM.dsADS02DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
//     MessageBox(0,'该单位已发生业务,无法删除','警告',MB_ICONEXCLAMATION+MB_OK);
//     Abort;
end;

end.
