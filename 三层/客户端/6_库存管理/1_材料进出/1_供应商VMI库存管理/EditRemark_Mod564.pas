unit EditRemark_Mod564;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm,ucommfunc, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient;

type
  TfrmEditRemark_Mod564 = class(TfrmBaseEdit)
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditRemark_Mod564: TfrmEditRemark_Mod564;

implementation

{$R *.dfm}

procedure TfrmEditRemark_Mod564.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEditRemark_Mod564.btnSaveClick(Sender: TObject);
var Lcds:TClientDataSet;
begin
  inherited;
  Lcds:=TClientDataSet.Create(Self);
  try
    gSvrIntf.IntfGetDataBySql('select * from data0134 where rkey= ' + IntToStr(Edit1.Tag)+'',Lcds);
    if not Lcds.IsEmpty then
    begin
      Lcds.Edit;
      Lcds.FieldByName('rohs').Value:=Trim(Edit1.Text); //ROHS标志
      Lcds.FieldByName('SUPPLIER2').Value:=Trim(Memo1.Text); //详细位置
      Lcds.FieldByName('BARCODE_ID').Value:=Trim(Memo2.Text); //特别要求
      Lcds.Post;
    end;
    if (Lcds.ChangeCount>0) then
    if gSvrIntf.IntfPostDataByTable('data0134',Lcds.delta) then
    begin
      Lcds.MergeChangeLog;
      ShowMessage('修改成功');
      ModalResult:=mrOk;
    end;
  finally
    Lcds.Free;
  end;
end;

end.
