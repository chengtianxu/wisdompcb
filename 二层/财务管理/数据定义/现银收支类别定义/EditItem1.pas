unit EditItem1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB, ADODB;

type
  TFrmEditItem1 = class(TForm)
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
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEditItem1: TFrmEditItem1;

implementation
uses Main, damo,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrmEditItem1.BitBtn1Click(Sender: TObject);
var
  i:integer;
begin
  if trim(dm.ADOdata0128.fieldbyname('bank_name').asstring)='' then
   begin
    messagedlg('银行名称不能为空！',mtinformation,[mbok],0);
    exit;
   end;
  if dm.ADOdata0128.fieldbyname('gl_acct_ptr').asinteger=0 then
   begin
    messagedlg('请输入对应会计科目！',mtinformation,[mbok],0);
    exit;
   end;
   
  if dm.ADOdata0128.fieldbyname('currency_ptr').asinteger=0 then
   begin
    messagedlg('货币种类不能为空！',mtinformation,[mbok],0);
    edit2.SetFocus ;
    exit;
   end;
  try
    dm.Adodata0128.post();
  except
    messagedlg('保存失败,请检查帐户名称是否重复！',mtinformation,[mbok],0);
    dbedit1.SetFocus ;
    exit;
  end;
  i:=dm.ADOdata0128RKEY.Value;
  dm.ADOdata0128.Close;
  dm.ADOdata0128.Open;
  dm.ADOdata0128.Locate('rkey',i,[]);
  modalresult:=mrok;
end;

procedure TFrmEditItem1.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TFrmEditItem1.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
   InputVar.Fields := 'curr_code/币种代码/210,curr_name/币种名称/210';
   InputVar.Sqlstr := 'select rkey,curr_code,curr_name from data0001';
   inputvar.KeyField:='curr_code';
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
   begin
    edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['curr_code']);
    label18.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['curr_name']);
    dm.ADOData0128.FieldByName('currency_ptr').AsInteger:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
   end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmEditItem1.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
   InputVar.Fields := 'GL_ACC_NUMBER/科目编码/210,GL_DESCRIPTION/科目名称/210';
   InputVar.Sqlstr := 'select rkey,gl_acc_number,gl_description from data0103 where has_child=0 order by gl_acc_number';
   inputvar.KeyField:='curr_code';
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
   begin
    edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['GL_ACC_NUMBER']);
    label11.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['GL_DESCRIPTION']);
    dm.ADOData0128.FieldByName('gl_acct_ptr').AsInteger:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
   end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmEditItem1.Edit1Exit(Sender: TObject);
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
     dm.ADOData0128.FieldByName('gl_acct_ptr').AsInteger:=FieldValues['rkey'];
    end;
    close;
  end
  else
  begin
    dm.ADOdata0128.fieldbyname('gl_acct_ptr').asinteger:=0;
    label11.Caption:='';
  end;
end;

procedure TFrmEditItem1.Edit2Exit(Sender: TObject);
begin
 if trim(edit2.Text)<>'' then
  with dm.aqtmp do
  begin
    sql.Clear;
    sql.Add('select rkey,curr_code,curr_name from data0001 where curr_code='''+trim(edit2.Text)+'''');
    open;
    if isempty then
    begin
      showmessage('币种代码输入错误，请重输！');
      edit2.Text:='';
      edit2.SetFocus;
    end
    else
     begin
     label18.Caption:=trim(FieldValues['curr_name']);
     dm.ADOData0128.FieldByName('currency_ptr').AsInteger:=FieldValues['rkey'];
     end;
    close;
  end
 else
  begin
    dm.ADOdata0128.fieldbyname('currency_ptr').asinteger:=0;
    label18.Caption:='';
  end;
end;

end.
