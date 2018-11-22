unit MainTem_Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, DBGridEh, ExtCtrls, StdCtrls, ADODB,
  Buttons,Excel2000, OleServer,ClipBrd, ExcelXP, Menus,DMUnit1;
  {Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls;    {}

type
  TMainTemForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Temp_DBGridEh1: TDBGridEh;
    PopupMenu2: TPopupMenu;
    procedure BitBtn6Click(Sender: TObject);
    procedure Temp_DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  


  public
    { Public declarations }
    vColumn1: TColumnEh;
    csi_rkey: string  ;
    db_ptr: string ;
    vprev: string ;
    procedure DbgridEHToExcel2(DBGridEh_value: TDBGridEh; stitle: string);
    procedure DrawDBGridEHColorCol(DBGridEHName: TDBGridEH; Rect: TRect; DataCol: Integer;
                                   Column: TColumnEh; State: TGridDrawState);

    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADODataSet);  overload;

    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADOTable);  overload;

    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADOStoredProc);  overload;

    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADOQuery);  overload;
  end;

var
  MainTemForm1: TMainTemForm1;

implementation

//uses DMUnit1;

{$R *.dfm}

procedure TMainTemForm1.BitBtn6Click(Sender: TObject);
begin
  //退出
  close;
end;


procedure TMainTemForm1.DbgridEHToExcel2(DBGridEh_value: TDBGridEh;stitle:string);
var
  eaApps1: TExcelApplication;
     y   : integer;
  //tsList : TStringList;
  s,s1,t : string;
  aSheet : Variant;
  j,vleng,v_cloumn,jCount:integer;
  vstr:string;
begin
   if not DBGridEh_value.DataSource.DataSet.Active then
   begin
     showmessage('请先打开数据内容！！！按查谒条件...来打开数据');
     exit;
   end;
  //if messagedlg('要把数据资料导出到EXCEL文件吗？',mtconfirmation,[mbYes,mbNo],0)<>mrYes then exit;
  Screen.Cursor := crHourGlass;
  eaapps1:=TExcelApplication.Create(self);
  try
    eaapps1.connect;
  except
    messagedlg('是否正确安装了EXCEL？',mtinformation,[mbok],0);
    Abort;
  end;
  //Application.CreateForm(TForm_Progress, Form_Progress);

  eaapps1.Workbooks.Add(xlWBATWorksheet,0);
  //eaapps1.worksheets.Add(null,null,2,null,0);
  //Form_Progress.show;

  DBGridEh_value.DataSource.DataSet.DisableControls;
  //dm.wzcx48_1.DisableControls;


  //Form_Progress.Label1.Caption :='正在材料实际数据...';
  //Form_Progress.stepvalue := 0;
  //Form_Progress.Label1.refresh;
  aSheet:=eaapps1.Worksheets[1];

  s:='序号'+#9;
  //tsList:=TStringList.Create;
  try
    aSheet.cells[1, 1]:='序号';
    v_cloumn := 2;
    for y:=0 to DBGridEh_value.Columns.Count-1 do
     begin
      aSheet.cells[1, y + v_cloumn]:= DBGridEh_value.Columns.Items[y].Title.Caption ;
      //s:=s+DBGridEh_value.Columns.Items[y].Title.Caption+#9;
     end;
      
    //tsList.Add(s);
    DBGridEh_value.DataSource.DataSet.First;
    jCount := 2;
    while not DBGridEh_value.DataSource.DataSet.Eof do
      begin
        //v_cloumn:=2;
        //s:=inttostr(DBGridEh_value.DataSource.DataSet.RecNo)+#9;
        aSheet.cells[jCount, 1]:=inttostr(DBGridEh_value.DataSource.DataSet.RecNo);
        for y:=0 to DBGridEh_value.Columns.Count-1 do
          begin
            //s1:=DBGridEh_value.Columns.Items[y].Field.text;
            //s:=s+s1+#9;
            aSheet.cells[jCount, y  + v_cloumn]:=DBGridEh_value.Columns.Items[y].Field.text;
          end;
        //tsList.Add(s);
        jCount := jCount +1;
        DBGridEh_value.DataSource.DataSet.Next;
      end;
    //clipboard.Clear;
    //Clipboard.AsText:=tsList.Text;
  finally
    //tsList.Free;
    eaapps1.Disconnect;
    //aSheet.Paste;
    //clipboard.Clear;
  end;

  if DBGridEh_value.Columns.Count+1<=26 then
  begin
     vstr:=chr(DBGridEh_value.Columns.Count+1+96);
     //showmessage(  vstr +'  '  +inttostr(DBGridEh1.Columns.Count) );
  end
  else begin
    vstr:=chr(strtoint(floattostr(int((DBGridEh_value.Columns.Count+1)/26)+96)))
        +chr(strtoint(floattostr(DBGridEh_value.Columns.Count+1-26*int((DBGridEh_value.Columns.Count+1)/26)+96)));
  end;
  //  eaapps1.Disconnect;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.rows[1].insert;
  asheet.cells[1,3]:=stitle;
  asheet.cells[1,3].font.size:=18;
  asheet.cells[1,3].font.bold:=true;
  //asheet.cells[2,1]:='截数时间:'+dm.ADOQ444.FieldByName('cut_date').AsString;
  datetimetostring(t,'yyyy-MM-dd hh:mm:ss',now);
  asheet.cells[3,1]:='导出时间:'+t;
  asheet.Range['a4',vstr+inttostr(DBGridEh_value.DataSource.DataSet.RecordCount+4)].Borders.LineStyle :=1;
  asheet.columns.ColumnWidth :=10;
  asheet.Range['b1','b1'].ColumnWidth :=20;
  asheet.Name :=stitle;
  {}
  DBGridEh_value.DataSource.DataSet.EnableControls;


  eaapps1.Visible[0]:=true;         // display Excel files
  //Form_Progress.free;

  //dm.find1 :=true;
   Screen.Cursor := crDefault;
end;

procedure TMainTemForm1.DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;
  Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 try
   if  DBGridEHName.DataSource.DataSet.RecNo  mod 2=0 then
     begin
          DBGridEHName.Canvas.Brush.Color:=RGB(244,241,255);
          DBGridEHName.Canvas.FillRect(rect);
          //DBGridEHName.Canvas.font.color:=clblack; //不要此句，不然的话将不会显示不同的字体的颜色值
     end
     else
     begin
          DBGridEHName.Canvas.Brush.Color:=clwhite;
          DBGridEHName.Canvas.FillRect(rect);
          //DBGridEHName.Canvas.font.color:=clblack;
     end;
    if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
     begin
          DBGridEHName.Canvas.Brush.Color:=RGB(0,224,224);
          DBGridEHName.Canvas.FillRect(rect);
          //DBGridEHName.Canvas.font.color:=clblack;
     end;
     DBGridEHName.DefaultDrawColumnCell(rect,datacol,column,state);
 except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;
end;

procedure TMainTemForm1.Temp_DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  try
    if not (gdFixed in State) then
    begin
     if Temp_DBGridEh1.DataSource.DataSet.Active then //只有在打开的时候才画
        DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
    end;
  except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;

end;

procedure TMainTemForm1.TitleBtnSort1(Sender: TObject; ACol: Integer;
  Column: TColumnEh; value: TADODataSet);
var
  sortstring:string; //排序列
begin
 try
  //先设置这个内容 OptionsEh＝dghAutoSortMarking
  //Column.Title.TitleButton＝true
  //
  //进行排序
  with Column do
  begin
    if Column<> vColumn1  then
    begin
     if vColumn1<>nil then
       vColumn1.Title.color:=clbtnface;
     vColumn1:=Column;
     Column.Title.Color :=clred;
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
 except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;
end;

procedure TMainTemForm1.TitleBtnSort1(Sender: TObject; ACol: Integer;
  Column: TColumnEh; value: TADOStoredProc);
var
  sortstring:string; //排序列
begin
 try
  //先设置这个内容 OptionsEh＝dghAutoSortMarking
  //Column.Title.TitleButton＝true
  //
  //进行排序
  with Column do
  begin
    if Column<> vColumn1  then
    begin
     if vColumn1<>nil then
       vColumn1.Title.color:=clbtnface;
     vColumn1:=Column;
     Column.Title.Color :=clred;
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
 except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;
end;

procedure TMainTemForm1.TitleBtnSort1(Sender: TObject; ACol: Integer;
  Column: TColumnEh; value: TADOTable);
var
  sortstring:string; //排序列
begin
 try
  //先设置这个内容 OptionsEh＝dghAutoSortMarking
  //Column.Title.TitleButton＝true
  //
  //进行排序
  with Column do
  begin
    if Column<> vColumn1  then
    begin
     if vColumn1<>nil then
       vColumn1.Title.color:=clbtnface;
     vColumn1:=Column;
     Column.Title.Color :=clred;
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
 except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;
end;

procedure TMainTemForm1.TitleBtnSort1(Sender: TObject; ACol: Integer;
  Column: TColumnEh; value: TADOQuery);
var
  sortstring:string; //排序列
begin
 try
  //先设置这个内容 OptionsEh＝dghAutoSortMarking
  //Column.Title.TitleButton＝true
  //
  //进行排序
  with Column do
  begin
    if Column<> vColumn1  then
    begin
     if vColumn1<>nil then
       vColumn1.Title.color:=clbtnface;
     vColumn1:=Column;
     Column.Title.Color :=clred;
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
 except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;
end;

end.
