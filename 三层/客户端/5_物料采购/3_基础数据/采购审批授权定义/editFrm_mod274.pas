unit editFrm_mod274;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm,uCommFunc, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Datasnap.DBClient,
  Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit ;

type
  TfrmEdit_mod274 = class(TfrmBaseEdit)
    ds77: TDataSource;
    cds77: TClientDataSet;
    lbl1: TLabel;
    cbb_type: TComboBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edt_WH: TRKeyRzBtnEdit;
    edt_NO: TRKeyRzBtnEdit;
    edt_LLimit: TRKeyRzBtnEdit;
    edt_ULimit: TRKeyRzBtnEdit;
    cdstemp: TClientDataSet;
    edt_User: TRKeyRzBtnEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   FEditType:integer;
   procedure GetData(ARkey:string);

  end;

var
  frmEdit_mod274: TfrmEdit_mod274;

implementation

{$R *.dfm}

procedure TfrmEdit_mod274.btnCloseClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmEdit_mod274.btnSaveClick(Sender: TObject);
var
LPostData:OleVariant;
begin
  inherited;
   if Trim(cbb_type.Text)='' then
   begin
   ShowMessage('审批类型不能为空！');
   exit;
   end;

   if Trim(edt_WH.Text)='' then
   begin
   ShowMessage('工厂不能为空！');
   exit;
   end;

   if Trim(edt_user.Text)='' then
   begin
   ShowMessage('用户不能为空！');
   exit;
   end;

   if (StrToFloat(Trim(edt_LLimit.Text))<=0) or (Trim(edt_LLimit.Text)='') then
   begin
   ShowMessage('额度下限不能为空，且不能为0为负数！');
   exit;
   end;

   if (cds77.FieldByName('upper_limit').AsString='')
   or(cds77.FieldByName('upper_limit').AsFloat<=cds77.FieldByName('lower_limit').AsFloat) then
    begin
    ShowMessage('额度下限值必须大于额度上限！');
    exit;
    end;


//    if FEditType =1 then
//    cds77.Append
//    else
    cds77.Edit;

    if FEditType =1 then
    cds77.FieldByName('IDKEy').Value := gFunc.CreateIDKey;

    cds77.FieldByName('PURCHASE_TYPE').value:=Trim(cbb_type.Text);

    cds77.Post;

    // if cds77.ChangeCount > 0 then
    if   gSvrintf.IntfPostDataByTable('data0077', cds77.Delta) then
    begin
      cds77.MergeChangeLog;
      showmessage('保存成功');

     self.ModalResult:=mrok;

    end;


end;

procedure TfrmEdit_mod274.FormCreate(Sender: TObject);
var
Lsql: string;
begin
  inherited;
  Lsql:='select distinct PURCHASE_TYPE  from data0077';
  gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

  cbb_type.Items.Clear;
  if not cdstemp.IsEmpty   then
  begin
  cdstemp.First;
  while not cdstemp.Eof do
  begin
  cbb_type.Items.Add(cdstemp.FieldByName('PURCHASE_TYPE').AsString);
  cdstemp.Next;
  end;
  end;

end;

procedure TfrmEdit_mod274.GetData(ARkey: string);
var
  Lsql77 : string;
begin

  Lsql77 := 'select * from data0077 where rkey = ' + ARkey;


  if not gSvrIntf.IntfGetDataBySql(Lsql77, cds77) then
    exit;
end;

end.
