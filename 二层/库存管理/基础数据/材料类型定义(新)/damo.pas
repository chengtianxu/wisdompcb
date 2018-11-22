unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADO499: TADOQuery;
    ADO499RKEY: TAutoIncField;
    ADO499INV_GROUP_PTR: TIntegerField;
    ADO499PARAMETER_PTR: TIntegerField;
    ADO499DEF_VALUE: TStringField;
    ADO499SEQ_NO: TSmallintField;
    aq278: TADOQuery;
    aq278rkey: TIntegerField;
    aq278PARAMETER_NAME: TStringField;
    aq278PARAMETER_DESC: TStringField;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1inv_group_name: TStringField;
    ADOQuery1inv_group_desc: TStringField;
    ADOQuery2: TADOQuery;
    ADOQuery2GL_ACC_NUMBER: TStringField;
    ADOQuery2description_2: TStringField;
    ADOQuery2GL_DESCRIPTION: TStringField;
    ADO499ttype: TWordField;
    temp: TADOQuery;
    ADO496: TADODataSet;
    ADO496RKEY: TAutoIncField;
    ADO496GROUP_NAME: TStringField;
    ADO496GROUP_DESC: TStringField;
    ADO496ttype: TStringField;
    ADO496group_ptr: TIntegerField;
    ADO496SPEC_RKEY: TStringField;
    ADO496MASK_INV_NUMBER: TStringField;
    ADO496IF_FLAG: TWordField;
    ADO496gl_acct_ptr: TIntegerField;
    ADO496quote_flag: TBooleanField;
    ADO496type: TStringField;
    ADO496inv_group_name: TStringField;
    ADO496inv_group_desc: TStringField;
    ADOQuery3: TADOQuery;
    ADO496INSPECT: TWideStringField;
    ADO496SHELF_LIFE: TSmallintField;
    ADO496CATALOG_NUM: TWideStringField;
    ADO496AVL_FLAG: TWideStringField;
    ADO496IsMaster: TBooleanField;
    ADO496Rkey595: TIntegerField;
    procedure ADO496PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADO496DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADO496AfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADO496PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  messagedlg('数据保存失败,请检查编类别名称是否重复!',mtwarning,[mbok],0);
  abort;
end;

procedure TDM.ADO496DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('无法删除该记录,已有被材料项目使用!',mtwarning,[mbcancel],0);
 abort;
end;

procedure TDM.ADO496AfterDelete(DataSet: TDataSet);
begin
  messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

end.

