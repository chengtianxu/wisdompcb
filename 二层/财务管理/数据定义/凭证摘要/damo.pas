unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery1DICT_GRP: TStringField;
    ADOQuery2DESCRIPTION: TStringField;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery2RKEY: TAutoIncField;
    ADOQuery2GRP_PTR: TIntegerField;
    ADOQ: TADOQuery;
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1DeleteError(DataSet: TDataSet; E: EDatabaseError;
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

procedure TDM.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
if dm.ADOQuery1.FieldByName('rkey').AsInteger>0 then
 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0513 where GRP_PTR='+dm.ADOQuery1RKEY.AsString);
   sql.Add('order by DESCRIPTION');
   prepared;
   open;
  end
  else
  with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0513 where GRP_PTR=0');
   sql.Add('order by DESCRIPTION');
   prepared;
   open;
 end;
end;
procedure TDM.ADOQuery1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('数据删除失败，已被其它数据引用!!!',mtwarning,[mbok],0);
 abort;
end;

end.
