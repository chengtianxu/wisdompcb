unit editFrm_mod278;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm,uCommFunc, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Data.DB,
  Datasnap.DBClient;

type
  TfrmEdit_mod278 = class(TfrmBaseEdit)
    lbl4: TLabel;
    edt_TName: TRKeyRzBtnEdit;
    ds75: TDataSource;
    cds75: TClientDataSet;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FEditType:  integer;
    procedure GetData(ARkey:string);
  end;

var
  frmEdit_mod278: TfrmEdit_mod278;

implementation

{$R *.dfm}

procedure TfrmEdit_mod278.btnCloseClick(Sender: TObject);
begin
  inherited;
Close;
end;

procedure TfrmEdit_mod278.btnSaveClick(Sender: TObject);
begin
  inherited;
   if Trim(edt_TName.Text)='' then
   begin
   ShowMessage('名称不能为空！');
   exit;
   end;

//    if FEditType =1 then
//    cds75.Append
//    else
    cds75.Edit;

    if FEditType =1 then
    cds75.FieldByName('IDKEy').Value := gFunc.CreateIDKey;
    cds75.FieldByName('DESCRIPTION').Value :=trim(edt_tname.text);

    cds75.Post;

    if  gSvrintf.IntfPostDataByTable('data0075', cds75.Delta) then
    begin
      cds75.MergeChangeLog;
      showmessage('保存成功');

     ModalResult:=mrok;

    end;


end;

procedure TfrmEdit_mod278.GetData(ARkey: string);
var
  Lsql75 : string;
begin

  Lsql75 := 'select * from data0075 where rkey = ' + ARkey;

  if not gSvrIntf.IntfGetDataBySql(Lsql75, cds75) then   exit;

end;



end.
