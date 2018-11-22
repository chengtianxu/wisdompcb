unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
    Tfm_demo = class(TDataModule)
    ds_source: TDataSource;
    qry_adoqry: TADOQuery;
    cn_adocon: TADOConnection;
    procedure qry_adoqryDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
      procedure qry_adoqryAfterDelete(DataSet: TDataSet);
    procedure qry_adoqryPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_demo: Tfm_demo;

implementation

{$R *.dfm}

procedure Tfm_demo.qry_adoqryDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   ShowMessage('该单位已发生业务,无法删除');
   Abort;
end;

procedure Tfm_demo.qry_adoqryAfterDelete(DataSet: TDataSet);
begin
  ShowMessage('单位删除成功');
end;

procedure Tfm_demo.qry_adoqryPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  ShowMessage('单位重复，无法提交');
  Abort;
end;

end.
