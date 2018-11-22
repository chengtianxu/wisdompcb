unit Creditfrm_Mod83;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Datasnap.DBClient;

type
  TfrmCredit_Mod83 = class(TForm)
    Grd310: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    cds310: TClientDataSet;
    ds310: TDataSource;
    procedure cds310AfterInsert(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    rkey10:Integer;
  end;

var
  frmCredit_Mod83: TfrmCredit_Mod83;

implementation
uses
uCommFunc;
{$R *.dfm}

procedure TfrmCredit_Mod83.Button1Click(Sender: TObject);
begin
 if cds310.State in [dsEdit,dsInsert] then cds310.Post;
  if gSvrIntf.IntfPostDataByTable('data0310',cds310.Delta) then
  begin
    cds310.MergeChangeLog;
    ShowMessage('保存信用记录成功');
    ModalResult:=mrok;
  end;
end;

procedure TfrmCredit_Mod83.cds310AfterInsert(DataSet: TDataSet);
var
Lcds05:TClientDataSet;
begin
 cds310.FieldByName('cust_ptr').Value:=rkey10;
 cds310.FieldByName('Record_number').Value:=self.cds310.RecordCount+1;
 cds310.FieldByName('ENT_date').Value:=gFunc.GetSvrDateTime;
 Lcds05:=TClientDataSet.Create(Self);
 try
  if not gSvrIntf.IntfGetDataBySql('select EMPLOYEE_NAME from data0005 where rkey='+gvar.rkey05,Lcds05) then Exit;
  cds310.FieldByName('APPR_BY').Value:=Lcds05.fieldbyname('EMPLOYEE_NAME').asstring;
 finally
  Lcds05.Free;
 end;
end;

end.
