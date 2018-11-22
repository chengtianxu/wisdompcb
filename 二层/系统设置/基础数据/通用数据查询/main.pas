unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, StdCtrls, Menus, Grids, DBGrids, ExtCtrls,
  DBCtrls,ComObj, Buttons, ToolWin,Excel2000,ClipBrd;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ADOConnection1: TADOConnection;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ADOTable1: TADOTable;
    N3: TMenuItem;
    Excel1: TMenuItem;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    ListBox1: TListBox;
    Label1: TLabel;
    ListBox2: TListBox;
    Label2: TLabel;
    ListBox3: TListBox;
    Label3: TLabel;
    DBNavigator1: TDBNavigator;
    ListBox4: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    Memo1: TMemo;
    ListBox5: TListBox;
    DBNavigator2: TDBNavigator;
    ADOTable2: TADOTable;
    StringGrid1: TStringGrid;
    SpeedButton5: TSpeedButton;
    ODBC1: TMenuItem;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Excel1Click(Sender: TObject);
    procedure ListBox4Click(Sender: TObject);
    procedure Memo1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Memo1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ODBC1Click(Sender: TObject);
    function find_error():boolean;
    function find_error1():boolean;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses history_sql, odbc_data, save_sql,common;

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
 adoconnection1.GetTableNames(listbox1.Items,false);
 adoconnection1.GetTableNames(listbox4.Items,false);
 listbox1.Selected[0]:=true;
 listbox1click(sender);
 listbox4.Selected[0]:=true;
 listbox4click(sender);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
 adotable1.Close;
 listbox2.Clear;
 adotable1.TableName:=listbox1.Items[listbox1.itemindex];
 adotable1.IndexFieldNames:='';
 adotable1.Open;
 adotable1.GetFieldNames(listbox2.Items);
 adotable1.GetIndexNames(listbox3.Items);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
 adotable1.IndexFieldNames:=column.FieldName;
end;

procedure TForm1.Excel1Click(Sender: TObject);

begin
if pagecontrol1.TabIndex=0 then
 begin
  Export_dbGrid_to_Excel(dbgrid1,self.caption);
 end
else
 if adoquery1.Active=true then
 begin
  Export_dbGrid_to_Excel(dbgrid2,self.caption);
 end;

end;

procedure TForm1.ListBox4Click(Sender: TObject);
begin
 adotable2.Close;
 listbox5.Clear;
 adotable2.TableName:=listbox4.Items[listbox4.itemindex];
 adotable2.Open;
 adotable2.GetFieldNames(listbox5.Items);
end;

procedure TForm1.Memo1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
 i,k:byte;
 str:string;
 LineNum:longint;
// colnum:longint;
begin              //返回memo 控件中当前行
 LineNum:=SendMessage(Memo1.Handle,EM_LINEFROMCHAR,Memo1.SelStart,0);
// colnum :=SendMessage(Memo1.Handle,EM_LINEINDEX,LineNum,0); //返回当前列
 k:=0;
 for i:=0 to (source as Tlistbox).Items.Count-1 do
  if (source as Tlistbox).Selected[i] then
   begin
    inc(k);
    if k<(source as Tlistbox).SelCount then
     if (source as Tlistbox).Name='ListBox5' then
      str:=str+listbox4.Items[listbox4.itemindex]+'.'+listbox5.Items[i]+','
     else
      str:=str+listbox4.Items[i]+','
    else
     begin
      if (source as Tlistbox).Name='ListBox5' then
       str:=str+listbox4.Items[listbox4.itemindex]+'.'+listbox5.Items[i]
      else
       str:=str+listbox4.Items[i];
      break;
     end;
   end;
 memo1.Lines[linenum]:=memo1.Lines[linenum]+str;

end;

procedure TForm1.Memo1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
 accept:=(source is tlistbox)
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
if pos('SELECT',UPPERCASE(memo1.Text))>0 then
 with adoquery1 do
  begin
   close;
   sql.Clear;
   sql.Text:=memo1.Text;
   try
    open;
   except
    messagedlg('请检查输入的查询语句是否有误！',mtinformation,[mbok],0);
    exit;
   end;
   stringgrid1.Cells[0,stringgrid1.RowCount-1]:=memo1.Text;
   stringgrid1.RowCount:=stringgrid1.RowCount+1;
   stringgrid1.Row:=stringgrid1.RowCount-2;
  end
else
 showmessage('禁止执行非 SELECT以外的语句!');
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
if stringgrid1.Row<stringgrid1.RowCount-1 then
 begin
  stringgrid1.Row:=stringgrid1.Row+1;
  memo1.Text:=stringgrid1.Cells[0,stringgrid1.row];
 end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
if stringgrid1.Row>1 then
 begin
  stringgrid1.Row:=stringgrid1.Row-1;
  memo1.Text:=stringgrid1.Cells[0,stringgrid1.row];
 end;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to stringgrid1.RowCount-2 do
   stringgrid1.Rows[i].Clear;
 stringgrid1.RowCount:=2;
end;

procedure TForm1.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=116 then speedbutton1click(sender);
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var
 i:word;
begin
try
 form2:=tform2.Create(application);
 form2.StringGrid1.RowCount:=stringgrid1.RowCount;
 for i:=1 to stringgrid1.RowCount-2 do
  form2.StringGrid1.Rows[i]:=stringgrid1.Rows[i];
 if form2.ShowModal=mrok then
  begin
   memo1.Text:=form2.StringGrid1.Cells[0,form2.stringgrid1.row];
   stringgrid1.Row:=form2.stringgrid1.row;
  end;
finally
 form2.Free;
end;

end;

procedure TForm1.FormCreate(Sender: TObject);

begin
 if not App_Init_2(ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
 self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if  ADOConnection1.Connected then
 begin

 end;
end;

procedure TForm1.ODBC1Click(Sender: TObject);
 var
  i:word;
begin
if pagecontrol1.TabIndex=0 then
   try
    FORM3:=tform3.Create(application);
    if form3.ShowModal=mrok then
     begin
      if self.find_error1 then
       messagedlg('查询出的数据的字段在导出目标表上没有,请修改导出表或者重新选择!',mterror,[mbcancel],0)
      else
       begin
        while not form3.Table1.Eof do form3.Table1.Delete;
        adotable1.First;
        try
         screen.Cursor := crHourGlass;
         DBGrid1.DataSource.DataSet.DisableControls;
         while not adotable1.Eof do
         begin
          form3.Table1.Append;
          for i:=0 to adotable1.FieldCount-1 do
           form3.Table1.FieldValues[adotable1.Fields[i].FieldName]:=
           adotable1.Fields[i].Value;
          form3.Table1.Post;
          adotable1.Next;
         end;
          messagedlg('数据导出成功!',mtinformation,[mbok],0);
          adotable1.First;
          screen.Cursor := crDefault;
          DBGrid1.DataSource.DataSet.EnableControls;
        except
         messagedlg('数据导出出错可能字段类型不匹配或者目标表字段不允许非空值,请修改导出表或者重新选择!',mterror,[mbcancel],0);
         screen.Cursor := crDefault;
         DBGrid1.DataSource.DataSet.EnableControls;
        end;
       end;
     end;
   finally
    form3.Free;
   end
else
 if adoquery1.Active=true then
   try
    FORM3:=tform3.Create(application);
    if form3.ShowModal=mrok then
     begin
      if self.find_error then
        messagedlg('查询出的数据的字段在导出目标表上没有,请修改导出表或者重新选择!',mterror,[mbcancel],0)
      else
       begin
        while not form3.Table1.Eof do form3.Table1.Delete;
        adoquery1.First;
        try
         screen.Cursor := crHourGlass;
         DBGrid2.DataSource.DataSet.DisableControls;
         while not adoquery1.Eof do
         begin
          form3.Table1.Append;
          for i:=0 to adoquery1.FieldCount-1 do
           form3.Table1.FieldValues[adoquery1.Fields[i].FieldName]:=
           adoquery1.Fields[i].Value;
          form3.Table1.Post;
          adoquery1.Next;
         end;
          messagedlg('数据导出成功!',mtinformation,[mbok],0);
          adoquery1.First;
          screen.Cursor := crDefault;
          DBGrid2.DataSource.DataSet.EnableControls;
        except

         on E: Exception do
          begin
           messagedlg(E.Message,mterror,[mbcancel],0);
           screen.Cursor := crDefault;
           DBGrid2.DataSource.DataSet.EnableControls;
          end;

         //messagedlg('数据导出出错可能字段类型不匹配或者目标表字段不允许非空值,请修改导出表或者重新选择!',mterror,[mbcancel],0);
         //screen.Cursor := crDefault;
         //DBGrid2.DataSource.DataSet.EnableControls;
        end;
       end;
     end;
   finally
    form3.Free;
   end
 else
  messagedlg('导出数据不能为空,请先查询出要导出的数据!',mtinformation,[mbok],0);
end;

function tform1.find_error():boolean;//查找源数据字段在目的表字段中是否有
var                                  //如果有任一字段在目的表中没有那么结果为true
 i,j:word;                           //如果都有那么函数返回为false
 if_find:boolean;
begin
 find_error:=false;
 if_find:=false;
 for i:=0 to adoquery1.FieldCount-1 do
  begin
   for j:=0 to form3.Table1.fieldcount-1 do
   begin   //不区分大小写进行比较
    if comparetext(adoquery1.fields[i].FieldName,form3.Table1.Fields[j].FieldName)=0 then
     begin
      if_find:=true;
      break;                    //跳出for j循环
     end
    else //字段名不相等
     if j=form3.Table1.FieldCount-1 then //源数据中的字段在目的表中没有找到
      if_find := false;                   //表示没有找到将要导出的字段,导出将终止
   end;
   if if_find=false then break; //跳出for i循环
  end;
 if if_find = false then find_error := true;
end;

function tform1.find_error1():boolean;//查找源数据字段在目的表字段中是否有
var                                  //如果有任一字段在目的表中没有那么结果为true
 i,j:word;                           //如果都有那么函数返回为false
 if_find:boolean;
begin
 find_error1:=false;
 if_find:=false;
 for i:=0 to adotable1.FieldCount-1 do
  begin
   for j:=0 to form3.Table1.fieldcount-1 do
   begin   //不区分大小写进行比较
    if comparetext(adotable1.fields[i].FieldName,form3.Table1.Fields[j].FieldName)=0 then
     begin
      if_find:=true;
      break;                    //跳出for j循环
     end
    else //字段名不相等
     if j=form3.Table1.FieldCount-1 then //源数据中的字段在目的表中没有找到
      if_find := false;                   //表示没有找到将要导出的字段,导出将终止
   end;
   if if_find=false then break; //跳出for i循环
  end;
 if if_find = false then find_error1 := true;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
var
 str:string;
begin
if pos('SELECT',UPPERCASE(memo1.Text))>0 then
 begin
  str:='';
  if inputquery('查询语句存储','请输入要存储的查询语句的说明:            ',str) then
   if trim(str)<> '' then
    begin
     form_savesql:=tform_savesql.Create(application);
     form_savesql.ADO300.Append;
     form_savesql.ADO300description.Value:=str;
     form_savesql.ADO300select_sql.Value:=memo1.Text;
     form_savesql.ADO300.UpdateBatch();
     form_savesql.Free;
     showmessage('保存成功!');
    end;
 end;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
 form_savesql:=tform_savesql.Create(application);
 form_savesql.DBGrid1.ReadOnly:=true;
 form_savesql.DBMemo1.ReadOnly:=true;
 form_savesql.Button1.Caption:='确认';
 if not form_savesql.ADO300.IsEmpty then
 if form_savesql.ShowModal=mrok then
  begin
   memo1.Text:=form_savesql.ADO300select_sql.Value;
   speedbutton1click(sender);
  end;
 form_savesql.Free;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
 form_savesql:=tform_savesql.Create(application);
 if not form_savesql.ADO300.IsEmpty then
 if form_savesql.ShowModal=mrok then
  form_savesql.ADO300.UpdateBatch();
 form_savesql.Free;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=0 then
 begin
  n4.Enabled:=false;
  n5.Enabled:=false;
  n7.Enabled:=false;
 end
else
 begin
  n4.Enabled:=true;
  n5.Enabled:=true;
  n7.Enabled:=true;
 end;
end;

end.
