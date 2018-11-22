unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery1type: TStringField;
    ADOQuery1RKEY: TSmallintField;
    ADOQuery1FASSET_TYPE: TStringField;
    ADOQuery1depr_mthd_ptr: TIntegerField;
    ADOQuery1expected_life: TFloatField;
    ADOQuery1expected_surplus_rate: TFloatField;
    ADOQuery1prechar1: TStringField;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADOQuery1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADOQuery1EditError(DataSet: TDataSet; E: EDatabaseError;
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

procedure TDM.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 case dm.ADOQuery1.FieldByName('depr_mthd_ptr').AsInteger of
  0: dm.ADOQuery1type.AsString:='不计提折旧';
  1: dm.ADOQuery1type.AsString:='平均年限法';
  2: dm.ADOQuery1type.AsString:='工作量法';
  3: dm.ADOQuery1type.AsString:='双倍金额递减法';
  4: dm.ADOQuery1type.AsString:='工作年限法';
 end;
end;
procedure TDM.ADOQuery1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('请检查提交数据是否有误!',mtwarning,[mbok],0);
 abort;
end;

procedure TDM.ADOQuery1EditError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('请检查数据是否删除有误!',mtwarning,[mbok],0);
 abort;
end;

end.
