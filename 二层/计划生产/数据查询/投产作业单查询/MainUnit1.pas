unit MainUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, DBGridEh, ExtCtrls, StdCtrls, ADODB,
  Buttons,Excel2000, OleServer,ClipBrd, ExcelXP, Menus,DateUtils;

type
  TMainForm1 = class(TForm)
    DataSource2: TDataSource;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    Menu_N1: TMenuItem;
    Menu_N2: TMenuItem;
    Menu_N3: TMenuItem;
    Menu_N4: TMenuItem;
    N1: TMenuItem;
    EXCEL1: TMenuItem;
    sgrid1: TStringGrid;
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridEh2TitleBtnClick(Sender: TObject; ACol: Integer;Column: TColumnEh);
    procedure Menu_N1Click(Sender: TObject);
    procedure Menu_N2Click(Sender: TObject);
    procedure Menu_N3Click(Sender: TObject);
    procedure Menu_N4Click(Sender: TObject);
    procedure EXCEL1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    vColumn1: TColumnEh;
    vColumn2: TColumnEh;
    vColumn3: TColumnEh;
    vs3:string;
    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADOStoredProc;const value2:integer); overload;
    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADODataSet;const value2:integer); overload;

    procedure DrawDBGridEHColorCol(DBGridEHName: TDBGridEH; Rect: TRect; DataCol: Integer;
                                   Column: TColumnEh; State: TGridDrawState);
    procedure MenuItemClick(Sender: TObject);
    procedure DoSearch(subSql:string);
  public
  end;

var
  MainForm1: TMainForm1;

implementation

uses DMUnit1,IF_Unit1,Show58Unit2,Show53Unit2,Show48Unit2,Show38Unit2,common;

{$R *.dfm}

procedure TMainForm1.FormCreate(Sender: TObject);
var vn2:array of TMenuItem;
    i,n:integer;
begin
  if not App_Init(dm.ADOConnection1 ) then
  begin
    ShowMsg('程序启动失败，请与系统管理员联系！',1);
    application.Terminate;
  end;   
  Caption := application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
 // user_ptr:='785';
 // vprev:='4';
 // dm.ADOConnection1.Open;
  vs3 := '';
  n:=DBGridEh1.Columns.Count-1  ;
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

procedure TMainForm1.FormShow(Sender: TObject);
begin
  dm.tmp.Close;
  dm.tmp.SQL.Text:='select getdate()';
  dm.tmp.Open;
  sysdate:=dm.tmp.Fields[0].AsDateTime;
  If_Form1.DateTimePicker1.Date:=sysdate-30 ; //EncodeDate(YearOf(sysdate),MonthOf(sysdate),1);
  If_Form1.DateTimePicker2.Date:=sysdate;
  If_Form1.DateTimePicker3.Time :=StrToTime( '00:00:00');
  If_Form1.DateTimePicker4.Time :=StrToTime( '23:59:59');
  If_Form1.dtpk3.Date:=sysdate-30;//sysdate-dayof(sysdate)+1;
  If_Form1.dtpk4.Date:=sysdate;
end;

procedure TMainForm1.BitBtn3Click(Sender: TObject);
var i:integer;
    sqlstr:string;
begin
  with If_Form1 do
  try
    if ShowModal=mrok then
    begin
      Sqlstr:='data0492.ISSUE_DATE>='+QuotedStr(formatdatetime('yyyy-mm-dd',DateTimePicker1.Date)+formatdatetime(' hh:nn:ss',DateTimePicker3.Time))+
              ' and data0492.ISSUE_DATE<='+QuotedStr(formatdatetime('yyyy-mm-dd',DateTimePicker2.Date)+formatdatetime(' hh:nn:ss',DateTimePicker4.Time))+' ';
      for i:=1 to sgrid1.RowCount-2 do
      begin
        if sgrid1.Cells[2,i]<> '' then
           Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      end;
      sqlstr:=sqlstr+'';
      DoSearch(sqlstr);
      DBGridEh1.SetFocus;
    end;
  finally
  end;
end;

procedure TMainForm1.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
  if not DBGridEh1.DataSource.DataSet.Active then exit;
  TitleBtnSort1(sender,acol,column,dm.ADODataSet1,1);
end;

procedure TMainForm1.TitleBtnSort1(Sender: TObject; ACol: Integer; Column: TColumnEh; value: TADOStoredProc;const value2:integer);
var sortstring:string; //排序列
begin
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

   if FieldName = '' then Exit;
   case Title.SortMarker of
    smNoneEh:
    begin
     Title.SortMarker := smDownEh;
     sortstring := Column.FieldName + ' ASC';
    end;
    smDownEh: sortstring := Column.FieldName + ' ASC';
    smUpEh: sortstring := Column.FieldName + ' DESC';
   end;
   try
     value.Sort := sortstring
   except
   end;
  end;
end;

procedure TMainForm1.BitBtn6Click(Sender: TObject);
begin
  close;
end;

procedure TMainForm1.BitBtn2Click(Sender: TObject);
var y: integer;
    eaApps1: TExcelApplication;
    t:string;
    aSheet : Variant;
    v_cloumn,jCount:integer;
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

  eaapps1.Workbooks.Add(xlWBATWorksheet,0);
  eaapps1.worksheets.Add(null,null,2,null,0);

  dm.ADODataSet1.DisableControls;
  dm.ADODataSet2.DisableControls;
  aSheet:=eaapps1.Worksheets[1];
  try
    aSheet.cells[1, 1]:='序号';
    v_cloumn := 2;
    for y:=0 to DBGridEh1.Columns.Count-1 do
      aSheet.cells[1, y + v_cloumn]:= DBGridEh1.Columns.Items[y].Title.Caption ;
    DBGridEh1.DataSource.DataSet.First;
    jCount := 2;
    while not DBGridEh1.DataSource.DataSet.Eof do
    begin
      aSheet.cells[jCount, 1]:=inttostr(DBGridEh1.DataSource.DataSet.RecNo);
      for y:=0 to DBGridEh1.Columns.Count-1 do
        aSheet.cells[jCount, y  + v_cloumn]:=DBGridEh1.Columns.Items[y].Field.text;
      jCount := jCount +1;
      DBGridEh1.DataSource.DataSet.Next;
    end;
  finally
    eaapps1.Disconnect;
  end;

  if DBGridEh1.Columns.Count+1<=26 then
     vstr:=chr(DBGridEh1.Columns.Count+1+96)
  else begin
    vstr:=chr(strtoint(floattostr(int((DBGridEh1.Columns.Count+1)/26)+96)))
        +chr(strtoint(floattostr(DBGridEh1.Columns.Count+1-26*int((DBGridEh1.Columns.Count+1)/26)+96)));
  end;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='订单数据';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;

  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh1.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='订单数据';

  dm.ADODataSet1.EnableControls;
  dm.ADODataSet2.EnableControls;
  aSheet:=eaapps1.Worksheets[2];


  try
    aSheet.cells[1, 1]:='序号';
    v_cloumn := 2;
    for y:=0 to DBGridEh2.Columns.Count-1 do
        aSheet.cells[1, y + v_cloumn]:= DBGridEh2.Columns.Items[y].Title.Caption ;
    DBGridEh2.DataSource.DataSet.First;
    jCount := 2;
    while not DBGridEh2.DataSource.DataSet.Eof do
    begin
      aSheet.cells[jCount, 1]:=inttostr(DBGridEh2.DataSource.DataSet.RecNo);
      for y:=0 to DBGridEh2.Columns.Count-1 do
         aSheet.cells[jCount, y  + v_cloumn]:=DBGridEh2.Columns.Items[y].Field.text;
      jCount := jCount +1;
      DBGridEh2.DataSource.DataSet.Next;
    end;
  finally
    eaapps1.Disconnect;
  end;

  if DBGridEh2.Columns.Count+1<=26
    then vstr:=chr(DBGridEh2.Columns.Count+1+96)
  else begin
    vstr:=chr(strtoint(floattostr(int((DBGridEh2.Columns.Count+1)/26)+96)))
        +chr(strtoint(floattostr(DBGridEh2.Columns.Count+1-26*int((DBGridEh2.Columns.Count+1)/26)+96)));
  end;

  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='生产数据汇总';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh2.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='生产数据汇总';
  eaapps1.Visible[0]:=true;
  dm.find1 :=true;
end;

procedure TMainForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if not (gdFixed in State) then
  DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
end;

procedure TMainForm1.DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;Rect:
  TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if DBGridEHName.DataSource.DataSet.RecNo  mod 2=0 then
  begin
    DBGridEHName.Canvas.Brush.Color:=RGB(244,241,255);
    DBGridEHName.Canvas.FillRect(rect);
    DBGridEHName.Canvas.font.color:=clblack;
  end
  else begin
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
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;State: TGridDrawState);
begin
 if not (gdFixed in State) then
  DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
end;

procedure TMainForm1.BitBtn4Click(Sender: TObject);
var s,s2,s3:string;
    b2:boolean;
    V2: Variant;
begin
 try
   if not DBGridEh1.DataSource.DataSet.Active then exit;
   if vColumn1 = nil then
   begin
     s :='CUT_NO';
     s3 := '配料单号:  ';
   end
   else
   begin
     s := vColumn1.FieldName;
     s3 := vColumn1.Title.Caption+':             '  ;
   end;

   s2:=inputbox('输入--'+s3, s3, vs3);
   vs3 :=s2 ;
   v2:=vs3;
   if s2='' then exit;
   b2 := DBGridEH1.DataSource.DataSet.Locate(s,v2,[]);
   if not b2 then showmessage('没有找到您要求的记录！！请确认是否输入正确');
 except
 end;
end;

procedure TMainForm1.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMainForm1.MenuItemClick(Sender: TObject);
var i:byte;
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
   end else begin
     for i:=0 to DBGridEh1.FieldCount-1 do
      if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
      begin
        DBGridEh1.Columns[i].Visible:=false;
        break;
      end;
   end;
end;


procedure TMainForm1.DBGridEh2TitleBtnClick(Sender: TObject; ACol: Integer;Column: TColumnEh);
begin
  if not DBGridEh2.DataSource.DataSet.Active then exit;
  if dm.ADODataSet2.RecordCount <= 1 then exit;
    TitleBtnSort1(sender,acol,column,dm.ADODataSet2,1);
end;

procedure TMainForm1.TitleBtnSort1(Sender: TObject; ACol: Integer;
  Column: TColumnEh; value: TADODataSet; const value2: integer);
var sortstring:string;
begin
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

    if FieldName = '' then Exit;
    case Title.SortMarker of
      smNoneEh:
      begin
        Title.SortMarker := smDownEh;
        sortstring := Column.FieldName + ' ASC';
      end;
      smDownEh: sortstring := Column.FieldName + ' ASC';
      smUpEh: sortstring := Column.FieldName + ' DESC';
    end;

    try
      value.Sort := sortstring
    except
    end;
  end;
end;

procedure TMainForm1.Menu_N1Click(Sender: TObject);
begin
 if DBGridEh2.DataSource.DataSet.Active then
   if DBGridEh2.DataSource.DataSet.RecordCount >0 then
   begin
     Show58Form2:= TShow58Form2.Create(self) ;
     try
       if Show58Form2.ADOStoredProc1.Active then Show58Form2.ADOStoredProc1.Close;
       Show58Form2.ADOStoredProc1.Parameters.ParamValues['@WO_PTR'] := DBGridEh2.DataSource.DataSet.FieldValues['rkey06'];
       Show58Form2.ADOStoredProc1.Open;
       Show58Form2.Caption := '报废信息';
       Show58Form2.ShowModal;
     finally
       Show58Form2.Free;
     end;
   end;
end;

procedure TMainForm1.Menu_N2Click(Sender: TObject);
begin
  if DBGridEh2.DataSource.DataSet.Active then
    if DBGridEh2.DataSource.DataSet.RecordCount >0 then
    begin
      Show53Form2:= TShow53Form2.Create(self) ;
      try
        if Show53Form2.ADOStoredProc1.Active then Show53Form2.ADOStoredProc1.Close;
        Show53Form2.ADOStoredProc1.Parameters.ParamValues['@WO_PTR'] := DBGridEh2.DataSource.DataSet.FieldValues['rkey06'];
        Show53Form2.ADOStoredProc1.Open;
        Show53Form2.Caption := '入仓信息';
        Show53Form2.ShowModal;
      finally
        Show53Form2.Free;
      end;
    end;
end;

procedure TMainForm1.Menu_N3Click(Sender: TObject);
begin
  if DBGridEh2.DataSource.DataSet.Active then
    if DBGridEh2.DataSource.DataSet.RecordCount >0 then
    begin
      Show48Form2:= TShow48Form2.Create(self) ;
      try
        if Show48Form2.ADOStoredProc1.Active then Show48Form2.ADOStoredProc1.Close;
        Show48Form2.ADOStoredProc1.Parameters.ParamValues['@WO_PTR'] := DBGridEh2.DataSource.DataSet.FieldValues['rkey06'];
        Show48Form2.ADOStoredProc1.Open;
        Show48Form2.Caption := '流转信息';
        Show48Form2.ShowModal;
      finally
        Show48Form2.Free;
      end;
    end;
end;

procedure TMainForm1.Menu_N4Click(Sender: TObject);
begin
  if DBGridEh2.DataSource.DataSet.Active then
   if DBGridEh2.DataSource.DataSet.RecordCount >0 then
   begin
     Show38Form2:= TShow38Form2.Create(self) ;
     try
       if Show38Form2.ADOStoredProc1.Active then Show38Form2.ADOStoredProc1.Close;
       Show38Form2.ADOStoredProc1.Parameters.ParamValues['@FLOW_NO'] := DBGridEh2.DataSource.DataSet.FieldValues['FLOW_NO'];
       Show38Form2.ADOStoredProc1.Parameters.ParamValues['@bom_ptr'] := DBGridEh2.DataSource.DataSet.FieldValues['bom_ptr'];
       Show38Form2.ADOStoredProc1.Open;
       Show38Form2.Caption := 'MI流程信息';
       Show38Form2.ShowModal;
     finally
       Show38Form2.Free;
     end;
   end;

end;

procedure TMainForm1.EXCEL1Click(Sender: TObject);
var y:integer;
    eaApps1:TExcelApplication;
    t:string;
    aSheet:Variant;
    v_cloumn,jCount:integer;
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
  eaapps1.Workbooks.Add(xlWBATWorksheet,0);
  eaapps1.worksheets.Add(null,null,2,null,0);
  aSheet:=eaapps1.Worksheets[1];
  try
    aSheet.cells[1, 1]:='序号';
    v_cloumn := 2;
    for y:=0 to DBGridEh2.Columns.Count-1 do
      begin
        aSheet.cells[1, y + v_cloumn]:= DBGridEh2.Columns.Items[y].Title.Caption ;
      end;
    DBGridEh2.DataSource.DataSet.First;
    jCount := 2;
    while not DBGridEh2.DataSource.DataSet.Eof do
      begin
        aSheet.cells[jCount, 1]:=inttostr(DBGridEh2.DataSource.DataSet.RecNo);
        for y:=0 to DBGridEh2.Columns.Count-1 do
          begin
            aSheet.cells[jCount, y  + v_cloumn]:=DBGridEh2.Columns.Items[y].Field.text;
          end;
        jCount := jCount +1;
        DBGridEh2.DataSource.DataSet.Next;
      end;
  finally
    eaapps1.Disconnect;
  end;

  if DBGridEh2.Columns.Count+1<=26
    then vstr:=chr(DBGridEh2.Columns.Count+1+96)
  else begin
    vstr:=chr(strtoint(floattostr(int((DBGridEh2.Columns.Count+1)/26)+96)))
        +chr(strtoint(floattostr(DBGridEh2.Columns.Count+1-26*int((DBGridEh2.Columns.Count+1)/26)+96)));
  end;

  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='生产数据汇总';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh2.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='生产数据汇总';
  eaapps1.Visible[0]:=true;
  dm.find1 :=true;
end;

procedure TMainForm1.DoSearch(subSql: string);
var sqlstr:widestring;
    i:integer;
begin
  sqlstr:=uppercase(dm.ADODataSet1.CommandText);
  i:=Pos('WHERE',sqlstr);
  if i = 0 then
   begin
    ShowMsg('SQL语句出错,请联系系统管理员',1);
    abort;
   end;
  Sqlstr:=copy(sqlstr,1,i-1);
  dm.ADODataSet1.Close;
  dm.ADODataSet1.CommandText := sqlstr+' WHERE '+subsql ;
  dm.ADODataSet1.open;
end;

procedure TMainForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADODataSet1.CommandText);
end;

end.
