unit EditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGridEh, ExtCtrls, damo,
  choiseFrm2, TrainFrm, DetailFrm, common, DateUtils, Menus;

type
  TFrmEdit = class(TForm)
    ComboBox2: TComboBox;
    Label3: TLabel;
    lb_5: TLabel;
    edt_5: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label6: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label7: TLabel;
    BitBtn7: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox3: TComboBox;
    SpeedButton2: TSpeedButton;
    lbldataField: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label8: TLabel;
    Memo1: TMemo;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel2: TPanel;
    StringGrid1: TStringGrid;
    BitBtn3: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    procedure getItemname(Sender: TObject);
    procedure  DeleteRow(Row:   Integer);
  public
    { Public declarations }
  end;

var
  FrmEdit: TFrmEdit;

implementation

{$R *.dfm}

procedure Tfrmedit.getItemname(Sender: TObject);
var
  i: Integer;
begin
  BitBtn8.Click;
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select distinct itemname, datafield from dbo.DesignSalaryItem inner join salaryaccount  '
      + 'on DesignSalaryItem.accountid=salaryaccount.rkey where datasourcetype=2 '
      + 'and accountName = ' + QuotedStr(ComboBox3.Text)
      + 'order by datafield';
    Open;
    ComboBox2.Items.Clear;
    First;
    for i := 0 to RecordCount - 1 do
    begin
      ComboBox2.Items.Add(FieldValues['itemname']);
      Next;
    end;
    ComboBox2.ItemIndex := 0;
    ComboBox2.Style := csDropDownList;
  end;
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select rkey, datafield from DesignSalaryItem where itemname =' + QuotedStr(ComboBox2.Text);
    Open;
    lbldataField.Caption := FieldValues['datafield'];
    DM.ItemField := lbldataField.Caption;
  end;
end;

procedure TFrmEdit.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select *, convert(varchar(100), getdate(), 23) as sysdate from salaryaccount';
    Open;
    First;
    for i := 0 to RecordCount - 1 do
    begin
      ComboBox3.Items.Add(FieldValues['AccountName']);
      Next;
    end;
    ComboBox3.ItemIndex := 0;
    ComboBox3.Style := csDropDownList;
    Edit2.Text := DM.qrytemp.FieldValues['sysdate'];
    DateTimePicker1.Date := StrToDate(DM.qrytemp.FieldValues['sysdate']);
  end;
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select employee_name from data0005 inner join data0073 on  data0005.rkey=data0073.employee_ptr '
      + ' where data0005.rkey =' + user_ptr;
    Open;
    edt_5.Text := FieldValues['employee_name'];
  end;
  getItemname(Sender);

  StringGrid1.Cells[0,0] := '工号';
  StringGrid1.Cells[1,0] := '姓名';
  StringGrid1.Cells[2,0] := '部门';
  StringGrid1.Cells[3,0] := '职务';
  StringGrid1.Cells[4,0] := '关联培训';
  StringGrid1.Cells[5,0] := '现金额';
  StringGrid1.Cells[6,0] := '培训编号';
  StringGrid1.Cells[7,0] := '调薪原因';
  StringGrid1.ColWidths[8] := 0;                                                //员工rkey
  StringGrid1.ColWidths[9] := 0;
  StringGrid1.ColWidths[10] := 0;
  StringGrid1.Cells[11,0] := '培训验证结果';

end;

procedure TFrmEdit.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if ACol=0 then
  begin
      SpeedButton2.Visible := CanSelect;
      if not CanSelect then Exit;
      SpeedButton2.Parent := StringGrid1;
      R := StringGrid1.CellRect(ACol, ARow);
      SpeedButton2.BoundsRect := R;
      SpeedButton2.Width := SpeedButton2.Height;
      SpeedButton2.Left  := R.Right - SpeedButton2.Width;
  end
  else
  begin
    SpeedButton2.Visible := False;
  end;
  if ACol=6 then
  begin
      SpeedButton3.Visible := CanSelect;
      if not CanSelect then Exit;
      SpeedButton3.Parent := StringGrid1;
      R := StringGrid1.CellRect(ACol, ARow);
      SpeedButton3.BoundsRect := R;
      SpeedButton3.Width := SpeedButton3.Height;
      SpeedButton3.Left  := R.Right - SpeedButton3.Width;
  end
  else
  begin
    SpeedButton3.Visible := False;
  end;
  if ACol=7 then
  begin
      SpeedButton4.Visible := CanSelect;
      if not CanSelect then Exit;
      SpeedButton4.Parent := StringGrid1;
      R := StringGrid1.CellRect(ACol, ARow);
      SpeedButton4.BoundsRect := R;
      SpeedButton4.Width := SpeedButton4.Height;
      SpeedButton4.Left  := R.Right - SpeedButton4.Width;
  end
  else
  begin
    SpeedButton4.Visible := False;
  end;
end;

procedure TFrmEdit.SpeedButton2Click(Sender: TObject);
var
  i: Integer;
begin
  try
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select rkey from salaryaccount where accountName = ' + QuotedStr(ComboBox3.Text);
      Open;
      DM.AccountRkey := FieldValues['rkey'];
    end;
    frmchoise2 := Tfrmchoise2.Create(Application);
    if frmchoise2.ShowModal = mrok then
    begin
      StringGrid1.Cells[0, StringGrid1.Row] := DM.qrychosieEmp.FieldValues['employeecode'];
      StringGrid1.Cells[1, StringGrid1.Row] := DM.qrychosieEmp.FieldValues['chinesename'];
      StringGrid1.Cells[2, StringGrid1.Row] := DM.qrychosieEmp.FieldValues['departmentname'];
      if not DM.qrychosieEmp.FieldByName('item').IsNull then
      StringGrid1.Cells[3, StringGrid1.Row] := DM.qrychosieEmp.FieldValues['item'];
      if not DM.qrychosieEmp.FieldByName('train_flag').IsNull then
      StringGrid1.Cells[4, StringGrid1.Row] := DM.qrychosieEmp.FieldValues['train_flag'];
      StringGrid1.Cells[5, StringGrid1.Row] := DM.qrychosieEmp.FieldValues[DM.ItemField];
      StringGrid1.Cells[8, StringGrid1.Row] := DM.qrychosieEmp.FieldValues['rkey'];           //员工rkey
      for i := 2 to StringGrid1.RowCount - 1 do
      begin
        if StringGrid1.Cells[0,StringGrid1.Row] = StringGrid1.Cells[0, i-1] then
        begin
          ShowMessage('不能重复添加人员！');
          StringGrid1.Cells[0,StringGrid1.Row] := '';
          StringGrid1.Cells[1,StringGrid1.Row] := '';
          StringGrid1.Cells[2,StringGrid1.Row] := '';
          StringGrid1.Cells[3,StringGrid1.Row] := '';
          StringGrid1.Cells[4, StringGrid1.Row] := '';
          StringGrid1.Cells[5, StringGrid1.Row] := '';
          StringGrid1.Cells[7, StringGrid1.Row] := '';
          StringGrid1.Cells[8, StringGrid1.Row] := '';
          StringGrid1.Cells[9, StringGrid1.Row] := '';
          StringGrid1.Cells[10, StringGrid1.Row] := '';
          StringGrid1.Cells[11, StringGrid1.Row] := '';
          Exit;
        end;
      end;
    end;
  finally
    frmchoise2.Free;
  end;
end;

procedure TFrmEdit.ComboBox3Change(Sender: TObject);
begin
  getItemname(Sender);
end;

procedure TFrmEdit.BitBtn8Click(Sender: TObject);
var
 i:byte;
begin
  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    StringGrid1.Rows[i].Clear;
  end;
  StringGrid1.RowCount:=2;
end;

//保存
procedure TFrmEdit.BitBtn1Click(Sender: TObject);
var
  i,  employee_train_flag, employee_train_ptr, alter_reason: Integer;
begin
  if Trim(Edit1.Text) = '' then
  begin
    ShowMessage('调整后金额不能为空！');
    Exit;
    Edit1.SetFocus();
  end;
  
  if (Trim(stringgrid1.Cells[0, stringgrid1.row]) = '') then
  begin
    ShowMessage('员工信息不能为空！');
    Exit;
  end;

  for i := 0 to StringGrid1.RowCount - 1 do
  begin
    if StringGrid1.Cells[11, i] = '' then
    begin
      ShowMessage('请进行所有行的培训验证后再保存！');
      Exit;
    end;
  end;

  if MessageDlg('保存时只保存验证通过的记录，您确定要保存吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    for i := 1 to stringgrid1.RowCount - 1 do
    begin
      employee_train_ptr := 0;
      alter_reason := 0;
      if (StringGrid1.Cells[0, i] <> '') and (StringGrid1.Cells[11, i] = '验证通过！') then
      begin
        if StringGrid1.Cells[9, i] <> '' then
        begin
          employee_train_ptr := StrToInt(StringGrid1.Cells[9, i]);
          employee_train_flag := 1;
        end
        else
        begin
          employee_train_flag := 0;
        end;
        if StringGrid1.Cells[10, i] <> '' then alter_reason := StrToInt(StringGrid1.Cells[10, i]);
        dm.qryTrainTemp.Parameters[0].Value := 0;
        DM.qryTrainTemp.Open;
        DM.qryTrainTemp.Append;
        DM.qryTrainTemp.FieldByName('employeeid').AsString := stringgrid1.Cells[8,i];
        DM.qryTrainTemp.FieldByName('itemname').AsString := combobox2.text;
        DM.qryTrainTemp.FieldByName('datafield').AsString := lbldataField.Caption;
        DM.qryTrainTemp.FieldByName('originaldata').AsString := stringgrid1.Cells[5,i];
        DM.qryTrainTemp.FieldByName('newdata').AsString := Edit1.Text;
        DM.qryTrainTemp.FieldByName('operator').AsString := user_ptr;
        DM.qryTrainTemp.FieldByName('effect_date').AsString := IntToStr(YearOf(DateTimePicker1.Date)) + '-' + IntToStr(MonthOf(DateTimePicker1.Date)) + '-01';
        DM.qryTrainTemp.FieldByName('accountid').AsInteger := DM.AccountRkey;
        DM.qryTrainTemp.FieldByName('remark').AsString := Memo1.Text;
        if employee_train_ptr > 0 then
          DM.qryTrainTemp.FieldByName('employee_train_ptr').Value := employee_train_ptr;
        DM.qryTrainTemp.FieldByName('employee_train_flag').Value := employee_train_flag;
        if alter_reason > 0 then
          DM.qryTrainTemp.FieldByName('alter_reason').Value := alter_reason;
        DM.qryTrainTemp.Post;
        with DM.qrytemp do
        begin
          if StringGrid1.Cells[9, i] <> '' then
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'update Employee_Train set ptr_flag=1 where rkey=' + IntToStr(employee_train_ptr);
            ExecSQL;
          end;
        end;
      end;
    end;
    DM.qrySalaryJL.Close;
    DM.qrySalaryJL.Open;
    if label11.Caption <> '0' then
    begin
      if MessageDlg('当前记录已保存成功，是否继续？', mtInformation, [mbYes, mbNo], 1) = mrno then close
      else BitBtn8.Click;
    end
    else
    begin
      ShowMessage('验证通过记录笔数为0，保存失败！');
    end;
  end;
end;

procedure TFrmEdit.ComboBox2Change(Sender: TObject);
var
  i: Integer;
begin
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select rkey, datafield from DesignSalaryItem where itemname =' + QuotedStr(ComboBox2.Text);
    Open;
    lbldataField.Caption := FieldValues['datafield'];
    DM.ItemField := lbldataField.Caption;
  end;
  for i := 1  to StringGrid1.RowCount - 1 do
  begin
    if StringGrid1.Cells[0, i] <> '' then
    begin
      with DM.qrytemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select Employeebasicsalary.'
          + DM.ItemField
          + ' from Employeebasicsalary where employeeid =' + StringGrid1.Cells[8, i];
        Open;
        StringGrid1.Cells[5, i] := FieldValues[DM.ItemField];
      end;
    end;
  end;
  if lbldataField.Caption <> 'F2' then
  begin
    for i := 1  to StringGrid1.RowCount - 1 do
    begin
      StringGrid1.Cells[6, i] := '';
      StringGrid1.Cells[9, i] := '';
    end;
  end;
end;

procedure TFrmEdit.BitBtn7Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEdit.BitBtn2Click(Sender: TObject);
var
  i, j: Integer;
  DateTimeNow: TDate;
begin
  if StringGrid1.Cells[0,1] = '' then
  begin
    ShowMessage('当前无记录，请添加记录后再做验证！');
    Label11.Caption := '0';
    Label12.Caption := '0';
    Exit;
  end;
  if Trim(Edit1.Text) = '' then
  begin
    ShowMessage('调后金额为空，无法进行验证！');
    Edit1.SetFocus();
    Exit;
  end;
  DateTimeNow := StrToDate(IntToStr(YearOf(DateTimePicker1.Date)) + '-' + IntToStr(MonthOf(DateTimePicker1.Date)) + '-01');
  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select max(effect_date) as effect_date from basicsalary_Alteration where employeeid = ' + StringGrid1.Cells[8, i]
        + ' and datafield = ' + QuotedStr(lbldataField.Caption);
      Open;
      if (not IsEmpty) and (FieldByName('effect_date').Value >= DateTimeNow)  then
      begin
        ShowMessage('工号:' +  StringGrid1.Cells[0,i]
          + ', 姓名: ' + StringGrid1.Cells[1,i]
          + ', 薪资科目: ' + ComboBox2.Text + #13
          + '最新生效日期: ' + FieldByName('effect_date').asstring + #13
          + '当前生效日期: ' + datetostr(DateTimeNow) + #13
          + '最新生效日期大于当前生效日期，请检查');
        StringGrid1.Cells[11, i] := '失败:当前调薪科目最新生效日期大于当前生效日期!';
        Exit;
      end;
    end;
  end;
  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    if Trim(StringGrid1.Cells[9, i]) = '' then
    begin
      if (Trim(StringGrid1.Cells[4, i]) = 'True' )
        and (StrToFloat(Edit1.Text) > StrToFloat(Trim(StringGrid1.Cells[5, i])))
        and (Trim(lbldataField.Caption) = 'F2') and (StrToFloat(Trim(StringGrid1.Cells[5, i])) <> 0) then
      begin
        StringGrid1.Cells[11, i] := '失败:当前调薪科目F2,职务关联培训,且调薪金额大于当前金额!';
      end
      else
      begin
        StringGrid1.Cells[11, i] := '验证通过！';
        j := j + 1;
      end;
    end
    else
    begin
      StringGrid1.Cells[11, i] := '验证通过！';
      j := j + 1;
    end;
  end;
  Label11.Caption := IntToStr(j) ;
  label12.Caption := IntToStr(StringGrid1.RowCount - j - 1);
end;

procedure  TFrmEdit.DeleteRow(Row: Integer);
var
  i: integer;
begin
  if (Row < StringGrid1.RowCount) and (Row > StringGrid1.FixedRows - 1) then
  begin
    if Row < StringGrid1.RowCount - 1 then
    begin
      for i := Row to StringGrid1.RowCount - 1 do
      begin
        StringGrid1.Rows[i] := StringGrid1.Rows[i + 1];
      end;
    end
    else StringGrid1.Rows[Row].Clear;
    StringGrid1.RowCount := StringGrid1.RowCount - 1;
    if  StringGrid1.RowCount = 1 then
    begin

      StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.FixedRows := 1 ;
    end;
  end;
end;

procedure TFrmEdit.N1Click(Sender: TObject);
var
  Sel: TGridRect;
  i: Integer;
begin
  Sel := StringGrid1.Selection;
  DeleteRow(Sel.Top);
end;

procedure TFrmEdit.SpeedButton3Click(Sender: TObject);
begin
  if StringGrid1.Cells[0, StringGrid1.Row] = '' then
  begin
    ShowMessage('请先选择人员！');
    Exit;
  end;
  if lbldataField.Caption <> 'F2' then
  begin
    ShowMessage('当前调薪科目不为综合工资，无法选择培训编号！');
    Exit;
  end;
  FrmTrain := TFrmTrain.Create(Application);
  if FrmTrain.ShowModal = mrok then
  begin
    StringGrid1.Cells[6, StringGrid1.Row] := DM.qryTrain.FieldValues['Train_No'];
    StringGrid1.Cells[9, StringGrid1.Row] := DM.qryTrain.FieldValues['Rkey'];
  end;
  FrmTrain.Free;
end;

procedure TFrmEdit.SpeedButton4Click(Sender: TObject);
begin
  if StringGrid1.Cells[0, StringGrid1.Row] = '' then
  begin
    ShowMessage('请先选择人员！');
    Exit;
  end;
  FrmDetail := TFrmDetail.Create(Application);
  if FrmDetail.ShowModal = mrok then
  begin
    StringGrid1.Cells[7, StringGrid1.Row] := DM.qryDetail.FieldValues['Item'];
    StringGrid1.Cells[10, StringGrid1.Row] := DM.qryDetail.FieldValues['Rkey'];
  end;
  FrmDetail.Free;
end;

procedure TFrmEdit.BitBtn3Click(Sender: TObject);
begin
  if StringGrid1.Cells[0,StringGrid1.RowCount-1] <> '' then
  StringGrid1.RowCount := StringGrid1.RowCount + 1;
end;

procedure TFrmEdit.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  If (Length(StringGrid1.Cells[ACol, ARow]) > 10) and (ACol = 11) and (ARow > 0)then
  Begin
      StringGrid1.Canvas.Brush.Color := clRed;
  End;
  StringGrid1.Canvas.FillRect(Rect);
  StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[acol,ARow]);
end;

procedure TFrmEdit.Edit1Change(Sender: TObject);
var
 i:byte;
begin
  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    StringGrid1.Cells[11, i] := '';
  end;
end;

end.
