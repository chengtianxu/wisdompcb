unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus,
  ComObj,Excel2000,ClipBrd, DB, ADODB;

type
  TForm1 = class(TForm)
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
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    user_ptr: TLabel;
    vprev: TLabel;
    db_ptr: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Edit2: TEdit;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn3Click(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure cacl_total();
  private
    { Private declarations }
   hMapFile: THandle;
   MapFilePointer: Pointer;
   v_colwidth: array of integer;
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
   sys_shortdate:tdatetime;    
  end;

var
  Form1: TForm1;

implementation

uses datamd, income_payment;

{$R *.dfm}
procedure TForm1.cacl_total;
var
 amount_bamt:currency;
begin
 amount_bamt:=0;
 dm.aq129.DisableControls;
 dm.datasource1.DataSet:=nil;
 dm.aq129.First;
 while not dm.aq129.Eof do
  begin
   amount_bamt:=amount_bamt+dm.aq129amount_bamt.Value;
   dm.aq129.Next;
  end;
 dm.aq129.First;
 dm.datasource1.DataSet:=dm.aq129;
 dm.aq129.EnableControls;
 Edit2.Text:=format('%2f',[amount_bamt]);
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

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
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

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin
   setlength(v_colwidth,10);
   for i:=low(v_colwidth) to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
   field_name:='CHECK_NUMBER';     //设备过滤字段
if not dm.act.Connected then
 begin
  if trim(vprev.Caption)='' then  application.Terminate;
   dm.act.ConnectionString := db_ptr.Caption;
   dm.act.Connected := true;

   with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    sys_shortdate:=strtodate(datetostr(fieldvalues['v_dt']));
   end;
  dtpk2.Date := sys_shortdate;
  dtpk1.Date := dtpk2.Date - 10;
  dm.Aq129.Close;
  dm.Aq129.Parameters[0].Value:=dtpk1.Date;
  dm.Aq129.Parameters[1].Value:=dtpk2.Date;
  dm.Aq129.Open;
 end; 
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  dm.aq129.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  dm.aq129.Filter:='';
self.cacl_total;
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-723)*v_colwidth[i]/700);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.Aq129.SQL.Text);
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

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
 rkey:=dm.Aq129rkey.Value;
 dm.Aq129.Close;
 dm.Aq129.Open;
 if rkey>0 then dm.Aq129.Locate('rkey',rkey,[]);
end;

procedure TForm1.dtpk1CloseUp(Sender: TObject);
begin
  dm.Aq129.Close;
  dm.Aq129.Parameters[0].Value:=dtpk1.Date;
  dm.Aq129.Parameters[1].Value:=dtpk2.Date;
  dm.Aq129.Open;
end;

procedure TForm1.N6Click(Sender: TObject);
var
 rkey:integer;
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('你确定要取消这条记录吗?该操作将不可逆!',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ACt.BeginTrans;
  try

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0129');
    sql.Add('set STATUS=3');
    sql.Add('where rkey='+dm.AQ129rkey.AsString);
    ExecSQL;
   end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0128');
     sql.Add('set bal_amount=bal_amount+data0129.AMOUNT');
     sql.Add('from data0129 inner join data0128');
     sql.Add('on data0129.bank_ptr=data0128.rkey');
     sql.Add('where data0129.rkey='+dm.aq129rkey.AsString);
     ExecSQL;
    end;


    dm.ACt.CommitTrans;
    showmessage('取消操作成功');
    rkey:=dm.AQ129rkey.Value;
    dm.AQ129.Close;
    dm.AQ129.Open;
    dm.AQ129.Locate('rkey',rkey,[]);
   except
    dm.ACt.RollbackTrans;
    showmessage('取消操作不成功,请与管理员联系');
   end;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.AQ129.IsEmpty then
 begin
  n4.enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;
 end
else
 begin
  n5.Enabled:=true;
  if dm.AQ129STATUS.Value=3 then
   begin
    n6.Enabled:=false;
    n4.enabled:=false;
   end
  else
   begin
    if dm.AQ129STATUS.Value=1 then
     n4.enabled:=true
    else
     n4.enabled:=false;
    n6.Enabled:=true;
   end;

 end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 dm.Aq129.Close;
if not checkbox1.Checked then
 dm.Aq129.Parameters[2].Value:=1
else
 dm.Aq129.Parameters[2].Value:=0;
if not checkbox2.Checked then
 dm.Aq129.Parameters[3].Value:=2
else
 dm.Aq129.Parameters[3].Value:=0;
if not checkbox3.Checked then
 dm.Aq129.Parameters[4].Value:=3
else
 dm.Aq129.Parameters[4].Value:=0;
 DM.Aq129.open;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then exit;
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

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form2:=tform2.Create(application);
form2.dtpk1.Date:=self.sys_shortdate;
if form2.ShowModal=mrok then
 begin
  dm.AQ129.Close;
  dm.AQ129.Open;
  dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
  dm.ado129.close;
 end;
finally
form2.Free;
end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form2:=tform2.Create(application);
 with form2 do
  begin
   edit1.Text:=dm.AQ129CHECK_NUMBER.Value;

   edit2.Text:=dm.AQ129BANK_NAME.Value;
   edit7.Text:=dm.AQ129bal_amount.AsString;
   dtpk1.Date:=dm.AQ129TDATE.Value;

   edit3.Text:=dm.AQ129WAREHOUSE_CODE.Value;
   label9.Caption:=dm.AQ129WAREHOUSE_NAME.Value;
   edit4.Text:=dm.aq129empl_code.Value;
   label10.Caption:=dm.AQ129employee_NAME.Value;
   edit5.Text:=dm.AQ129CURR_CODE.Value;
   label11.Caption:=dm.AQ129CURR_NAME.Value;
   edit6.Text:=dm.AQ129EX_RATE.AsString;
   edit8.Text:=dm.AQ129AMOUNT.AsString;

   edit15.Text:=dm.AQ129REMARK.Value;
   label12.caption:='1';//编辑检查
  end;
 if form2.ShowModal=mrok then
  begin
  dm.AQ129.Close;
  dm.AQ129.Open;
  dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
  dm.ADO129.Close;
  end;
finally
 form2.Free;
end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
try
form2:=tform2.Create(application);
 with form2 do
  begin
   edit1.Text:=dm.AQ129CHECK_NUMBER.Value;

   edit2.Text:=dm.AQ129BANK_NAME.Value;
   edit7.Text:=dm.AQ129bal_amount.AsString;
   dtpk1.Date:=dm.AQ129TDATE.Value;

   edit3.Text:=dm.AQ129WAREHOUSE_CODE.Value;
   label9.Caption:=dm.AQ129WAREHOUSE_NAME.Value;
   edit4.Text:=dm.aq129empl_code.Value;
   label10.Caption:=dm.AQ129employee_NAME.Value;
   edit5.Text:=dm.AQ129CURR_CODE.Value;
   label11.Caption:=dm.AQ129CURR_NAME.Value;
   edit6.Text:=dm.AQ129EX_RATE.AsString;
   edit8.Text:=dm.AQ129AMOUNT.AsString;

   edit15.Text:=dm.AQ129REMARK.Value;
   label12.caption:='1';//编辑检查
   bitbtn1.enabled:=false;
   bitbtn2.Enabled:=false;
   bitbtn3.Enabled:=false;
   bitbtn5.Enabled:=false;
   edit1.Enabled:=false;
   dtpk1.Enabled:=false;
   edit15.Enabled:=false;
   stgd1.Options:=stgd1.Options-[goediting];
   stgd1.popupmenu:=popupmenu2;
  end;

form2.ShowModal;

finally
 form2.Free;
end;
end;

end.
