unit EditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, ComCtrls, Damo, DB;

type
  TFrmEdit = class(TForm)
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    Button4: TButton;
    DBGridEh2: TDBGridEh;
    edt_1: TEdit;
    label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    RadioGroup1: TRadioGroup;
    Edit2: TEdit;
    Memo1: TMemo;
    ComboBox1: TComboBox;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label7: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
    procedure FlagChange();
  public
    { Public declarations }
  end;

var
  FrmEdit: TFrmEdit;

implementation

{$R *.dfm}

//关闭
procedure TFrmEdit.BitBtn1Click(Sender: TObject);
begin
  Self.Close;
end;

//保存
procedure TFrmEdit.BitBtn2Click(Sender: TObject);
var
  i, datadetailRkey: Integer;
begin
  try
    if not DM.qry3.Active then DM.qry3.Open;
    if DBGridEh2.DataSource.DataSet.RecordCount <= 0 then
    begin
      ShowMessage('对不起，请指定您要添加的员工信息！');
      Exit;
    end;
    if Trim(Edit2.Text) = '' then
    begin
      ShowMessage('对不起，绩效分值不能为空！');
      Exit;
    end;    
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select * from dbo.datadetail where item=' + QuotedStr(ComboBox1.Text);
      Open;
      datadetailRkey := FieldValues['rkey'];
    end;
    DM.ADOConnection1.BeginTrans;
    DM.qry3.First;
    for i := 0 to DM.qry3.RecordCount - 1 do
    begin
      with DM.qrytemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := Format('insert into employee_rewards_punishment(employeeid,type,money,flag,effectdate,remark) '
          + ' values (%d, %d, %f, %d, ''%s'', ''%s'')',
          [DM.qry3.FieldByName('rkey').AsInteger, datadetailRkey, StrToFloat(Edit2.Text),
          RadioGroup1.ItemIndex, DateToStr(DateTimePicker1.Date), Memo1.Text]);
        ExecSQL;
      end;
      DM.qry3.Next;
    end;
    DM.ADOConnection1.CommitTrans;
    ShowMessage('恭喜您，此次操作已保存成功！');
  except
    on e: Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      ShowMessage('网络异常...' + e.Message);
    end;
  end;
  Self.Close;
end;

procedure TFrmEdit.FormCreate(Sender: TObject);
begin
  DM.qry2.Close;
  DM.qry2.Open;
  DM.qry3.Close;
  DM.qry3.SQL.Clear;
  DM.qry3.SQL.Text := 'select employeemsg.rkey,employeemsg.employeecode,employeemsg.chinesename, '
    + 'datadepartment.departmentname,datadetail.item,employeemsg.ondutytime '
    + 'from employeemsg '
    + 'inner join dbo.datadepartment on employeemsg.departmentid=datadepartment.rkey '
    + 'inner join datadetail on employeemsg.position=datadetail.rkey '
    + 'where employeemsg.rkey=-1';
  DM.qry3.Open;
end;

procedure TFrmEdit.FlagChange();
var
  i: Integer;
begin
  ComboBox1.Items.Clear;
  if RadioGroup1.ItemIndex = 0 then   //奖励类型明细  dictid=12
  begin
    with DM.qryTemp do
    begin
      Close;
      SQL.clear;
      SQL.text := 'select * from dbo.datadetail where dictid=12';
      Open;
      First;
      for i := 0 to RecordCount - 1 do
      begin
        ComboBox1.Items.Add(FieldValues['item']);
        Next;
      end;
    end;
  end;
  
  if RadioGroup1.ItemIndex = 1 then   //惩罚类型明细  dictid=15
  begin
    with DM.qryTemp do
    begin
      Close;
      SQL.clear;
      SQL.text := 'select * from dbo.datadetail where dictid=15';
      Open;
      First;
      for i := 0 to RecordCount - 1 do
      begin
        ComboBox1.Items.Add(FieldValues['item']);
        Next;
      end;
    end;
  end;
  ComboBox1.ItemIndex := 0;
end;

procedure TFrmEdit.FormShow(Sender: TObject);
begin
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select convert(varchar(100), getdate(), 23) as sysdate';
    Open;
    DateTimePicker1.Date :=  StrToDate(FieldValues['sysdate']);
  end;
  FlagChange();
  DM.qry2.Filter := '';
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  label1.Caption := DBGridEh1.Columns[0].Title.Caption;
end;

procedure TFrmEdit.RadioGroup1Click(Sender: TObject);
begin
  FlagChange();
end;

//单项添加人员
procedure TFrmEdit.Button1Click(Sender: TObject);
var
  i: Integer;
  StrRkey: string;
begin
  if (DBGridEh1.SelectedRows.Count < 1) then
  begin
    ShowMessage('功能正在完善中，目前只支持选中整行时，才能进行添加！');
    Exit;
  end;

  if DBGridEh1.SelectedRows.Count > 0 then
  begin
    Screen.Cursor := crHourGlass;
    for i := 0 to DBGridEh1.SelectedRows.Count - 1 do
    begin
      DM.qry2.GotoBookmark(Pointer(DBGridEh1.SelectedRows.items[i]));
      StrRkey := StrRkey + IntToStr(DM.qry2.FieldValues['rkey']) + ',';
    end;
    StrRkey := Copy(StrRkey, 0, Length(StrRkey) - 1);
    with DM.qry3 do
    begin
      SQL.Text := SQL.Text + ' or employeemsg.rkey in (' + StrRkey + ')';
      Open;
    end;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmEdit.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry2.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry2.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
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

procedure TFrmEdit.edt_1Change(Sender: TObject);
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
end;

procedure TFrmEdit.Button4Click(Sender: TObject);
var
  i: Integer;
  StrRkey: string;
begin
  if (DBGridEh2.SelectedRows.Count < 1) or (DM.qry3.RecordCount = 0) then
  begin
    ShowMessage('功能正在完善中，目前只支持选中整行时，才能进行取消！');
    Exit;
  end;
  Screen.Cursor := crHourGlass;
  for i := 0 to DBGridEh2.SelectedRows.Count - 1 do
  begin
    DM.qry3.GotoBookmark(Pointer(DBGridEh2.SelectedRows.items[i]));
    StrRkey := StrRkey + IntToStr(DM.qry3.FieldValues['rkey']) + ',';
  end;
  StrRkey := Copy(StrRkey, 0, Length(StrRkey) - 1);
  with DM.qry3 do
  begin
    SQL.Text := SQL.Text + ' and employeemsg.rkey not in (' + StrRkey + ')';
    Open;
  end;
  Screen.Cursor := crDefault;
end;

end.
