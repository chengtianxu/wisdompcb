unit MainUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, DBGridEh, ExtCtrls, StdCtrls, ADODB,
  Buttons,Excel2000, OleServer,ClipBrd, ExcelXP, Menus,DateUtils;

type
  TMainForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    vs3:string;
    sql_text:string;
    server_date:Tdatetime;
    precolumn:Tcolumneh;
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
DMUnit1,IF_Unit1,common;

{$R *.dfm}

procedure TMainForm1.BitBtn3Click(Sender: TObject);
var i:byte;
begin
  try
    if If_Form1.ShowModal=mrok then
    with dm.adodataset1 do
    begin
      close;
      commandtext:=sql_text;
      for i:=1 to If_Form1.SGrid1.RowCount-1 do
        CommandText:=CommandText+If_Form1.SGrid1.cells[2,i];
      commandtext:=commandtext+' and data0492.ISSUE_DATE>='''+datetostr(If_Form1.dtpk1.date)+''''+
                   ' and data0492.issue_date<='''+datetostr(If_Form1.dtpk2.date+1)+'''';
      open;
    end;
  finally
  end;
end;

procedure TMainForm1.BitBtn6Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TMainForm1.BitBtn2Click(Sender: TObject);
var eaApps1: TExcelApplication;
    y:integer;
    t:string;
    aSheet : Variant;
    v_cloumn,jCount:integer;
    vstr:string;
begin
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
    for y:=0 to DBGridEh1.Columns.Count-1 do
      begin
        aSheet.cells[1, y + v_cloumn]:= DBGridEh1.Columns.Items[y].Title.Caption ;
      end;
    DBGridEh1.DataSource.DataSet.First;
    jCount := 2;
    while not DBGridEh1.DataSource.DataSet.Eof do
      begin
        aSheet.cells[jCount, 1]:=inttostr(DBGridEh1.DataSource.DataSet.RecNo);
        for y:=0 to DBGridEh1.Columns.Count-1 do
          begin
            aSheet.cells[jCount, y  + v_cloumn]:=DBGridEh1.Columns.Items[y].Field.text;
          end;
        jCount := jCount +1;
        DBGridEh1.DataSource.DataSet.Next;
      end;
  finally
    eaapps1.Disconnect;
  end;

  if DBGridEh1.Columns.Count+1<=26 then
  begin
     vstr:=chr(DBGridEh1.Columns.Count+1+96);
  end
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
  aSheet:=eaapps1.Worksheets[2];
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

  aSheet:=eaapps1.Worksheets[3];
  try
    aSheet.cells[1, 1]:='序号';
    v_cloumn := 2;
    for y:=0 to DBGridEh3.Columns.Count-1 do
       aSheet.cells[1, y + v_cloumn]:= DBGridEh3.Columns.Items[y].Title.Caption ;
    DBGridEh3.DataSource.DataSet.First;
    jCount := 2;
    while not DBGridEh3.DataSource.DataSet.Eof do
      begin
        aSheet.cells[jCount, 1]:=inttostr(DBGridEh3.DataSource.DataSet.RecNo);
        for y:=0 to DBGridEh3.Columns.Count-1 do
          begin
            aSheet.cells[jCount, y  + v_cloumn]:=DBGridEh3.Columns.Items[y].Field.text;
          end;
        jCount := jCount +1;
        DBGridEh3.DataSource.DataSet.Next;
      end;
  finally
    eaapps1.Disconnect;
  end;

  if DBGridEh3.Columns.Count+1<=26
    then vstr:=chr(DBGridEh3.Columns.Count+1+96)
  else begin
    vstr:=chr(strtoint(floattostr(int((DBGridEh3.Columns.Count+1)/26)+96)))
        +chr(strtoint(floattostr(DBGridEh3.Columns.Count+1-26*int((DBGridEh3.Columns.Count+1)/26)+96)));
  end;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:='生产数据详细';
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh3.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :='生产数据详细';
  eaapps1.Visible[0]:=true;         // display Excel files
end;

procedure TMainForm1.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TMainForm1.FormShow(Sender: TObject);
var vn2:array of TMenuItem;
    i,n:integer;
begin
  if not dm.ADOConnection1.Connected then
     application.Terminate;
  sql_text:=dm.ADODataSet1.CommandText;
  precolumn:=dbgrideh1.Columns[0];
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
  server_date:=getsystem_date(dm.aqtmp,1);
  If_Form1.dtpk1.Date:=server_date-dayof(server_date)+1;
  If_Form1.dtpk2.date:=server_date;
  If_Form1.dtpk3.Date:=server_date-30;
  If_Form1.dtpk4.Date:=server_date;
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
var s,s2,s3:string;
    b2:boolean;
    V2: Variant;
begin
 try
   if not DBGridEh1.DataSource.DataSet.Active then exit;
   s := precolumn.FieldName;
   s3 := precolumn.Title.Caption+':             '  ;
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
  end
  else begin
   for i:=0 to DBGridEh1.FieldCount-1 do
    if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
    begin
     DBGridEh1.Columns[i].Visible:=false;
     break;
    end;
  end;
end;

procedure TMainForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.adodataset1.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.adodataset1.IndexFieldNames:=column.FieldName;
  end;

  if (column.ReadOnly) and (precolumn.FieldName<>column.FieldName) then
  begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    precolumn.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn:=column;
  end;
end;

procedure TMainForm1.DBGridEh1KeyDown(Sender:TObject; var Key:Word;Shift:TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
   showmessage(dm.adodataset1.CommandText);
end;

procedure TMainForm1.DBGridEh2KeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
   showmessage(dm.adodataset2.CommandText);
end;

procedure TMainForm1.DBGridEh3KeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
   showmessage(dm.adodataset3.CommandText);
end;

end.
