unit proout_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons,ExtCtrls,DB, ADODB,ComObj, Excel2000,Menus,ClipBrd,
  Mask, DBCtrlsEh;//

type
  TForm_proout = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Lbl_FieldCaption: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edt_Start: TEdit;
    cbxSymbol: TComboBox;
    EdtDate_Start: TDBDateTimeEditEh;
    EdtDate_End: TDBDateTimeEditEh;
    Edt_End: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edt_StartChange(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure Edt_StartKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure EdtDate_StartKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_EndKeyPress(Sender: TObject; var Key: Char);
    procedure cbxSymbolChange(Sender: TObject);
    procedure EdtDate_EndKeyPress(Sender: TObject; var Key: Char);
  private
    FSort,FSortField,FFilterField:String;//控制grid排序和过滤
    procedure FilterControlSet(FDBGrid:TDBGrid;FColumns:TColumn);
    { Private declarations }
  public
    function GetFieldTypeName(DataType : TFieldType; IsEnglish : boolean=False) : string;

    { Public declarations }
  end;

var
  Form_proout: TForm_proout;

implementation

uses damo,common;
{$R *.dfm}
function TForm_proout.GetFieldTypeName(DataType : TFieldType; IsEnglish : boolean=False) : string;
begin
 case DataType of
  ftUnknown :
  if IsEnglish then
    result := 'Unknown or undetermined Field'
  else
    result := '未知或者无法判断的字段类型';
  ftString :
  if IsEnglish then
    result := 'Character or string field'
  else
    result := '字符或者字符串字段';
  ftSmallint:
  if IsEnglish then
    result := '16-bit integer field'
  else
    result := '16位整型字段';
  ftInteger :
  if IsEnglish then
    result := '32-bit integer field'
  else
    result := '32位整型字段';
  ftWord :
  if IsEnglish then
    result := '16-bit unsigned integer field'
  else
    result := '16位无符号整型字段';
  ftBoolean :
  if IsEnglish then
    result := 'Boolean field'
  else
    result := '布尔型字段';
  ftFloat :
  if IsEnglish then
    result := 'Floating-point numeric field'
  else
    result := '浮点型字段';
  ftCurrency:
  if IsEnglish then
    result := 'Money field'
  else
    result := '货币类型字段';
  ftBCD :
  if IsEnglish then
    result := 'Binary-Coded Decimal field'
  else
    result := '二进制类型字段';
  ftDate :
  if IsEnglish then
    result := 'Date field'
  else
    result := '日期类型字段';
  ftTime :
  if IsEnglish then
    result := 'Time field'
  else
    result := '时间类型字段';
  ftDateTime:
  if IsEnglish then
    result := 'Date and time field'
  else
    result := '日期时间类型字段';
  ftBytes :
  if IsEnglish then
    result := 'Fixed number of bytes (binary storage)'
  else
    result := '固定格式或字节类型字段(二进制形式存储)';
  ftVarBytes:
  if IsEnglish then
    result := 'Variable number of bytes (binary storage)'
  else
    result := '可变字节类型字段(二进制形式存储)';
  ftAutoInc :
  if IsEnglish then
    result := 'Auto-incrementing 32-bit integer counter field'
  else
  result := '自增的32位整型计数器字段';
  ftBlob :
  if IsEnglish then
    result := 'Binary Large OBject field'
  else
    result := '二进制大容量对象字段';
  ftMemo :
  if IsEnglish then
    result := 'Text memo field'
  else
    result := '文本备注类型字段';
  ftGraphic :
  if IsEnglish then
    result := 'Bitmap field'
  else
    result := '位图类型字段';
  ftFmtMemo :
  if IsEnglish then
    result := 'Formatted text memo field'
  else
    result := '格式化的文本备注类型字段';
  ftParadoxOle:
  if IsEnglish then
    result := 'Paradox OLE field'
  else
    result := 'Paradox OLE类型字段';
  ftDBaseOle:
  if IsEnglish then
    result := 'dBASE OLE field'
  else
  result := 'dBASE OLE类型字段';
  ftTypedBinary :
  if IsEnglish then
    result := 'Typed binary field'
  else
    result := '类型化二进制类型字段';
  ftCursor :
  if IsEnglish then
    result := 'Output cursor from an Oracle stored procedure (TParam only)'
  else
    result := 'Oracle存储过程的输出游标(仅适用于参数)';
  ftFixedChar :
  if isEnglish then
    result := 'Fixed character field'
  else
    result := '固定格式的字符类型字段';
  ftWideString:
  if IsEnglish then
    result := 'Wide string field'
  else
    result := '长字符串类型字段';
  ftLargeInt :
  if IsEnglish then
    result := 'Large integer field'
  else
    result := '长整型字段';
  ftADT :
  if IsEnglish then
    result := 'Abstract Data Type field'
  else
    result := '抽象类型字段';
  ftArray :
  if IsEnglish then
    result := 'Array field'
  else
    result := '数组类型字段';
  ftReference :
  if IsEnglish then
    result := 'REF field'
  else
    result := 'REF类型字段';
  ftDataSet :
  if IsEnglish then
    result := 'DataSet field'
  else
    result := '数据集类型字段';
  ftOraBlob :
  if IsEnglish then
    result := 'BLOB fields in Oracle 8 tables'
  else
    result := 'Oracle 8的BLOB类型字段';
  ftOraClob :
  if IsEnglish then
    result := 'CLOB fields in Oracle 8 tables'
  else
    result := 'Oracle 8的CLOB类型字段';
  ftVariant :
  if IsEnglish then
    result := 'Data of unknown or undetermined type'
  else
    result := '未知或无法确定数据类型字段';
  ftInterface :
  if IsEnglish then
    result := 'References to interfaces (IUnknown)'
  else
    result := '接口引用(IUnknown)类型字段';
  ftIDispatch :
  if IsEnglish then
    result := 'References to IDispatch interfaces'
  else
    result := '派发接口引用类型字段';
  ftGuid :
  if IsEnglish then
    result := 'globally unique identifier (GUID) values'
  else
    result := '唯一性标识(GUID)类型字段';
  else
  if IsEnglish then
    result := 'Unknown or undetermined Field'
  else
    result := '未知或者无法判断的字段类型';
 end;
end;

procedure TForm_proout.BitBtn1Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_proout.BitBtn2Click(Sender: TObject);
begin
dm.ADO0457.Close;
dm.ADO0457.Open;
end;

procedure TForm_proout.Edt_StartChange(Sender: TObject);
begin
  //彭华修改于2012-8-18，原代码被注释
  with dm.ADO0457 do
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

{if trim(edit1.text)<>'' then
 begin
 if  trim(label1.Caption)='出仓单号' then
  dm.ADO0457.Filter:='GON_NUMBER like ''%'+trim(EDIT1.TEXT)+'%'''
  else if trim(label1.Caption)='物品名称' then
   dm.ADO0457.Filter:='goods_name like ''%'+trim(EDIT1.TEXT)+'%'''
  else if trim(label1.Caption)='物品规格' then
   dm.ADO0457.Filter:='goods_guige like ''%'+trim(EDIT1.TEXT)+'%'''
  else if trim(label1.Caption)='领用部门' then
   dm.ADO0457.Filter:='DEPT_NAME like ''%'+trim(EDIT1.TEXT)+'%'''
  else if trim(label1.Caption)='领用人员' then
   dm.ADO0457.Filter:='EMPLOYEE_NAME like ''%'+trim(EDIT1.TEXT)+'%'''
 else
 dm.ADO0457.Filter:='goods_type like ''%'+trim(EDIT1.TEXT)+'%''' ;
 end
else
 dm.ADO0457.Filter:='';  }
end;

procedure TForm_proout.DBGrid1TitleClick(Column: TColumn);
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
  

end;

procedure TForm_proout.BitBtn3Click(Sender: TObject);
begin
   Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm_proout.FormShow(Sender: TObject);
begin
  if (strtoint(vprev) in [3,4]) then
       begin
            self.DBGrid1.Columns[6].Visible:=true;
            self.DBGrid1.Columns[7].Visible:=true;
            self.DBGrid1.Columns[9].Visible:=true;
            self.DBGrid1.Columns[10].Visible:=true;
            self.DBGrid1.Columns[11].Visible:=true;
            self.DBGrid1.Columns[12].Visible:=true;
       end
  else
       begin
            self.DBGrid1.Columns[6].Visible:=false;
            self.DBGrid1.Columns[7].Visible:=false;
            //self.DBGrid1.Columns[9].Visible:=false;
            self.DBGrid1.Columns[9].Visible:=true;
            self.DBGrid1.Columns[10].Visible:=false;
            self.DBGrid1.Columns[11].Visible:=false;
            self.DBGrid1.Columns[12].Visible:=false;
       end ;


end;

procedure TForm_proout.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO0457.SQL.Text);
end;

procedure TForm_proout.FilterControlSet(FDBGrid:TDBGrid;FColumns:TColumn);
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

procedure TForm_proout.DBGrid1ColEnter(Sender: TObject);
begin
  //彭华添加于2012-8-18，
  with  (Sender as TDBGrid)  do
  begin
    FilterControlSet(Sender as TDBGrid,Columns[SelectedIndex] );
  end;
end;

procedure TForm_proout.Edt_StartKeyPress(Sender: TObject; var Key: Char);
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

procedure TForm_proout.FormActivate(Sender: TObject);
begin
  DBGrid1.SelectedIndex:=1;    //彭华添加于2012-8-18，用于获取过滤条件，会触发 DBGrid1ColEnter  事件。
  DBGrid1.SelectedIndex:=0; 
end;

procedure TForm_proout.EdtDate_StartKeyPress(Sender: TObject;
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

procedure TForm_proout.Edt_EndKeyPress(Sender: TObject; var Key: Char);
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

procedure TForm_proout.cbxSymbolChange(Sender: TObject);
begin
  DBGrid1ColEnter(DBGrid1);
end;

procedure TForm_proout.EdtDate_EndKeyPress(Sender: TObject; var Key: Char);
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

end.
