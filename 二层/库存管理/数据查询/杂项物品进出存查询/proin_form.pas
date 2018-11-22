unit proin_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,DB, ADODB,ComObj, Excel2000, Menus,ClipBrd,
  Mask, DBCtrlsEh;

type
  TForm_proin = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    Lbl_FieldCaption: TLabel;
    cbxSymbol: TComboBox;
    Edt_Start: TEdit;
    Edt_End: TEdit;
    EdtDate_Start: TDBDateTimeEditEh;
    EdtDate_End: TDBDateTimeEditEh;
    BitBtn4: TBitBtn;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxSymbolChange(Sender: TObject);
    procedure Edt_StartChange(Sender: TObject);
    procedure Edt_StartKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_EndKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDate_StartKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDate_EndKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FSort,FSortField,FFilterField:String;//控制DBgrid排序和过滤
    procedure FilterControlSet(FDBGrid:TDBGrid;FColumns:TColumn);
    { Private declarations }
  public
    { Public declarations }
    stardate,enddate:string;
  end;

var
  Form_proin: TForm_proin;

implementation
uses damo,common,zx_report;

{$R *.dfm}

procedure TForm_proin.BitBtn1Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_proin.BitBtn2Click(Sender: TObject);
begin
with dm.ADO0456 do
 begin
  close;
  open;
 end;
end;

procedure TForm_proin.BitBtn3Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm_proin.Edit1Change(Sender: TObject);
begin
if trim(edit1.text)<>'' then
 begin
 if  trim(label1.Caption)='入仓单号' then
  dm.ADO0456.Filter:='GRN_NUMBER like ''%'+trim(EDIT1.TEXT)+'%'''
  else if trim(label1.Caption)='物品名称' then
   dm.ADO0456.Filter:='goods_name like ''%'+trim(EDIT1.TEXT)+'%'''
  else if trim(label1.Caption)='物品规格' then
  dm.ADO0456.Filter:='goods_guige like ''%'+trim(EDIT1.TEXT)+'%'''
  else if trim(label1.Caption)='接收人' then
  dm.ADO0456.Filter:='EMPLOYEE_NAME like ''%'+trim(EDIT1.TEXT)+'%'''
  else if trim(label1.Caption)='供应商代码' then
  dm.ADO0456.Filter:='CODE like ''%'+trim(EDIT1.TEXT)+'%'''
  else if trim(label1.Caption)='供应商简称' then
  dm.ADO0456.Filter:='abbr_name like ''%'+trim(EDIT1.TEXT)+'%'''
  else if trim(label1.Caption)='采购订单号' then
  dm.ADO0456.Filter:='PO_NUMBER like ''%'+trim(EDIT1.TEXT)+'%'''
  else
 dm.ADO0456.Filter:='goods_type like ''%'+trim(EDIT1.TEXT)+'%''' ;
 end
else
 dm.ADO0456.Filter:='';
end;

procedure TForm_proin.DBGrid1TitleClick(Column: TColumn);
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
{
if (column.FieldName='GRN_NUMBER') or (column.FieldName='goods_name')
    or (column.FieldName='goods_type')or (column.FieldName='goods_guige')
    or (column.FieldName='EMPLOYEE_NAME')or (column.FieldName='CODE')
    or (column.FieldName='abbr_name')or (column.FieldName='PO_NUMBER')
    then
 begin
  dbgrid1.columns[0].Title.color:=clbtnface;
  dbgrid1.columns[1].Title.color:=clbtnface;
  dbgrid1.columns[2].Title.color:=clbtnface;
  dbgrid1.columns[3].Title.color:=clbtnface;
  dbgrid1.columns[7].Title.color:=clbtnface;
  dbgrid1.columns[8].Title.color:=clbtnface;
  dbgrid1.columns[9].Title.color:=clbtnface;
  dbgrid1.columns[12].Title.color:=clbtnface;
 if column.FieldName='GRN_NUMBER' then
  begin
   with dm.ADO0456 do
    begin
     close;
     sql.Delete(sql.Count-1);
     sql.Add('order by data0456.GRN_NUMBER');
     open;
    end;
   label1.Caption:='入仓单号';
   column.Title.Color:=clred;
   edit1.SetFocus;
   end
   else if column.FieldName='goods_name' then
  begin
   with dm.ADO0456 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by data0235.goods_name');
    open;
   end;
   label1.Caption:='物品名称';
   column.Title.Color:=clred ;
   edit1.SetFocus;
  end
  else if column.FieldName='goods_type' then
  begin
  with dm.ADO0456 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by data0235.goods_type');
    open;
   end;
   label1.Caption:='物品类别';
   column.Title.Color:=clred;
   edit1.SetFocus;
  end
  else if column.FieldName='goods_guige' then
  begin
  with dm.ADO0456 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by data0235.goods_guige');
    open;
   end;
   label1.Caption:='物品规格';
   column.Title.Color:=clred;
   edit1.SetFocus;
  end
  else if column.FieldName='EMPLOYEE_NAME' then
  begin
  with dm.ADO0456 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by data0005.EMPLOYEE_NAME');
    open;
   end;
   label1.Caption:='接收人';
   column.Title.Color:=clred;
   edit1.SetFocus;
  end
  else if column.FieldName='CODE' then
  begin
  with dm.ADO0456 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by data0023.CODE');
    open;
   end;
   label1.Caption:='供应商代码';
   column.Title.Color:=clred;
   edit1.SetFocus;
   end
  else if column.FieldName='abbr_name' then
  begin
  with dm.ADO0456 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by data0023.abbr_name');
    open;
   end;
   label1.Caption:='供应商简称';
   column.Title.Color:=clred;
   edit1.SetFocus;
  end
  else if column.FieldName='PO_NUMBER' then
  begin
  with dm.ADO0456 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by data0070.PO_NUMBER');
    open;
   end;
   label1.Caption:='采购订单号';
   column.Title.Color:=clred;
   edit1.SetFocus;
   end;
 end; }
end;

procedure TForm_proin.FormShow(Sender: TObject);
begin
  if (strtoint(vprev) in [3,4]) then
      begin
           self.DBGrid1.Columns[12].Visible:=true;
           self.DBGrid1.Columns[13].Visible:=true;
           self.DBGrid1.Columns[14].Visible:=true;
           self.DBGrid1.Columns[15].Visible:=true;
           self.DBGrid1.Columns[16].Visible:=true;
           self.DBGrid1.Columns[17].Visible:=true;
           self.DBGrid1.Columns[5].Visible:=true;
      end
  else
      begin
           self.DBGrid1.Columns[12].Visible:=false;
           self.DBGrid1.Columns[13].Visible:=false;
           self.DBGrid1.Columns[14].Visible:=false;
           self.DBGrid1.Columns[15].Visible:=false;
           self.DBGrid1.Columns[16].Visible:=false;
           self.DBGrid1.Columns[17].Visible:=false;
          // self.DBGrid1.Columns[5].Visible:=false;
          self.DBGrid1.Columns[5].Visible:=true;
      end ;
end;

procedure TForm_proin.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ([ssAlt]=Shift) and (key=86) then
   showmessage(DM.ADO0456.SQL.Text);
end;

procedure TForm_proin.cbxSymbolChange(Sender: TObject);
begin
  DBGrid1ColEnter(DBGrid1);
end;

procedure TForm_proin.Edt_StartChange(Sender: TObject);
begin
  //彭华修改于2012-8-18，原代码被注释
  with DBGrid1.DataSource.DataSet do
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

procedure TForm_proin.Edt_StartKeyPress(Sender: TObject; var Key: Char);
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

procedure TForm_proin.Edt_EndKeyPress(Sender: TObject; var Key: Char);
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

procedure TForm_proin.EdtDate_StartKeyPress(Sender: TObject;
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

procedure TForm_proin.EdtDate_EndKeyPress(Sender: TObject; var Key: Char);
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

procedure TForm_proin.FormActivate(Sender: TObject);
begin
  DBGrid1.SelectedIndex:=1;    //彭华添加于2012-8-18，用于获取过滤条件，会触发 DBGrid1ColEnter  事件。
  DBGrid1.SelectedIndex:=0;
end;

procedure TForm_proin.FilterControlSet(FDBGrid:TDBGrid;FColumns:TColumn);
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


procedure TForm_proin.DBGrid1ColEnter(Sender: TObject);
begin
  //彭华添加于2012-8-18，
  with  (Sender as TDBGrid)  do
  begin
    FilterControlSet(Sender as TDBGrid,Columns[SelectedIndex] );
  end;
end;

procedure TForm_proin.BitBtn4Click(Sender: TObject);
begin
PopupMenu2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.y);
end;

procedure TForm_proin.N1Click(Sender: TObject);
begin
 try
  Form_report:=TForm_report.Create(Application);
  Form_report.ppReport1.Reset;
  Form_report.ppReport1.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'received_zxwl.rtm';
  Form_report.ppReport1.Template.LoadFromFile;
  Form_report.ppReport1.SaveAsTemplate:=True;
  Form_report.ppDesigner1.ShowModal;
 finally
   Form_report.Free;
 end;
end;

procedure TForm_proin.N2Click(Sender: TObject);
begin
 try
  form_report := tform_report.Create(application);
  dm.ADO0456.DisableControls;       //切断与DBgrid控件的联系加快显示速度

  Form_report.ppReport1.Reset;
  Form_report.ppReport1.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'received_zxwl.rtm';
  Form_report.ppReport1.Template.LoadFromFile;
  Form_report.ppReport1.SaveAsTemplate:=False;
  Form_report.ppLabel18.Caption:=self.stardate;
  Form_report.ppLabel19.Caption:=self.enddate;
  form_report.ppReport1.Print;
  dm.ADO0456.EnableControls;
 finally
  form_report.free;
 end;
end;

procedure TForm_proin.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
{ if dm.ADO0456DATE_RECD.Value<=getsystem_date(DM.ADOQuery1,1) then
  DBGrid1.Canvas.Font.Color := clRed;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);  }
end;

end.
