unit PasClerkTiCH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DBGrids, Menus,Excel2000, ComObj,
  ComCtrls;

type
  TfrmClerkTiCH = class(TForm)
    PopupMenu2: TPopupMenu;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BitBtn7: TBitBtn;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure item_click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    Sqlstr:string;
    strSQLTxt:string;
    StartDate,EndDate:TDatetime;
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  frmClerkTiCH: TfrmClerkTiCH;

implementation

uses common,PasSetClerk, PasDM, PasQuery;

{$R *.dfm}
procedure TfrmClerkTiCH.item_click(Sender: TObject);
var
  i:byte;
begin
  (Sender as TmenuItem).Checked := not ((Sender as TmenuItem).Checked);
  if (Sender as TmenuItem).Checked then
  begin
    for i := 0 to DBGrid1.FieldCount - 1 do
    if DBGrid1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGrid1.Columns[i].Visible := True ;
      Break;
    end ;
  end
  else
  begin
    for i := 0 to DBGrid1.FieldCount - 1 do
    if DBGrid1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGrid1.Columns[i].Visible := False ;
      Break;
    end ;
  end ;
end;

procedure TfrmClerkTiCH.BitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmClerkTiCH.BitBtn6Click(Sender: TObject);
begin
//  if (strtoint(vprev)<>4)  then
//  begin
//    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
//    Exit;
//  end;
  frmSetClerk:=TfrmSetClerk.Create(application);
  frmSetClerk.ShowModal;
  frmSetClerk.Free;
end;

procedure TfrmClerkTiCH.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  field_name:='REFERENCE_NO';
  Sqlstr:='';
  strSQLTxt:=dm.AqD114.CommandText;
  StartDate:=getsystem_date(DM.tmp,0)-6;
  EndDate:=getsystem_date(DM.tmp,0);
  FrmQuery.DateTimePicker3.Date:=StartDate;
  FrmQuery.DateTimePicker5.Date:=EndDate;
  dm.AqD114.Close;
  dm.AqD114.Parameters.ParamByName('dtpk1').Value:=StartDate;;
  dm.AqD114.Parameters.ParamByName('dtpk2').Value:=EndDate;
  dm.aqd114.Prepared;
  dm.AqD114.Open;
    for i:=1 to DBGrid1.Columns.Count do
    begin
      item := TmenuItem.Create(self);
      item.Caption := DBGrid1.Columns[i-1].Title.Caption ;
      if DBGrid1.Columns[i-1].Visible then
        item.Checked := true ;
      item.OnClick := item_click ;
      PopupMenu2.Items.Add(item) ;
    end;
end;

procedure TfrmClerkTiCH.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dm.AqD114.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
  else
    dm.AqD114.filter := '';
end;

procedure TfrmClerkTiCH.DBGrid1TitleClick(Column: TColumn);
var
  i:byte;
begin
  if (column.FieldName<>dm.AqD114.IndexFieldNames) then
    dm.AqD114.IndexFieldNames:=column.FieldName;
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

procedure TfrmClerkTiCH.BitBtn2Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(DBGrid1,Self.Caption);
end;

procedure TfrmClerkTiCH.BitBtn4Click(Sender: TObject);
begin
  PopupMenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmClerkTiCH.BitBtn1Click(Sender: TObject);
var i:integer;
begin
  if StartDate > 100 then
    FrmQuery.DateTimePicker3.Date:= StartDate
  else
    FrmQuery.DateTimePicker3.Date:=getsystem_date(DM.tmp,1)-6;
  if EndDate > 100 then
    FrmQuery.DateTimePicker5.Date:= EndDate
  else
    FrmQuery.DateTimePicker5.Date:=getsystem_date(DM.tmp,1);
  FrmQuery.ListBox3.ItemIndex := FrmQuery.iItem;
  Sqlstr:='';
  if FrmQuery.ShowModal=mrok then
  begin
    screen.Cursor:=crHourGlass;
    for i:=1 to FrmQuery.SGrid1.RowCount-2 do
    if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    try
      StartDate:=FrmQuery.DateTimePicker3.Date;
      EndDate:=FrmQuery.DateTimePicker5.Date;
      BitBtn3Click(nil);
    finally
//      DM.Ado360.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;

procedure TfrmClerkTiCH.BitBtn3Click(Sender: TObject);
begin
  dm.AqD114.Close;
  dm.AqD114.CommandText:=strSQLTxt+' '+Sqlstr;
  dm.AqD114.Parameters.ParamByName('dtpk1').Value:=StartDate;
  dm.AqD114.Parameters.ParamByName('dtpk2').Value:=EndDate;
  dm.aqd114.Prepared;
  dm.AqD114.Open;
end;

procedure TfrmClerkTiCH.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    showmessage(dm.AqD114.CommandText);
end;

procedure TfrmClerkTiCH.FormCreate(Sender: TObject);
begin
  if not App_init_2(DM.ADOConnection1) then
  begin
    showmsg('程序启动失败,请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;

// rkey73:='2525';
// user_ptr := '2998';
// vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

end.
