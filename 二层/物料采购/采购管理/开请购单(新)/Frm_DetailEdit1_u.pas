unit Frm_DetailEdit1_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ADODB, Buttons, DBCtrlsEh;

type
  TFrm_DetailEdit1 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    BtSave: TBitBtn;
    BtCan: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    DBText1: TDBText;
    dbchkIF_urgency: TDBCheckBox;
    lbl1: TLabel;
    dbedtQUANTITY_REQUIRED: TDBEdit;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    Ftag,Frkey68:integer;
    procedure initData;
  end;

var
  Frm_DetailEdit1: TFrm_DetailEdit1;

implementation
uses DM_u,Pick_Item_Single,ConstVar;
{$R *.dfm}

{ TFrm_DetailEdit1 }

procedure TFrm_DetailEdit1.initData;
begin
  with dm.tmp do
  begin
    close;
    sql.Clear;
    sql.Add('select * from data0075');
    sql.Add('order by DESCRIPTION');
    open;
    while not eof do
    begin
      DBComboBox1.Items.Add(trim(FieldValues['DESCRIPTION']));
      Next;
    end;
  end;
 // DBComboBox1.DataField:='DESCRIPTION_2';
end;

procedure TFrm_DetailEdit1.BitBtn4Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields:='unit_code/单位代码/110,unit_name/单位名称/251';
    InputVar.Sqlstr:='select rkey,unit_code,unit_name from data0002 where purch=''Y'' order by unit_code ';
    inputvar.KeyField:='unit_code';
    inputvar.InPut_value:=edit1.Text;
    InputVar.AdoConn := DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['unit_code']);
      DM.AQ204G_L_PTR.Value:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.Free ;
  end;

end;

procedure TFrm_DetailEdit1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
   SelectNext(ActiveControl,true,true);
end;

procedure TFrm_DetailEdit1.BtSaveClick(Sender: TObject);
 var s:string;
begin
  if (DBEdit1.Text='') then
  begin
    showmessage('请输物料名称...');
    abort;
  end;
  if (DBEdit2.Text='') then
  begin
    showmessage('请输物料规格...');
    abort;
  end;
  if (DBComboBox1.Text='') then
  begin
    showmessage('请输物品类别...');
    abort;
  end;

  if (DBEdit3.Text='') then
  begin
    showmessage('请输物品单位...');
    abort;
  end;

  if (DBEdit4.Field.AsFloat<=0) then
  begin
    showmessage('请输入数量');
    abort;
  end;
  if (DBEdit6.Text='') then
  begin
    showmessage('请输入请购原因...');
    abort;
  end;
  if Ftag=0 then
  begin
    DM.AQ204.FieldByName('req_quantity').AsFloat:= DM.AQ204.FieldByName('QUANTITY_REQUIRED').AsFloat;
    DM.AQ204.Post;
    s:=DBEdit6.Text;
    DM.AQ204.Append;
    if Frkey68<>0 then
      DM.AQ204.FieldByName('purchase_req_ptr').AsInteger:=Frkey68;
    DBEdit6.Text:=s;
    Edit1.Text:='';
    DBEdit1.SetFocus;
  end else
  begin
    DM.AQ204.FieldByName('req_quantity').AsFloat:= DM.AQ204.FieldByName('QUANTITY_REQUIRED').AsFloat;
    modalresult:=mrok;
  end;
end;

end.
