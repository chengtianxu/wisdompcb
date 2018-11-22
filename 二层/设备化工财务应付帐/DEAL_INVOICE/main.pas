unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, Menus,
  ComObj,Excel2000,ClipBrd, DB, ADODB;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N11: TMenuItem;
    user_ptr: TLabel;
    vprev: TLabel;
    db_ptr: TLabel;
    BitBtn3: TBitBtn;
    Label5: TLabel;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cacl_total();
  private
    { Private declarations }
   v_colwidth: array of integer;
   field_name:string;
    hMapFile: THandle;
    MapFilePointer: Pointer;   
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
   sys_longdate,sys_shortdate:tdatetime;
  end;

var
  Form1: TForm1;

implementation

uses datamd, invt_recept, edadd_dealinvoice, tax_invoice, misc_dealinvoice;

{$R *.dfm}
procedure TForm1.cacl_total;
var
 total_bamt:double;
 rkey:integer;
begin
 total_bamt:=0;
 rkey:=dm.Aq107rkey.Value;
 dm.Aq107.DisableControls;
 dm.datasource1.DataSet:=nil;
 dm.aq107.First;
 while not dm.aq107.Eof do
  begin
   total_bamt:=total_bamt+dm.Aq107total_bamt.Value;
   dm.aq107.Next;
  end;

 if rkey>0 then dm.Aq107.Locate('rkey',rkey,[]);
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


procedure TForm1.FormCreate(Sender: TObject);
var
 ZAppName: array[0..127] of char;
 s,title_name:string;
 Found: HWND;
 vprog:pchar;
begin
 hMapFile := CreateFileMapping ($FFFFFFFF,nil,page_ReadWrite,0,100,'xyz2055coimasp20');
  MapFilePointer := MapViewOfFile(hMapFile,File_Map_All_Access,0,0,0);
  S := PChar(MapFilePointer);

  user_ptr.Caption := trim(copy(S,3,pos(' ',s)-3));
  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1));
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s)));

  title_name:=application.Title;

  application.Title:='OnlyOne'+ IntToStr(HInstance);
  vprog:=pchar(title_name);
  strpcopy(ZAppName,vprog);
  Found := FindWindow(nil,ZAppName);


  if Found <> 0 then
   begin
    ShowWindow(Found, SW_SHOWMINIMIZED);
    ShowWindow(Found, SW_SHOWNORMAL);
    application.Terminate;
   end;

  application.Title := title_name;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.Aq107.SQL.Text);
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin
if not dm.act.Connected then
 begin
  if trim(vprev.Caption)='' then  application.Terminate;
   dm.act.ConnectionString := db_ptr.Caption;
   dm.act.Connected := true;
   setlength(v_colwidth,10);
   for i:=low(v_colwidth) to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
   field_name:='INVOICE_NO';     //设备过滤字段
   with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    sys_longdate := fieldvalues['v_dt']; //长格式
    sys_shortdate:=strtodate(datetostr(sys_longdate));
   end;
  dtpk2.Date := sys_shortdate;
  dtpk1.Date := dtpk2.Date - 10;
  dm.Aq107.Close;
  dm.Aq107.Parameters[0].Value:=dtpk1.Date;
  dm.Aq107.Parameters[1].Value:=dtpk2.Date;
  dm.Aq107.Open;
 end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-725)*v_colwidth[i]/700);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
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
self.cacl_total;  
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
begin
    Screen.Cursor := crHourglass;
    DBGrid1.DataSource.DataSet.DisableControls;
    bm := DBGrid1.DataSource.DataSet.GetBookmark;
    DBGrid1.DataSource.DataSet.First;

    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrid1.FieldCount-1 do
      sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
     begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
        sline := sline + DBGrid1.Fields[col].AsString + #9;
      mem.Add(sline);
      DBGrid1.DataSource.DataSet.Next;
     end;

    // we copy the data to the clipboard
    clipboard.Clear;
    Clipboard.AsText:=mem.Text;

    // if needed, send it to Excel
    // if not, we already have it in the clipboard
    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;
  //  FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
end;

procedure TForm1.dtpk1CloseUp(Sender: TObject);
begin
  dm.Aq107.Close;
  dm.Aq107.Parameters[0].Value:=dtpk1.Date;
  dm.Aq107.Parameters[1].Value:=dtpk2.Date;
  dm.Aq107.Open;
  
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
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form_invtrecept:=tform_invtrecept.Create(application);
form_invtrecept.dtpk2.Date:=self.sys_shortdate;
form_invtrecept.dtpk1.Date:=self.sys_shortdate-30;
if form_invtrecept.ShowModal=mrok then
 begin
  try
   application.CreateForm(tform2,form2);
   amount:=0;
   tax_amount:=0;
   with form2 do
    begin
     edit2.Text:=form_invtrecept.aqwz456WAREHOUSE_CODE.Value;
     label8.Caption:=form_invtrecept.aqwz456WAREHOUSE_NAME.Value;
     edit3.Text:=form_invtrecept.aqwz456CODE.Value;
     label9.Caption:=form_invtrecept.aqwz456SUPPLIER_NAME.Value;
     edit4.Text:=form_invtrecept.aqwz456CURR_NAME.Value;
     edit5.Text:=form_invtrecept.aqwz456EXCHANGE_RATE.AsString;
     datetimepicker1.Date:=self.sys_shortdate;
     datetimepicker2.Date:=self.sys_shortdate+form_invtrecept.aqwz456PAYMENT_TERMS.Value;
     combobox1.ItemIndex:=form_invtrecept.aqwz456TTYPE.Value-1;
     warehouse_ptr:=form_invtrecept.aqwz456warehouse_ptr.Value;
     form2.supp_ptr:=form_invtrecept.aqwz456SUPP_PTR.Value;
     form2.currency_ptr:=form_invtrecept.aqwz456CURRENCY_PTR.Value;
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
      edit6.Text:=floattostr(amount);
      edit9.Text:=floattostr(tax_amount);
      edit8.Text:=floattostr(amount-tax_amount);
    end;
   if form2.ShowModal=mrok then
    begin

     case dm.ADO107INV_TP.Value of
     1:
      begin
      dm.ADOupdate70.Close;
      dm.ADOupdate70.Parameters[0].Value:=dm.ADO107rkey.Value;
      dm.ADOupdate70.ExecSQL;
      end;
     2:
      begin
      dm.ADOupmc70.Close;
      dm.ADOupmc70.Parameters[0].Value:=dm.ADO107rkey.Value;
      dm.ADOupmc70.ExecSQL;
      end;
     end;

     dm.Aq107.Close;
     dm.Aq107.Open;
     dm.Aq107.Locate('rkey',dm.ADO107rkey.Value,[]);
     dm.ADO107.Close;
    end;
  finally
   form2.Free;
  end;
 end;
finally
 form_invtrecept.Free;
end;
end;

procedure TForm1.N2Click(Sender: TObject);  //编辑
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if dm.Aq107INV_TP.Value<>4 then
try
 form2:=tform2.Create(application);
 with form2 do
  begin
   edit1.Text:=dm.Aq107INVOICE_NO.Value;
   edit2.Text:=dm.aq107WAREHOUSE_CODE.Value;
   label8.Caption:=dm.Aq107WAREHOUSE_NAME.Value;
   edit3.Text:=dm.Aq107CODE.Value;
   label9.Caption:=dm.aq107SUPPLIER_NAME.Value;
   edit4.Text:=dm.Aq107CURR_NAME.Value;
   edit5.Text:=dm.Aq107EX_RATE.AsString;
   datetimepicker1.Date:=dm.Aq107INV_DATE.Value;
   datetimepicker2.Date:=dm.Aq107DUE_DATE.Value;
   combobox1.ItemIndex:=dm.Aq107INV_TP.Value-1;
   edit6.Text:=dm.Aq107INV_TOTAL.AsString;
   edit7.Text:=dm.Aq107MISC_TOT.AsString;
   edit8.Text:=dm.Aq107MATL_TOT.AsString;
   edit9.Text:=dm.Aq107FED_TAX.AsString;
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
     dm.ADOQuery1.Next;
    end;
  end;
 if form2.ShowModal=mrok then
  begin
   case dm.ADO107INV_TP.Value of
    1:
     begin
      dm.ADOupdate70.Close;
      dm.ADOupdate70.Parameters[0].Value:=dm.ADO107rkey.Value;
      dm.ADOupdate70.ExecSQL;
     end;
    2:
     begin
      dm.ADOupmc70.Close;
      dm.ADOupmc70.Parameters[0].Value:=dm.ADO107rkey.Value;
      dm.ADOupmc70.ExecSQL;
     end;
   end;
   dm.Aq107.Close;
   dm.Aq107.Open;
   dm.Aq107.Locate('rkey',dm.ADO107rkey.Value,[]);
   dm.ADO107.Close;
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
    edit2.Text:=dm.Aq107WAREHOUSE_CODE.Value;
    label8.Caption:=dm.Aq107WAREHOUSE_NAME.Value;
    edit3.Text:=dm.Aq107CODE.Value;
    label9.Caption:=dm.Aq107SUPPLIER_NAME.Value;
    edit4.Text:=dm.Aq107CURR_NAME.Value;
    edit5.Text:=dm.Aq107EX_RATE.AsString;
    datetimepicker1.Date:=dm.Aq107INV_DATE.Value;
    datetimepicker2.Date:=dm.Aq107DUE_DATE.Value;
    edit6.Text:=dm.Aq107INV_TOTAL.AsString;
    edit7.Text:=dm.Aq107MISC_TOT.AsString;
    edit8.Text:=dm.Aq107MATL_TOT.AsString;
    edit9.Text:=dm.Aq107FED_TAX.AsString;
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
if dm.Aq107INV_TP.Value<>4 then
try
 form2:=tform2.Create(application);
 with form2 do
  begin
   edit1.Text:=dm.Aq107INVOICE_NO.Value;
   edit2.Text:=dm.aq107WAREHOUSE_CODE.Value;
   label8.Caption:=dm.Aq107WAREHOUSE_NAME.Value;
   edit3.Text:=dm.Aq107CODE.Value;
   label9.Caption:=dm.aq107SUPPLIER_NAME.Value;
   edit4.Text:=dm.Aq107CURR_NAME.Value;
   edit5.Text:=dm.Aq107EX_RATE.AsString;
   datetimepicker1.Date:=dm.Aq107INV_DATE.Value;
   datetimepicker2.Date:=dm.Aq107DUE_DATE.Value;
   combobox1.ItemIndex:=dm.Aq107INV_TP.Value-1;
   edit6.Text:=dm.Aq107INV_TOTAL.AsString;
   edit7.Text:=dm.Aq107MISC_TOT.AsString;
   edit8.Text:=dm.Aq107MATL_TOT.AsString;
   edit9.Text:=dm.Aq107FED_TAX.AsString;

   bitbtn1.Enabled:=false;
   edit1.Enabled:=false;
   datetimepicker1.Enabled:=false;
   datetimepicker2.Enabled:=false;
   stringgrid2.PopupMenu:=popupmenu2;
   speedbutton1.Enabled:=false;
   speedbutton2.Visible:=false;

   edit7.Enabled:=false;

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
     dm.ADOQuery1.Next;
    end;
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
    label8.Caption:=dm.Aq107WAREHOUSE_NAME.Value;
    edit3.Text:=dm.Aq107CODE.Value;
    label9.Caption:=dm.Aq107SUPPLIER_NAME.Value;
    edit4.Text:=dm.Aq107CURR_NAME.Value;
    edit5.Text:=dm.Aq107EX_RATE.AsString;
    datetimepicker1.Date:=dm.Aq107INV_DATE.Value;
    datetimepicker2.Date:=dm.Aq107DUE_DATE.Value;
    edit6.Text:=dm.Aq107INV_TOTAL.AsString;
    edit7.Text:=dm.Aq107MISC_TOT.AsString;
    edit8.Text:=dm.Aq107MATL_TOT.AsString;
    edit9.Text:=dm.Aq107FED_TAX.AsString;

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
   end;
  form4.ShowModal;
 finally
  form4.free;
 end;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
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
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
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
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ACt.BeginTrans;
  try
  case dm.Aq107INV_TP.Value of
  1:
   begin
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
  2:
   begin
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

  if dm.Aq107INV_TP.Value<>4 then
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

   dm.ADO107.Close;
   dm.ADO107.Parameters[0].Value:=dm.Aq107rkey.Value;
   dm.ADO107.Open;
   dm.ADO107.Delete;
   dm.ACt.CommitTrans;
   showmessage('数据删除成功!');
   dm.Aq107.Close;
   dm.Aq107.Open;
   
   except
    dm.ACt.RollbackTrans;
    showmessage('数据删除遇到错误请速与管理员联系William.Wang!');
   end;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 begin
   dm.ADO107.Close;
   dm.ADO107.Parameters[0].Value:=dm.Aq107rkey.Value;
   dm.ADO107.Open;
   dm.ADO107.Edit;
   dm.ADO107STATUS.Value:=3;
   dm.ADO107.Post;
   dm.Aq107.Close;
   dm.Aq107.Open;
   dm.Aq107.Locate('rkey',dm.ADO107rkey.Value,[]);
   dm.ADO107.Close;
 end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 begin
   dm.ADO107.Close;
   dm.ADO107.Parameters[0].Value:=dm.Aq107rkey.Value;
   dm.ADO107.Open;
   dm.ADO107.Edit;
   dm.ADO107STATUS.Value:=1;
   dm.ADO107.Post;
   dm.Aq107.Close;
   dm.Aq107.Open;
   dm.Aq107.Locate('rkey',dm.ADO107rkey.Value,[]);
   dm.ADO107.Close;
 end;    
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
   n2.Enabled:=true;
   n3.Enabled:=true;
   n4.Enabled:=true;
   n6.Enabled:=true;
   n7.Enabled:=true;
   n8.Enabled:=true;
 case dm.Aq107STATUS.Value of
 1:
  begin
   n7.Enabled:=false;
  end;
 2:
  begin
   n2.Enabled:=false;
   n4.Enabled:=false;
   n6.Enabled:=false;
   n7.Enabled:=false;
  end;
 3:
  begin
   n2.Enabled:=false;
   n4.Enabled:=false;
   n6.Enabled:=false;
  end;
 else
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
   n4.Enabled:=false;
   n6.Enabled:=false;
   n7.Enabled:=false;
   n8.Enabled:=false;
  end;
 end;
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



end.
