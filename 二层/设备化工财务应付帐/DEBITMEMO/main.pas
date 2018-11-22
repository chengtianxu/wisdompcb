unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus,
   ComObj,Excel2000,ClipBrd, DB, ADODB;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    user_ptr: TLabel;
    vprev: TLabel;
    db_ptr: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
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
    sys_shortdate,sys_longdate:tdatetime;
  end;

var
  Form1: TForm1;

implementation

uses datamd,  debit_bysupp, invt_recept, debit_returen;

{$R *.dfm}
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

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;


procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-688)*v_colwidth[i]/659);
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
  setlength(v_colwidth,9);
  for i:=low(v_colwidth) to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
  field_name:='MEMO_NUMBER';     //设备过滤字段
   with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    sys_longdate := fieldvalues['v_dt']; //长格式
    sys_shortdate:=strtodate(datetostr(fieldvalues['v_dt']));
   end;
  dtpk2.Date := sys_shortdate;
  dtpk1.Date := dtpk2.Date - 20;
  dm.Aq132.Close;
  dm.Aq132.Parameters[0].Value:=dtpk1.Date;
  dm.Aq132.Parameters[1].Value:=dtpk2.Date;
  dm.Aq132.Open;
 end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  dm.aq132.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  dm.aq132.Filter:='';
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.Aq132.SQL.Text);
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

procedure TForm1.dtpk1CloseUp(Sender: TObject);
begin
  dm.Aq132.Close;
  dm.Aq132.Parameters[0].Value:=dtpk1.Date;
  dm.Aq132.Parameters[1].Value:=dtpk2.Date;
  dm.Aq132.Open;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 dm.aq132.Close;
if not checkbox1.Checked then
 dm.aq132.Parameters[2].Value:=3
else
 dm.aq132.Parameters[2].Value:=0;
if not checkbox2.Checked then
 dm.aq132.Parameters[3].Value:=4
else
 dm.aq132.Parameters[3].Value:=0;
if not checkbox3.Checked then
 dm.aq132.Parameters[4].Value:=2
else
 dm.aq132.Parameters[4].Value:=0;
 DM.aq132.open;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
 rkey:=dm.Aq132rkey.Value;
 dm.Aq132.Close;
 dm.Aq132.Open;
 if rkey>0 then
  dm.Aq132.Locate('rkey',rkey,[]);
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

procedure TForm1.N6Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form2:=tform2.Create(application);
with form2 do
 begin
  dtpk1.Date:=self.sys_shortdate;
  dtpk2.Date:=self.sys_shortdate;
  combobox1.ItemIndex:=0;
  bitbtn3.Enabled:=false;
  bitbtn5.Enabled:=false;
 end;
if form2.ShowModal=mrok then
 begin
  dm.aq132.Close;
  dm.aq132.Open;
  dm.aq132.Locate('rkey',dm.ADO132RKEY.Value,[]);
  dm.ADO132.Close; 
 end;
finally
form2.Free;
end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form2:=tform2.Create(application);
with form2 do
 begin
  dtpk1.Date:=self.sys_shortdate;
  dtpk2.Date:=self.sys_shortdate;
  combobox1.ItemIndex:=1;
  bitbtn2.Enabled:=false;
  edit6.Enabled:=true;
 end;
if form2.ShowModal=mrok then
 begin
  dm.aq132.Close;
  dm.aq132.Open;
  dm.aq132.Locate('rkey',dm.ADO132RKEY.Value,[]);
  dm.ADO132.Close;  
 end;
finally
form2.Free;
end;
end;

procedure TForm1.N5Click(Sender: TObject);
var
 i:word;
 amount,tax_amount: currency;
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form_invtship:=tform_invtship.Create(application);
form_invtship.dtpk2.Date:=self.sys_shortdate;
form_invtship.dtpk1.Date:=self.sys_shortdate-30;
if form_invtship.ShowModal=mrok then
 begin
  form4:=tform4.Create(application);
  amount:=0;
  tax_amount:=0;
  with form4 do
   begin
    dtpk1.Date:=self.sys_shortdate;
    dtpk2.Date:=self.sys_shortdate;
    edit4.Text:=form_invtship.aqwz95CODE.Value;
    label10.Caption:=form_invtship.aqwz95SUPPLIER_NAME.Value;
    supp_ptr:=form_invtship.aqwz95SUPP_PTR.Value;
    edit5.Text:=form_invtship.aqwz95CURR_CODE.Value;
    label11.Caption:=form_invtship.aqwz95CURR_NAME.Value;
    curr_ptr:=form_invtship.aqwz95CURRENCY_PTR.Value;
    edit6.Text:=form_invtship.aqwz95EXCHANGE_RATE.AsString;
    for i:=1 to form_invtship.DBGrid1.SelectedRows.Count do
     begin
      form_invtship.dbgrid1.DataSource.DataSet.Bookmark :=
                       form_invtship.dbgrid1.SelectedRows.Items[i-1];
      stgd1.Cells[0,i]:=form_invtship.aqwz95GRN_NUMBER.Value; //'入库单号';
      stgd1.Cells[1,i]:=form_invtship.aqwz95DELIVER_NUMBER.Value; //'送货单号';
      stgd1.Cells[2,i]:=form_invtship.aqwz95INV_NAME.Value; //'物料名称';
      stgd1.Cells[3,i]:=form_invtship.aqwz95INV_DESCRIPTION.Value; //'物料规格';
      stgd1.Cells[4,i]:=form_invtship.aqwz95TRAN_DATE.AsString; //'装运日期';
      stgd1.Cells[5,i]:=form_invtship.aqwz95QUANTITY.AsString; //'退货数量';
      stgd1.Cells[6,i]:=form_invtship.aqwz95UNIT_NAME.Value; //'单位';
      stgd1.Cells[7,i]:=form_invtship.aqwz95PRICE.AsString;  //'单价';
      stgd1.Cells[8,i]:=form_invtship.aqwz95TAX_2.AsString; //'税率';
      stgd1.Cells[9,i]:=form_invtship.aqwz95RKEY.AsString; //'rkey95';
      stgd1.RowCount:=stgd1.RowCount+1;
      amount:=amount+form_invtship.aqwz95amount.Value;   //合计金额
      tax_amount:=tax_amount+form_invtship.aqwz95tax_amount.Value;//税金
     end;
     edit8.Text:=floattostr(amount);
     edit7.Text:=floattostr(tax_amount);
     edit3.Text:=floattostr(amount-tax_amount);
   end;
  if form4.ShowModal=mrok then
   begin
    dm.aq132.Close;
    dm.aq132.Open;
    dm.aq132.Locate('rkey',dm.ADO132RKEY.Value,[]);
    dm.ADO132.Close;
   end;
  form4.Free; 
 end;
finally
form_invtship.Free;
end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if dm.aq132MEMO_TP.Value=3 then
 begin
  form4:=tform4.Create(application);
  with form4 do
   begin
    a_or_e.Caption:='1';
    edit1.Text:=dm.aq132MEMO_NUMBER.Value;
    dtpk1.Date:=dm.aq132MEMO_DATE.Value;
    dtpk2.date:=dm.aq132ent_date.value;
    edit4.Text:=dm.aq132CODE.Value;
    label10.Caption:=dm.aq132supplier_name.Value;
    supp_ptr:=dm.aq132SUPP_PTR.Value;
    edit5.Text:=dm.aq132CURR_CODE.Value;
    label11.Caption:=dm.aq132CURR_NAME.Value;
    curr_ptr:=dm.aq132CURRENCY_PTR.Value;
    edit6.Text:=dm.aq132EX_RATE.AsString;
    edit15.Text:=dm.aq132REF_NUMBER.Value;
    edit8.Text:=dm.aq132AMOUNT.AsString;
    edit2.Text:=dm.aq132MISC_TOT.AsString;
    edit3.Text:=dm.aq132MATL_TOT.AsString;
    edit7.Text:=dm.aq132FED_TAX.AsString;
    edit9.Text:=floattostr(dm.aq132AMOUNT.Value-dm.aq132AVL_AMT.Value);
   end;
  if form4.ShowModal=mrok then
   begin
    dm.aq132.Close;
    dm.aq132.Open;
    dm.aq132.Locate('rkey',dm.ADO132RKEY.Value,[]);
    dm.ADO132.Close;
   end;
  form4.Free;
 end
else
 begin
  form2:=tform2.Create(application);
  with form2 do
  begin
   a_or_e.Caption:='1';
   edit1.Text:=dm.aq132MEMO_NUMBER.Value;
   dtpk1.Date:=dm.aq132MEMO_DATE.Value;
   dtpk2.date:=dm.aq132ent_date.value;
   edit4.Text:=dm.aq132CODE.Value;
   label10.Caption:=dm.aq132supplier_name.value;
   edit5.Text:=dm.aq132CURR_CODE.Value;
   label11.Caption:=dm.aq132CURR_NAME.Value;
   edit6.Text:=dm.aq132EX_RATE.AsString;
   edit8.Text:=dm.aq132AMOUNT.AsString;

   edit3.Text:=floattostr(dm.aq132AMOUNT.Value-dm.aq132AVL_AMT.Value);
   edit15.Text:=dm.aq132REF_NUMBER.Value;
   if dm.aq132MEMO_TP.Value=4 then//预付备忘
    begin
     combobox1.ItemIndex:=0;
     edit8.ReadOnly:=true;
     bitbtn3.Enabled:=false;
     bitbtn5.Enabled:=false;
     if dm.aq132AVL_AMT.Value<>dm.aq132AMOUNT.Value then
      bitbtn2.Enabled:=false;    //备忘一但被使用就不能修改了
    end
   else                          //其它备忘
    begin
     combobox1.ItemIndex:=1;
     bitbtn2.Enabled:=false;
    end;
  end;
 if form2.ShowModal=mrok then
  begin
   dm.aq132.Close;
   dm.aq132.Open;
   dm.aq132.Locate('rkey',dm.ADO132RKEY.Value,[]);
   dm.ADO132.Close;
  end;
form2.Free;
 end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if dm.aq132MEMO_TP.Value=3 then//退货备忘
 begin
  form4:=tform4.Create(application);
  with form4 do
   begin
    a_or_e.Caption:='1';
    edit1.Text:=dm.aq132MEMO_NUMBER.Value;
    dtpk1.Date:=dm.aq132MEMO_DATE.Value;
    dtpk2.date:=dm.aq132ent_date.value;
    edit4.Text:=dm.aq132CODE.Value;
    label10.Caption:=dm.aq132supplier_name.Value;
    supp_ptr:=dm.aq132SUPP_PTR.Value;
    edit5.Text:=dm.aq132CURR_CODE.Value;
    label11.Caption:=dm.aq132CURR_NAME.Value;
    curr_ptr:=dm.aq132CURRENCY_PTR.Value;
    edit6.Text:=dm.aq132EX_RATE.AsString;
    edit15.Text:=dm.aq132REF_NUMBER.Value;
    edit8.Text:=dm.aq132AMOUNT.AsString;
    edit2.Text:=dm.aq132MISC_TOT.AsString;
    edit3.Text:=dm.aq132MATL_TOT.AsString;
    edit7.Text:=dm.aq132FED_TAX.AsString;
    edit9.Text:=floattostr(dm.aq132AMOUNT.Value-dm.aq132AVL_AMT.Value);
    stgd1.PopupMenu:=popupmenu2;
    edit2.Enabled:=false;
    edit1.Enabled:=false;
    dtpk1.Enabled:=false;
    dtpk2.Enabled:=false;
    edit15.Enabled:=false;
    bitbtn1.Enabled:=false;
   end;
  if form4.ShowModal=mrok then
   begin

   end;
  form4.Free;
 end
else
 begin
  form2:=tform2.Create(application);
  with form2 do
  begin
   a_or_e.Caption:='1';
   edit1.Text:=dm.aq132MEMO_NUMBER.Value;
   dtpk1.Date:=dm.aq132MEMO_DATE.Value;
   dtpk2.date:=dm.aq132ent_date.value;
   edit4.Text:=dm.aq132CODE.Value;
   label10.Caption:=dm.aq132supplier_name.value;
   edit5.Text:=dm.aq132CURR_CODE.Value;
   label11.Caption:=dm.aq132CURR_NAME.Value;
   edit6.Text:=dm.aq132EX_RATE.AsString;
   edit8.Text:=dm.aq132AMOUNT.AsString;

   edit3.Text:=floattostr(dm.aq132AMOUNT.Value-dm.aq132AVL_AMT.Value);
   edit15.Text:=dm.aq132REF_NUMBER.Value;
   if dm.aq132MEMO_TP.Value=4 then//预付备忘
    begin
     combobox1.ItemIndex:=0;
    end
   else                          //其它备忘
    begin
     combobox1.ItemIndex:=1;
    end;
   bitbtn3.Enabled:=false;
   bitbtn5.Enabled:=false;
   bitbtn2.Enabled:=false;
   edit8.ReadOnly:=true;
   bitbtn1.Enabled:=false;
   edit1.Enabled:=false;
   dtpk1.Enabled:=false;
   dtpk2.Enabled:=false;
   edit15.Enabled:=false;
  end;
 if form2.ShowModal=mrok then
  begin

  end;
form2.Free;
 end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADO132.Close;
  dm.ADO132.Parameters[0].Value:=dm.aq132rkey.Value;
  dm.ADO132.Open;
  if dm.ADO132AMOUNT.Value=dm.ADO132AVL_AMT.Value then
  begin
  dm.ACt.BeginTrans;
  try
  if dm.aq132MEMO_TP.Value=3 then//退货备忘
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0095');
    sql.Add('set debit_ptr=null');
    sql.Add('where debit_ptr='+dm.Aq132RKEY.AsString);
    ExecSQL
   end
  else
   if dm.aq132MEMO_TP.Value=4 then//退货备忘
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0129');
     sql.Add('set status=1');
     sql.Add('where rkey='+dm.Aq132CHECK_PTR.AsString);
     ExecSQL;
    end;
  dm.ADO132.Close;
  dm.ADO132.Parameters[0].Value:=dm.aq132rkey.Value;
  dm.ADO132.Open;
  dm.ADO132.Delete;

   dm.ACt.CommitTrans;
   showmessage('数据删除成功!');
   dm.Aq132.Close;
   dm.Aq132.Open;
  except
   dm.ACt.RollbackTrans;
   showmessage('数据删除遇到错误请速与管理员联系William.Wang!');
  end;
  end
  else
   showmessage('不能删除该记录,借项备忘数据被使用了');
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.aq132.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
 end
else
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
  if dm.aq132AMOUNT.Value=dm.aq132AVL_AMT.Value then
   n4.Enabled:=true
  else
   n4.Enabled:=false; 
 end;
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

end.
