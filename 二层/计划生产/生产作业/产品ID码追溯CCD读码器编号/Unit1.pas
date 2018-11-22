unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel5: TPanel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DataSource1: TDataSource;
    N4: TMenuItem;
    PopupMenu2: TPopupMenu;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Sqlstr:string;
    PreColumn: TColumnEh;
    field_name:string;
    { Private declarations }
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses PasDM,common,myclass,ConstVar, PasEditCCD, PasQuery;

{$R *.dfm}
procedure TForm1.item_click(sender: TObject);
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

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,self.Caption) ;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  PopupMenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.Ado1410.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.Ado1410.Sort:=Column.FieldName+' DESC';
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

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.Ado1410.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
  else
    DM.Ado1410.Filter:='';
end;

procedure TForm1.FormShow(Sender: TObject);
var i:Integer;
    item:TMenuItem;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  DM.strSQLTxt:=DM.Ado1410.SQL.Text;
  DM.StartDate:=getsystem_date(DM.tmp,1)-1;
  DM.EndDate:=getsystem_date(DM.tmp,1);
  dm.Ado1410.Close;
  DM.Ado1410.SQL.Text:=dm.strSQLTxt+' where Y1410.install>='''+formatdatetime('yyyy-mm-dd ',DM.StartDate)+
                           ''' and Y1410.install<='''+formatdatetime('yyyy-mm-dd ',DM.EndDate)+''' order by Y1410.Rkey desc';
  dm.Ado1410.Open;
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

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1) then
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

procedure TForm1.N1Click(Sender: TObject);
var rkey:integer;
begin
  if Form2=nil then  Form2:=TForm2.Create(Application);
  Form2.Ftp:=0;//0新增
  if Form2.ShowModal=mrok then
  begin
      if (not DM.Ado1410.IsEmpty) then
      begin
        rkey:=dm.Ado1410Rkey.Value;
      end;
      dm.Ado1410.Close;
      DM.Ado1410.SQL.Text:=dm.strSQLTxt+' where Y1410.install>='''+formatdatetime('yyyy-mm-dd ',DM.StartDate)+
                           ''' and Y1410.install<='''+formatdatetime('yyyy-mm-dd ',DM.EndDate)+''' order by Y1410.Rkey desc';
      dm.Ado1410.Open;
      if (not DM.Ado1410.IsEmpty) then dm.Ado1410.Locate('Rkey',rkey,[]);
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
var iRkey:Integer;
begin
  if (not DM.Ado1410.IsEmpty) then
  begin
    if Form2=nil then  Form2:=TForm2.Create(Application);
    Form2.Ftp:=1;//1编辑
    iRkey:=DM.Ado1410rkey.Value;
    if Form2.ShowModal=mrok then
    begin
      dm.Ado1410.Close;
      DM.Ado1410.SQL.Text:=dm.strSQLTxt+' where Y1410.install>='''+formatdatetime('yyyy-mm-dd ',DM.StartDate)+
                           ''' and Y1410.install<='''+formatdatetime('yyyy-mm-dd ',DM.EndDate)+''' order by Y1410.Rkey desc';
      dm.Ado1410.Open;
    end;
    dm.Ado1410.Locate('Rkey',iRkey,[]);
  end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  if (not DM.Ado1410.IsEmpty) then
  begin
    if (Application.MessageBox('确定删除操作？', '操作提示', MB_OKCANCEL + MB_ICONINFORMATION) = IDCANCEL) then Exit;
    dm.tmp.Close;
    dm.tmp.SQL.Clear;
    dm.tmp.SQL.Text:='delete from Y1410 where Rkey='+inttostr(dm.Ado1410rkey.AsInteger);
    dm.tmp.ExecSQL;
    DM.Ado1410.Close;
    DM.Ado1410.SQL.Text:=dm.strSQLTxt+' where Y1410.install>='''+formatdatetime('yyyy-mm-dd ',DM.StartDate)+
                         ''' and Y1410.install<='''+formatdatetime('yyyy-mm-dd ',DM.EndDate)+''' order by Y1410.Rkey desc';
    dm.Ado1410.Open;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i,j,iNo:integer;
    strText,sTemp:string;
begin
  if DM.StartDate > 100 then
    FrmQuery.DateTimePicker3.Date:= DM.StartDate
  else
    FrmQuery.DateTimePicker3.Date:=getsystem_date(DM.tmp,1)-1;
  if DM.EndDate > 100 then
    FrmQuery.DateTimePicker5.Date:= DM.EndDate
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
      DM.StartDate:=FrmQuery.DateTimePicker3.Date;
      DM.EndDate:=FrmQuery.DateTimePicker5.Date;
      DM.Ado1410.DisableControls;
      DM.Ado1410.Close;
      DM.Ado1410.SQL.Clear;
      DM.Ado1410.SQL.Text:=dm.strSQLTxt+' where 1=1 '+Sqlstr+' and Y1410.install>='''+formatdatetime('yyyy-mm-dd ',DM.StartDate)+
                         ''' and Y1410.install<='''+formatdatetime('yyyy-mm-dd ',DM.EndDate)+''' order by Y1410.Rkey desc';
      DM.Ado1410.Prepared;
      DM.Ado1410.Open;
    finally
      DM.Ado1410.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Chr(Key)='V') and (ssalt in Shift) then
    ShowMessage(DM.ado1410.sql.Text);
end;

end.
