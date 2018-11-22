unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus, DB, ADODB;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Label1: TLabel;
    edt_1: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N6: TMenuItem;
    LabelCount: TLabel;
    btn1: TBitBtn;
    pm2: TPopupMenu;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    chk4: TCheckBox;
    N8: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name, PupoFlag :string;
    procedure item_click(sender:TObject);
  public
    { Public declarations }
    StartSql: string;
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  common, Damo, EditFrm, QueFrm;
{$R *.dfm}

procedure TFrmMain.N1Click(Sender: TObject);
var
  i: Integer;
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  if Tmenuitem(Sender).Tag = 1 then  //修改
  begin
    if DM.qryMainEnt_UserRkey.AsString <> user_ptr then
    begin
      ShowMessage('当前记录非本人录入，无法进行修改...');
      Exit;
    end;
  end;
  try
    i := DM.qryMainrkey.Value;
    DM.Ftag := Tmenuitem(Sender).Tag;
    FrmEdit := TFrmEdit.Create(Application);
    if FrmEdit.ShowModal = mrOK then
    begin
      DM.qryMain.Requery();
      if DM.Ftag = 0 then DM.qryMain.Last;
      if DM.Ftag = 1 then DM.qryMain.Locate('rkey', i, []);
      LabelCount.Caption := '当前显示记录笔数：' + IntToStr(DM.qryMain.RecordCount);
    end;
  finally
    FrmEdit.Free;
  end;
end;

procedure TFrmMain.item_click(sender: TObject);
var
  i:byte;
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

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  if not App_init(DM.ADOConnection1) then
  begin
    common.ShowMsg('程序启动失败,请联系系统管理员',1);
    application.Terminate;
    exit;
  end;
  self.StartSql := DM.qryMain.SQL.Text;
end;

procedure TFrmMain.N4Click(Sender: TObject);
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  if Tmenuitem(Sender).Tag = 3 then  //删除
  begin
    if DM.qryMainEnt_UserRkey.AsString <> user_ptr then
    begin
      ShowMessage('当前记录非本人录入，无法进行删除...');
      Exit;
    end;
  end;
  if MessageBox(Handle,'确定删除此记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  DM.qryWZCP0088.Close;
  DM.qryWZCP0088.Parameters.ParamByName('Rkey88').Value := DM.qryMainrkey.Value;
  DM.qryWZCP0088.Open;
  DM.qryWZCP0088.Delete;
  DM.qryMain.Requery();
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
var
  i: Integer;
begin
  i := DM.qryMainrkey.Value;
  DM.qryMain.Requery();
  DM.qryMain.Locate('rkey', i, []);
  LabelCount.Caption := '当前显示记录笔数：' + IntToStr(DM.qryMain.RecordCount);
end;

procedure TFrmMain.N5Click(Sender: TObject);
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  if (DM.qryMainEnt_UserRkey.AsString <> user_ptr) then
  begin
    if MessageBox(Handle,'当前记录非本人录入，此次操作造成的后果请自负，确定要执行当前操作吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  end;
  DM.qryWZCP0088.Close;
  DM.qryWZCP0088.Parameters.ParamByName('Rkey88').Value := DM.qryMainrkey.Value;
  DM.qryWZCP0088.Open;
  DM.qryWZCP0088.Edit;
  DM.qryWZCP0088Status.Value := TMenuItem(Sender).Tag;
  if TMenuItem(Sender).Tag = 0 then DM.intgrfldWZCP0088CommitUserRkey.AsVariant := null;
  if TMenuItem(Sender).Tag = 1 then DM.intgrfldWZCP0088CommitUserRkey.Value := strtoint(user_ptr);
  DM.qryWZCP0088.Post;
  BitBtn2.OnClick(BitBtn2);
end;

procedure TFrmMain.PopupMenu1Popup(Sender: TObject);
begin
  N3.Enabled := True;
  if DM.qryMainStatus.Value = 0 then
  begin
    N2.Enabled := True;
    N4.Enabled := True;
    N5.Enabled := True;
    N6.Enabled := False;
    N7.Enabled := False;
    N8.Enabled := False;
  end;
  if DM.qryMainStatus.Value = 1 then
  begin
    N2.Enabled := False;
    N4.Enabled := False;
    N5.Enabled := False;
    N6.Enabled := True;
    N7.Enabled := True;
    N8.Enabled := False;
  end;
  if DM.qryMainStatus.Value = 2 then
  begin
    N2.Enabled := False;
    N4.Enabled := False;
    N5.Enabled := False;
    N6.Enabled := False;
    N7.Enabled := False;
    N8.Enabled := True;
  end;
  if DM.qryMainStatus.Value = 3 then
  begin
    N2.Enabled := False;
    N4.Enabled := False;
    N5.Enabled := False;
    N6.Enabled := False;
    N7.Enabled := False;
    N8.Enabled := False;
  end;
  if DM.qryMain.RecordCount = 0 then
  begin
    N2.Enabled := False;
    N3.Enabled := False;
    N4.Enabled := False;
    N5.Enabled := False;
    N6.Enabled := False;
    N7.Enabled := False;
    N8.Enabled := False;
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
    label1.Caption := column.Title.Caption ;
    label1.Left := edt_1.Left - label1.Width - 5;
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

procedure TFrmMain.edt_1Change(Sender: TObject);
begin
  DBGridEh1.DataSource.DataSet.Filtered := True;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_1.text) <> '' then
      begin
        if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
          end
        else
          if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
          end;
      end
    else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
  LabelCount.Caption := '当前显示记录笔数：' + IntToStr(DM.qryMain.RecordCount);
end;

procedure TFrmMain.btn1Click(Sender: TObject);
begin
  pm2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  i: Integer;
  item: TMenuItem;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  label1.Caption := DBGridEh1.Columns[0].Title.Caption;
  label1.Left := edt_1.Left - label1.Width - 5;
  DM.qryMain.Close;
  DM.qryMain.SQL.Text := self.StartSql +' and WZCP0088.Ent_Date >= '
    + QuotedStr(DateToStr(FrmQue.DateTimePicker1.date)+ ' 00:00:00')
    + ' and WZCP0088.Ent_Date <= '
    + QuotedStr(DateToStr(FrmQue.DateTimePicker2.date)+ ' 23:59:59')
    + ' order by WZCP0088.Ent_Date';
  DM.qryMain.Open;
  if DM.ADOConnection1.Connected then
  begin
    DBGridEh1TitleClick(PreColumn);
    for i:=1 to DBGridEh1.Columns.Count do
    begin
      item := TmenuItem.Create(self) ;
      item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;
      if DBGridEh1.Columns[i-1].Visible then item.Checked := true ;

      item.OnClick := item_click ;
      pm2.Items.Add(item) ;
    end;
  end;
  LabelCount.Caption := '当前显示记录笔数：' + IntToStr(DM.qryMain.RecordCount);
end;

procedure TFrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.qryMain.SQL.Text);
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(DBGridEh1, '外发申请单');
end;

procedure TFrmMain.N7Click(Sender: TObject);
begin
  if (strtoint(vprev) <> 4) then
  begin
    messagedlg('对不起! 您没有写银权限，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  DM.qryWZCP0088.Close;
  DM.qryWZCP0088.Parameters.ParamByName('Rkey88').Value := DM.qryMainrkey.Value;
  DM.qryWZCP0088.Open;
  DM.qryWZCP0088.Edit;
  DM.qryWZCP0088Status.Value := 2;
  DM.qryWZCP0088Author.Value := StrToInt(user_ptr);
  DM.qryWZCP0088Author_Date.Value := Now;
  DM.qryWZCP0088.Post;
  BitBtn2.OnClick(BitBtn2);
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
        open;
      end;
    end;
  finally
    FrmQue.Free;
  end;
end;

procedure TFrmMain.chk1Click(Sender: TObject);
var
  FilterStr: string;
  i: Integer;
begin
  FilterStr := '';
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TCheckBox) and TCheckBox(Components[i]).Checked = True then
    begin
      FilterStr := FilterStr + 'or (status =' + IntToStr(TCheckBox(Components[i]).tag) + ')'
    end;
  end;
  FilterStr := Copy(FilterStr, 3, Length(FilterStr));
  DM.qryMain.Filter := FilterStr;
  DM.qryMain.Filtered := True;
  LabelCount.Caption := '当前显示记录笔数: ' + IntToStr(DM.qryMain.RecordCount);
end;

procedure TFrmMain.N8Click(Sender: TObject);
begin
  if (strtoint(vprev) <> 4) then
  begin
    messagedlg('对不起! 您没有写银权限，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  if (DM.qryMainAuthor.AsString <> user_ptr) then
  begin
    if MessageBox(Handle,'当前记录非本人审核，确定要取消审核吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  end;
  DM.qryWZCP0088.Close;
  DM.qryWZCP0088.Parameters.ParamByName('Rkey88').Value := DM.qryMainrkey.Value;
  DM.qryWZCP0088.Open;
  DM.qryWZCP0088.Edit;
  DM.qryWZCP0088Status.Value := 1;
  if TMenuItem(Sender).Tag = 0 then
  begin
    DM.qryWZCP0088Author_Date.AsVariant := null;
    DM.qryWZCP0088Author.AsVariant := null;
  end;

  if TMenuItem(Sender).Tag = 1 then DM.qryWZCP0088Author.Value := strtoint(user_ptr);
  DM.qryWZCP0088.Post;
  BitBtn2.OnClick(BitBtn2);
end;

end.


