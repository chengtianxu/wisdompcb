unit DeInEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, ExtCtrls;

type
  TForm_DeInEdit = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    CBLoc: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button1: TButton;
    Button2: TButton;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Edit7: TEdit;
    Edit8: TEdit;
    ComboBox2: TComboBox;
    dtpk1: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CBLocChange(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
  private
    FLoc:array of integer;
    FVend:integer;
  public
    procedure init(iFac,iVend:integer);
  end;

var
  Form_DeInEdit: TForm_DeInEdit;

implementation
uses demo,common,Pick_Item_Single,ConstVar;
{$R *.dfm}
procedure TForm_DeInEdit.init(iFac,iVend:integer);
var i:integer;
begin
  DM.tmpt.Close;
  DM.tmpt.SQL.Text:='select rkey,LOCATION from data0016 where whouse_ptr='+inttostr(iFac)+' and LOCATION_TYPE=0 order by rkey';
  DM.tmpt.Open;
  setlength(FLoc,DM.tmpt.RecordCount);
  i:=0;
  CBLoc.Items.Clear;
  while not DM.tmpt.Eof do
  begin
    FLoc[i]:=DM.tmpt.Fields[0].AsInteger;
    CBLoc.Items.Append(DM.tmpt.Fields[1].asstring);
    DM.tmpt.Next;
    inc(i);
  end;
  FVend:=iVend;
  dtpk1.Date:=date;
end;
procedure TForm_DeInEdit.BitBtn1Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'UNIT_CODE/单位编码/150,UNIT_NAME/单位名称/250';
      InputVar.Sqlstr :='SELECT RKEY, UNIT_CODE, UNIT_NAME FROM dbo.Data0002 order by 2';
      inputvar.KeyField:='UNIT_CODE';
      InputVar.InPut_value:=Edit2.Text;
    end;
    1:
    begin
//      InputVar.Fields := 'INV_PART_NUMBER/材料编码/80,INV_NAME/材料名称/100,INV_DESCRIPTION/材料规格/150,ABBR_NAME/供应商/200';
//      InputVar.Sqlstr :='SELECT distinct dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '+
//                      'dbo.Data0017.INV_DESCRIPTION, dbo.Data0023.CODE,dbo.Data0023.ABBR_NAME,'+
//                      'dbo.Data0017.STOCK_UNIT_PTR, dbo.Data0002.UNIT_CODE,dbo.Data0002.UNIT_NAME FROM dbo.Data0017 '+
//                      'INNER JOIN dbo.Data0028 ON dbo.Data0017.RKEY = dbo.Data0028.INVENTORY_PTR INNER JOIN '+
//                      'dbo.Data0023 ON dbo.Data0028.SUPPLIER_PTR = dbo.Data0023.RKEY INNER JOIN '+
//                      'dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY '+
//                      'where dbo.Data0023.RKEY='+inttostr(FVend)+' order by 2' ;
      InputVar.Fields := 'INV_PART_NUMBER/材料编码/120,INV_NAME/材料名称/150,INV_DESCRIPTION/材料规格/250';
      InputVar.Sqlstr := 'SELECT dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,' +
                         'dbo.Data0017.STOCK_UNIT_PTR,dbo.Data0002.UNIT_CODE,dbo.Data0002.UNIT_NAME,'+
                         'dbo.Data0017.INV_DESCRIPTION from dbo.Data0017 inner join '+
                         'dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY ';
      inputvar.KeyField:='INV_PART_NUMBER';
      InputVar.InPut_value:=Edit1.Text;
    end;
  end;
  InputVar.AdoConn := DM.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         Edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['UNIT_CODE']);
         Label9.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['UNIT_NAME']);
         Edit2.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
       end;
     1:begin
         Edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['INV_PART_NUMBER']);
         Edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['INV_NAME']);
         Edit8.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['INV_DESCRIPTION']);
         Edit1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;

         Edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['UNIT_CODE']);
         Label9.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['UNIT_NAME']);
         Edit2.tag:=frmPick_Item_Single.adsPick.Fieldbyname('STOCK_UNIT_PTR').AsInteger;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;
end;
procedure TForm_DeInEdit.Button1Click(Sender: TObject);
begin
  if Edit1.Text='' then
  begin
    showmessage('请输入材料编码!');
    exit;
  end;
  if CBLoc.Text='' then
  begin
    showmessage('仓位不能为空!');
    exit;
  end;
  if Edit2.Text='' then
  begin
    showmessage('单位不能为空!');
    exit;
  end;
  if strtofloat('0'+trim(Edit3.Text))=0 then
  begin
    showmessage('请输入入库数量!');
    exit;
  end;
  if dtpk1.Date>common.getsystem_date(dm.tmp,1) then
  begin
   showmsg('入仓记录制造日期大于当前日期,不符合要求,请修改相关制造日期!',1);
   dtpk1.SetFocus;
   Exit;
  end;
  if dm.ADO134_1.Locate('INVENTORY_PTR',Edit1.Tag,[]) then
  begin
    showmessage('此材料已经录入,记录不能重复!');
    exit;
  end;
  DM.ADO134_1.Append;
  DM.ADO134_1INVENTORY_PTR.Value:=Edit1.Tag;
  DM.ADO134_1LOCATION_PTR.Value:=CBLoc.Tag;
  DM.ADO134_1UNIT_PTR.Value:=Edit2.Tag;
  DM.ADO134_1QUANTITY.AsString:=Edit3.Text;
  DM.ADO134_1tax_price.AsString:=Edit4.Text;
  DM.ADO134_1TAX_2.AsString:=Edit5.Text;

  DM.ADO134_1BARCODE_ID.Value:=Edit6.Text;
  DM.ADO134_1MANU_DATE.Value:=dtpk1.DateTime;
  DM.ADO134_1rohs.Value:=ComboBox2.Text;

  DM.ADO134_1UNIT_NAME.Value:=Edit2.Text;
  DM.ADO134_1INV_PART_NUMBER.Value:=Edit1.Text;
  DM.ADO134_1INV_name.Value:=Edit7.Text;
  DM.ADO134_1INV_DESCRIPTION.Value:=Edit8.Text;
  DM.ADO134_1LOCATION.Value:=CBLoc.Text;
  DM.ADO134_1.Post;

  Edit1.Text:='';
  Edit2.Text:='';

  Edit3.Text:='0.00';
  Edit4.Text:='0.0000';
  Edit5.Text:='0.00';

  Edit6.Text:='';
  Edit7.Text:='';
  Edit8.Text:='';

end;


procedure TForm_DeInEdit.CBLocChange(Sender: TObject);
begin
CBLoc.Tag:=FLoc[CBLoc.ItemIndex] ;
end;

procedure TForm_DeInEdit.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) or ((key='.') and (pos('.',TEdit(sender).Text)>0)) then abort;
end;

procedure TForm_DeInEdit.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) or ((key='.') and (pos('.',TEdit(sender).Text)>0)) then abort;
end;

procedure TForm_DeInEdit.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) or ((key='.') and (pos('.',TEdit(sender).Text)>0)) then abort;
end;

end.
