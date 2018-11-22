unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus, DB, ADODB,
  ComCtrls;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    edt_1: TEdit;
    LabelCount: TLabel;
    dbgrideh2: TDBGridEh;
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edt_1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N2Click(Sender: TObject);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure pgc1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name, PupoFlag :string;
  public
    { Public declarations }
    StartSql: string;
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  common, Damo, EditFrm, FinishFrm, QueFrm;
{$R *.dfm}

procedure TFrmMain.N1Click(Sender: TObject);
var
  i: Integer;
begin
  try
    i := DM.qryMainrkey.Value;
    DM.Ftag := Tmenuitem(Sender).Tag;
    FrmEdit := TFrmEdit.Create(Application);
    if FrmEdit.ShowModal = mrOK then
    begin
      DM.qryMain.Requery();
      if DM.Ftag = 0 then DM.qryMain.Last;
      if DM.Ftag = 1 then DM.qryMain.Locate('rkey', i, []);
    end;
  finally
    FrmEdit.Free;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  if not App_init(DM.ADOConnection1) then
  begin
    common.ShowMsg('程序启动失败,请联系系统管理员',1);
    application.Terminate;
    exit;
  end;
  //user_ptr := '3';
  field_name := DBGridEh2.Columns[0].FieldName;
  PreColumn := DBGridEh2.Columns[0];
  DBGridEh2.Columns[0].Title.Color := clred ;
  Label1.Caption := DBGridEh2.Columns[0].Title.Caption;
  Label1.Left := edt_1.Left - Label1.Width - 5;
  DM.qryMain.Close;
  DM.qryMain.Open;
  DM.qryWZCP89.Close;
  DM.qryWZCP89.Open;
  pgc1.ActivePageIndex := 0;
  StartSql := DM.qryMain.SQL.Text;
  BitBtn4.Enabled := False;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
var
  i: Integer;
begin
  if pgc1.ActivePageIndex = 0 then
  begin
    i := DM.qryWZCP89rkey.Value;
    DM.qryWZCP89.Requery();
    DM.qryWZCP89.Locate('rkey', i, []);
  end;
  if pgc1.ActivePageIndex = 1 then
  begin
    i := DM.qryMainRkey.Value;
    DM.qryMain.Requery();
    DM.qryMain.Locate('rkey', i, []);
  end;

end;

procedure TFrmMain.edt_1Change(Sender: TObject);
begin
  if pgc1.ActivePageIndex = 0 then
  begin
    DBGridEh2.DataSource.DataSet.Filtered := True;
    if DBGridEh2.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
    if DBGridEh2.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger,ftFloat]  then
    begin
      if trim(edt_1.text) <> '' then
        begin
          if DBGridEh2.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
            begin
              DBGridEh2.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
            end
          else
            if DBGridEh2.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
            begin
              DBGridEh2.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
            end;
        end
      else
        DBGridEh2.DataSource.DataSet.Filter:='';
    end;
    LabelCount.Caption := '当前显示记录笔数：' + IntToStr(DM.qryWZCP89.RecordCount);
  end;
  if pgc1.ActivePageIndex = 1 then
  begin
    DBGridEh1.DataSource.DataSet.Filtered := True;
    if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
    if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger,ftFloat]  then
    begin
      if trim(edt_1.text) <> '' then
        begin
          if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString, ftFloat]  then
            begin
              DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
            end
          else
            if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger, ftFloat]  then
            begin
              DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
            end;
        end
      else
        DBGridEh1.DataSource.DataSet.Filter:='';
    end;
    LabelCount.Caption := '当前显示记录笔数：' + IntToStr(DM.qryMain.RecordCount);
  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  LabelCount.Caption := '当前显示记录笔数：' + IntToStr(DM.qryWZCP89.RecordCount);
end;

procedure TFrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.qryMain.SQL.Text);
end;

//结束收货
procedure TFrmMain.N2Click(Sender: TObject);
begin
  if (strtoint(vprev) <> 4) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  try
    FrmFinish := TFrmFinish.Create(Application);
    if FrmFinish.ShowModal = MrOk then
    begin
      DM.qryMain.Requery();
      DM.qryWZCP89.Requery();;
    end;
  finally
    FrmFinish.Free;
  end;
end;

procedure TFrmMain.DBGridEh2GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then
   Background := clMoneyGreen;
end;

procedure TFrmMain.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with (Sender as TDBGridEh) do
  begin
    if ((State=[gdSelected])) then
      Canvas.Brush.Color:=clInactiveCaption;
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
  Canvas.brush.Color := clMoneyGreen;
end;

procedure TFrmMain.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.qryWZCP89.SQL.Text);
end;

procedure TFrmMain.DBGridEh2TitleClick(Column: TColumnEh);
begin
  if DBGridEh2.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qryWZCP89.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qryWZCP89.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh2.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    Label1.Caption := column.Title.Caption ;
    Label1.Left := edt_1.Left - Label1.Width - 5;
    field_name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
end;

procedure TFrmMain.pgc1Change(Sender: TObject);
begin
  if pgc1.ActivePageIndex = 0 then
  begin
    BitBtn4.Enabled := False;
    field_name := DBGridEh2.Columns[0].FieldName;
    PreColumn := DBGridEh2.Columns[0];
    DBGridEh2.Columns[0].Title.Color := clred ;
    Label1.Caption := DBGridEh2.Columns[0].Title.Caption;
    Label1.Left := edt_1.Left - Label1.Width - 5;
    LabelCount.Caption := '当前显示记录笔数：' + IntToStr(DM.qryWZCP89.RecordCount);
  end;
  if pgc1.ActivePageIndex = 1 then
  begin
    BitBtn4.Enabled := True;
    field_name := DBGridEh1.Columns[0].FieldName;
    PreColumn := DBGridEh1.Columns[0];
    DBGridEh1.Columns[0].Title.Color := clred ;
    Label1.Caption := DBGridEh1.Columns[0].Title.Caption;
    Label1.Left := edt_1.Left - Label1.Width - 5;
    LabelCount.Caption := '当前显示记录笔数：' + IntToStr(DM.qryMain.RecordCount);
  end;
end;

procedure TFrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qryMain.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qryMain.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    Label1.Caption := column.Title.Caption ;
    Label1.Left := edt_1.Left - Label1.Width - 5;
    field_name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
end;

procedure TFrmMain.PopupMenu1Popup(Sender: TObject);
begin
  if DM.qryMain.RecordCount <= 0 then
  begin
    N1.Enabled := False;
    N2.Enabled := False;
  end;
end;

procedure TFrmMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with (Sender as TDBGridEh) do
  begin
    if ((State=[gdSelected])) then
      Canvas.Brush.Color:=clInactiveCaption;
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
  Canvas.brush.Color := clMoneyGreen;
end;

procedure TFrmMain.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then
   Background := clMoneyGreen;
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
begin
  if pgc1.ActivePageIndex = 0 then
    common.Export_dbGridEH_to_Excel(dbgrideh2, '验收信息');
  if pgc1.ActivePageIndex = 1 then
    common.Export_dbGridEH_to_Excel(DBGridEh1, '待验收单概览');
end;

procedure TFrmMain.BitBtn4Click(Sender: TObject);
var
  i: Integer;
begin
  try
    FrmQue := TFrmQue.Create(Application);
    if FrmQue.ShowModal = MrOk then
    begin
      with DM.qryMain do
      begin
        close;
        SQL.Text := self.StartSql + #13;
        for i := 1 to FrmQue.SGrid1.RowCount - 2 do SQL.Text := SQL.Text + FrmQue.SGrid1.Cells[2,i] + #13;
        SQL.Text := SQL.Text + ' and WZCP0088.Ent_Date >= '
          + QuotedStr(DateToStr(FrmQue.DateTimePicker1.Date)+ ' 00:00:00')
          + ' and WZCP0088.Ent_Date <= ' + QuotedStr(DateToStr(FrmQue.DateTimePicker2.Date) + ' 23:59:59')
          + ' order by WZCP0088.Ent_Date desc';
        ShowMessage(SQL.Text);
        open;
      end;
    end;
  finally
    FrmQue.Free;
  end;
end;

end.
