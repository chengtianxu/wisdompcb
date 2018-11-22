unit PasGetPPShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus,DateUtils;

type
  TForm2 = class(TForm)
    Panel5: TPanel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    Sqlstr:string;
    strSQLTxt:string;
    StartDate,EndDate:TDatetime;
    PreColumn: TColumnEh;
    field_name:string;
    { Private declarations }
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses PasDM,common,myclass,ConstVar, PPget, PPgetLoss, PasQuery;

{$R *.dfm}
procedure TForm2.item_click(sender: TObject);
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

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,self.Caption) ;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
  PopupMenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm2.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.Ado734.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.Ado734.Sort:=Column.FieldName+' DESC';
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

procedure TForm2.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.Ado734.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
  else
    DM.Ado734.Filter:='';
end;

procedure TForm2.FormShow(Sender: TObject);
var i:Integer;
    item:TMenuItem;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  strSQLTxt:=DM.Ado734.SQL.Text;
  StartDate:=getsystem_date(DM.tmp,1)-1;
  EndDate:=getsystem_date(DM.tmp,1);
  dm.Ado734.Close;
  DM.Ado734.SQL.Text:=strSQLTxt+' where dbo.DATA0734.create_date>='''+formatdatetime('yyyy-mm-dd ',StartDate)+formatdatetime(' hh:nn:ss',FrmQuery.DateTimePicker4.Time)+
                           ''' and dbo.DATA0734.create_date<='''+formatdatetime('yyyy-mm-dd ',EndDate)+formatdatetime(' hh:nn:ss',FrmQuery.DateTimePicker6.Time)+''' order by dbo.DATA0734.Rkey desc';
  dm.Ado734.Open;
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
   PopupMenu2.Items.Add(item) ;
  end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)<>2) and (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  with TfrmPPget.Create(nil) do
  begin
    if showmodal=mrok then
    begin
    
    end;
    Free;
  end;
  dm.Ado734.Close;
  DM.Ado734.SQL.Text:=strSQLTxt+' where dbo.DATA0734.create_date>='''+formatdatetime('yyyy-mm-dd ',StartDate)+formatdatetime(' hh:nn:ss',FrmQuery.DateTimePicker4.Time)+
                           ''' and dbo.DATA0734.create_date<='''+formatdatetime('yyyy-mm-dd ',EndDate)+formatdatetime(' hh:nn:ss',FrmQuery.DateTimePicker6.Time)+''' order by dbo.DATA0734.Rkey desc';
  dm.Ado734.Open;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;

// rkey73:='851';
// user_ptr := '1752';
// vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm2.N3Click(Sender: TObject);
var igz:Integer;
begin
  if (strtoint(vprev)<>2) and (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (DM.Ado734create_ptr.AsString<>user_ptr) then
  begin
    messagedlg('对不起,不能删除他人操作！',mtinformation,[mbok],0);
    Exit;
  end;
  if (not DM.Ado734.IsEmpty) then
  begin

    if (Application.MessageBox('确定删除操作？', '操作提示', MB_OKCANCEL + MB_ICONINFORMATION) = IDCANCEL) then Exit;
//删除734记录必须还原修改的732，731或733的记录-----------------------
    igz:=0;
    if (dm.Ado734ttype.AsString='正常领料') then
    begin
      DM.tmp.Close;
      dm.tmp.SQL.Clear;
      dm.tmp.SQL.Text:='select * from dbo.data0731 where matrece_flag=1 and Rkey='+dm.Ado734rkey731.AsString;
      DM.tmp.Open;
      if (not dm.tmp.IsEmpty) then
      begin
        DM.tmp.Close;
        dm.tmp.SQL.Clear;
        dm.tmp.SQL.Text:='update dbo.data0731 set matrece_flag=0 where Rkey='+dm.Ado734rkey731.AsString;
        DM.tmp.ExecSQL;
      end;
      DM.tmp.Close;
      dm.tmp.SQL.Clear;
      dm.tmp.SQL.Text:='update dbo.data0732 set matrece_flag=0 where Rkey='+dm.Ado734rkey732.AsString;
      DM.tmp.ExecSQL;
      dm.tmp.Close;
      dm.tmp.SQL.Clear;
      dm.tmp.SQL.Text:='select * from dbo.data0733 where Rkey='+dm.Ado734rkey733.AsString;
      dm.tmp.Open;
      if (not dm.tmp.IsEmpty) then
      begin
        igz:=DM.tmp.FieldBYName('pick_material_qty').AsInteger;
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        dm.tmp.SQL.Text:='update dbo.data0733  set pick_material_qty='+inttostr(igz-dm.Ado734pick_mater_qty.AsInteger)+' where Rkey='+dm.Ado734rkey733.AsString;
        dm.tmp.ExecSQL;
      end;
    end else
    if (dm.Ado734ttype.AsString='损耗领料') then
    begin
      dm.tmp.Close;
      dm.tmp.SQL.Clear;
      dm.tmp.SQL.Text:='select * from dbo.data0733 where Rkey='+dm.Ado734rkey733.AsString;
      dm.tmp.Open;
      if (not dm.tmp.IsEmpty) then
      begin
        igz:=DM.tmp.FieldBYName('pick_material_qty_e').AsInteger;
        dm.tmp.Close;
        dm.tmp.SQL.Clear;
        dm.tmp.SQL.Text:='update dbo.data0733  set pick_material_qty_e='+inttostr(igz-dm.Ado734pick_mater_qty.AsInteger)+' where Rkey='+dm.Ado734rkey733.AsString;
        dm.tmp.ExecSQL;
      end;
    end;
//end删除734---------------------------------------------------------
    DM.tmp.Close;
    dm.tmp.SQL.Clear;
    dm.tmp.SQL.Text:='delete data0734 where Rkey='+DM.Ado734Rkey.Text;
    DM.tmp.ExecSQL;
    dm.Ado734.Close;
    DM.Ado734.SQL.Text:=strSQLTxt+' where dbo.DATA0734.create_date>='''+formatdatetime('yyyy-mm-dd ',StartDate)+formatdatetime(' hh:nn:ss',FrmQuery.DateTimePicker4.Time)+
                           ''' and dbo.DATA0734.create_date<='''+formatdatetime('yyyy-mm-dd ',EndDate)+formatdatetime(' hh:nn:ss',FrmQuery.DateTimePicker6.Time)+''' order by dbo.DATA0734.Rkey desc';
    dm.Ado734.Open;
  end;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
  if (strtoint(vprev)<>2) and (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  with TfrmgetLoss.Create(nil) do
  begin
    if showmodal=mrok then
    begin

    end;
    Free;
  end;
  dm.Ado734.Close;
  DM.Ado734.SQL.Text:=strSQLTxt+' where dbo.DATA0734.create_date>='''+formatdatetime('yyyy-mm-dd ',StartDate)+formatdatetime(' hh:nn:ss',FrmQuery.DateTimePicker4.Time)+
                           ''' and dbo.DATA0734.create_date<='''+formatdatetime('yyyy-mm-dd ',EndDate)+formatdatetime(' hh:nn:ss',FrmQuery.DateTimePicker6.Time)+''' order by dbo.DATA0734.Rkey desc';
  dm.Ado734.Open;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var i,j,iNo:integer;
    strText,sTemp:string;
begin
  if StartDate > 100 then
    FrmQuery.DateTimePicker3.Date:= StartDate
  else
    FrmQuery.DateTimePicker3.Date:=getsystem_date(DM.tmp,1)-1;
  if EndDate > 100 then
    FrmQuery.DateTimePicker5.Date:= EndDate
  else
    FrmQuery.DateTimePicker5.Date:=getsystem_date(DM.tmp,1);
  FrmQuery.ListBox3.ItemIndex := FrmQuery.iItem;
  Sqlstr:='';
  if FrmQuery.ShowModal=mrok then
  begin
    screen.Cursor:=crHourGlass;
    iNo:=0;
    for i:=1 to FrmQuery.SGrid1.RowCount-2 do
    if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    try
      DM.Ado734.DisableControls;
      DM.Ado734.Close;
      DM.Ado734.SQL.Clear;
      DM.Ado734.SQL.Text:=strSQLTxt+' where 1=1 '+Sqlstr+' and dbo.DATA0734.create_date>='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+formatdatetime(' hh:nn:ss',FrmQuery.DateTimePicker4.Time)+
                           ''' and dbo.DATA0734.create_date<='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date)+formatdatetime(' hh:nn:ss',FrmQuery.DateTimePicker6.Time)+''' order by dbo.DATA0734.Rkey desc';
      StartDate:=FrmQuery.DateTimePicker3.Date;
      EndDate:=FrmQuery.DateTimePicker5.Date;
      DM.Ado734.Prepared;
      DM.Ado734.Open;
    finally
      DM.Ado734.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;

end.
