unit frm_emp_choose_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBGrids, Grids, DBGridEh,DB,Menus, ExtCtrls, DBCtrls,
  ComCtrls,TMyThread_u, TMyThread2_u;
type
  Tfrm_emp_choose = class(TForm)
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Grd1: TDBGridEh;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    StaticText1: TStaticText;
    Label6: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1CellClick(Column: TColumnEh);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    sSql_begin: string;
    sSql_right :string;
    sSql_end :string;
    sSql_begin_up: string;
    sSql_right_up :string;
    sSql_end_up :string;
    FsCheck,FsSearch:string;
    procedure init;
    procedure item_click(sender:TObject);
  public
    prepare_flag : integer;
    sSql_fiter :string;
  end;
var
  frm_emp_choose: Tfrm_emp_choose;
  MyThread:  TMyThread;
  MyThread2: TMyThread2;
implementation

uses DaMO,common,Pick_Item_Single,
ConstVar, frm_dataoperating_u;


{$R *.dfm}

procedure Tfrm_emp_choose.FormCreate(Sender: TObject);
begin
  self.DateTimePicker1.DateTime := IncMonth(now,-1);
  dm.ADODataSet_emplist.Active := false;
  dm.ADODataSet_emplist.CommandText := damo.sSql_fiter_0;
  dm.ADODataSet_emplist.Active := true;
  dm.ADODataSet_emplist.Filter := '';
  stringgrid1.Cells[0,0] := '☆';
  stringgrid1.Cells[1,0] := '部门';
  stringgrid1.Cells[2,0] := '工号';
  stringgrid1.Cells[3,0] := '姓名';
  stringgrid1.ColWidths[4] := 0;
  STRINGGRID1.RowCount := 2;
  init;
end;

procedure Tfrm_emp_choose.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
VAR
  vCol, vRow : LongInt;
begin
  vCol := ACol; vRow := ARow;
WITH Sender AS TStringGrid, Canvas DO
  begin
    SetTextAlign(Handle, TA_center);
    FillRect(Rect);
    TextRect(Rect, rect.Left+stringgrid1.ColWidths[vcol] div 2, Rect.Top+4, Cells[vCol, vRow]);
  end;
end;

procedure Tfrm_emp_choose.StringGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
i,j: Integer;
begin
  with StringGrid1 do
  begin
    if abs(Selection.Bottom - Selection.Top) > 0 then
      begin
        button3.Enabled := false;
        button4.Enabled := true;
      end;
    if abs(Selection.Bottom - Selection.Top) = 0 then
      begin
        button3.Enabled := true;
        button4.Enabled := false;
      end;
    end;
  with StringGrid1 do
  begin
    for i := 1 to  Selection.Top - 1 do
    cells[0,i] := '';
  end;
  with StringGrid1 do
  begin
    for i := Selection.Top to Selection.Bottom + 1 do
    //for j:=Selection.Left to Selection.Right do
    if i <> 0 then
    Cells[0,i] := '√';
  end;
  with StringGrid1 do
  begin
    for i := Selection.Bottom + 1 to rowcount - 1 do
    //for j:=Selection.Left to Selection.Right do
    Cells[0,i] := '';
  end;
end;

procedure DeleteRow(StringGrid1m: TStringGrid; ARow: Integer);
  var i, j: Integer;
   begin    with StringGrid1m do
   begin      for i := ARow to RowCount-2 do
    for j := 0 to ColCount-1 do
  Cells[j, i] := Cells[j, i+1];
    RowCount := RowCount - 1
    end;
  end;

procedure Tfrm_emp_choose.Button3Click(Sender: TObject);
var i,j:integer;
begin  
  for i := 1 to stringgrid1.RowCount - 1 do
  begin
    if (stringgrid1.Cells[0,i] = '√')  and (stringgrid1.RowCount > 2) then
    begin
      deleterow(StringGrid1, i);
      j:=i;
    end;
    if (stringgrid1.Cells[0,i] = '√')  and (stringgrid1.RowCount <= 2) then
    begin
      stringgrid1.Cells[1,1] := '';
      stringgrid1.Cells[2,1] := '';
      stringgrid1.Cells[3,1] := '';
      stringgrid1.Cells[4,1] := '';
      j := i;
    end;
  end;
  if j >= 1 then
  stringgrid1.Cells[0,j] := '√';
  // 左边重定位
  sSql_right:='';
  for i := 1 to stringgrid1.RowCount -1 do
  begin
    if  stringgrid1.Cells[4,i] <> '' then
    sSql_right := sSql_right + stringgrid1.Cells[4,i] + ',';
  end;
  sSql_begin := '  and rkey not in (' ;
  sSql_end := '0) ';
  sSql_fiter := sSql_begin + sSql_right + sSql_end ;
  frm_dataoperating := Tfrm_dataoperating.Create(nil);
  frm_dataoperating.prepare;
end;

procedure Tfrm_emp_choose.Button4Click(Sender: TObject);
var i, j: integer;
begin
  i := 1;
  while i <= stringgrid1.RowCount-1 do
  begin
    if (stringgrid1.Cells[0,i] = '√')  and (stringgrid1.RowCount > 2) then
      begin
        deleterow(StringGrid1, i);
        i := i-1;
      end;
    if (stringgrid1.Cells[0,i] = '√' ) and (stringgrid1.RowCount <= 2) then
      begin
        stringgrid1.Cells[0,1] := '';
        stringgrid1.Cells[1,1] := '';
        stringgrid1.Cells[2,1] := '';
        stringgrid1.Cells[3,1] := '';
        stringgrid1.Cells[4,1] := '';
        i := i-1;
      end;
    i:=i+1;
  end;
  Button4.Enabled := false;
  Button3.Enabled := false;
  // 左边重定位
  sSql_right := '';
  for i := 1 to stringgrid1.RowCount-1 do
  begin
    if  stringgrid1.Cells[4,i] <> '' then
    sSql_right := sSql_right + stringgrid1.Cells[4,i] + ',';
  end;
  sSql_begin := ' and  rkey not in (' ;
  sSql_end := '0)';
  sSql_fiter := sSql_begin + sSql_right + sSql_end ;
  frm_dataoperating := Tfrm_dataoperating.Create(nil);
  frm_dataoperating.prepare;
end;

procedure Tfrm_emp_choose.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i,j:Integer;
begin
  with StringGrid1 do
  begin
    if abs(Selection.Bottom-Selection.Top)>0   then
      begin
        button3.Enabled:=false;
        button4.Enabled:=true;
      end;
    if abs(Selection.Bottom-Selection.Top)=0   then
      begin
        button3.Enabled:=true;
        button4.Enabled:=false;
      end;
  end;
  with StringGrid1 do
  begin
    for i:=1 to  Selection.Top-1 do
    cells[0,i]:='';
  end;
  with StringGrid1 do
  begin
    for i:=Selection.Top to Selection.Bottom do
    //for j:=Selection.Left to Selection.Right do
    if i<>0 then
    Cells[0,i]:='√';
  end;
  with StringGrid1 do
  begin
    for i:=Selection.Bottom+1 to rowcount-1 do
    //for j:=Selection.Left to Selection.Right do
    Cells[0,i]:='';
  end;
  //showmessage('top'+inttostr(StringGrid1.Selection.Top)+'bottom'+inttostr(StringGrid1.selection.bottom));
end;

procedure Tfrm_emp_choose.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
    begin
      column.Title.SortMarker:=smUpEh;
      dm.ADODataSet_emplist.Sort:=Column.FieldName;
    end
  else
    begin
      column.Title.SortMarker:=smDownEh;
      dm.ADODataSet_emplist.Sort:=Column.FieldName+' DESC';
    end;
  //dm.ADODataSet_emplistAfterScroll(dm.ADODataSet_emplist);
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
    begin
      label1.Caption := column.Title.Caption ;
      field_name := column.FieldName ;
      edit1.SetFocus;
      PreColumn.Title.Color := clBtnFace ;
      Column.Title.Color := clred ;
      PreColumn := column ;
      Edit1Change(Edit1);
    end
  else
    edit1.SetFocus;
end;

procedure Tfrm_emp_choose.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
    begin
      if trim(Edit1.text) <> '' then
        begin
          if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
            Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
          else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
            Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
        end
      else
        Grd1.DataSource.DataSet.Filter:='';
    end;
   statictext1.Caption := inttostr(self.Grd1.DataSource.DataSet.RecordCount);
end;
procedure Tfrm_emp_choose.init;
var  i: byte;
    item: TMenuItem;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  for i := 1 to Grd1.Columns.Count do
  begin
    item := TmenuItem.Create(self);
    item.Caption := Grd1.Columns[i - 1].Title.Caption;
    item.Checked :=Grd1.Columns[i - 1].Visible ;
    item.OnClick := item_click ;
    //PMFlds.Items.Add(item);
  end; 
end;

procedure Tfrm_emp_choose.item_click(sender: TObject);
var
  i: byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
    begin
      for i := 0 to Grd1.FieldCount - 1 do
      if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
        begin
          Grd1.Columns[i].Visible := true;
          break;
        end;
    end
  else
    begin
      for i := 0 to Grd1.FieldCount - 1 do
      if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
        begin
          Grd1.Columns[i].Visible := false;
          break;
        end;
    end;
end;

procedure Tfrm_emp_choose.Button2Click(Sender: TObject);
var
 i,j: integer;
begin
  frm_emp_choose.Enabled:=false;
  for i:= 1 to grd1.SelectedRows.Count   do
    begin
      grd1.DataSource.DataSet.Bookmark:=grd1.SelectedRows.Items[i-1];
      if stringgrid1.Cells[4,1]='' then j := 1 else  j:=stringgrid1.RowCount;
      stringgrid1.RowCount:=j+1;
      stringgrid1.Cells[1,j]:=dm.ADODataSet_emplistdepartmentname.AsString;
      stringgrid1.Cells[2,j]:=dm.ADODataSet_emplistemployeecode.AsString;
      stringgrid1.Cells[3,j]:=dm.ADODataSet_emplistchinesename.AsString;
      stringgrid1.Cells[4,j]:=dm.ADODataSet_emplistrkey.AsString;
    end;
  sSql_right:='';
  for i:=1 to stringgrid1.RowCount - 1 do
    begin
      if stringgrid1.Cells[4,i] <> '' then
        sSql_right:=sSql_right+stringgrid1.Cells[4,i]+',';
    end;
  sSql_begin := ' and rkey not in (' ;
  sSql_end := '0)';
  sSql_fiter := sSql_begin + sSql_right + sSql_end ;
  frm_dataoperating := Tfrm_dataoperating.Create(nil);
  frm_dataoperating.prepare; 
end;

procedure Tfrm_emp_choose.CheckBox1Click(Sender: TObject);
begin
  //dm.ADODataSet_emplist.Close;
  if checkbox2.Checked =false then    //有无班组过滤
    damo.sSql_fiter_00 := format(' and rkey  in (select rkey from employeemsg where isnull(classgroupid,0) in (0,%d))',[damo.D_Ftag])
  else
    damo.sSql_fiter_00 := ' ';
  if checkbox1.Checked = false then   //离职过滤
    begin
      damo.sSql_fiter_0 := ' select rkey,departmentname,employeecode,chinesename,' +
 ' position_item,ondutytime,classgroupcode,accountname '+
 ' from v_employeemsg where attendance=1 and outdutytime is null  ' + damo.sSql_fiter_00;
      sSql_fiter := sSql_begin + sSql_right + sSql_end ;
    end
  else
    begin
      damo.sSql_fiter_0 := format(' select rkey,departmentname,employeecode,chinesename,' +
      ' position_item,ondutytime,classgroupcode,accountname '+
      ' from v_employeemsg where attendance=1 and ( outdutytime is null or outdutytime>=''%s'' )',[' ',datetimetostr(datetimepicker1.DateTime)]) + damo.sSql_fiter_00;
      sSql_fiter := sSql_begin + sSql_right + sSql_end ;
    end;
  //dm.ADODataSet_emplist.open;
  frm_dataoperating := Tfrm_dataoperating.Create(nil);
  frm_dataoperating.prepare;
end;

procedure Tfrm_emp_choose.FormShow(Sender: TObject);
begin
statictext1.Caption := inttostr(self.Grd1.DataSource.DataSet.RecordCount);
end;

procedure Tfrm_emp_choose.BitBtn1Click(Sender: TObject);
var
 i,j: integer;
begin
  bitbtn1.Enabled := false;
  sSql_begin_up := '';
  sSql_right_up := '';
  sSql_end_up := '';
  for i := 1 to stringgrid1.RowCount - 1 do
  begin
    if  stringgrid1.Cells[4,i] <> '' then
    sSql_right_up := sSql_right_up + stringgrid1.Cells[4,i] + ',';
  end;
  try
    sSql_begin_up := ' and  rkey  in (' ;
    sSql_end_up := '0) ';
    dm.ADOTMP.SQL.Clear;
    dm.ADOTMP.SQL.Text := format(' update employeemsg set classgroupid = %d '
      +'where status=1',[damo.D_Ftag])
      + sSql_begin_up + sSql_right_up + sSql_end_up;
    dm.ADOTMP.ExecSQL;
    dm.ADOTMP.Close;
    dm.ADOTMP.SQL.Clear;
    sSql_begin_up := ' and  rkey not in (' ;
    sSql_end_up := '0) ';
    dm.ADOTMP.SQL.Clear;
    dm.ADOTMP.SQL.Text := format(' update employeemsg set classgroupid = 0 '
      +' where status=1 and classgroupid = %d',[damo.D_Ftag]) + sSql_begin_up
      + sSql_right_up + sSql_end_up;
    dm.ADOTMP.ExecSQL; //清除不在选框内,的在职员工的班组
    dm.ADOTMP.Close;
    dm.ADOTMP.SQL.Clear;
    application.MessageBox('保存成功', '提示', 64);
  except on E: Exception do
    begin
        messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
  bitbtn1.Enabled := true;
end;

procedure Tfrm_emp_choose.Grd1CellClick(Column: TColumnEh);
begin
  if button2.Enabled = false then button2.Enabled:=true;
end;

procedure Tfrm_emp_choose.FormActivate(Sender: TObject);
var
 i: integer;
begin
    sSql_right := '';
  for i := 1 to stringgrid1.RowCount-1 do
  begin
    if  stringgrid1.Cells[4,i] <> '' then
    sSql_right := sSql_right + stringgrid1.Cells[4,i] + ',';
  end;
  sSql_begin := ' and  rkey not in (' ;
  sSql_end := '0)';
  sSql_fiter := sSql_begin + sSql_right + sSql_end ;
  if checkbox2.Checked =false then    //有无班组过滤
    damo.sSql_fiter_00 := format(' and rkey  in (select rkey from employeemsg where isnull(classgroupid,0) in (0,%d))',[damo.D_Ftag])
  else
    damo.sSql_fiter_00 := ' ';
  if checkbox1.Checked = false then   //离职过滤
    begin
      damo.sSql_fiter_0 := ' select rkey,departmentname,employeecode,chinesename,' +
 ' position_item,ondutytime,classgroupcode,accountname '+
 ' from v_employeemsg where attendance=1 and outdutytime is null  ' + damo.sSql_fiter_00;
      sSql_fiter := sSql_begin + sSql_right + sSql_end ;
    end
  else
    begin
      damo.sSql_fiter_0 := format(' select rkey,departmentname,employeecode,chinesename,' +
      ' position_item,ondutytime,classgroupcode,accountname '+
      ' from v_employeemsg where attendance=1 and ( outdutytime is null or outdutytime>=''%s'' )',[' ',datetimetostr(datetimepicker1.DateTime)]) + damo.sSql_fiter_00;
      sSql_fiter := sSql_begin + sSql_right + sSql_end ;
    end;  
end;

procedure Tfrm_emp_choose.BitBtn3Click(Sender: TObject);
begin
  Export_Grid_to_Excel(StringGrid1,'班组 '+label4.Caption,true);
end;

procedure Tfrm_emp_choose.BitBtn4Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(grd1,'无班组员工');
end;

end.
