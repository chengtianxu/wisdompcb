unit received_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls,ComObj,
  Excel2000,ClipBrd, Menus, DBGridEh;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1DELIVER_NUMBER: TStringField;
    ADOQuery1SHIP_NAME: TStringField;
    ADOQuery1SHIP_DATE: TDateTimeField;
    ADOQuery1epiboly_number: TStringField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1STANDARD: TStringField;
    ADOQuery1AREA_SQM: TBCDField;
    ADOQuery1AREA_SQF: TBCDField;
    ADOQuery1LAYER: TWordField;
    ADOQuery1THINK: TBCDField;
    ADOQuery1MIN_aperture: TBCDField;
    ADOQuery1REQ_DATE: TDateTimeField;
    ADOQuery1rece_quantity: TIntegerField;
    ADOQuery1REMARK: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1QUANTITY: TIntegerField;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    ADOQuery1price: TBCDField;
    ADOQuery1pattern_money: TBCDField;
    ADOQuery1MIN_MONEY: TBCDField;
    ADOQuery1ENG_MONEY: TBCDField;
    ADOQuery1TOTAL_MONEY: TBCDField;
    ADOQuery1v_status: TStringField;
    Button3: TButton;
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
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    Edit2: TEdit;
    Label2: TLabel;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1reject_qty: TIntegerField;
    ADOQuery1RETURN_QTY: TIntegerField;
    N18: TMenuItem;
    N28: TMenuItem;
    DBGrid1: TDBGridEh;
    StatusBar1: TStatusBar;
    PopupMenu2: TPopupMenu;
    N29: TMenuItem;
    Button2: TButton;
    N30: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure dtpk1Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    function sum_total():string;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N29Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
  private
    { Private declarations }
   field_name:string;
//   procedure SetGridColumns;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses data_module, main, common, ColsDisplaySet_unt;

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
  dtpk1.Date:=form1.dtpk1.Date;
  dtpk2.Date:=form1.DTPk2.Date;
  self.ADOQuery1.Close;
  self.ADOQuery1.Parameters[0].Value:=dtpk1.Date;
  self.ADOQuery1.Parameters[1].Value:=dtpk2.Date;
  self.ADOQuery1.Open;
  edit2.Text:=self.sum_total;
  //field_name:='DELIVER_NUMBER';
  
end;

procedure TForm3.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 begin
  adoquery1.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%''';
  edit2.Text:=self.sum_total;
 end
else
 begin
  adoquery1.Filter:='';
  edit2.Text:=self.sum_total;
 end;
end;

procedure TForm3.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;  
 end
else
 edit1.SetFocus;
end;

function TForm3.sum_total: string;
var
 total:double;
begin
 total:=0;
 self.ADOQuery1.DisableControls;
 self.ADOQuery1.First;
 while not self.ADOQuery1.Eof do
  begin
   total:=total+self.ADOQuery1TOTAL_MONEY.Value;
   self.ADOQuery1.Next;
  end;
 self.ADOQuery1.First;
 self.ADOQuery1.EnableControls;
 sum_total:=formatfloat('#0.000',total);
end;

procedure TForm3.dtpk1Exit(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    self.ADOQuery1.Close;
    self.ADOQuery1.Parameters[0].Value:=dtpk1.Date;
    self.ADOQuery1.Parameters[1].Value:=dtpk2.Date;
    self.ADOQuery1.Open;
    edit2.Text:=self.sum_total;
  finally    
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
begin
    Screen.Cursor := crHourglass;
    DBGrid1.DataSource.DataSet.DisableControls;
    bm := DBGrid1.DataSource.DataSet.GetBookmark;
    DBGrid1.DataSource.DataSet.First;

    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrid1.FieldCount-1 do
      sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
     begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
        sline := sline + DBGrid1.Fields[col].AsString + #9;
      mem.Add(sline);
      DBGrid1.DataSource.DataSet.Next;
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
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
end;

procedure TForm3.N1Click(Sender: TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  show_ColsDisplaySet_frm(self,DBGrid1,StrToInt(rkey73));
  //ResetColumns(Self,DM.ADOConnection1,DM.cds0849,DBGrid1,StrToInt(rkey73));
// popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

//procedure TForm3.SetGridColumns;
//var
//  GridCount,i,ColID,ExecRkey:Integer;//
//  StrFilter:string;
//begin
//  with DM.ADOQuery1 do
//  begin
//    Close;
//    SQL.Clear ;
//    SQL.Text:='select * from data0419 where programe='+QuotedStr(Extractfilename(application.exename));
//    Open;
//    ExecRkey:=FieldByName('rkey').Value;
//  end ;
//  for GridCount:=0 to Self.ComponentCount-1 do
//  if  Self.Components[GridCount] is TDBGridEh then
//  with (Self.Components[GridCount] as TDBGridEh) do
//  begin
////    ShowMessage((Self.Components[GridCount] as TDBGridEh).Name);
//    if DM.cds0849.Active=False then
//    begin
//      DM.cds0849.Params.ParamByName('vPrograme').Value:=Extractfilename(application.exename);
//      DM.cds0849.Params.ParamByName('vD073_ptr').Value:=rkey73;
//      DM.cds0849.Open;
//    end;
//    DM.cds0849.Filtered:=False ;                         //用窗口名和表格名对数据进行过滤
//    StrFilter:='FormName='+QuotedStr(Self.Name)
//              +' and GridName=' +QuotedStr((Self.Components[GridCount] as TDBGridEh).Name);
//    DM.cds0849.Filter:= StrFilter;
//    DM.cds0849.Filtered:=True;
//
//    DM.cds0849.First;
//    while not DM.cds0849.Eof do     // 遍历cds0849 ，查找是否有表格中不存的列，不存在删除。
//    begin
//      for i:=0 to Columns.Count-1  do
//      begin
//        if UpperCase(Trim(Columns[i].FieldName))=UpperCase(Trim(DM.cds0849.FieldByName('FieldName').AsString))then
//          begin
//            Break  ;
//          end
//        else                                         //如果没有找到
//          begin
//            if i=Columns.Count-1 then   //已经是最后一列
//            begin
//             // ShowMessage('Delete:'+DM.cds0849.FieldByName('FieldName').AsString);
//              DM.cds0849.Delete   ;
//            end;
//          end;
//      end;
//      DM.cds0849.Next;
//    end;
//   // DM.cds0849.ApplyUpdates(0);
//
//    for i:=0 to Columns.Count-1  do            //如果表格中的列在 DM.cds0849中不存在，添加
//    if Columns[i].FieldName<>''then
//    begin
//      DM.cds0849.Filtered:=False;               //然后和data0849表中记录的列名进行过滤
//      DM.cds0849.Filter:=StrFilter+' and FieldName='+ QuotedStr(Columns[i].FieldName);
//      DM.cds0849.Filtered:=True;
//      if  DM.cds0849.IsEmpty then               //如果在data0849表记录中不存在，添加
//      begin
//        DM.cds0849.Append;
//        DM.cds0849.FieldByName('D419_ptr')    .Value:=ExecRkey;
//        DM.cds0849.FieldByName('D073_ptr')    .Value:=rkey73;
//        DM.cds0849.FieldByName('FormName')    .Value:=Self.Name;
//        DM.cds0849.FieldByName('GridName')    .Value:=Name;
//        DM.cds0849.FieldByName('FieldName')   .Value:=Columns[i].Field.FieldName;
//        DM.cds0849.FieldByName('FieldCaption').Value:=Columns[i].Field.DisplayLabel;
//        DM.cds0849.FieldByName('FieldOrder')  .Value:=i;
//        DM.cds0849.FieldByName('FieldWidth')  .Value:=Columns[i].Width;
//        //ShowMessage('insert:'+Columns[i].Field.FieldName+' '+Columns[i].Field.DisplayLabel);
//        if Columns[i].Visible then
//          DM.cds0849.FieldByName('IsDisplay').Value:=True
//        else
//          DM.cds0849.FieldByName('IsDisplay').Value:=False;
//        DM.cds0849.Post;
//      end;
//    end;
//
//    ColID:=0;
//    DM.cds0849.Filtered:=False ;
//    DM.cds0849.Filter:= StrFilter;
//    DM.cds0849.Filtered:=True;
//    while not DM.cds0849.Eof do   //根据 cds0849表中的记录，重新定义表格
//    begin
//      for i:=0 to Columns.Count-1 do
//      if UpperCase(Columns[i].FieldName)=UpperCase(DM.cds0849.FieldByName('FieldName').AsString)then
//      begin
//        begin
//          Columns[i].Width:= DM.cds0849.FieldByName('FieldWidth').AsInteger;
//          if DM.cds0849.FieldByName('IsDisplay').AsBoolean then
//            Columns[i].Visible:=True
//          else
//            Columns[i].Visible:=False;
//          Columns[i].Index:=ColID; //DM.cds0849.FieldByName('FieldOrder').AsInteger;
//          ColID:=ColID+1;
//          {   //如果使用下面的方法，会造成不显示的列排在最后。在字段设置窗口的列错位
//          Columns[i].Width:= DM.cds0849.FieldByName('FieldWidth').AsInteger;   
//          if DM.cds0849.FieldByName('IsDisplay').AsBoolean then
//            begin
//            Columns[i].Visible:=True ;
//            Columns[i].Index:=ColID; //DM.cds0849.FieldByName('FieldOrder').AsInteger;
//            ColID:=ColID+1;
//            end
//          else
//            Columns[i].Visible:=False;   }
//        end;
//        Break;
//      end;
//      DM.cds0849.Next;
//    end;
//  end;
//  DM.cds0849.Filtered:=False;
//end;

procedure TForm3.DBGridEh1TitleClick(Column: TColumnEh);
var
 i:byte;
begin
  with Column.Grid.DataSource.DataSet as TCustomADODataSet do
  begin
    if FieldByName(Column.FieldName).FieldKind in[ fkCalculated,fkLookup]  then
      exit ;
    if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
    begin
      column.Title.SortMarker:=smUpEh;
      Sort:=Column.FieldName;
    end
    else
    begin
      column.Title.SortMarker:=smDownEh;
      Sort:=Column.FieldName+' DESC';
    end;
  end;

  //if (column.ReadOnly) and (field_name<>column.FieldName) then
  if Column.Field.DataType in[ftString] then
  begin
    label1.Caption:=column.Title.Caption;
    self.field_name:=column.FieldName;
    edit1.SetFocus;
    for i:=0 to dbgrid1.FieldCount-1 do
    if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
    column.Title.Color:=clred;
  end
  else
    edit1.SetFocus;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  SetLength(FieldsCanNotSee_Info,1);
  FieldsCanNotSee_Info[0]:=TFieldsCanNotSeeInfo.Create();
  FieldsCanNotSee_Info[0].F_GridName:=DBGrid1;
  FieldsCanNotSee_Info[0].F_Fields:=varArrayOf(['price','TOTAL_MONEY']);

  DBGridEh1TitleClick(DBGrid1.FieldColumns['DELIVER_NUMBER']);
  ResetGridColumns(self,DM.ADOConnection1,StrToInt(rkey73),StrToInt(vprev)=2);
end;

procedure TForm3.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  with   DataSet do
  StatusBar1.Panels[0].Text:=
  '当前记录行:'+IntToStr(RecNo)+'/总记录数:'+ IntToStr(RecordCount);
end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)  ;
  end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveColsInfo(Self, StrToInt(rkey73));
end;

procedure TForm3.N29Click(Sender: TObject);
begin
  SetFrozenField(Self,DBGrid1,DBGrid1.SelectedField.FieldName,StrToInt(rkey73));
end;

procedure TForm3.N30Click(Sender: TObject);
begin
  CancelFrozenField(Self,DBGrid1,StrToInt(rkey73));
end;

end.
