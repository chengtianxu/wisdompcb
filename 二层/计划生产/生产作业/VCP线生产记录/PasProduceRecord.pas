unit PasProduceRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, ComCtrls, Menus,
  DB, ADODB,DateUtils;

type
  TFrmProduceRecord = class(TForm)
    Panel5: TPanel;
    Label9: TLabel;
    Label20: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    Popup1: TPopupMenu;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    strSQLTxt:string;
    StartDate,EndDate:TDatetime;
    PreColumn: TColumnEh;
    field_name:string;
    iTt:Integer;
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  FrmProduceRecord: TFrmProduceRecord;

implementation

uses common,myclass,Pick_Item_Single,PasDM,ConstVar, PasNewPdRecord,
  PasPublic, PasPropertyType, PasQuery;

{$R *.dfm}
procedure TFrmProduceRecord.item_click(sender: TObject);
var i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
    begin
      for i := 0 to DBGridEh1.FieldCount - 1 do
      if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
      begin
        DBGridEh1.Columns[i].Visible := true ;
        break ;
      end ;
    end
  else
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := false ;
      break ;
    end ;
  end ;
end;

procedure TFrmProduceRecord.FormShow(Sender: TObject);
var i:Integer;
    item:TMenuItem;
begin
  strSQLTxt:='';
  iTt:=0;
  DateTimePicker1.Date:=Now-1;
  DateTimePicker2.Date:=Now;
  strSQLTxt:=dm.Ado181.SQL.Text;
  dm.Ado181.Close;
  DM.Ado181.SQL.Text:=strSQLTxt+' where dbo.data0181.create_date>='''+formatdatetime('yyyy-mm-dd ',DateTimePicker1.Date)+'08:00:00'+
                           ''' and dbo.data0181.create_date<='''+formatdatetime('yyyy-mm-dd ',DateTimePicker2.Date)+'08:00:00'+''' ';
//  DM.Ado181.Parameters.ParamByName('D1').Value:=DateTimePicker1.Date +' 00:00:00';
//  DM.Ado181.Parameters.ParamByName('D2').Value:=DateTimePicker2.Date+1;
  dm.Ado181.Open;

  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;

  for i := 1 to DBGridEh1.Columns.Count do
  begin
   item := TmenuItem.Create(self) ;
   item.Caption := DBGridEh1.Columns[i - 1].Title.Caption ;
   if DBGridEh1.Columns[i - 1].Visible then
    item.Checked := true ;
   item.OnClick := item_click ;
   self.Popup1.Items.Add(item) ;
  end;
  StartDate:=Now-1;
  EndDate:=Now;
end;

procedure TFrmProduceRecord.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>2) and (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  with TFrmNewPdRecord.Create(nil) do
  begin
    if showmodal=mrok then
    begin
      if (not DM.Ado181.Eof) then
      begin
        dm.Ado181.Close;
        dm.Ado181.Open;
        dm.Ado181.Sort:=DBGridEh1.Columns[0].FieldName;
      end;
    end;
    Free;
  end;
end;

procedure TFrmProduceRecord.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmProduceRecord.FormCreate(Sender: TObject);
begin
  if not App_Init(DM.ADOConnection) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;

// rkey73:='851';
// user_ptr := '963';
// vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TFrmProduceRecord.BitBtn4Click(Sender: TObject);
begin
  Popup1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrmProduceRecord.BitBtn2Click(Sender: TObject);
begin
  IF DBGridEh1.DataSource.DataSet.Active THEN
    IF DBGridEh1.DataSource.DataSet.RecordCount > 0 THEN
        Export_dbGridEH_to_Excel(DBGridEh1,self.Caption) ;
end;

procedure TFrmProduceRecord.BitBtn3Click(Sender: TObject);
var rkey:integer;
begin
  if (not DM.Ado181.IsEmpty) then
  begin
    rkey:=dm.Ado181Rkey.Value;
    if (iTt=0) then
    begin
      dm.Ado181.Close;
      DM.Ado181.SQL.Clear;
      DM.Ado181.SQL.Text:=strSQLTxt+' where dbo.data0181.create_date>='''+formatdatetime('yyyy-mm-dd ',DateTimePicker1.Date)+'08:00:00'+
                               ''' and dbo.data0181.create_date<='''+formatdatetime('yyyy-mm-dd ',DateTimePicker2.Date)+formatdatetime('hh:mm:ss',DateTimePicker2.DateTime)+''' ';
      dm.Ado181.Open;
    end else
    begin
    dm.Ado181.Close;
    DM.Ado181.SQL.Clear;
//    dm.Ado181.SQL.Text:=strSQLTxt;
    DM.Ado181.SQL.Text:=strSQLTxt+' where dbo.data0181.create_date>='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker1.Date)+formatdatetime('hh:mm:ss',FrmQuery.dtt1.DateTime)+
                           ''' and dbo.data0181.create_date<='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker2.Date)+formatdatetime('hh:mm:ss',FrmQuery.dtt2.DateTime)+''' ';
    dm.Ado181.Open;
    end;
    dm.Ado181.Locate('Rkey',rkey,[]);
  end;
end;

procedure TFrmProduceRecord.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with  (Sender as TDBGridEh)do
  begin
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
  Canvas.brush.Color := clMoneyGreen;
end;

procedure TFrmProduceRecord.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then
   Background := clMoneyGreen;
end;

procedure TFrmProduceRecord.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    showmessage(dm.Ado181.SQL.Text);
end;

procedure TFrmProduceRecord.BitBtn6Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  with TFrmPropertyType.Create(nil) do
  begin
    if showmodal=mrok then
    begin
    end;
    Free;
  end;
end;

procedure TFrmProduceRecord.N3Click(Sender: TObject);
begin
  if (strtoint(vprev)<>2) and (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (DM.Ado181d05_Ptr.AsString<>user_ptr) then
  begin
    messagedlg('对不起,不能删除他人操作！',mtinformation,[mbok],0);
    Exit;
  end;
  if (not DM.Ado181.IsEmpty) then
  begin
    if (Application.MessageBox('确定删除操作？', '操作提示', MB_OKCANCEL + MB_ICONINFORMATION) = IDCANCEL) then Exit;
    DeleteRecordOver('Data0181',DM.Ado181Rkey.Text,DM.ADOConnection,'','','Rkey','','');
    if (iTt=0) then
    begin
      dm.Ado181.Close;
      DM.Ado181.SQL.Text:=strSQLTxt+' where dbo.data0181.create_date>='''+formatdatetime('yyyy-mm-dd ',DateTimePicker1.Date)+'08:00:00'+
                               ''' and dbo.data0181.create_date<='''+formatdatetime('yyyy-mm-dd ',DateTimePicker2.Date)+formatdatetime('hh:mm:ss',DateTimePicker2.DateTime)+''' ';
      dm.Ado181.Open;
    end else
    begin
      BitBtn3Click(nil);
    end;
  end;
end;

procedure TFrmProduceRecord.BitBtn1Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  FrmQuery.Caption:='VCP线生产记录查询';
  iTt:=1;
  FrmQuery.listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['产线类别','本厂编号','生产工序','班别','工厂']);
  v_Field_List_EN := VarArrayOf(['dbo.data0198.sName','dbo.data0025.MANU_PART_NUMBER','dbo.data0034.DEPT_CODE','dbo.data0181.sClass','dbo.data0015.WAREHOUSE_CODE']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    FrmQuery.listbox3.Items.Add(v_Field_List_CN[i]);
  FrmQuery.sgrid1.Cells[0,0]:='条件名';
  FrmQuery.sgrid1.Cells[1,0]:='条件值';
  if (FrmQuery.iIndex=0) then
    FrmQuery.ListBox3.ItemIndex := 0
  else FrmQuery.ListBox3.ItemIndex := FrmQuery.iIndex;
  FrmQuery.Button3.Enabled:=True;
  if StartDate <> DateTimePicker1.Date then
    FrmQuery.DateTimePicker1.Date:= StartDate
  else
    FrmQuery.DateTimePicker1.Date:=Now-1;
  if EndDate <> DateTimePicker2.Date then
    FrmQuery.DateTimePicker2.Date:= IncDay(EndDate,1)
  else
    FrmQuery.DateTimePicker2.Date:=IncDay(Now,1);

  if FrmQuery.ShowModal=mrok then
  begin
    sSql:=strSQLTxt;
    for i:=1 to FrmQuery.sgrid1.RowCount-2 do
      if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    StartDate:=FrmQuery.DateTimePicker1.Date;
    EndDate:=FrmQuery.DateTimePicker2.Date;

    DM.Ado181.SQL.Text:=sSql+' where dbo.data0181.create_date>='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker1.Date)+formatdatetime('hh:mm:ss',FrmQuery.dtt1.DateTime)+
                           ''' and dbo.data0181.create_date<='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker2.Date)+formatdatetime('hh:mm:ss',FrmQuery.dtt2.DateTime)+''' '+Sqlstr+'';
    if StartDate <> DateTimePicker1.Date then
      DateTimePicker1.Date:= StartDate;
    if EndDate <> DateTimePicker2.Date then
      DateTimePicker2.Date:= EndDate;
    DM.Ado181.Close;
    DM.Ado181.Open;
  end;
end;

procedure TFrmProduceRecord.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.Ado181.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.Ado181.Sort:=Column.FieldName+' DESC';
  end;
  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
  then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TFrmProduceRecord.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.Ado181.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
  else
    DM.Ado181.Filter:='';
end;

end.
