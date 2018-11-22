unit po_inspection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ComCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, Menus, DB, ADODB;

type
  TForm13 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    StatusBar1: TStatusBar;
    TC1: TTabControl;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    DBEdit16: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit18: TDBEdit;
    DBText2: TDBText;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBText1: TDBText;
    DBEdit5: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    PopupMenu1: TPopupMenu;
    PopupMenu3: TPopupMenu;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    DBCheckBox1: TDBCheckBox;
    Label16: TLabel;
    Label18: TLabel;
    DBEdit11: TDBEdit;
    DBEdit15: TDBEdit;
    Label23: TLabel;
    DBEdit12: TDBEdit;
    Label21: TLabel;
    Label19: TLabel;
    Bevel1: TBevel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label24: TLabel;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    Edit4: TEdit;
    DBEdit10: TDBEdit;
    DBEdit20: TDBEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Label14: TLabel;
    Button2: TButton;
    Button1: TButton;
    N1: TMenuItem;
    N2: TMenuItem;
    Label17: TLabel;
    DBEdit13: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label20: TLabel;
    Label22: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit14: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    Edit1: TEdit;
    N3: TMenuItem;
    DBCheckBox2: TDBCheckBox;
    DBRadioGroup2: TDBRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation
 uses damo, edit_misc, supplier, analysis, state_tax, annotation, note,
  edit_std_inv, edit_misc_po, supplier_info;
{$R *.dfm}

procedure TForm13.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm13.FormActivate(Sender: TObject);
var
 v_total,v_tax:real;
  v_ship_tax,v_misc_tax,misc_base:single;
begin

 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select code');
   sql.Add('from data0023');
   sql.Add('where rkey='+dm.ADO70SUPPLIER_POINTER.AsString);
   active:=true;
   tc1.Tabs.Add(fieldvalues['code']);             //查找供应商
  end;
 if (dm.ADO70PO_TYPE.Value = 'S')  then  //读取标准采购
  with dm.ADO71 do
   begin
    v_total:=0;
    v_tax:=0;
    first;
    while not eof do
     begin
      v_total:=v_total+dm.ADO71sim_total.Value;
      v_tax:=v_tax+dm.ADO71tax_total.Value;
      next;
     end;
    edit2.Text := formatfloat('0.00',v_total);
    edit3.Text := formatfloat('0.000',v_tax);
    first;
   end
 else
  with dm.ADO72 do   //读取杂项采购
   begin
    v_total:=0;
    v_tax:=0;
    first;
    while not eof do
     begin
      v_total:=v_total+dm.ADO72QUAN_ORD.Value*dm.ADO72tax_price.Value;
      v_tax:=v_tax+dm.ADO72tax_total.Value;
      next;
     end;
    edit2.Text := formatfloat('0.00',v_total);
    edit3.Text := formatfloat('0.000',v_tax);
    first;
    dbgrid1.Visible:=false;
    dbgrid2.Visible:=true;
    dbcheckbox2.Visible:=false;
   end;
 v_ship_tax:=0;
 v_misc_tax:=0;
 misc_base:=0;
if dm.ADO70STATE_SHIP_TAX_FLAG.Value='Y' then
 v_ship_tax :=dm.ADO70SHIPPING_COST.Value*dm.ADO70FEDERAL_TAX.Value/100;
if dm.ADO70STATE_MISC_TAX_FLAG.Value='Y' then
 begin
  dm.ado200.First;     //计算杂项与运输费用税金合计
  while not dm.ADO200.Eof do
   begin
    if dm.ADO200TAXABLE.Value='Y' then
     misc_base := misc_base+ dm.ADO200AMOUNT.Value;
    dm.ADO200.Next;
   end;
  dm.ADO200.First;
  v_misc_tax := misc_base*dm.ADO70FEDERAL_TAX.Value/100;
 end;
 edit4.Text := formatfloat('0.000',v_ship_tax+v_misc_tax);
end;

procedure TForm13.BitBtn10Click(Sender: TObject);
var
 i:byte;
begin
 try
  form7:=tform7.Create(application);
  dm.ADO200.First;
  while not dm.ADO200.Eof do   //查找杂项费用
   begin
    for i:=1 to form7.StringGrid1.RowCount-2 do
     if trim(form7.StringGrid1.Cells[4,i])=trim(dm.ADO200.fieldbyname('MISC_CHARGE_PTR').asstring) then
      begin
       form7.StringGrid1.Cells[3,i]:=formatfloat('0.00',dm.ADO200.FieldValues['amount']);
       break;
      end;
      dm.Ado200.Next;
   end;
  dm.ADO200.First;
  form7.ShowModal;
 finally
  form7.free;
 end;
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
 try
  form6:=tform6.Create(application);       //显示供应商信息
  form6.Caption := '供应商资料:'+tc1.Tabs[tc1.tabindex];
  form6.ShowModal;
 finally
  form6.free;
 end;
end;

procedure TForm13.Button1Click(Sender: TObject);
begin
 try
  form5:=tform5.Create(application);
  form5.DBEdit1.ReadOnly :=true;
  form5.DBEdit1.Color := cl3dlight;
  form5.DBEdit2.ReadOnly :=true;
  form5.DBEdit2.Color := cl3dlight;
  form5.DBEdit3.ReadOnly :=true;
  form5.DBEdit3.Color := cl3dlight;
  form5.DBEdit4.ReadOnly :=true;
  form5.DBEdit4.Color := cl3dlight;
//  form5.DBEdit5.ReadOnly :=true;
//  form5.DBEdit5.Color := cl3dlight;
  form5.Caption := '供应商分析代码:'+tc1.Tabs[tc1.tabindex];
  form5.ShowModal;
 finally
  form5.free;
 end;
end;

procedure TForm13.BitBtn11Click(Sender: TObject);
begin
try
 form8:=tform8.Create(application);
  with dm.ADOQuery1 do
   begin
    active := false;
    sql.Clear;
    sql.Add('select data0189.state_id from data0189,data0024');
    sql.Add('where data0024.city_tax_ptr=data0189.rkey and');
    sql.Add('data0024.rkey='+dm.ADO70SUPP_FAC_ADD_PTR.AsString);
    active := true;
    form8.Edit1.Text := fieldvalues['state_id'];
   end;
 form8.ShowModal;
finally
 form8.free;
end;
end;

procedure TForm13.BitBtn2Click(Sender: TObject);
begin
 popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm13.BitBtn3Click(Sender: TObject);
begin
 try
  form11:=tform11.Create(application);
  form11.Caption := '采购定单注释: '+dm.ADO70PO_NUMBER.Value;
  dm.adosp.close;
  dm.adosp.Parameters[1].Value:=2070;
  dm.adosp.Parameters[2].Value:=dm.ADO70.FieldValues['rkey'];
  dm.adosp.Open;
  if not dm.adosp.IsEmpty then
   form11.Memo1.Text:=dm.adosp.FieldValues['memo_text'];
  form11.Button2.Left:=300;  
  form11.ShowModal;
 finally
  form11.free;
 end;
end;

procedure TForm13.N4Click(Sender: TObject);
var
 i:byte;
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption :='采购订单记事本: '+dm.ADO70PO_NUMBER.Value;
  dm.adosp.close;
  dm.adosp.Parameters[1].Value:=70;
  dm.adosp.Parameters[2].Value:=dm.ADO70.FieldValues['rkey'];
  dm.adosp.Open;
  if not dm.ADOsp.IsEmpty then
   for i:=1 to 4 do
    edit_note.Memo1.Lines.Add(dm.ADOsp.fieldbyname('note_pad_line_'+inttostr(i)).AsString);
  edit_note.ShowModal;
 finally
  edit_note.free;
 end;
end;

procedure TForm13.N5Click(Sender: TObject);
var
 i:byte;
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption :='采购订单交货记事本: '+dm.ADO70PO_NUMBER.Value;
  dm.adosp.close;
  dm.adosp.Parameters[1].Value:=1070;
  dm.adosp.Parameters[2].Value:=dm.ADO70.FieldValues['rkey'];
  dm.adosp.Open;
  if not dm.ADOsp.IsEmpty then
   for i:=1 to 4 do
    edit_note.Memo1.Lines.Add(dm.ADOsp.fieldbyname('note_pad_line_'+inttostr(i)).AsString);
  edit_note.ShowModal;
 finally
  edit_note.free;
 end;
end;

procedure TForm13.N1Click(Sender: TObject);
begin
 try
  form9:=tform9.Create(application);
  with form9 do
  begin
   MaskEdit1.Text := dm.ADO71REQ_DATE.AsString;
//   MaskEdit2.Text := dm.ADO71DEL_DATE.AsString;
  end;
  form9.ShowModal;
 finally
  form9.free;
 end;
end;

procedure TForm13.N2Click(Sender: TObject);
begin
try
 form10:=tform10.Create(application);
 with form10 do
  begin
   MaskEdit1.Text := dm.ADO72del_DATE.AsString;
  end;
 form10.ShowModal;
finally
 form10.free;
end;

end;

procedure TForm13.DBGrid2DblClick(Sender: TObject);
begin
 if not dm.ADO72.IsEmpty then
  n2click(sender);
end;

procedure TForm13.DBGrid1DblClick(Sender: TObject);
begin
if not dm.ADO71.IsEmpty then
 n1click(sender);
end;

procedure TForm13.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=27 then
  self.ModalResult:=mrok;
end;

procedure TForm13.N3Click(Sender: TObject);
begin
 form_invtsupp:=tform_invtsupp.Create(application);
 form_invtsupp.ShowModal;
 form_invtsupp.Free;
end;

procedure TForm13.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if dm.ADO71CRITICAL_MATL.Value='是' then
  DBGrid1.Canvas.Font.Color := clRed;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
