unit EditItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB;

type
  TFrmEditItem = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Splitter1: TSplitter;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label11: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    gcc_ptr: TLabel;
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEditItem: TFrmEditItem;

implementation
uses Main, AcctSearch;
{$R *.dfm}

procedure TFrmEditItem.Edit1Exit(Sender: TObject);
begin
  if trim(edit1.text)='' then
   begin
    self.gcc_ptr.Caption:='0';
    label11.Caption:='';
   end
  else
   begin
  if FrmEdititem.ActiveControl = bitbtn2 then exit;
  if FrmAcctSearch.ADOQuery1.locate('gl_acc_number',edit1.Text,[]) then
  begin
    edit1.Text := FrmAcctSearch.ADOQuery1.FieldValues['gl_acc_number'];
    label11.Caption := FrmAcctSearch.ADOQuery1.FieldValues['gl_description'];
    self.gcc_ptr.Caption:=frmacctsearch.ADOQuery1rkey.AsString;    
  end else
  begin
    messagedlg('科目代号不正确！',mtinformation,[mbOk],0);
    edit1.setfocus;
    exit;
  end;
  end;
end;

procedure TFrmEditItem.BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FrmAcctSearch.Edit1.Text :=Edit1.text;
  if FrmAcctSearch.ShowModal=mrok then
  begin
    edit1.Text := FrmAcctSearch.ADOQuery1.FieldValues['gl_acc_number'];
    label11.Caption := FrmAcctSearch.ADOQuery1.FieldValues['gl_description'];
    self.gcc_ptr.Caption:=frmacctsearch.ADOQuery1rkey.AsString;
  end;
end;

procedure TFrmEditItem.BitBtn1Click(Sender: TObject);
var
 rkey:integer;
begin
{  if trim(edit1.Text)='' then
  begin
    messagedlg('帐号不能为空！',mtinformation,[mbok],0);
    exit;
  end;
}
  if trim(edit2.Text)='' then
   begin
    messagedlg('名称不能为空！',mtinformation,[mbok],0);
    exit;
   end;
  try
    FrmMain.AdoData0520.edit ;
    FrmMain.AdoData0520.Fieldbyname('name').asstring:=FrmEditItem.edit2.Text;
    FrmMain.AdoData0520.Fieldbyname('ttype').asinteger:=FrmEditItem.RadioGroup1.ItemIndex ;
    FrmMain.AdoData0520.Fieldbyname('description').asstring:=FrmEditItem.edit2.Text;
    if strtoint(self.gcc_ptr.Caption)>0 then
     FrmMain.AdoData0520.FieldByName('gl_acct_ptr').AsInteger:=strtoint(self.gcc_ptr.Caption)
    else
     frmmain.ADOData0520GL_ACCT_PTR.AsVariant:=null;

    FrmMain.Adodata0520.Post;
  except
    messagedlg('保存失败，请检查是否名称重复！',mtinformation,[mbok],0);
    edit2.SetFocus ;
    exit;
  end;
  rkey:=frmmain.ADOData0520RKEY.Value;
  FrmMain.AdoData0520.close;
  FrmMain.AdoData0520.open;
  FrmMain.AdoData0520.Locate('rkey',rkey,[]);
  modalresult:=mrok;
end;

procedure TFrmEditItem.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TFrmEditItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (FrmMain.ADOData0520.State=dsInsert)
    or (FrmMain.Adodata0520.Modified) then
     FrmMain.Adodata0520.Cancel ;
end;

end.
