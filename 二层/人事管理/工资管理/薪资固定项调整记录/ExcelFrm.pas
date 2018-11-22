unit ExcelFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBGridEh, ComCtrls, DateUtils;

type
  TFrmExcel = class(TForm)
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    EdtFilename: TEdit;
    BitBtn3: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    StringGrid2: TStringGrid;
    Label4: TLabel;
    Label5: TLabel;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExcel: TFrmExcel;

implementation

uses damo, ComObj, common;

{$R *.dfm}

procedure TFrmExcel.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0, 0] := '工号';
  StringGrid1.Cells[1, 0] := '姓名';
  StringGrid1.Cells[2, 0] := '职务';
  StringGrid1.Cells[3, 0] := '账套类型';                                        //2
  StringGrid1.Cells[4, 0] := '科目代码';
  StringGrid1.Cells[5, 0] := '科目名称';
  StringGrid1.Cells[6, 0] := '原金额';
  StringGrid1.Cells[7, 0] := '现金额';
  StringGrid1.Cells[8, 0] := '备注';
  StringGrid1.Cells[9, 0] := '培训编号';
  StringGrid1.Cells[10, 0] := '调薪原因';                                       //9
  StringGrid1.Cells[13, 0] := '验证结果';                                       //12
  StringGrid1.ColWidths[16] := 0;                                               //15
  StringGrid1.ColWidths[15] := 0;                                               //14
  StringGrid1.ColWidths[14] := 0;                                               //13
  StringGrid1.ColWidths[11] := 0;                                               //10
  StringGrid1.ColWidths[12] := 0;                                               //11


  StringGrid2.Cells[0, 0] := '工号';
  StringGrid2.Cells[1, 0] := '姓名';
  StringGrid2.Cells[2, 0] := '职务';
  StringGrid2.Cells[3, 0] := '账套类型';
  StringGrid2.Cells[4, 0] := '科目代码';
  StringGrid2.Cells[5, 0] := '科目名称';
  StringGrid2.Cells[6, 0] := '原金额';
  StringGrid2.Cells[7, 0] := '现金额';
  StringGrid2.Cells[8, 0] := '备注';
  StringGrid2.Cells[9, 0] := '培训编号';
  StringGrid2.Cells[10, 0] := '调薪原因';

  DateTimePicker1.Date := Now();
end;

procedure TFrmExcel.BitBtn3Click(Sender: TObject);
begin
  OpenDialog1.Title := '请选择正确的excel文件';
   OpenDialog1.Filter := 'Excel(*.xls)|*.xls';
   if OpenDialog1.Execute then
     EdtFilename.Text := OpenDialog1.FileName;
end;

procedure TFrmExcel.Button1Click(Sender: TObject);
const
     BeginRow = 2; BeginCol = 1;
var
     Excel: OleVariant;
     iRow,iCol,i : integer;
     xlsFilename: string;
begin
  if (trim(EdtFilename.Text) = '') then
  begin
   MessageBox(GetActiveWindow(), '请选择正确的excel路径', '提示信息', MB_OK + MB_ICONWARNING);
   exit;
  end;
  xlsFilename := trim(EdtFilename.Text);
  try
    Excel := CreateOLEObject('Excel.Application');
  except
    Application.MessageBox('excel没有安装', '提示信息', MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);
    Exit;
  end;
  Excel.Visible := false;
  Excel.WorkBooks.Open(xlsFilename);
  try
    iRow := BeginRow;
    iCol := BeginCol;
    while trim(Excel.WorkSheets[1].Cells[iRow,iCol].value) <> '' do
    begin
      with StringGrid1 do
      begin
        Cells[0, iRow - 1] := trim(Excel.WorkSheets[1].Cells[iRow,iCol].value);     //工号
        Cells[1, iRow - 1] := trim(Excel.WorkSheets[1].Cells[iRow,iCol+1].value);   //姓名
        Cells[2, iRow - 1] := trim(Excel.WorkSheets[1].Cells[iRow,iCol+2].value);   //职务
        Cells[3, iRow - 1] := trim(Excel.WorkSheets[1].Cells[iRow,iCol+3].value);   //账套类型
        Cells[4, iRow - 1] := trim(Excel.WorkSheets[1].Cells[iRow,iCol+4].value);   //科目代码
        Cells[5, iRow - 1] := trim(Excel.WorkSheets[1].Cells[iRow,iCol+5].value);   //科目名称
        Cells[6, iRow - 1] := trim(Excel.WorkSheets[1].Cells[iRow,iCol+6].value);   //原金额
        Cells[7, iRow - 1] := trim(Excel.WorkSheets[1].Cells[iRow,iCol+7].value);   //现金额
        Cells[8, iRow - 1] := trim(Excel.WorkSheets[1].Cells[iRow,iCol+8].value);   //备注
        Cells[9, iRow - 1] := trim(Excel.WorkSheets[1].Cells[iRow,iCol+9].value);   //培训编号
        Cells[10, iRow - 1] := trim(Excel.WorkSheets[1].Cells[iRow,iCol+10].value); //调薪原因
        iRow := iRow + 1;
        Label5.Caption := IntToStr(StringGrid1.RowCount - 1) + ' 笔';
        RowCount := RowCount + 1;
      end;
    end;
    StringGrid1.RowCount := StringGrid1.RowCount - 1;
    Excel.Quit;
  except
    Application.MessageBox('导入数据出错', '提示信息', MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);
    Excel.Quit;
  end;
  MessageBox(GetActiveWindow(), '数据导入成功', '提示信息', MB_OK + MB_ICONWARNING);
  Button1.Enabled := False;
end;

procedure TFrmExcel.Button2Click(Sender: TObject);
var
  i, j: Integer;
  DateNow: TDate;
begin
  screen.Cursor := crHourGlass;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := StringGrid1.RowCount - 1;
  DateNow := StrToDate(IntToStr(YearOf(DateTimePicker1.Date)) + '-' + IntToStr(MonthOf(DateTimePicker1.Date)) + '-01');
  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    if StringGrid1.Cells[0,1] ='' then
    begin
      ShowMessage('当前记录为空，请导入数据后再进行验证！');
      Exit;
    end;
    ProgressBar1.Position := ProgressBar1.Position + 1;
    with DM.qrytemp do
    begin
      //验证该员工的是否在人事信息中有档案。
      Close;
      SQL.Clear;
      SQL.Text := 'select employeemsg.rkey, wagetype, datadetail.train_flag, datadetail.item '
        + ' from employeemsg inner join '
        + ' datadetail on position=datadetail.rkey'
        + ' where employeecode =' + QuotedStr(StringGrid1.Cells[0, i]);
      Open;
      if (IsEmpty) or (FieldByName('item').AsString <> StringGrid1.Cells[2, i]) then
      begin
        StringGrid1.Cells[13, i] := StringGrid1.Cells[12, i] + '失败：人事信息无该员工信息或职务不对应';
        j := j + 1;
        continue;
      end
      else
      begin
        StringGrid1.Cells[11, i] := FieldValues['rkey']; //员工rkey
        StringGrid1.Cells[12, i] := FieldValues['wagetype']; //账套rkey
        //验证导入的科目代码和科目名称是否一致。
        Close;
        SQL.Clear;
        SQL.Text := 'select * from DesignSalaryItem where itemname ='
          + QuotedStr(StringGrid1.Cells[5, i])
          + ' and datafield ='
          + QuotedStr(StringGrid1.Cells[4, i]);
        Open;
        if IsEmpty then
        begin
          StringGrid1.Cells[13, i] := '失败：科目代码和科目名称有误; ';
          j := j + 1;
          continue;
        end
        else
        begin
          with DM.qrytemp do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'select max(effect_date) as effect_date from basicsalary_Alteration where employeeid = ' + StringGrid1.Cells[11, i]
              + ' and datafield = ' + QuotedStr(StringGrid1.Cells[4, i]);
            Open;
          end;
          if (not IsEmpty) and (FieldByName('effect_date').Value >= DateNow)  then
          begin
            StringGrid1.Cells[13, i] := '失败：最新生效日期: [' + DateToStr(FieldByName('effect_date').Value)
              + '] 大于当前生效日期: [' + DateToStr(DateNow) + ']';
            j := j + 1;
            continue;
          end
          else
          begin
            //验证导入的金额是否为空并且原金额要和最后一次调薪后金额相等。
            Close;
            SQL.Clear;
            SQL.Text := 'select rkey, employeeid, ' + StringGrid1.Cells[4, i]
              +  ' from Employeebasicsalary where employeeid=' + StringGrid1.Cells[11, i];
            Open;
            if ( (Trim(StringGrid1.Cells[6, i]) = '') or (Trim(StringGrid1.Cells[6, i]) <> fieldByName(StringGrid1.Cells[4, i]).asstring))
            or (Trim(StringGrid1.Cells[7, i]) = '') then
            begin
              StringGrid1.Cells[13, i] := '失败：金额为空或原金额与本员工最后一次调薪后金额不一致; ';
              j := j + 1;
              continue;
            end
            else
            begin
              Close;
              SQL.Clear;
              SQL.Text := 'select count(*) as counts from dbo.basicsalary_Alteration where employeeid = '
                + QuotedStr(stringGrid1.Cells[11, i])
                + ' and effect_date = ' + QuotedStr(IntToStr(YearOf(DateTimePicker1.Date)) + '-' + IntToStr(MonthOf(DateTimePicker1.Date)) + '-01')
                + ' and datafield = ' + QuotedStr(StringGrid1.Cells[4,i])
                + ' and effect_flag=1';
              Open;
              if FieldByName('counts').AsInteger >= 1 then
              begin
                StringGrid1.Cells[13, i] := '失败：当前导入行 '
                  + IntToStr(YearOf(DateTimePicker1.Date)) + '年 '
                  + IntToStr(MonthOf(DateTimePicker1.Date)) + '月，已有调薪记录; ';
                j := j + 1;
                continue;
              end
              else
              begin
                if Trim(StringGrid1.Cells[9, i]) <> ''  then
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'select Employee_Train.rkey from Employee_Train inner join datadetail '
                    + ' on Employee_Train.type_ptr=datadetail.rkey '
                    + ' where Employee_Train.Train_NO =' + QuotedStr(StringGrid1.Cells[9, i])
                    + ' and employeeid=' + stringGrid1.Cells[11, i]
                    + ' and (datadetail.item like ''%调薪%'' or datadetail.item like ''%晋升%'') ';
                  Open;
                  if IsEmpty  then
                  begin
                    StringGrid1.Cells[13, i] := '失败：该培训编号为非调薪类型培训记录，请检查; ';
                    j := j + 1;
                    continue;
                  end
                  else
                  begin
                    StringGrid1.Cells[14, i] := IntToStr(FieldValues['rkey']);
                    StringGrid1.Cells[15, i] := '1';
                    StringGrid1.Cells[13, i] := '验证通过';
                  end;
                end
                else
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'select * from datadetail where item=' + QuotedStr(StringGrid1.Cells[2, i])
                    + ' and train_flag = 1';
                  Open;
                  if (not IsEmpty) and (StrToFloat(StringGrid1.Cells[7, i]) > StrToFloat(StringGrid1.Cells[6, i]))
                    and (StringGrid1.Cells[4, i] = 'F2') and (StrToFloat(StringGrid1.Cells[6, i]) <> 0) then
                  begin
                    StringGrid1.Cells[13, i] := '失败：职务关联培训并且调后金额大于原金额';
                    j := j + 1;
                    continue;
                  end
                  else
                  begin
                    StringGrid1.Cells[13, i] := '验证通过';
                  end;
                end;

                if Trim(StringGrid1.Cells[10, i]) <> ''  then
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'select rkey, dictid from datadetail where item = ' + QuotedStr(stringGrid1.Cells[10, i])
                   + ' and dictid=21';
                  Open;
                  if IsEmpty  then
                  begin
                    StringGrid1.Cells[13, i] := '失败：调薪原因有误，请检查; ';
                    j := j + 1;
                    continue;
                  end
                  else
                  begin

                    StringGrid1.Cells[16, i] := IntToStr(FieldValues['rkey']);
                    StringGrid1.Cells[13, i] := '验证通过';
                  end;
                end
                else
                begin
                  StringGrid1.Cells[13, i] := '验证通过';
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  screen.Cursor := crDefault;
  Label7.Caption := IntToStr(j) +' 笔';
  Label6.Caption := IntToStr(StringGrid1.RowCount - 1 - j) + ' 笔';
end;

procedure TFrmExcel.Button3Click(Sender: TObject);
var
 i:byte;
begin
  for i := 1 to StringGrid1.RowCount - 1 do StringGrid1.Rows[i].Clear;
  StringGrid1.RowCount:=2;
  Button1.Enabled := True;
  Label5.Caption := '0 笔';
  Label6.Caption := '0 笔';
  Label7.Caption := '0 笔';
end;

procedure TFrmExcel.SpeedButton1Click(Sender: TObject);
begin
  common.Export_Grid_to_Excel(StringGrid2, '薪资批量导入');
end;

procedure TFrmExcel.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  If (Length(StringGrid1.Cells[ACol, ARow]) > 10) and (ACol = 13) and (ARow > 0) then
  Begin
      StringGrid1.Canvas.Brush.Color := clRed;
  End;
  StringGrid1.Canvas.FillRect(Rect);
  StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[acol,ARow]);
end;

procedure TFrmExcel.BitBtn2Click(Sender: TObject);
var
  i, p, q: Integer;
begin
  if StringGrid1.Cells[13, 1] = '' then
  begin
    MessageBox(GetActiveWindow(), '请先进行验证，验证后再保存结果！', '提示信息', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if MessageDlg('保存时只针对有效记录，当前保存的生效年月为：[' + Copy(DateToStr(DateTimePicker1.Date), 0, 7) + ']  您确定要保存吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    for i := 1 to stringgrid1.RowCount - 1 do
    begin
      try
        if Length(StringGrid1.Cells[13, i]) <= 8 then
        begin
          DM.ADOConnection1.BeginTrans;
          with DM.qrytemp do
          begin
            Close;
            SQL.Clear;
            SQL.Text := Format('insert into basicsalary_Alteration(employeeid, itemname, datafield, originaldata, '
              + 'newdata, operator, effect_date, accountid, remark, employee_train_ptr, employee_train_flag, alter_reason) '
              + 'values(%d, ''%s'', ''%s'', %f, %f, %d, ''%s'', %d, ''%s'', ''%s'', ''%s'', ''%s'')',
              [StrToInt(stringGrid1.Cells[11, i]), StringGrid1.Cells[5,i], StringGrid1.Cells[4,i], strtofloat(stringgrid1.Cells[6,i]),
              strtofloat(stringgrid1.Cells[7,i]), StrToInt(user_ptr),
              IntToStr(YearOf(DateTimePicker1.Date)) + '-' + IntToStr(MonthOf(DateTimePicker1.Date)) + '-01', strtoint(StringGrid1.Cells[12, i]),
              StringGrid1.Cells[8,i], StringGrid1.Cells[14,i], StringGrid1.Cells[15,i], StringGrid1.Cells[16,i]]);
            ExecSQL;

            if StringGrid1.Cells[14,i] <> '' then
            begin
              Close;
              SQL.Clear;
              SQL.Text := 'update Employee_Train set ptr_flag=1 where rkey=' + StringGrid1.Cells[14,i];
              ExecSQL;
            end;
          end;
          DM.ADOConnection1.CommitTrans;
          q := q + 1;
        end
        else
        begin
          p := p + 1;
        end;
      except
        on e: Exception do
        begin
          DM.ADOConnection1.RollbackTrans;
          ShowMessage('保存失败,网络异常...... (' + e.Message + ')');
        end;
      end;
    end;
    ModalResult := mrOk;
  end;
end;

procedure TFrmExcel.Label4Click(Sender: TObject);
begin
  common.Export_Grid_to_Excel(StringGrid1, '薪资批量导入');
end;

procedure TFrmExcel.Label2Click(Sender: TObject);
begin
  ShowMessage('对不起，亲爱的用户，目前无此功能，待后续开发....');
end;

procedure TFrmExcel.Label3Click(Sender: TObject);
var

  XLApp: Variant;
  Sheet: Variant;
  i,j: Integer;
  //aa:  string;
begin

  if StringGrid1.Cells[13, 1] = '' then
  begin
    MessageBox(GetActiveWindow(), '请先进行验证，验证后再保存结果！', '提示信息', MB_OK + MB_ICONWARNING);
    Exit;
  end;

 
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := '错误数据';
  Sheet := XLApp.Workbooks[1].WorkSheets['错误数据'];


  for j:=0  to  StringGrid1.ColCount-1  do
   for i:=0  to  StringGrid1.RowCount-1 do
  begin
    if i=0   then
     Sheet.cells[1,j+1]:=StringGrid1.Cells[j,0];
     
    if  copy(StringGrid1.Cells[13, i],0,4) ='失败' then
     Sheet.cells[i+1,j+1]:=StringGrid1.Cells[j,i];


  end;




   XlApp.Visible := True;

end;

procedure TFrmExcel.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
