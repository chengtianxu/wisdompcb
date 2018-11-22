unit EditItem2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB;

type
  TFrmEditItem2 = class(TForm)
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
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEditItem2: TFrmEditItem2;

implementation
uses Main, damo,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrmEditItem2.BitBtn1Click(Sender: TObject);
var
 rkey:integer;
begin
  if trim(edit1.Text)='' then
  begin
    messagedlg('帐号不能为空！',mtinformation,[mbok],0);
    exit;
  end;

  if trim(edit2.Text)='' then
   begin
    messagedlg('名称不能为空！',mtinformation,[mbok],0);
    exit;
   end;
  try
    dm.AdoData0520.edit ;
    dm.AdoData0520.Fieldbyname('name').asstring:=edit2.Text;
    dm.AdoData0520.Fieldbyname('ttype').asinteger:=RadioGroup1.ItemIndex ;
    dm.AdoData0520.Fieldbyname('description').asstring:=edit3.Text;
    if strtoint(self.gcc_ptr.Caption)>0 then
     dm.AdoData0520.FieldByName('gl_acct_ptr').AsInteger:=strtoint(self.gcc_ptr.Caption)
    else
     dm.ADOData0520GL_ACCT_PTR.AsVariant:=null;

    dm.Adodata0520.Post;
  except
    messagedlg('保存失败，请检查是否名称重复！',mtinformation,[mbok],0);
    edit2.SetFocus ;
    exit;
  end;
  rkey:=dm.ADOData0520RKEY.Value;
  dm.AdoData0520.close;
  dm.AdoData0520.open;
  dm.AdoData0520.Locate('rkey',rkey,[]);
  modalresult:=mrok;
end;

procedure TFrmEditItem2.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TFrmEditItem2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (dm.ADOData0520.State=dsInsert)
    or (dm.Adodata0520.Modified) then
     dm.Adodata0520.Cancel ;
end;

procedure TFrmEditItem2.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
   InputVar.Fields := 'gl_acc_number/科目代码/210,gl_description/科目名称/210';
   InputVar.Sqlstr := 'select rkey,gl_acc_number,gl_description from data0103 where has_child=0 order by gl_acc_number';
   inputvar.KeyField:='gl_acc_number';
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
   begin
    edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['gl_acc_number']);
    label11.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['gl_description']);
    self.gcc_ptr.Caption:=frmPick_Item_Single.adsPick.fieldbyname('rkey').asstring;
   end; 
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmEditItem2.Edit1Exit(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
  with dm.aqtmp do
  begin
    sql.Clear;
    sql.Add('select rkey,gl_acc_number,GL_DESCRIPTION from data0103 where gl_acc_number='''+trim(edit1.Text)+'''');
    open;
    if isempty then
    begin
      showmessage('科目代码输入错误，请重输！');
      edit1.Text:='';
      edit1.SetFocus;
    end
    else
    begin
     label11.Caption:=trim(FieldValues['GL_DESCRIPTION']);
     self.gcc_ptr.Caption:=fieldbyname('rkey').AsString;
    end;
    close;
  end
    else
    begin
     label11.Caption:='';
     self.gcc_ptr.Caption:='0';
    end;
end;

end.
