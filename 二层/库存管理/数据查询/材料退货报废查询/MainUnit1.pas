unit MainUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, DBGridEh, ExtCtrls, StdCtrls, ADODB,
  Buttons,Excel2000, OleServer,ClipBrd, ExcelXP, Menus;

type
  TMainForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    DBGridEh3: TDBGridEh;
    Panel1: TPanel;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    Splitter1: TSplitter;

    procedure DBGridEh2TitleBtnClick(Sender: TObject; ACol: Integer;
                                      Column: TColumnEh);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
                                      Column: TColumnEh);

    procedure DBGridEh3TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
                                       DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
                                       DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh3DrawColumnCell(Sender: TObject; const Rect: TRect;
                                       DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);

    
  private
    { Private declarations }
      vColumn1: TColumnEh;
      vColumn2: TColumnEh;
      vColumn3: TColumnEh;
      vs3:string;
      user_ptrs,vprevs,db_ptrs:string;
      hMapFile: THandle;
      MapFilePointer: Pointer;
    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADOStoredProc;const value2:integer);
    procedure DrawDBGridEHColorCol(DBGridEHName: TDBGridEH; Rect: TRect; DataCol: Integer;
                                   Column: TColumnEh; State: TGridDrawState);
    procedure MenuItemClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  MainForm1: TMainForm1;


implementation

uses
    DMUnit1,IF_Unit1;
{$R *.dfm}

procedure TMainForm1.BitBtn3Click(Sender: TObject);
begin
  If_Form1:=TIf_Form1.Create(application) ;
  try
    if If_Form1.ShowModal=mrok then
    begin
       //showmessage('k');
       if dm.wzcx48_1.Active then dm.wzcx48_1.Close;
       dm.wzcx48_1.Parameters.ParamValues['@if1']:=1;
       dm.wzcx48_1.Parameters.ParamValues['@wher1']:=If_Form1.parametersvalue1;
       dm.wzcx48_1.Parameters.ParamValues['@wher2']:=If_Form1.parametersvalue1;
       dm.wzcx48_1.Parameters.ParamValues['@wher3']:=If_Form1.parametersvalue2;
       dm.wzcx48_1.Parameters.ParamValues['@wher4']:=If_Form1.parametersvalue3;
       dm.wzcx48_1.Parameters.ParamValues['@wher5']:=If_Form1.parametersvalue4;
       dm.wzcx48_1.Parameters.ParamValues['@wher6']:=If_Form1.parametersvalue5;
       dm.wzcx48_1.Parameters.ParamValues['@wher7']:=If_Form1.parametersvalue7;
       dm.wzcx48_1.Parameters.ParamValues['@ISSUE_DATE1']:=datetostr(If_Form1.DateTimePicker1.Date);
       dm.wzcx48_1.Parameters.ParamValues['@ISSUE_DATE2']:=datetostr(If_Form1.DateTimePicker2.Date);

       dm.wzcx48_1.Prepared;
       dm.wzcx48_1.Open;
       dm.ADODataSet2.Open;
       dm.ADODataSet3.Open;
       DBGridEh1.SetFocus;
    end;
  finally
    If_Form1.Free;
  end;

end;

procedure TMainForm1.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if not DBGridEh1.DataSource.DataSet.Active then exit;
  //如果只有一条记录不存在排序的问题
  if dm.wzcx48_1.RecordCount <= 1 then exit;

   TitleBtnSort1(sender,acol,column,dm.wzcx48_1,1);
   {//
    if dm.wzcx48_2.Active then dm.wzcx48_2.Close;
    dm.wzcx48_2.Parameters.ParamValues['@rkey0006']:=dm.wzcx48_1rkey.Value;
    dm.wzcx48_2.Prepared;
    dm.wzcx48_2.Open;

    if dm.wzcx48_3.Active then dm.wzcx48_3.Close;
    dm.wzcx48_3.Parameters.ParamValues['@rkey0006']:=dm.wzcx48_1rkey.Value;
    dm.wzcx48_3.Prepared;
    dm.wzcx48_3.Open;
   {}
end;

procedure TMainForm1.DBGridEh2TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if not DBGridEh2.DataSource.DataSet.Active then exit;
  TitleBtnSort1(sender,acol,column,dm.wzcx48_2,2);
end;





procedure TMainForm1.TitleBtnSort1(Sender: TObject; ACol: Integer;
  Column: TColumnEh; value: TADOStoredProc;const value2:integer);
var
  sortstring:string; //排序列
begin
  //先设置这个内容 OptionsEh＝dghAutoSortMarking
  //Column.Title.TitleButton＝true
  //
  //进行排序
  with Column do
  begin
     if value2=1 then
     begin
       if Column<> vColumn1  then
       begin
         if vColumn1<>nil then
           vColumn1.Title.color:=clbtnface;
         vColumn1:=Column;
         Column.Title.Color :=clred;
       end;
     end
     else if value2=2 then
     begin
       if Column<> vColumn2  then
       begin
         if vColumn2<>nil then
           vColumn2.Title.color:=clbtnface;
         vColumn2:=Column;
         Column.Title.Color :=clred;
       end;
     end
     else if value2=3 then
     begin
       if Column<> vColumn3  then
       begin
         if vColumn3<>nil then
           vColumn3.Title.color:=clbtnface;
         vColumn3:=Column;
         Column.Title.Color :=clred;
       end;
     end;


    if FieldName = '' then
      Exit;
    case Title.SortMarker of
      smNoneEh:
      begin
        Title.SortMarker := smDownEh;
        sortstring := Column.FieldName + ' ASC';
      end;
      smDownEh: sortstring := Column.FieldName + ' ASC';
      smUpEh: sortstring := Column.FieldName + ' DESC';
    end;
    //进行排序
    try
      value.Sort := sortstring //dataset为实际数据集变量名
    except
    end;
  end;
end;

procedure TMainForm1.DBGridEh3TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if not DBGridEh3.DataSource.DataSet.Active then exit;
  TitleBtnSort1(sender,acol,column,dm.wzcx48_3,3);
end;

procedure TMainForm1.BitBtn6Click(Sender: TObject);
begin
  //退出
  close;
end;

procedure TMainForm1.BitBtn2Click(Sender: TObject);
var
  eaApps1: TExcelApplication;
     y   : integer;
  tsList : TStringList;
  s,s1,t : string;
  aSheet : Variant;
  j,vleng:integer;
  vstr:string;
begin
  dm.find1 :=false;
  if messagedlg('要把数据资料导出到EXCEL文件吗？',mtconfirmation,[mbYes,mbNo],0)<>mrYes then exit;
  eaapps1:=TExcelApplication.Create(self);
  try
    eaapps1.connect;
  except
    messagedlg('是否正确安装了EXCEL？',mtinformation,[mbok],0);
    Abort;
  end;
  //Application.CreateForm(TForm_Progress, Form_Progress);

  eaapps1.Workbooks.Add(xlWBATWorksheet,0);
  eaapps1.worksheets.Add(null,null,2,null,0);
  //Form_Progress.show;

  dm.wzcx48_1.DisableControls;


  //Form_Progress.Label1.Caption :='正在材料实际数据...';
  //Form_Progress.stepvalue := 0;
  //Form_Progress.Label1.refresh;
  aSheet:=eaapps1.Worksheets[1];

  s:='序号'+#9;
  tsList:=TStringList.Create;
  try
    for y:=0 to DBGridEh1.Columns.Count-1 do
      s:=s+DBGridEh1.Columns.Items[y].Title.Caption+#9;
    tsList.Add(s);
    DBGridEh1.DataSource.DataSet.First;
    while not DBGridEh1.DataSource.DataSet.Eof do
      begin
        s:=inttostr(DBGridEh1.DataSource.DataSet.RecNo)+#9;
        for y:=0 to DBGridEh1.Columns.Count-1 do
          begin
            s1:=DBGridEh1.Columns.Items[y].Field.text;
            s:=s+s1+#9;
          end;
        tsList.Add(s);
        DBGridEh1.DataSource.DataSet.Next;
      end;
    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
  finally
    tsList.Free;
    eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if DBGridEh1.Columns.Count+1<=26 then
  begin
     vstr:=chr(DBGridEh1.Columns.Count+1+96);
     //showmessage(  vstr +'  '  +inttostr(DBGridEh1.Columns.Count) );
  end
  else begin
    vstr:=chr(strtoint(floattostr(int((DBGridEh1.Columns.Count+1)/26)+96)))
        +chr(strtoint(floattostr(DBGridEh1.Columns.Count+1-26*int((DBGridEh1.Columns.Count+1)/26)+96)));
  end;
  //  eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='订单数据';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  //asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('cut_date').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh1.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='订单数据';
  {}
  dm.wzcx48_1.EnableControls;

  dm.wzcx48_2.DisableControls;

  //Form_Progress.Label1.Caption :='正在材料标准数据...';
  //Form_Progress.stepvalue := 0;
  //Form_Progress.Label1.refresh;
  aSheet:=eaapps1.Worksheets[2];

  s:='序号'+#9;
  tsList:=TStringList.Create;
  try
    for y:=0 to DBGridEh2.Columns.Count-1 do
      s:=s+DBGridEh2.Columns.Items[y].Title.Caption+#9;
    tsList.Add(s);
    DBGridEh2.DataSource.DataSet.First;
    while not DBGridEh2.DataSource.DataSet.Eof do
      begin
        s:=inttostr(DBGridEh2.DataSource.DataSet.RecNo)+#9;
        for y:=0 to DBGridEh2.Columns.Count-1 do
          begin
            s1:=DBGridEh2.Columns.Items[y].Field.text;
            s:=s+s1+#9;
          end;
        tsList.Add(s);
        DBGridEh2.DataSource.DataSet.Next;
      end;
    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
  finally
    tsList.Free;
    eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if DBGridEh2.Columns.Count+1<=26
    then vstr:=chr(DBGridEh2.Columns.Count+1+96)
  else begin
    vstr:=chr(strtoint(floattostr(int((DBGridEh2.Columns.Count+1)/26)+96)))
        +chr(strtoint(floattostr(DBGridEh2.Columns.Count+1-26*int((DBGridEh2.Columns.Count+1)/26)+96)));
  end;
  //  eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='生产数据汇总';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  //asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('cut_date').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh2.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='生产数据汇总';
  {}
  dm.wzcx48_2.EnableControls;

    dm.wzcx48_3.DisableControls;

  //Form_Progress.Label1.Caption :='正在材料标准数据...';
  //Form_Progress.stepvalue := 0;
  //Form_Progress.Label1.refresh;
  aSheet:=eaapps1.Worksheets[3];

  s:='序号'+#9;
  tsList:=TStringList.Create;
  try
    for y:=0 to DBGridEh3.Columns.Count-1 do
      s:=s+DBGridEh3.Columns.Items[y].Title.Caption+#9;
    tsList.Add(s);
    DBGridEh3.DataSource.DataSet.First;
    while not DBGridEh3.DataSource.DataSet.Eof do
      begin
        s:=inttostr(DBGridEh3.DataSource.DataSet.RecNo)+#9;
        for y:=0 to DBGridEh3.Columns.Count-1 do
          begin
            s1:=DBGridEh3.Columns.Items[y].Field.text;
            s:=s+s1+#9;
          end;
        tsList.Add(s);
        DBGridEh3.DataSource.DataSet.Next;
      end;
    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
  finally
    tsList.Free;
    eaapps1.Disconnect;
    aSheet.Paste;
    clipboard.Clear;
  end;

  if DBGridEh3.Columns.Count+1<=26
    then vstr:=chr(DBGridEh3.Columns.Count+1+96)
  else begin
    vstr:=chr(strtoint(floattostr(int((DBGridEh3.Columns.Count+1)/26)+96)))
        +chr(strtoint(floattostr(DBGridEh3.Columns.Count+1-26*int((DBGridEh3.Columns.Count+1)/26)+96)));
  end;
  //  eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='生产数据详细';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  //asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('cut_date').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh3.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='生产数据详细';
  {}
  dm.wzcx48_3.EnableControls;

  eaapps1.Visible[0]:=true;         // display Excel files
  //Form_Progress.free;

  dm.find1 :=true;

end;


procedure TMainForm1.FormShow(Sender: TObject);
var
  vn2:array of TMenuItem;
  i,n:integer;
begin
  if not dm.ADOConnection1.Connected then
  begin
     if trim(vprevs)='' then  close;
       dm.adoconnection1.ConnectionString := db_ptrs;
       try
         dm.Adoconnection1.Connected := true;
       except
         showmessage('连接错，请打开主程序');
         application.Terminate;
       end;
  end;


  SELF.WindowState :=wsMaximized;
  vs3 := '';

  //FOR I=0 TO DBGridEh1.FieldCount DO\
  //SHOWMESSAGE(DBGridEh1.Columns[0].Title.Caption );

  //N1.Caption := DBGridEh1.Columns[0].Title.Caption ;
  //n1.OnClick  := MenuItemClick ;

  n:=DBGridEh1.Columns.Count-1  ;
  //showmessage(inttostr(n));
  setlength(vn2,n+1);
  for i:=0 to n do
  begin
    vn2[i]:=TMenuItem.Create(PopupMenu2) ;
    vn2[i].Name :=trim(DBGridEh1.Name)+'_'+inttostr(i);
    vn2[i].Caption := DBGridEh1.Columns[i].Title.Caption;
    vn2[i].OnClick := MenuItemClick;
    vn2[i].Checked :=true;
    PopupMenu2.Items.Add(vn2[i]) ;
  end;


end;

procedure TMainForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if not (gdFixed in State) then
  DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
end;

procedure TMainForm1.DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;
  Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
   if  DBGridEHName.DataSource.DataSet.RecNo  mod 2=0 then
     begin
          DBGridEHName.Canvas.Brush.Color:=RGB(244,241,255);
          DBGridEHName.Canvas.FillRect(rect);
          DBGridEHName.Canvas.font.color:=clblack;
     end
     else
     begin
          DBGridEHName.Canvas.Brush.Color:=clwhite;
          DBGridEHName.Canvas.FillRect(rect);
          DBGridEHName.Canvas.font.color:=clblack;
     end;
    if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
     begin
          DBGridEHName.Canvas.Brush.Color:=RGB(0,224,224);
          DBGridEHName.Canvas.FillRect(rect);
          DBGridEHName.Canvas.font.color:=clblack;
     end;
     DBGridEHName.DefaultDrawColumnCell(rect,datacol,column,state);
end;

procedure TMainForm1.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if not (gdFixed in State) then
  DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
end;

procedure TMainForm1.DBGridEh3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if not (gdFixed in State) then
  DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
end;

procedure TMainForm1.BitBtn4Click(Sender: TObject);
var
  s,s2,s3:string;
  b2:boolean;
  V2: Variant;

begin
 try
   if not DBGridEh1.DataSource.DataSet.Active then exit;
   if vColumn1 = nil then
   begin
     s :='SALES_ORDER';
     s3 := '订单号:  ';
   end
   else
   begin
     s := vColumn1.FieldName;
     s3 := vColumn1.Title.Caption+':             '  ;
   end;
   //vColumn1.Field.DataType =
   //ftDate, ftTime, ftDateTime

   s2:=inputbox('输入--'+s3, s3, vs3);
   vs3 :=s2 ;
   v2:=vs3;
   if s2='' then exit;
   //DBGridEH1.DataSource.DataSet.Lookup()
   b2 := DBGridEH1.DataSource.DataSet.Locate(s,v2,[]);
   if not b2 then showmessage('没有找到您要求的记录！！请确认是否输入正确');
 except
 end;
end;

procedure TMainForm1.FormCreate(Sender: TObject);
var
 ZAppName: array[0..127] of char;
 s,title_name:string;
 Found: HWND;
 vprog:pchar;
begin
 hMapFile := CreateFileMapping ($FFFFFFFF,
   nil,page_ReadWrite,0,100,'xyz2055coimasp20');
  MapFilePointer := MapViewOfFile(hMapFile,File_Map_All_Access,0,0,0);
  S := PChar(MapFilePointer);
  user_ptrs := trim(copy(S,3,pos(' ',s)-3));
  vprevs := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1));
  db_ptrs := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s)));

  title_name:=application.Title;
  self.Caption:='';
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
  self.Caption:=title_name;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  
end;



procedure TMainForm1.BitBtn5Click(Sender: TObject);
begin
 popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMainForm1.MenuItemClick(Sender: TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;


end.
