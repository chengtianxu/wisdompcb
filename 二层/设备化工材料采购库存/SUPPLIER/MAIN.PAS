unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, ComCtrls, Mask,
  DBCtrls, Menus, ExtCtrls,Excel2000,ClipBrd,ComObj ;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    bar1: TStatusBar;
    DBGrid1: TDBGrid;
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
    db_ptr: TLabel;
    vprev: TLabel;
    Panel1: TPanel;
    N10: TMenuItem;
    Panel2: TPanel;
    Label1: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBMemo1: TDBMemo;
    BitBtn2: TBitBtn;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Label10: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure append_add_field();
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    hMapFile: THandle;
    MapFilePointer: Pointer;
    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
  public
    { Public declarations }
  end;
var
  Form1: TForm1;

implementation
uses damo, edit_supplier;
{$R *.dfm}

procedure tform1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
  showmessage('对不起您只有该程序的只读权限!')
 else

 try
  dm.adotable1.Edit;
  hide;
  form2 := Tform2.Create(Application);
  form2.control_edit:=true;   //新增,用于标识状态
  Form2.showmodal;
 finally
  form2.free;
 end;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 bk:tbookmark;
begin
 if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
  showmessage('对不起您只有该程序的只读权限!')
 else
 try
  bk:=dm.ADOTable1.GetBookmark();
  dm.Adotable1.Append;
  HIDE;
  append_add_field;

  form2 := Tform2.Create(Application);
  form2.control_edit:=true;   //新增,用于标识状态
  if Form2.showmodal=mrcancel then;
   begin
    dm.ADOTable1.GotoBookmark(bk);
    dm.ADOTable1.FreeBookmark(bk);
   end;
 finally
  form2.free;
 end;

end;

procedure tform1.append_add_field();
begin
 dm.ADOTable1.fieldvalues['CURRENCY_PTR'] :=1; //给货币指针赋值
 dm.ADOTable1LANGUAGE_FLAG.Value := 'C';
 dm.ADOTable1SUPPIER_ENT_DATE.Value :=date();  //供应商输入地址
 dm.ADOTable1EDI_OUT_NEW_PO.Value :=0;
 dm.ADOTable1EDI_OUT_CHG_PO.Value :=0;
 dm.ADOTable1DISCOUNT.Value :=0;
 dm.ADOTable1DISCOUNT2.Value :=0;
 dm.ADOTable1DISCOUNT_DAYS.Value :=0;
 dm.ADOTable1DISCOUNT2_DAYS.Value :=0;
 dm.ADOTable1PAYMENT_TERMS.Value :=0;
 dm.ADOTable1TAX_1.Value :=0;      //两个税率字段暂时不起作用
 dm.ADOTable1TAX_2.Value :=0;
 dm.ADOTable1CURRENT_BALANCE.Value :=0;
 dm.ADOTable1OUTSTANDING_DEBITS.Value :=0;
 dm.ADOTable1PRNT_ONE_INV_PER_CHK.Value := 'N';
 dm.ADOTable1PUT_ALL_INV_HOLD.Value := 'N';
 dm.ADOTable1EDI_FLAG_FOR_PO.Value :=0;
 dm.ADOTable1EDI_FLAG_DEBIT_MEMO.Value :=0;
end;

procedure TForm1.N3Click(Sender: TObject);
var
 v_recode:array[2..64] of variant;
 i:word;
 bk:tbookmark;
begin
 if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
  showmessage('对不起您只有该程序的只读权限!')
 else
 try
  //for i:=2 to 63 do
  for i:=low(v_recode) to high(v_recode) do
   v_recode[i]:=dm.adotable1.Fields[i].Value;
  with dm.ADOQuery3 do        //复制装运地点
   begin                       //首先把原表的装去地点查找出来
    active:=false;
    dm.ADOQuery3.Parameters[0].Value :=dm.ADOTable1RKEY.Value;
    active:=true;
   end;
  form2 := Tform2.Create(Application);
  form2.control_edit:=true;   //新增,用于标识状态
  form2.copy_lab.Caption :='1';   //表示新增状态中以复制
  bk:=dm.ADOTable1.GetBookmark();
  dm.Adotable1.Append;
  //for i:=2 to 63 do
  for i:=low(v_recode) to high(v_recode) do
   dm.adotable1.fieldvalues[dm.adotable1.Fields[i].FieldName]:=v_recode[i];
   dm.adotable1.fieldvalues[dm.adotable1.Fields[13].FieldName]:=null;
   dm.adotable1.fieldvalues[dm.adotable1.Fields[14].FieldName]:=null;
   dm.adotable1.fieldvalues[dm.adotable1.Fields[15].FieldName]:=null;
   dm.adotable1.fieldvalues[dm.adotable1.Fields[16].FieldName]:=null;

  with dm.ADOQuery2 do    //读取装运地点
  begin
   if Active=true then Active:=false;
   sql.Clear;
   sql.Add('select * from data0024 where supplier_ptr is null');
   active:=true;
   while not dm.ADOQuery3.Eof do   //从原来的装运地点复制
   begin
    append;
    for i:=2 to 28 do
    fieldvalues[Fields[i].FieldName]:=dm.ADOQuery3.fieldvalues[dm.ADOQuery3.Fields[i].FieldName];
    post;
    dm.ADOQuery3.Next;
   end;
  end;
  HIDE;
  if Form2.showmodal=mrcancel then;
   begin
    dm.ADOTable1.GotoBookmark(bk);
    dm.ADOTable1.FreeBookmark(bk);
   end;
 finally
  form2.free;
 end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
  showmessage('对不起您只有该程序的只读权限!')
 else
 if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 try
  dm.Adoconnection1.BeginTrans;
  if dm.ADOTable1.FieldValues['PO_NOTE_PAD_PTR']<>null then
  with dm.adoquery1 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where rkey='+dm.ADOTable1.fieldbyname('po_note_pad_ptr').AsString);
    active:=true;
    delete;
    end;
 if dm.ADOTable1.FieldValues['debmem_note_pad_ptr']<>null then
  with dm.adoquery1 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where rkey='+dm.ADOTable1.fieldbyname('debmem_note_pad_ptr').AsString);
    active:=true;
    delete;
   end;
 if dm.ADOTable1.FieldValues['rfq_note_pad_ptr']<>null then
  with dm.adoquery1 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where rkey='+dm.ADOTable1.fieldbyname('rfq_note_pad_ptr').AsString);
    active:=true;
    delete;
   end;
 if dm.ADOTable1.FieldValues['common_pad_ptr']<>null then
  with dm.adoquery1 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where rkey='+dm.ADOTable1.fieldbyname('common_pad_ptr').AsString);
    active:=true;
    delete;
   end;

  dm.adotable1.Delete;
  dm.ADOconnection1.CommitTrans;
 except
  dm.ADOconnection1.RollbackTrans;
 end;

end;

procedure TForm1.N6Click(Sender: TObject);
begin
 dm.ADOTable1.First;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
 dm.ADOTable1.Last;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 dm.ADOTable1.Prior;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
 dm.ADOTable1.Next;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if column.Index=1 then
 begin
  column.Title.Caption:='*'+'供应商名称';
  dbgrid1.Columns[0].Title.Caption:='代码';
  dm.adotable1.IndexFieldNames:='supplier_name';
  label10.Caption:='供应商名称';
 end
else
 begin
  column.Title.Caption:='*'+'代码';
  dbgrid1.Columns[1].Title.Caption:='供应商名称';
  dm.adotable1.IndexFieldNames:='code';
  label10.Caption:='代码';
 end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];
 if Key = Chr(vk_Back) then       //如果按下了backspace
 begin
  if length(bar1.SimpleText)>5 then
   bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
  if length(bar1.SimpleText)>5 then
   dm.Adotable1.Locate(dm.adotable1.IndexFieldNames,copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption)
  else
   dm.adotable1.First
 end
 else
 if key=chr(vk_return) then    //如果按下了enter
  n2click(sender)           //调用编辑命令
 ELSE
  begin
   bar1.SimpleText := bar1.SimpleText+key;
   dm.Adotable1.Locate(dm.adotable1.IndexFieldNames,copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 s:string;
  vprog0:string;
  vprog:pchar;
  ZAppName: array[0..127] of char;
  Found: HWND;

begin
  hMapFile := CreateFileMapping ($FFFFFFFF, // 特殊内存映射句柄
    nil, page_ReadWrite, 0,10000, 'coimasp20'); // 文件名
  MapFilePointer := MapViewOfFile (hMapFile,File_Map_All_Access, 0, 0, 0); // 访问整个映象文件
  S := PChar (MapFilePointer);//从共享内存读出内容

  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //权限
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //那一个数据库}

  vprog0:=trim(Application.Title);
  s:=copy(s,pos('Data Source=',s)-2,1);
  vprog:=pchar(vprog0+'-'+s);
  strpcopy(ZAppName,vprog);
  Found := FindWindow(nil, ZAppName); // 查找窗口
  if Found>0 then  begin
    ShowWindow(Found, SW_SHOWMINIMIZED);
    ShowWindow(Found, SW_SHOWNORMAL);
    application.Terminate;
  end;
  Application.Title:=vprog0+'-'+s;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if not dm.ADOConnection1.Connected then
 begin
  if trim(vprev.Caption)='' then  close;
  dm.adoconnection1.ConnectionString :=db_ptr.Caption;
  dm.Adoconnection1.Connected :=true;
  dm.AQ04.Open;
  dm.ADOTable1.Open;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADOTable1.IsEmpty then
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
   n4.Enabled:=false;
   n6.Enabled:=false;
   n7.Enabled:=false;
   n8.Enabled:=false;
   n9.Enabled:=false;
   n10.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
   n3.Enabled:=true;
   n4.Enabled:=true;
   n6.Enabled:=true;
   n7.Enabled:=true;
   n8.Enabled:=true;
   n9.Enabled:=true;
   n10.Enabled:=true;
  end;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
 try
  dm.adotable1.Edit;
  hide;
  form2 := Tform2.Create(Application);
  form2.BitBtn1.Enabled:=false;
  form2.BitBtn3.Enabled:=false;
  form2.control_edit:=false;   //新增,用于标识状态
  Form2.showmodal;

 finally
  form2.free;
 end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
   //bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
begin
  Screen.Cursor := crHourglass;
  DBGrid2.DataSource.DataSet.DisableControls;
  //bm := DBGrid2.DataSource.DataSet.GetBookmark;
  DBGrid2.DataSource.DataSet.First;
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
  ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrid2.FieldCount-1 do
      //sline := sline + DBGrid2.Fields[col].DisplayLabel + #9;
      sline := sline +DBGrid2.Columns[col].Title.Caption + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid2.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to DBGrid2.FieldCount-1 do
        sline := sline + DBGrid2.Fields[col].AsString + #9;

      mem.Add(sline);
      DBGrid2.DataSource.DataSet.Next;
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
    //DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    //DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid2.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  dm.ADOTable1.Filter:=dm.ADOTable1.IndexFieldNames + ' like ''%'+trim(edit1.Text)+'%'''
 else
  dm.ADOTable1.Filter:='';
end;

end.
