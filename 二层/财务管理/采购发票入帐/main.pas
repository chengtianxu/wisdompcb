unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, Menus,
  ComObj,Excel2000,ClipBrd, DB, ADODB,DateUtils;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N11: TMenuItem;
    BitBtn3: TBitBtn;
    Label5: TLabel;
    Edit3: TEdit;
    N10: TMenuItem;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    PopupMenu2: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    Label2: TLabel;
    Edit2: TEdit;
    empl_name: TLabel;
    curr_code: TLabel;
    N6: TMenuItem;
    N7: TMenuItem;
    N27: TMenuItem;
    Edit4: TEdit;
    Label3: TLabel;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cacl_total();
    procedure CopyDbDataToExcel(Args:array of const);
    procedure BitBtn5Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
  private
    { Private declarations }
    aqd107_sql:string;
    field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
   sys_longdate,sys_shortdate:tdatetime;
  end;

var
  Form1: TForm1;

implementation

uses datamd, invt_recept, edadd_dealinvoice, tax_invoice, misc_dealinvoice,
  term, voucher_report,common;

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
if not app_init(dm.ACt) then
 begin
  showmsg('程序起动失败,请与管理员联系!',1);
  application.Terminate;
 end;
 self.Caption:= application.Title;


//  vprev:='4';
//  user_ptr:='1016';
//  dm.ACt.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd; 
end;


procedure Tform1.CopyDbDataToExcel(Args:array of const);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;
 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm1.cacl_total;
var
 total_bamt:double;
begin
 total_bamt:=0;
 dm.Aq107.DisableControls;
 dm.datasource1.DataSet:=nil;
 dm.aq107.First;
 while not dm.aq107.Eof do
  begin
   total_bamt:=total_bamt+dm.Aq107total_bamt.Value;
   dm.aq107.Next;
  end;
 dm.datasource1.DataSet:=dm.Aq107;
 dm.Aq107.EnableControls;
 form1.Edit3.Text:=format('%2f',[total_bamt]);
end;

procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.Aq107.CommandText);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if dm.act.Connected then
 begin
  field_name:='INVOICE_NO';     //过滤字段
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    sys_longdate := fieldvalues['v_dt']; //长格式
    sys_shortdate:=strtodate(datetostr(sys_longdate));
   end;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select employee_name from data0005'+#13+
               'where rkey='+user_ptr;
    open;
    self.empl_name.Caption:=fieldbyname('employee_name').AsString;
   end;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select curr_code from data0001 where rkey=1');
    open;
    self.curr_code.Caption:=fieldvalues['curr_code'];
   end;
  dm.Aq107.Close;
  dm.Aq107.Parameters[0].Value:=sys_shortdate-dayof(sys_shortdate)+1;
  dm.Aq107.Parameters[1].Value:=sys_shortdate;
  dm.Aq107.Prepared;
  dm.Aq107.Open;
  aqd107_sql:=dm.Aq107.CommandText;
 end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if dm.AQ107.IndexFieldNames<>column.FieldName then
 dm.AQ107.IndexFieldNames:=column.FieldName;
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  dm.aq107.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  dm.aq107.Filter:='';
dm.Aq107AfterOpen(dm.Aq107);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 dm.Aq107.Close;
if not checkbox1.Checked then
 dm.Aq107.Parameters[2].Value:=1
else
 dm.Aq107.Parameters[2].Value:=0;
if not checkbox2.Checked then
 dm.Aq107.Parameters[3].Value:=2
else
 dm.Aq107.Parameters[3].Value:=0;
if not checkbox3.Checked then
 dm.Aq107.Parameters[4].Value:=3
else
 dm.Aq107.Parameters[4].Value:=0;
 DM.Aq107.open;
end;

procedure TForm1.N9Click(Sender: TObject);
var
 i:word;
 amount,tax_amount: currency;
 append_flag:boolean;
begin
append_flag:=true;
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form_invtrecept:=tform_invtrecept.Create(application);
repeat
if form_invtrecept.ShowModal=mrok then
 begin
  try
   application.CreateForm(tform2,form2);
   amount:=0;
   tax_amount:=0;
   with form2 do
    begin
     edit2.Text:=form_invtrecept.aqwz456WAREHOUSE_CODE.Value;
     label8.Caption:=form_invtrecept.aqwz456name15.Value;
     edit3.Text:=form_invtrecept.aqwz456CODE.Value;
     label9.Caption:=form_invtrecept.aqwz456SUPPLIER_NAME.Value;
     edit4.Text:=form_invtrecept.aqwz456CURR_code.Value;
     label15.Caption:=form_invtrecept.aqwz456CURR_NAME.Value;
     edit5.Text:=form_invtrecept.aqwz456EXCH_RATE.AsString;
     datetimepicker1.Date:=self.sys_shortdate;
     datetimepicker2.Date:=self.sys_shortdate+form_invtrecept.aqwz456PAYMENT_TERMS.Value;

     if form_invtrecept.aqwz456TTYPE.Value <> 5 then
      combobox1.ItemIndex:=form_invtrecept.aqwz456TTYPE.Value-1 //类型
     else
      combobox1.ItemIndex:=0;
     ttype:=form_invtrecept.aqwz456TTYPE.Value;
     warehouse_ptr:=form_invtrecept.aqwz456warehouse_ptr.Value;
     supp_ptr:=form_invtrecept.aqwz456SUPP_PTR.Value;
     currency_ptr:=form_invtrecept.aqwz456CURRENCY_PTR.Value;
     acc_gl_ptr:=form_invtrecept.aqwz456ACC_PAYABLE_PTR.Value;
     abbr_name.Caption:=form_invtrecept.aqwz456ABBR_NAME.Value;
     for i:=1 to form_invtrecept.DBGrid1.SelectedRows.Count do
      begin
       form_invtrecept.dbgrid1.DataSource.DataSet.Bookmark :=
                       form_invtrecept.dbgrid1.SelectedRows.Items[i-1];
       stringgrid2.Cells[0,i]:=form_invtrecept.aqwz456GRN_NUMBER.Value;
       stringgrid2.Cells[1,i]:=form_invtrecept.aqwz456DELIVER_NUMBER.Value;
       stringgrid2.Cells[2,i]:=form_invtrecept.aqwz456PO_NUMBER.Value;
       stringgrid2.Cells[3,i]:=form_invtrecept.aqwz456ship_DATE.AsString;
       stringgrid2.Cells[4,i]:=form_invtrecept.aqwz456RKEY.AsString;
       stringgrid2.RowCount:=stringgrid2.RowCount+1;

       if form_invtrecept.aqwz456TTYPE.Value=2 then  //杂项入仓
       begin
       dm.aq235.close;
       dm.aq235.Parameters[0].Value:=form_invtrecept.aqwz456RKEY.Value;
       dm.aq235.open;
       while not dm.aq235.Eof do
        begin
         stringgrid1.Cells[0,stringgrid1.RowCount-1]:=dm.aq235goods_name.Value;
         stringgrid1.Cells[1,stringgrid1.RowCount-1]:=dm.aq235goods_guige.Value;
         stringgrid1.Cells[2,stringgrid1.RowCount-1]:=dm.aq235QUAN_RECD.AsString;
         stringgrid1.Cells[3,stringgrid1.RowCount-1]:=dm.aq235UNIT_NAME.Value;
         stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.aq235unit_price.AsString;
         stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.aq235state_tax.AsString;
         stringgrid1.Cells[6,stringgrid1.RowCount-1]:=dm.aq235amount.AsString;
         stringgrid1.Cells[7,stringgrid1.RowCount-1]:=dm.aq235tax_amount.AsString;
         stringgrid1.Cells[8,stringgrid1.RowCount-1]:=dm.aq235GRN_PTR.AsString;
         stringgrid1.RowCount:=stringgrid1.RowCount+1;
         amount:=amount+dm.aq235amount.Value;
         tax_amount:=tax_amount+dm.aq235tax_amount.Value;
         dm.aq235.Next;
        end;
       end
       else     //1,3,5标准PO
       begin
       dm.aq22.close;
       dm.aq22.Parameters[0].Value:=form_invtrecept.aqwz456RKEY.Value;
       dm.aq22.open;
       while not dm.aq22.Eof do
        begin
         stringgrid1.Cells[0,stringgrid1.RowCount-1]:=dm.aq22INV_NAME.Value;
         stringgrid1.Cells[1,stringgrid1.RowCount-1]:=dm.aq22INV_DESCRIPTION.Value;
         stringgrid1.Cells[2,stringgrid1.RowCount-1]:=dm.aq22QUANTITY.AsString;
         stringgrid1.Cells[3,stringgrid1.RowCount-1]:=dm.aq22UNIT_NAME.Value;
         stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.aq22PRICE.AsString;
         stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.aq22TAX_2.AsString;
         stringgrid1.Cells[6,stringgrid1.RowCount-1]:=dm.aq22amount.AsString;
         stringgrid1.Cells[7,stringgrid1.RowCount-1]:=dm.aq22tax_amount.AsString;
         stringgrid1.Cells[8,stringgrid1.RowCount-1]:=dm.aq22GRN_PTR.AsString;
         stringgrid1.RowCount:=stringgrid1.RowCount+1;
         amount:=amount+dm.aq22amount.Value;
         tax_amount:=tax_amount+dm.aq22tax_amount.Value;
         dm.aq22.Next;
        end;
       end;
      end;
      edit6.Text:=floattostr(amount);
      edit9.Text:=floattostr(tax_amount);
      edit8.Text:=floattostr(amount-tax_amount);
    end;
   if form2.ShowModal=mrok then
    begin
     dm.Aq107.Close;
     dm.Aq107.Open;
     dm.Aq107.Locate('rkey',dm.ADO107rkey.Value,[]);
     dm.ADO107.Close;
     dm.ADO105.Close;
     dm.ADO106.Close;
    end;
  finally
   form2.Free;
  end;
 end
else 
 append_flag:=false;
until not append_flag
finally
 form_invtrecept.Free;
end;
end;

procedure TForm1.N2Click(Sender: TObject);  //编辑
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;

 dm.ado105.close;
 dm.ado105.Parameters[0].Value:=dm.Aq107rkey105.Value;
 dm.ado105.open;
 if dm.ado105STATUS.Value>0 then
  begin
   messagedlg('发票生成的会计凭证已被审核,无法编辑!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

if strtoint(dm.Aq107INV_TP.Value)<>4 then
try
 form2:=tform2.Create(application);
 with form2 do
  begin
   edit1.Text:=dm.Aq107INVOICE_NO.Value;

   dm.ADOSP04.Close;
   dm.ADOSP04.Open;
   if dm.ADOSP04SEED_FLAG.Value=4 then
   Edit1.ReadOnly:=True;
   edit2.Text:=dm.aq107WAREHOUSE_CODE.Value;
   label8.Caption:=dm.Aq107name15.Value;
   edit3.Text:=dm.Aq107CODE.Value;
   label9.Caption:=dm.aq107SUPPLIER_NAME.Value;
   edit4.Text:=dm.Aq107CURR_code.Value;
   label15.Caption:=dm.Aq107CURR_NAME.Value;
   edit5.Text:=dm.Aq107EX_RATE.AsString;
   datetimepicker1.Date:=dm.Aq107INV_DATE.Value;
   datetimepicker2.Date:=dm.Aq107DUE_DATE.Value;
   combobox1.ItemIndex:=strtoint(dm.Aq107INV_TP.Value);
   edit6.Text:=dm.Aq107INV_TOTAL.AsString;
   edit7.Text:=dm.Aq107MISC_TOT.AsString;
   edit8.Text:=dm.Aq107MATL_TOT.AsString;
   edit9.Text:=dm.Aq107FED_TAX.AsString;
   abbr_name.Caption:=dm.Aq107ABBR_NAME.Value;
   warehouse_ptr:=0;//标识新增状态,因编辑时不用修改工厂指针
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('SELECT Data0456.RKEY, Data0456.GRN_NUMBER,data0456.ttype,');
     sql.Add('Data0456.DELIVER_NUMBER, Data0070.PO_NUMBER,Data0456.ship_DATE');
     sql.Add('FROM Data0456 LEFT OUTER JOIN');
     sql.Add('Data0070 ON Data0456.PO_PTR = Data0070.RKEY');
     sql.Add('where data0456.dealiv_ptr='+dm.Aq107rkey.AsString);
     open;
    end;
   ttype := dm.ADOQuery1.fieldbyname('ttype').AsInteger;
   while not dm.ADOQuery1.Eof do
    begin
     stringgrid2.Cells[0,stringgrid2.RowCount-1]:=dm.ADOQuery1.FieldValues['GRN_NUMBER'];
     stringgrid2.Cells[1,stringgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('DELIVER_NUMBER').AsString;
     stringgrid2.Cells[2,stringgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('PO_NUMBER').AsString;
     stringgrid2.Cells[3,stringgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('ship_DATE').AsString;
     stringgrid2.Cells[4,stringgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('RKEY').AsString;
     stringgrid2.RowCount:=stringgrid2.RowCount+1;

    if strtoint(dm.Aq107INV_TP.Value)=1 then  //杂项入仓
     begin
      dm.aq235.close;
      dm.aq235.Parameters[0].Value:=dm.ADOQuery1.FieldValues['RKEY'];
      dm.aq235.open;
      while not dm.aq235.Eof do
       begin
        stringgrid1.Cells[0,stringgrid1.RowCount-1]:=dm.aq235goods_name.Value;
        stringgrid1.Cells[1,stringgrid1.RowCount-1]:=dm.aq235goods_guige.Value;
        stringgrid1.Cells[2,stringgrid1.RowCount-1]:=dm.aq235QUAN_RECD.AsString;
        stringgrid1.Cells[3,stringgrid1.RowCount-1]:=dm.aq235UNIT_NAME.Value;
        stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.aq235unit_price.AsString;
        stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.aq235state_tax.AsString;
        stringgrid1.Cells[6,stringgrid1.RowCount-1]:=dm.aq235amount.AsString;
        stringgrid1.Cells[7,stringgrid1.RowCount-1]:=dm.aq235tax_amount.AsString;
        stringgrid1.Cells[8,stringgrid1.RowCount-1]:=dm.aq235GRN_PTR.AsString;
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        dm.aq235.Next;
       end;
     end
    else     //1,3标准PO杂项PO
     begin

     dm.aq22.close;
     dm.aq22.Parameters[0].Value:=dm.ADOQuery1.FieldValues['RKEY'];
     dm.aq22.open;
     while not dm.aq22.Eof do
      begin
       stringgrid1.Cells[0,stringgrid1.RowCount-1]:=dm.aq22INV_NAME.Value;
       stringgrid1.Cells[1,stringgrid1.RowCount-1]:=dm.aq22INV_DESCRIPTION.Value;
       stringgrid1.Cells[2,stringgrid1.RowCount-1]:=dm.aq22QUANTITY.AsString;
       stringgrid1.Cells[3,stringgrid1.RowCount-1]:=dm.aq22UNIT_NAME.Value;
       stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.aq22PRICE.AsString;
       stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.aq22TAX_2.AsString;
       stringgrid1.Cells[6,stringgrid1.RowCount-1]:=dm.aq22amount.AsString;
       stringgrid1.Cells[7,stringgrid1.RowCount-1]:=dm.aq22tax_amount.AsString;
       stringgrid1.Cells[8,stringgrid1.RowCount-1]:=dm.aq22GRN_PTR.AsString;
       stringgrid1.RowCount:=stringgrid1.RowCount+1;
       dm.aq22.Next;
      end;
       end;
     dm.ADOQuery1.Next;
    end;
    dm.aq22.Close;
    dm.aq235.Close;
  end;
 if form2.ShowModal=mrok then
  begin
   dm.Aq107.Close;
   dm.Aq107.Open;
   dm.Aq107.Locate('rkey',dm.ADO107rkey.Value,[]);
   dm.ADO107.Close;
   dm.ADO105.Close;
   dm.ADO106.Close;
  end;
finally
 form2.Free;
end
else
 try
  form4:=tform4.Create(application);
  with form4 do
   begin
    add_edit.Caption:='1';//代表编辑
    edit1.Text:=dm.Aq107INVOICE_NO.Value;
    dm.ADOSP04.Close;
    dm.ADOSP04.Open;
    if dm.ADOSP04SEED_FLAG.Value=4 then
     Edit1.ReadOnly:=True;

    edit2.Text:=dm.Aq107WAREHOUSE_CODE.Value;
    label8.Caption:=dm.Aq107name15.Value;
    edit3.Text:=dm.Aq107CODE.Value;
    label9.Caption:=dm.Aq107SUPPLIER_NAME.Value;
    edit4.Text:=dm.Aq107CURR_code.Value;
    label14.Caption:=dm.Aq107CURR_NAME.Value;
    edit5.Text:=dm.Aq107EX_RATE.AsString;
    datetimepicker1.Date:=dm.Aq107INV_DATE.Value;
    datetimepicker2.Date:=dm.Aq107DUE_DATE.Value;
    edit6.Text:=dm.Aq107INV_TOTAL.AsString;
    edit7.Text:=dm.Aq107MISC_TOT.AsString;
    edit8.Text:=dm.Aq107MATL_TOT.AsString;
    edit9.Text:=dm.Aq107FED_TAX.AsString;
    abbr_name.Caption:=dm.Aq107ABBR_NAME.Value;
    combobox1.ItemIndex:=strtoint(dm.Aq107INV_TP.Value);
   end;
  if form4.ShowModal=mrok then
   begin
   dm.Aq107.Close;
   dm.Aq107.Open;
   dm.Aq107.Locate('rkey',dm.ADO107rkey.Value,[]);
   dm.ADO107.Close;    
   end;
 finally
  form4.Free;
 end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if strtoint(dm.Aq107INV_TP.Value)<>4 then
try
 form2:=tform2.Create(application);
 with form2 do
  begin
   edit1.Text:=dm.Aq107INVOICE_NO.Value;
   edit2.Text:=dm.aq107WAREHOUSE_CODE.Value;
   label8.Caption:=dm.Aq107name15.Value;
   edit3.Text:=dm.Aq107CODE.Value;
   label9.Caption:=dm.aq107SUPPLIER_NAME.Value;
   edit4.Text:=dm.Aq107CURR_code.Value;
   label15.Caption:=dm.Aq107CURR_NAME.Value;
   edit5.Text:=dm.Aq107EX_RATE.AsString;
   datetimepicker1.Date:=dm.Aq107INV_DATE.Value;
   datetimepicker2.Date:=dm.Aq107DUE_DATE.Value;
   combobox1.ItemIndex:=strtoint(dm.Aq107INV_TP.Value);
   edit6.Text:=dm.Aq107INV_TOTAL.AsString;
   edit7.Text:=dm.Aq107MISC_TOT.AsString;
   edit8.Text:=dm.Aq107MATL_TOT.AsString;
   edit9.Text:=dm.Aq107FED_TAX.AsString;
   warehouse_ptr:=0;//不是新增门状态
   bitbtn1.Enabled:=false;
   edit1.Enabled:=false;
   datetimepicker1.Enabled:=false;
   datetimepicker2.Enabled:=false;
   stringgrid2.PopupMenu:=nil;
   speedbutton1.Enabled:=false;
   speedbutton2.Visible:=false;
   
   edit5.Enabled:=false;
   edit7.Enabled:=false;
   sgrid1.Enabled:=false;
   toolbar1.Enabled:=false;
   edit_number.Enabled:=false;
   edit_date.Enabled:=false;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('SELECT Data0456.RKEY, Data0456.GRN_NUMBER,');
     sql.Add('Data0456.DELIVER_NUMBER, Data0070.PO_NUMBER,Data0456.ship_DATE');
     sql.Add('FROM Data0456 LEFT OUTER JOIN');
     sql.Add('Data0070 ON Data0456.PO_PTR = Data0070.RKEY');
     sql.Add('where data0456.dealiv_ptr='+dm.Aq107rkey.AsString);
     open;
    end;
   while not dm.ADOQuery1.Eof do
    begin
     stringgrid2.Cells[0,stringgrid2.RowCount-1]:=dm.ADOQuery1.FieldValues['GRN_NUMBER'];
     stringgrid2.Cells[1,stringgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('DELIVER_NUMBER').AsString;
     stringgrid2.Cells[2,stringgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('PO_NUMBER').AsString;
     stringgrid2.Cells[3,stringgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('ship_DATE').AsString;
     stringgrid2.Cells[4,stringgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('RKEY').AsString;
     stringgrid2.RowCount:=stringgrid2.RowCount+1;
     if strtoint(dm.Aq107INV_TP.Value)=1 then  //杂项入仓
     begin
      dm.aq235.close;
      dm.aq235.Parameters[0].Value:=dm.ADOQuery1.FieldValues['RKEY'];
      dm.aq235.open;
      while not dm.aq235.Eof do
       begin
        stringgrid1.Cells[0,stringgrid1.RowCount-1]:=dm.aq235goods_name.Value;
        stringgrid1.Cells[1,stringgrid1.RowCount-1]:=dm.aq235goods_guige.Value;
        stringgrid1.Cells[2,stringgrid1.RowCount-1]:=dm.aq235QUAN_RECD.AsString;
        stringgrid1.Cells[3,stringgrid1.RowCount-1]:=dm.aq235UNIT_NAME.Value;
        stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.aq235unit_price.AsString;
        stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.aq235state_tax.AsString;
        stringgrid1.Cells[6,stringgrid1.RowCount-1]:=dm.aq235amount.AsString;
        stringgrid1.Cells[7,stringgrid1.RowCount-1]:=dm.aq235tax_amount.AsString;
        stringgrid1.Cells[8,stringgrid1.RowCount-1]:=dm.aq235GRN_PTR.AsString;
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        dm.aq235.Next;
       end;
     end
    else     //1,3标准PO杂项PO
     begin
      dm.aq22.close;
      dm.aq22.Parameters[0].Value:=dm.ADOQuery1.FieldValues['RKEY'];
      dm.aq22.open;
      while not dm.aq22.Eof do
      begin
       stringgrid1.Cells[0,stringgrid1.RowCount-1]:=dm.aq22INV_NAME.Value;
       stringgrid1.Cells[1,stringgrid1.RowCount-1]:=dm.aq22INV_DESCRIPTION.Value;
       stringgrid1.Cells[2,stringgrid1.RowCount-1]:=dm.aq22QUANTITY.AsString;
       stringgrid1.Cells[3,stringgrid1.RowCount-1]:=dm.aq22UNIT_NAME.Value;
       stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.aq22PRICE.AsString;
       stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.aq22TAX_2.AsString;
       stringgrid1.Cells[6,stringgrid1.RowCount-1]:=dm.aq22amount.AsString;
       stringgrid1.Cells[7,stringgrid1.RowCount-1]:=dm.aq22tax_amount.AsString;
       stringgrid1.Cells[8,stringgrid1.RowCount-1]:=dm.aq22GRN_PTR.AsString;
       stringgrid1.RowCount:=stringgrid1.RowCount+1;
       dm.aq22.Next;
      end;
     end;
     dm.ADOQuery1.Next;
    end;
    dm.aq22.Close;
    dm.aq235.Close;
  end;
   form2.ShowModal;
finally
 form2.Free;
end
else
 try
  form4:=tform4.Create(application);
  with form4 do
   begin
    add_edit.Caption:='2';//代表检查
    edit1.Text:=dm.Aq107INVOICE_NO.Value;
    edit2.Text:=dm.Aq107WAREHOUSE_CODE.Value;
    label8.Caption:=dm.Aq107name15.Value;
    edit3.Text:=dm.Aq107CODE.Value;
    label9.Caption:=dm.Aq107SUPPLIER_NAME.Value;
    edit4.Text:=dm.Aq107CURR_code.Value;
    label14.Caption:=dm.Aq107CURR_NAME.Value;
    edit5.Text:=dm.Aq107EX_RATE.AsString;
    datetimepicker1.Date:=dm.Aq107INV_DATE.Value;
    datetimepicker2.Date:=dm.Aq107DUE_DATE.Value;
    edit6.Text:=dm.Aq107INV_TOTAL.AsString;
    edit7.Text:=dm.Aq107MISC_TOT.AsString;
    edit8.Text:=dm.Aq107MATL_TOT.AsString;
    edit9.Text:=dm.Aq107FED_TAX.AsString;
    combobox1.ItemIndex:=strtoint(dm.Aq107INV_TP.Value);
    bitbtn1.Enabled:=false;
    edit1.Enabled:=false;
    bitbtn2.Enabled:=false;
    bitbtn4.Enabled:=false;
    bitbtn5.Enabled:=false;
    edit5.Enabled:=false;
    datetimepicker1.Enabled:=false;
    datetimepicker2.Enabled:=false;
    edit7.Enabled:=false;
    edit8.Enabled:=false;
    edit9.Enabled:=false;
    edit10.Enabled:=false;
    edit11.Enabled:=false;
    datetimepicker3.Enabled:=false;
    sgrid1.Enabled:=false;
    toolbar1.Enabled:=false;
    edit_number.Enabled:=false;
    edit_date.Enabled:=false;
   end;
  form4.ShowModal;
 finally
  form4.free;
 end;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
 form3:=tform3.Create(application);
 dm.ADO107.Close;
 dm.ADO107.Parameters[0].Value:=dm.Aq107rkey.Value;
 dm.ADO107.Open;
 form3.Edit1.Text:=dm.ADO107tax_invoice_amt.AsString;
 form3.DateTimePicker1.Date:=dm.ADO107tax_invoice_date.Value;
 form3.Edit2.Text:=dm.ADO107tax_invoice_ref.Value;
if form3.ShowModal = mrok then
 begin

  dm.ADO107.Edit;
  dm.ADO107tax_invoice_amt.Value:=strtofloat(form3.Edit1.Text);
  dm.ADO107tax_invoice_date.Value:=form3.DateTimePicker1.Date;
  dm.ADO107tax_invoice_ref.Value:=form3.Edit2.Text;
  dm.ADO107.Post;
  dm.ADO107.Close;

 end;
finally
form3.Free;
end;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form4:=tform4.Create(application);
if form4.ShowModal=mrok then
 begin
  dm.Aq107.Close;
  dm.Aq107.Open;
  dm.Aq107.Locate('rkey',dm.ADO107rkey.Value,[]);
  dm.ADO107.Close;
 end;
finally
form4.Free;
end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin

 if strtoint(user_ptr)<>dm.Aq107EMPL_PTR.Value then
 begin
  messagedlg('取消操作必须输入人员才可能操作!',mtinformation,[mbok],0);
  exit;
 end;

  dm.ado105.close;
  dm.ado105.Parameters[0].Value:=dm.Aq107rkey105.Value;
  dm.ado105.open;
  if dm.ado105.IsEmpty then
  begin
   messagedlg('发票状态发生了改变,请刷新后再操作',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;
  if dm.ado105STATUS.Value>0 then
  begin
   messagedlg('发票生成的会计凭证已被审核,无法了取消!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

  dm.ADO107.Close;
  dm.ADO107.Parameters[0].Value:=dm.Aq107rkey.Value;
  dm.ADO107.Open;

  if dm.ADO107AMT_PAID.Value+dm.ADO107CASH_DISC.Value > 0 then
  begin
   messagedlg('发票已经产生了付款金额,无法取消!',mtinformation,[mbcancel],0);
   dm.ADO107.Close;
   exit;
  end;

  if dm.ADO107STATUS.Value<>dm.Aq107status.Value then
   messagedlg('不能取消该张发票状态已经发生改变!',mtinformation,[mbcancel],0)
  else
  begin
  dm.ACt.BeginTrans;
  try
  case strtoint(dm.Aq107INV_TP.Value) of
  0:
   begin
    with dm.adoquery2 do
     begin
      close;
      sql.Clear;
      sql.Add('update data0070');   //修改70曾被修改的状态
      sql.Add('set status=6');
      sql.Add('where rkey in (select dbo.Data0456.PO_PTR');
      sql.Add('FROM dbo.Data0456 INNER JOIN');
      sql.Add('dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY INNER JOIN');
      sql.Add('dbo.Data0071 ON dbo.Data0070.RKEY = dbo.Data0071.PO_PTR');
      sql.Add('WHERE (dbo.Data0456.dealiv_ptr = :rkey107) AND (dbo.Data0070.STATUS = 7)');
      sql.Add('GROUP BY dbo.Data0456.PO_PTR');
      sql.Add('HAVING (SUM(dbo.Data0071.QUAN_INVD) >= SUM(dbo.Data0071.QUAN_RECD)))');
      Parameters[0].Value:=dm.ADO107rkey.Value;
      execsql;
     end;
    with dm.ADOQuery2 do
    begin
    close;
    sql.Clear;
    sql.Add('update data0071');
    sql.Add('set QUAN_INVD = QUAN_INVD-data0022.QUANTITY');
    sql.Add('FROM dbo.Data0071 INNER JOIN');
    sql.Add('dbo.Data0022 ON dbo.Data0071.RKEY = dbo.Data0022.SOURCE_PTR INNER JOIN');
    sql.Add('dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY');
    sql.Add('where data0456.dealiv_ptr='+dm.Aq107rkey.AsString);
    ExecSQL
    end;
   end;
  1:
   begin
    with dm.adoquery2 do
     begin
      close;
      sql.Clear;
      sql.Add('update data0070');
      sql.Add('set status=6');
      sql.Add('where rkey in (select dbo.Data0456.PO_PTR');
      sql.Add('FROM dbo.Data0456 INNER JOIN');
      sql.Add('dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY INNER JOIN');
      sql.Add('dbo.Data0072 ON dbo.Data0070.RKEY = dbo.Data0072.POPTR');
      sql.Add('WHERE (dbo.Data0456.dealiv_ptr = :rkey107) AND (dbo.Data0070.STATUS = 7)');
      sql.Add('GROUP BY dbo.Data0456.PO_PTR');
      sql.Add('HAVING (SUM(dbo.Data0072.QUAN_INVD) >= SUM(dbo.Data0072.QUANTITY_RECEIVED)))');
      Parameters[0].Value:=dm.ADO107rkey.Value;
      execsql;
     end;
    with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0072');
     sql.Add('set QUAN_INVD = QUAN_INVD-data0235.QUAN_RECD');
     sql.Add('FROM dbo.Data0072 INNER JOIN');
     sql.Add('dbo.Data0235 ON dbo.Data0072.RKEY = dbo.Data0235.D0072_PTR INNER JOIN');
     sql.Add('dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY');
     sql.Add('where data0456.dealiv_ptr='+dm.Aq107rkey.AsString);
     ExecSQL
    end;
   end;
  end;

  if strtoint(dm.Aq107INV_TP.Value)<>4 then
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0456');
     sql.Add('set status=3,');
     sql.Add('dealiv_ptr=null');
     sql.Add('where dealiv_ptr='+dm.Aq107rkey.AsString);
     ExecSQL
    end;

   dm.ADO107.Edit;
   dm.ADO107STATUS.Value:=3;
   dm.ADO107.Post;

   if not dm.ado105.IsEmpty then
    begin
     dm.ADO105.Edit;
     dm.ADO105STATUS.Value:=5;
     dm.ado105.Post;
    end;
   dm.ACt.CommitTrans;
   showmessage('数据取消操作成功!');
   dm.Aq107.Close;
   dm.Aq107.Open;
   dm.Aq107.Locate('rkey',dm.ADO107rkey.Value,[]);
   dm.ADO107.Close;
   dm.ADO105.Close;
   except
   on E: Exception do
    begin
     dm.ACt.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     edit1.SetFocus;
    end;
   end;
  end;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
   n2.Enabled:=true;
   n3.Enabled:=true;
   n4.Enabled:=true;
   n8.Enabled:=true;
   n6.Enabled:=true;
 case dm.Aq107STATUS.Value of
 1:
  begin

  end;
 2:
  begin
   n2.Enabled:=false;
   n4.Enabled:=false;

  end;
 3:
  begin
   n2.Enabled:=false;
   n4.Enabled:=false;
   n3.Enabled:=false;
  end;
 else
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
   n4.Enabled:=false;
   n6.Enabled:=false;
   n8.Enabled:=false;
  end;
 end;
 if (dm.Aq107FED_TAX.AsFloat=0) and (not dm.Aq107GLPTR_STATUS.Value) then
  N30.Enabled:= True
 else
  N30.Enabled:= False;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
 rkey:=dm.Aq107rkey.Value;
 dm.Aq107.Close;
 dm.Aq107.Open;
 if rkey>0 then
  dm.Aq107.Locate('rkey',rkey,[]);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
 CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm1.N12Click(Sender: TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
form_condition:=tform_condition.Create(application);
form_condition.dtpk1.Date:=dm.aq107.Parameters.ParamValues['dtpk1'];
form_condition.dtpk2.Date:=dm.aq107.Parameters.ParamValues['dtpk2'];
if form_condition.ShowModal=mrok then
 begin
  dm.aq107.Close;
  dm.aq107.CommandText:=self.aqd107_sql;

  for i:=1 to form_condition.SGrid1.RowCount-2 do
   dm.aq107.CommandText:=dm.aq107.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;

  dm.aq107.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
  dm.aq107.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date;
  dm.Aq107.Prepared;
  dm.aq107.Open;
 end;
form_condition.Free;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 form_voucherreport:=Tform_voucherreport.Create(application);
 form_voucherreport.AQD105.Close;
 form_voucherreport.AQD105.Parameters[0].Value:=dm.Aq107rkey105.Value;
 form_voucherreport.AQD105.open;
 form_voucherreport.AQD106.Open;
 form_voucherreport.AQD493.Open;
 if not form_voucherreport.AQD105.IsEmpty then
 form_voucherreport.ppReport1.Print;
 form_voucherreport.Free;
end;


procedure TForm1.N30Click(Sender: TObject);
begin
  IF dm.Aq107FED_TAX.AsFloat=0 then
  begin
    try
      with dm.ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE Data0107 SET GLPTR_STATUS=1 WHERE FED_TAX=0 AND GLPTR_STATUS=0 AND RKEY='+dm.Aq107RKEY.AsString);
        ExecSQL;
      end;

      if dm.Aq107DSDesigner4.Value=0 then
      with dm.ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE Data0107 SET STATUS=2 WHERE STATUS=1 AND Data0107.INV_TOTAL-Data0107.AMT_PAID=0 AND RKEY='+dm.Aq107RKEY.AsString);
        ExecSQL;
      end;

      showmessage('操作成功');
    except
      showmessage('操作失败');
      abort;
    end;
    BitBtn3Click(nil);
  end;
end;

end.
