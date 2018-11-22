unit Unit1;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOTable1PR_GRP_CODE: TStringField;
    ADOTable1PRODUCT_GROUP_NAME: TStringField;
    ADOTable1RKEY: TAutoIncField;
    procedure ADOTable1AfterDelete(DataSet: TDataSet);
    procedure ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
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

procedure TDM.ADOTable1AfterDelete(DataSet: TDataSet);
begin
messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TDM.ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('保存失败,请检查组别代码是否重复!',mtwarning,[mbok],0);
 abort;
end;

procedure TDM.ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('数据删除失败，已被其它数据引用!!!',mtwarning,[mbok],0);
 abort;
end;

end.

