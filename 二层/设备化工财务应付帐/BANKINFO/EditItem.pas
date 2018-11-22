unit EditItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB, ADODB;

type
  TFrmEditItem = class(TForm)
    Splitter1: TSplitter;
    BitBtn4: TBitBtn;
    Panel1: TPanel;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    DBEdit15: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label5: TLabel;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    Label6: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    DBEdit11: TDBEdit;
    Label10: TLabel;
    BitBtn2: TBitBtn;
    Label11: TLabel;
    Label3: TLabel;
    Label18: TLabel;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    Label19: TLabel;
    DBEdit5: TDBEdit;
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEditItem: TFrmEditItem;

implementation
uses Main, AcctSearch,curr_search;
{$R *.dfm}

procedure TFrmEditItem.Edit1Exit(Sender: TObject);
begin
  if trim(edit1.text)='' then
   begin
    label11.caption:='';
    frmmain.ADOdata0128GL_ACCT_PTR.AsVariant:=null;
   end
  else
   begin
  if FrmEdititem.ActiveControl = bitbtn2 then exit;
  Application.CreateForm(TFrmAcctSearch, FrmAcctSearch);
  FrmAcctSearch.Edit1.Text :=Edit1.text;
  if FrmAcctSearch.ADOQuery1.RecordCount>0 then
  begin
    edit1.Text := FrmAcctSearch.ADOQuery1.FieldValues['gl_acc_number'];
    label11.Caption := FrmAcctSearch.ADOQuery1.FieldValues['gl_description'];
//    FrmMain.ADOData0128.Edit ;
    FrmMain.ADOData0128.FieldByName('gl_acct_ptr').AsInteger:=FrmAcctSearch.ADOQuery1.FieldValues['rkey'];
  end else
  begin
    messagedlg('会计科目不正确！',mtinformation,[mbok],0);
    edit1.SetFocus ;
    exit;
  end;
  FrmAcctSearch.free;
   end;
end;

procedure TFrmEditItem.BitBtn2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Application.CreateForm(TFrmAcctSearch, FrmAcctSearch);
  FrmAcctSearch.Edit1.Text :=Edit1.text;
  if FrmAcctSearch.ShowModal=mrok then
  if not FrmAcctSearch.ADOQuery1.Eof then
  begin
    edit1.Text := FrmAcctSearch.ADOQuery1.FieldValues['gl_acc_number'];
    label11.Caption := FrmAcctSearch.ADOQuery1.FieldValues['gl_description'];
    FrmMain.ADOData0128.FieldByName('gl_acct_ptr').AsInteger:=FrmAcctSearch.ADOQuery1.FieldValues['rkey'];
  end else
    Edit1.SetFocus
  else
    Edit1.SetFocus;
  FrmAcctSearch.free;
end;

procedure TFrmEditItem.BitBtn1Click(Sender: TObject);
begin
  if trim(FrmMain.ADOdata0128.fieldbyname('bank_name').asstring)='' then
   begin
    messagedlg('银行名称不能为空！',mtinformation,[mbok],0);
    exit;
   end;
{  if FrmMain.ADOdata0128.fieldbyname('gl_acct_ptr').asinteger=0 then
   begin
    messagedlg('请输入对应会计科目！',mtinformation,[mbok],0);
    exit;
   end;
 }  
  if FrmMain.ADOdata0128.fieldbyname('currency_ptr').asinteger=0 then
   begin
    messagedlg('货币种类不能为空！',mtinformation,[mbok],0);
    edit2.SetFocus ;
    exit;
   end;
  try
    FrmMain.Adodata0128.post();
  except
    messagedlg('保存失败,请检查帐户名称是否重复！',mtinformation,[mbok],0);
    dbedit1.SetFocus ;
    exit;
  end;
  modalresult:=mrok;
end;

procedure TFrmEditItem.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TFrmEditItem.Edit2Exit(Sender: TObject);
begin
   if ActiveControl=bitbtn3 then exit;
   if FrmMain.Adodata0001.locate('curr_code',edit2.text,[]) then
    begin
      edit2.Text :=FrmMain.Adodata0001.FieldValues['curr_code'];
      label18.Caption :=FrmMain.Adodata0001.Fieldbyname('curr_name').asstring;
//    FrmMain.ADOData0128.Edit ;
      FrmMain.ADOData0128.FieldByName('currency_ptr').AsInteger:=FrmMain.Adodata0001.Fieldbyname('rkey').asinteger;
    end else
   begin
    messagedlg('货币代号不正确！',mtinformation,[mbok],0);
    edit2.setfocus;
    exit;
   end;
end;

procedure TFrmEditItem.BitBtn3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    Application.CreateForm(TFrmCurr, FrmCurr);
    FrmCurr.Edit1.Text :=edit2.Text ;
    if FrmCurr.ShowModal=mrok then
    IF not FrmCurr.Adodata0001.Eof then
    begin
      edit2.Text :=FrmCurr.Adodata0001.FieldValues['curr_code'];
      label18.Caption :=FrmCurr.Adodata0001.Fieldbyname('curr_name').asstring;
      FrmMain.ADOData0128.FieldByName('currency_ptr').AsInteger:=FrmCurr.Adodata0001.Fieldbyname('rkey').asinteger;
    end else
      Edit2.SetFocus
    else
      Edit2.SetFocus;
    FrmCurr.free;
end;

procedure TFrmEditItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (FrmMain.Adodata0128.State=dsInsert)
    or (FrmMain.Adodata0128.Modified) then
     FrmMain.Adodata0128.Cancel ;
end;

end.
