unit PasStepDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB, Menus;

type
  TfrmStepDate = class(TForm)
    Panel1: TPanel;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    edtName: TEdit;
    Label2: TLabel;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    BitBtn3: TBitBtn;
    labName: TLabel;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label3: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit2: TEdit;
    Label4: TLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
    procedure item_click(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmStepDate: TfrmStepDate;

implementation
uses common,Pick_Item_Single,ConstVar, PasDM, PasSetLevel;
{$R *.dfm}
procedure TfrmStepDate.item_click(Sender: TObject);
var
  i:byte;
begin
  (Sender as TmenuItem).Checked := not ((Sender as TmenuItem).Checked);
  if (Sender as TmenuItem).Checked then
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := True ;
      Break;
    end ;
  end
  else
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := False ;
      Break;
    end ;
  end ;
end;

procedure TfrmStepDate.BitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmStepDate.BitBtn3Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'DEPT_CODE/工序代码/160,DEPT_NAME/工序名称/250';
    InputVar.Sqlstr :='select Rkey,DEPT_CODE,DEPT_NAME from dbo.data0034 where TType=1 order by DEPT_CODE';
    inputvar.KeyField:='DEPT_CODE';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtName.Text:=frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE'];
      labName.Caption:=frmPick_Item_Single.adsPick.FieldValues['DEPT_NAME'];
      edtName.Tag:=frmPick_Item_Single.adsPick.FieldValues['Rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmStepDate.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9','.',#8,#13]) then Key:=#0;
end;

procedure TfrmStepDate.BitBtn2Click(Sender: TObject);
begin
  if (Trim(Edit1.Text)='') then
  begin
    ShowMsg('时长不能为空！',1);
    Exit;
  end;
  if (Trim(edtName.Text)='') then
  begin
    ShowMsg('工序代码不能为空！',1);
    Exit;
  end;
  DM.tmp.Close;
  DM.tmp.SQL.Clear;
  DM.tmp.SQL.Text:='select * from data0586 where RKey34='+inttostr(edtName.Tag)+' and TType='+inttostr(integer(combobox1.items.objects[combobox1.itemindex]));
  DM.tmp.open;
  if not dm.tmp.IsEmpty then
  begin
    if (MessageBox(Handle,'该工序时长已设置,'+#13+'确定重新设置吗?','重新设置提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
    DM.tmp.Close;
    DM.tmp.SQL.Clear;
    DM.tmp.SQL.Text:='update data0586 set DataValues='+edit1.Text+' where RKey34='+inttostr(edtName.Tag)+' and TType='+inttostr(integer(combobox1.items.objects[combobox1.itemindex]));
    DM.tmp.ExecSQL;
  end else
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Clear;
    DM.tmp.SQL.Text:='Insert into data0586 (RKey34,DataValues,TType) Values (:RKey34,:DataValues,:TType)';
    DM.tmp.Parameters.ParamByName('RKey34').Value:=edtName.Tag;
    DM.tmp.Parameters.ParamByName('DataValues').Value:=StrToFloat(Edit1.Text);
    dm.tmp.Parameters.ParamByName('TType').Value:=integer(combobox1.items.objects[combobox1.itemindex]);
    DM.tmp.ExecSQL;
  end;
  DM.Ado586.Close;
  DM.Ado586.Open;
end;

procedure TfrmStepDate.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (not dm.Ado586.IsEmpty) then
  begin
    try
      DM.tmp.Close;
      DM.tmp.SQL.Clear;
      DM.tmp.SQL.Text:='delete data0586 where Rkey34='+dm.Ado586Rkey.asstring;
      DM.tmp.ExecSQL;
      DM.Ado586.Close;
      DM.Ado586.Open;
    finally
    end;
  end;
end;

procedure TfrmStepDate.FormShow(Sender: TObject);
begin
  DM.Ado586.Close;
  DM.Ado586.Open;
  dm.tmp.Close;
  dm.tmp.SQL.Text:='select * from data0283';
  dm.tmp.Open;
  ComboBox1.Items.Clear;
  if not DM.tmp.IsEmpty then
  begin
    while not dm.tmp.Eof do
    begin
      ComboBox1.Items.AddObject(dm.tmp.fieldBYName('PRIORITY_name').AsString,Pointer(dm.tmp.fieldBYName('PRIORITY_CODE').AsInteger));
      dm.tmp.Next;
    end;
  end;
  ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(dm.tmp.fieldBYName('PRIORITY_name').AsString);
  ComboBox1.ItemIndex:=0;
  
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
end;

procedure TfrmStepDate.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in shift) and  (chr(key)='S') then
    showmessage(DM.Ado586.SQL.Text);
end;

procedure TfrmStepDate.BitBtn1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  frmSetLevel:=TfrmSetLevel.Create(application);
  try
    if frmSetLevel.ShowModal=mrok then
    begin
      dm.tmp.Close;
      dm.tmp.SQL.Text:='select * from data0283';
      dm.tmp.Open;
      ComboBox1.Items.Clear;
      if not DM.tmp.IsEmpty then
      begin
        while not dm.tmp.Eof do
        begin
          ComboBox1.Items.AddObject(dm.tmp.fieldBYName('PRIORITY_name').AsString,Pointer(dm.tmp.fieldBYName('PRIORITY_CODE').AsInteger));
          dm.tmp.Next;
        end;
      end;
      ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(dm.tmp.fieldBYName('PRIORITY_name').AsString);
      ComboBox1.ItemIndex:=0;
    end;
  finally
    frmSetLevel.Free;
  end;
end;

procedure TfrmStepDate.BitBtn4Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgrideh1,self.Caption);
end;

procedure TfrmStepDate.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.Ado586.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.Ado586.Sort:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
      then
  begin
    Label4.Caption:=column.Title.Caption;
    Edit2.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else Edit2.SetFocus;
end;

procedure TfrmStepDate.Edit2Change(Sender: TObject);
begin
  if Trim(Edit2.Text)<>'' then
    DM.Ado586.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit2.Text)+'%'''
  else
    DM.Ado586.Filter:='';
end;

end.
