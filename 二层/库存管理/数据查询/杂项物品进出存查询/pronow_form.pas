unit pronow_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,DB, ADODB,ComObj, Excel2000, Menus,ClipBrd,
  Mask, DBCtrlsEh;

type
  TForm_pronow = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Lbl_FieldCaption: TLabel;
    Edt_Start: TEdit;
    Edt_End: TEdit;
    EdtDate_Start: TDBDateTimeEditEh;
    EdtDate_End: TDBDateTimeEditEh;
    cbxSymbol: TComboBox;
    pm1: TPopupMenu;
    N1: TMenuItem;
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure Edt_FilterChange(Sender: TObject);
    procedure Edt_FilterKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_StartKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_EndKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDate_StartKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDate_EndKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_StartChange(Sender: TObject);
    procedure cbxSymbolChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
  private
    FSort,FSortField,FFilterField:String;//控制DBgrid排序和过滤
    dDate:TDateTime;
    { Private declarations }
    PreColumn: TColumn;
    procedure FilterControlSet(FDBGrid:TDBGrid;FColumns:TColumn);
  public
    { Public declarations }
  end;

var
  Form_pronow: TForm_pronow;

implementation
uses damo,common, Pas_report_zxcard;

{$R *.dfm}

procedure TForm_pronow.BitBtn3Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm_pronow.Edit1Change(Sender: TObject);
begin
if dm.ADOnow.Active then
 if trim(Edit1.text)<>'' then
   DBGrid1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   DBGrid1.DataSource.DataSet.Filter:='';
end;

procedure TForm_pronow.DBGrid1TitleClick(Column: TColumn);
var 
  iFieldCount:Integer;
begin
   //彭华修改于2012-8-18，原代码被注释
  with  Column.Grid as TDBGrid do
  begin
    for   iFieldCount := 0  to  Columns.Count -1 do  //遍历列，如果有▼▲去掉 ，如果有红色的列改变颜色。
    begin
      Columns[iFieldCount].Title.color:=clbtnface;
      if  (Copy(Columns[iFieldCount].Title.Caption,Length(Columns[iFieldCount].Title.Caption)-1,2)='▼')
        or(Copy(Columns[iFieldCount].Title.Caption,Length(Columns[iFieldCount].Title.Caption)-1,2)='▲')then
      begin
        Columns[iFieldCount].Title.Caption := Copy(Columns[iFieldCount].Title.Caption,1,Length(Columns[iFieldCount].Title.Caption)-2);
      end;
    end; 
    if Column.FieldName = FSortField then          //如果还在原列上单击,改变排序规则
    begin
      if FSort = 'DESC' then
        FSort := 'ASC'
      else
        FSort := 'DESC';
    end 
    else
    begin
      FSortField := Column.FieldName;
      FSort := 'ASC';
    end;

    SelectedIndex:= Column.Index;                         //重新设置表格控件活动单元格等于当前单击列。
    FilterControlSet((Column.grid as TDBGrid),Column );

    if FSort = 'ASC' then
      Column.Title.Caption := Column.Title.Caption + '▲'
    else
      Column.Title.Caption := Column.Title.Caption + '▼';
    (DataSource.DataSet as TCustomADODataSet).Sort:= Column.FieldName+'   '+ FSort;
    column.Title.Color:=clred;
  end;
{ if not dm.ADOnow.Active then Exit;
 if (PreColumn.FieldName<>column.FieldName) then
  begin
   dm.ADOnow.Sort:=Column.FieldName;
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
   begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
   end
  else
   edit1.SetFocus;    }
end;

procedure TForm_pronow.BitBtn2Click(Sender: TObject);
begin
dm.ADOnow.Close;
dm.ADOnow.Prepared;
dm.ADOnow.Open;
dm.ADOnow.Sort:=PreColumn.FieldName;
end;

procedure TForm_pronow.BitBtn1Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_pronow.FormShow(Sender: TObject);
begin
  dDate:=getsystem_date(DM.ADOQuery1,1);
  DBGrid1.SelectedIndex:=0;    //彭华添加于2012-8-18，用于获取过滤条件，会触发 DBGrid1ColEnter  事件。

  PreColumn := DBGrid1.Columns[0];
  dm.ADOnow.Sort:=PreColumn.FieldName;
  if (strtoint(vprev) in [3,4]) then
      begin
           self.DBGrid1.Columns[11].Visible:=true;
           self.DBGrid1.Columns[6].Visible:=true;
           self.DBGrid1.Columns[7].Visible:=true;
           self.DBGrid1.Columns[8].Visible:=true;
           self.DBGrid1.Columns[9].Visible:=true;
           self.DBGrid1.Columns[10].Visible:=true;
      end
  else
      begin
           self.DBGrid1.Columns[11].Visible:=false;
           self.DBGrid1.Columns[6].Visible:=false;
           self.DBGrid1.Columns[7].Visible:=false;
           self.DBGrid1.Columns[8].Visible:=false;
           self.DBGrid1.Columns[9].Visible:=false;
           self.DBGrid1.Columns[10].Visible:=false;
      end ;
end;

procedure TForm_pronow.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADOnow.SQL.Text);

 if (ssCtrl in shift) and (key=46) then  abort;
 if (key=45) then abort;      //insert键
     
end;

procedure TForm_pronow.FilterControlSet(FDBGrid:TDBGrid;FColumns:TColumn);
begin                        //功能介绍：根据字段的数据类型，设置各控件的可见属性。
  with FDBGrid do
  begin
    Lbl_FieldCaption.Caption:=FColumns.Title.Caption;
    FFilterField:= FColumns.FieldName;
    with  DataSource.DataSet do
    if Filtered then
      Filtered:=False;

    with DataSource.DataSet.FieldByName(FFilterField) do
    if  DataType in [ftString] then
      begin
      cbxSymbol     .Visible:=False;
      EdtDate_Start .Visible:=False;
      EdtDate_End   .Visible:=False;
      Edt_End       .Visible:=False;
      Edt_Start     .Visible:=True;
      Edt_Start.Left        :=Lbl_FieldCaption.Left+Lbl_FieldCaption.Width+5;
      Edt_Start.Text        :='';
      end
    else            // ftBCD :  对应数据库的下列数据类型smallmoney  decimal  numeric  money
    if  DataType in [ftBCD,ftFloat,ftCurrency,ftLargeint,ftSmallint,ftInteger,ftWord] then
      begin
      EdtDate_Start .Visible:=False;
      EdtDate_End   .Visible:=False;
      cbxSymbol     .Visible:=True ;
      cbxSymbol        .Left:=Lbl_FieldCaption.Left+Lbl_FieldCaption.Width+5;
      Edt_Start     .Visible:=True;
      Edt_Start        .Text:='';
      Edt_Start.Left:=cbxSymbol.Left+cbxSymbol.Width;
        if cbxSymbol.Text='><' then
        begin
        Edt_End.Visible:=True;
        Edt_End.Left   := Edt_Start.Left+ Edt_Start.Width+5;
        end
        else
        Edt_End.Visible:=False;
      end
    else
    if  DataType in [ftDate,ftDateTime] then      //如果是日期类型
    begin
      Edt_Start.Visible:=False;
      Edt_End.Visible  :=False;
      cbxSymbol.Visible:=True ;
      cbxSymbol.Left:=Lbl_FieldCaption.Left+Lbl_FieldCaption.Width+5;
      EdtDate_Start.Visible:=True;
      EdtDate_Start.Left :=cbxSymbol.Left+  cbxSymbol.Width;
      if cbxSymbol.Text='><' then
      begin
        EdtDate_End.Visible:=True;
        EdtDate_End.Left   := EdtDate_Start.Left+ EdtDate_Start.Width+5;
      end
      else
       EdtDate_End.Visible:=False;
    end;
  end;
end;

procedure TForm_pronow.DBGrid1ColEnter(Sender: TObject);
begin
  //彭华添加于2012-8-18，
  with  (Sender as TDBGrid)  do
  begin
    FilterControlSet(Sender as TDBGrid,Columns[SelectedIndex] );
  end;
end;

procedure TForm_pronow.Edt_FilterChange(Sender: TObject);
begin
  //彭华修改于2012-8-18，原代码被注释
 { with DBGrid1.DataSource.DataSet do
  if Active then
  if trim(Edt_Filter.text)<>'' then
  begin
    if FieldByName(FFilterField).DataType=ftString then
      Filter:=FFilterField+' like ''%'+trim(Edt_Filter.TEXT)+'%'''
  end
  else
    Filter:=''; }
end;

procedure TForm_pronow.Edt_FilterKeyPress(Sender: TObject; var Key: Char);
begin
  //彭华添加于2012-8-18，
 { with DBGrid1 do
  if Key=#13 then
  if  SelectedField.DataType in [ftBCD,ftFloat,ftCurrency,ftSmallint,ftInteger,ftWord] then
  with  DataSource.DataSet   do
  begin
    if Trim(Edt_Filter.Text)<>'' then
    begin
    Filtered :=False;
    Filter:=FFilterField+cbxSymbol.Text+Edt_Filter.Text;
    Filtered :=True;
    end
    else
    Filtered :=False;
  end;  }
end;

procedure TForm_pronow.Edt_StartKeyPress(Sender: TObject; var Key: Char);
begin
  //彭华添加于2012-8-18，
  with DBGrid1 do              // SelectedField.DataType
  if DataSource.DataSet.FieldByName(FFilterField).DataType in [ftBCD,ftFloat,ftCurrency,ftSmallint,ftInteger,ftWord] then
  begin
    if Key=#13 then
    if cbxSymbol.Text<>'><'  then
    with  DataSource.DataSet   do
    begin
      if Trim(Edt_Start.Text)<>'' then
      begin
      Filtered :=False;
      Filter:=FFilterField+cbxSymbol.Text+Edt_Start.Text;
      Filtered :=True;
      end
      else
      Filtered :=False;
    end;

    if   not   (key   in   [ '0'.. '9', '.',#8])   then    //如果表格中选择的字段类型是数据型 ，且输入的字符不是数值和小数和退格键，输入无效。
    key   :=   #0
  end;
end;

procedure TForm_pronow.Edt_EndKeyPress(Sender: TObject; var Key: Char);
begin
  with DBGrid1 do
  if DataSource.DataSet.FieldByName(FFilterField).DataType in [ftBCD,ftFloat,ftCurrency,ftSmallint,ftInteger,ftWord] then
  begin
    if Key=#13 then
    if cbxSymbol.Text='><'  then
    with  DataSource.DataSet   do
    begin
      if (Trim(Edt_Start.Text)<>'')and(Trim(Edt_End.Text)<>'') then
      begin
      Filtered :=False;
      Filter:=FFilterField+' >= '+Trim(Edt_Start.Text)+' and '+FFilterField+' <= '+Edt_End.Text;
      Filtered :=True;
      end
      else
      Filtered :=False;
    end;
    if   not   (key   in   [ '0'.. '9', '.',#8])   then    //如果表格中选择的字段类型是数据型 ，且输入的字符不是数值和小数和退格键，输入无效。
    key   :=   #0
  end;
end;

procedure TForm_pronow.EdtDate_StartKeyPress(Sender: TObject;
  var Key: Char);
begin
  //彭华添加于2012-8-18，
  with DBGrid1 do
  if Key=#13 then
  if cbxSymbol.Text<>'><'  then
  with  DataSource.DataSet   do
  begin
    if Trim(EdtDate_Start.Value)<>'' then
    begin
    Filtered :=False;
    Filter:=FFilterField+cbxSymbol.Text+QuotedStr(EdtDate_Start.Value);
    Filtered :=True;
    end
    else
    Filtered :=False;
  end;
end;

procedure TForm_pronow.EdtDate_EndKeyPress(Sender: TObject; var Key: Char);
begin
  //彭华添加于2012-8-18，
  with DBGrid1 do
  if Key=#13 then
  if cbxSymbol.Text='><'  then
  with  DataSource.DataSet   do
  begin
    if (not VarIsNull(EdtDate_Start.Value)) and (not VarIsNull(EdtDate_End.Value)) then
    begin
    Filtered :=False;
    Filter:=FFilterField+' >= '+QuotedStr(EdtDate_Start.Value)+' and '+FFilterField+' <= '+QuotedStr(EdtDate_End.Value);
    Filtered :=True;
    end
    else
    Filtered :=False;
  end;
end;

procedure TForm_pronow.Edt_StartChange(Sender: TObject);
begin
  //彭华修改于2012-8-18，
  with dm.ADOnow do
  if Active then
  if trim(Edt_Start.text)<>'' then
  begin
    if FieldByName(FFilterField).DataType=ftString then
    begin
      Filtered:=False;
      Filter:=FFilterField+' like ''%'+trim(Edt_Start.TEXT)+'%'''  ;
      Filtered:=True;
    end
  end
  else
    begin
    Filter:='';
    Filtered:=False;
    end;
end;

procedure TForm_pronow.cbxSymbolChange(Sender: TObject);
begin
  DBGrid1ColEnter(DBGrid1);
end;

procedure TForm_pronow.FormActivate(Sender: TObject);
begin
  DBGrid1.SelectedIndex:=1;    //彭华添加于2012-8-18，用于获取过滤条件，会触发 DBGrid1ColEnter  事件。
  DBGrid1.SelectedIndex:=0;
end;

procedure TForm_pronow.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 {if dm.ADOnowDATE_RECD.Value<=dDate then
  DBGrid1.Canvas.Font.Color := clRed;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State); }
end;

procedure TForm_pronow.N1Click(Sender: TObject);
var
  LFrm:Tfrm_report_zx;
begin
  LFrm:= Tfrm_report_zx.Create(nil);
  try
     LFrm.qry235.close;
     LFrm.qry235.Parameters[0].Value:= dm.ADOnowrkey235.Value;
     LFrm.qry235.open;

     
     LFrm.ADO493.Close;
     LFrm.ADO493.Open;

     LFrm.ppReport1.Reset;
     LFrm.ppReport1.Template.FileName :=
         StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
             'Wlbzreport_zx.rtm';
     LFrm.ppReport1.Template.LoadFromFile;
     LFrm.ppReport1.SaveAsTemplate:=false;
     LFrm.ppReport1.Print;
  finally
    LFrm.Free;
  end;
end;

end.
