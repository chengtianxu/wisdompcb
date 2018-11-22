unit AddMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Grids, ExtCtrls, Menus, ADODB, DB,
  Mask, DBCtrlsEh;

type
  TAddFrmMain = class(TForm)
    SGrid: TStringGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    Edit2: TEdit;
    Memo1: TMemo;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit3: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    qrytemp: TADOQuery;
    procedure SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGridKeyPress(Sender: TObject; var Key: Char);
    procedure N2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure  DeleteRow(Row:   Integer);
  public
    { Public declarations }
  end;

var
  AddFrmMain: TAddFrmMain;

implementation
uses
  Pick_Item_Single, ConstVar, common, DM, Main;

{$R *.dfm}

procedure TAddFrmMain.SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var 
  s:   String;
  R:   TRect; 
begin 
    if (ARow = 0) then
    begin
            with   SGrid   do
            begin
                Canvas.FillRect(Rect);
                S   :=   Cells[ACol,ARow];
                R   :=   Rect;
                DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER   or   DT_SINGLELINE   or   DT_VCENTER);     //文字居中
            end;
    end;
end;

procedure TAddFrmMain.FormShow(Sender: TObject);
var
  i: Integer;
begin
  SGrid.Cells[0,0]:='序';
  SGrid.Cells[1,0]:='员工工号';
  SGrid.Cells[2,0]:='姓名';
  SGrid.Cells[3,0]:='所属部门';
  SGrid.Cells[4,0]:='所耗工时';
  SGrid.Cells[5,0]:='备注';
  SGrid.ColWidths[7] := 0;

  //如果是新增，初始化个控件值
  if damo.Tag = 0 then
  begin
   { with damo.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select getdate() as nowdate';
      Open;
    end;}

    DateTimePicker1.Date := common.getsystem_date(damo.qryTemp,1);
    //damo.qryTemp.FieldValues['nowdate'];
    Edit3.Text :=FormatDateTime('yyyy-mm-dd HH:mm:ss',common.getsystem_date(damo.qryTemp,0));
    //damo.qryTemp.FieldValues['nowdate'];
    with damo.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select data0005.rkey, employee_name from data0005 inner join data0073 '
         + 'on data0005.rkey=data0073.employee_ptr where data0073.rkey=' + rkey73;
      open;
    end;
    Edit2.Text := damo.qryTemp.FieldValues['employee_name'];
    Edit2.Tag := damo.qryTemp.FieldValues['rkey'];
  end;

  //如果是编辑，初始化个控件值
  if (damo.Tag in [1,2,3])  then
  begin
    Edit1.Text := damo.qry72cut_no.Value;
    Edit1.Tag := damo.qry72rkey_492.Value;
    DateTimePicker1.Date :=StrToDate(FormatDateTime('yyyy-mm-dd',damo.qry72work_date.AsDateTime));
    if  (damo.Tag =3) then
      begin
      Edit2.Text:= FrmMain.User_Name;
      Edit2.Tag := FrmMain.rkey05;
      end
    else
      begin
      Edit2.Text := damo.qry72entname.Value;
      Edit2.Tag := damo.qry72ent_userptr.Value;
      end;
    Edit3.Text := FormatDateTime('yyyy-mm-dd HH:mm:ss',damo.qry72ent_date.AsDateTime);
    Memo1.Text := damo.qry72remark.Value;
    Label4.Caption := damo.qry72prod_code.Value;
    for  i := 0 to damo.qry73.RecordCount - 1 do
    begin
      SGrid.Cells[0, i+1] := IntToStr(i + 1);
      SGrid.Cells[1, i+1] := damo.qry73empl_code.Value;
      SGrid.Cells[2, i+1] := damo.qry73employee_name.Value;
      SGrid.Cells[3, i+1] := damo.qry73dept_name.Value;
      SGrid.Cells[4, i+1] := FloatToStr(damo.qry73WORKHOUSE.Value);
      SGrid.Cells[5, i+1] := damo.qry73REMARK.Value;
      SGrid.Cells[7, i+1] := IntToStr(damo.qry73USR_PTR.Value);
      SGrid.RowCount:= damo.qry73.RecordCount + 1 ;
      damo.qry73.next;
    end;
    if  damo.Tag = 2 then
    begin
      BitBtn2.Enabled := False;
    end;
  end;

end;

procedure TAddFrmMain.SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  R:TRect;
begin
  if Trim(Edit1.Text) = '' then
  begin
    ShowMessage('提示：生产单号不能为空！');
    Edit1.SetFocus();
    Exit;
  end;
  SpeedButton1.Visible := False;
  if (ACol = 6) then
  begin
    SGrid.Options:=SGrid.Options-[goEditing];
    if (ARow = Self.SGrid.RowCount-1) then
    begin
      SGrid.Cells[6,0]:='新增';
      SpeedButton3.Visible := CanSelect;
      if not CanSelect then Exit;
      SpeedButton3.Parent := SGrid;
      R := SGrid.CellRect(ACol, ARow);
      SpeedButton3.BoundsRect := R;
      SpeedButton3.Width := SpeedButton3.Height;
      SpeedButton3.Left  := R.Right - SpeedButton3.Width;
    end;
  end
  else
  begin
    SGrid.Options := SGrid.Options + [goEditing];
    SpeedButton3.Visible := False;
  end;
  if ACol=1 then
  begin
      SpeedButton1.Visible := CanSelect;
      if not CanSelect then Exit;
      SpeedButton1.Parent := SGrid;
      R := SGrid.CellRect(ACol, ARow);
      SpeedButton1.BoundsRect := R;
      SpeedButton1.Width := SpeedButton1.Height;
      SpeedButton1.Left  := R.Right - SpeedButton1.Width;
  end;

end;

procedure TAddFrmMain.SpeedButton3Click(Sender: TObject);
begin
   SGrid.RowCount := SGrid.RowCount + 1;
   Self.SpeedButton3.Visible:=False;
   SGrid.Row := SGrid.RowCount - 1;
   SGrid.Cells[0, SGrid.Row] := IntToStr(SGrid.Row);
   SGrid.Col := 1;
end;

procedure TAddFrmMain.SpeedButton1Click(Sender: TObject);
var
  InputVar: PDlgInput;
  i: Integer;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'empl_code/员工工号/100,employee_name/员工姓名/100,dept_name/所属部门/150,';
    InputVar.Sqlstr :='select data0005.rkey, empl_code, employee_name, dept_name from data0005 '
      + ' inner join data0034 on data0005.employee_id=data0034.rkey '
      //+ ' where data0034.dept_code in  (''05'',''07'',''21'',''37'')'
      + ' where data0005.active_flag=''Y'' ';
    InputVar.AdoConn := DM.damo.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      SGrid.Cells[1,SGrid.Row] := frmPick_Item_Single.adsPick.FieldValues['empl_code'];
      SGrid.Cells[2,SGrid.Row] := frmPick_Item_Single.adsPick.FieldValues['employee_name'];
      SGrid.Cells[3,SGrid.Row] := frmPick_Item_Single.adsPick.FieldValues['dept_name'];
      SGrid.Cells[7,SGrid.Row] := frmPick_Item_Single.adsPick.FieldValues['rkey'];
      for i := 1 to SGrid.RowCount - 1 do
      begin
        if SGrid.Cells[1,SGrid.Row] = SGrid.Cells[1, i-1] then
        begin
          ShowMessage('不能重复添加人员！');
          SGrid.Cells[1,SGrid.Row] := '';
          SGrid.Cells[2,SGrid.Row] := '';
          SGrid.Cells[3,SGrid.Row] := '';
          SGrid.Cells[4,SGrid.Row] := '';
          Exit;
        end;
      end;

    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TAddFrmMain.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'prod_code/产品编码/100,product_name/产品名称/120,product_desc/产品描述/120,cut_no/生产单号/100,';
    InputVar.Sqlstr :='select distinct(data0492.rkey),data0492.cut_no,data0008.prod_code,data0008.product_name,product_desc from data0492 '
      + 'inner join data0008 on data0492.BOM_PTR=data0008.rkey where data0492.tstatus <> 3';   //where data0492.tstatus <> 4
    InputVar.AdoConn := DM.damo.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Text := frmPick_Item_Single.adsPick.FieldValues['cut_no'];
      Edit1.Tag :=  frmPick_Item_Single.adsPick.FieldValues['rkey'];
      Label4.Caption := frmPick_Item_Single.adsPick.FieldValues['prod_code'];
      SendMessage(DateTimePicker1.Handle,   WM_SYSKEYDOWN,   VK_DOWN,   0);
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
    SGrid.Cells[0,1] :=  '1';
  end;

end;

procedure TAddFrmMain.BitBtn2Click(Sender: TObject);
var
  TotalWorkHouse,ahour: Double;
  i,j: Integer;
  FM_DATE,Lsql: string;
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('生产单号不能为空！');
    Edit1.SetFocus;
    Exit;
  end;

  if (Trim(SGrid.Cells[7, SGrid.row]) = '') or (Trim(SGrid.Cells[1,SGrid.row]) = '')
    or (Trim(SGrid.Cells[2,SGrid.row]) = '') or (Trim(SGrid.Cells[3,SGrid.row]) = '') then
  begin
    ShowMessage('员工信息不全，请输入员工信息！');
    Exit;                      
  end;

  if Trim(SGrid.Cells[4,SGrid.row]) = '' then
  begin
    ShowMessage('请输入消耗工时明细！');
    Exit;
  end;

   with damo.qrytemp do  //查询该该产品的最新完工日期，如果小于输入的工时日期，则不通过！
  begin
    Close;
    SQL.Clear;
    SQL.text := 'select distinct(data0492.rkey), data0492.ISSUE_DATE, data0492.cut_no, data0416.sys_date, data0492.TSTATUS '
      + 'from data0492 '
      + 'left join data0053 on data0492.rkey=data0053.mo_ptr '
      + 'left join data0416 on data0053.NPAD_PTR=data0416.rkey '
      + 'where data0492.rkey =' + IntToStr(Edit1.Tag) + ' order by data0416.sys_date desc';
    Open;
    if not FieldByName('sys_date').IsNull then
    begin
      if (FieldByName('sys_date').AsDateTime < StrToDateTime(DateToStr(DateTimePicker1.Date) + ' 00:00:00')) and (FieldByName('TSTATUS').AsInteger = 4) then
      begin
        ShowMessage('该产品已完工，最新入库日期为：'+ DateToStr(fieldByName('sys_date').AsDateTime)
          + '，当前工时日期为：'+ Datetostr(DateTimePicker1.Date)+ ', 保存失败！');
        Exit;
      end;
    end;
    if not FieldByName('ISSUE_DATE').IsNull then
    begin
      if (StrToDate(FormatDateTime('yyyy-MM-dd',FieldByName('ISSUE_DATE').AsDateTime))>StrToDate(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date))) then
      begin
        ShowMessage('【投产日期：'+ DateToStr(fieldByName('ISSUE_DATE').AsDateTime)
          + '】 大于 【当前工时日期为：'+ Datetostr(DateTimePicker1.Date)+ '】， 保存失败！');
        Exit;
      end;
    end;
  end;

  TotalWorkHouse := 0;
  for i := 1 to SGrid.RowCount - 1 do
  begin
    TotalWorkHouse := TotalWorkHouse + StrToFloat(SGrid.Cells[4,i]);  //计算总工时
  end;

  if damo.Tag in[ 0,3] then     //新增  复制
    try
      damo.ADOConnection1.BeginTrans;
      damo.qry72s.Close;
      damo.qry72s.Open;
      damo.qry72s.Append;
      damo.qry72s.FieldByName('Rkey_492').AsInteger := Edit1.Tag;
      damo.qry72s.FieldByName('Work_Date').AsString := FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date);
      damo.qry72s.FieldByName('Ent_UserPtr').AsInteger := Edit2.Tag;
      damo.qry72s.FieldByName('Total_WorkHouse').AsFloat := TotalWorkHouse;
      damo.qry72s.FieldByName('Remark').AsString :=Memo1.Text;
      damo.qry72s.Post;
     { with damo.qrytemp1 do
      begin
        Close;
        SQL.Clear;
        SQL.text := 'SELECT IDENT_CURRENT(''wzcp0072'') as rkey';
        Open;
        Rkey72 := FieldValues['rkey'];  //获取刚添加的主表wzcp0072的rkey
      end;         }
      if  damo.qry73s.Active =False then
        damo.qry73s.Open;
        
      for i := 1 to SGrid.RowCount - 1 do
      begin
        Lsql:='select  SUM(WORKHOUSE)WORKHOUSE '+
        ' from WZCP0072  a'+
        ' inner join WZCP0073 b on a.RKEY=b.rkey_cp72'+
        ' where a.WORK_DATE='''+FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)+''' and b.USR_PTR='+SGrid.Cells[7,i]+' ' ;
       qrytemp.close;
       qrytemp.sql.text:=Lsql;
       qrytemp.open;
       ahour:=0;
      if qrytemp.Fields[0].asfloat>0 then
         ahour:= qrytemp.Fields[0].asfloat;

      if (ahour+StrToFloat(SGrid.Cells[4,i])<=10.5)
      or ((ahour+StrToFloat(SGrid.Cells[4,i])>10.5)
           and (MessageDlg('员工['+SGrid.Cells[2,i]+']当天总工时已超过10.5，是否继续保存?',mtWarning,[mbYes,mbNo],0)=mryes))then
       begin
        damo.qry73s.Append;
        damo.qry73s.FieldByName('Rkey_cp72').AsInteger := damo.qry72sRKEY.Value;
        damo.qry73s.FieldByName('usr_ptr').AsInteger := StrToInt(SGrid.Cells[7,i]);
        damo.qry73s.FieldByName('workhouse').AsFloat := StrToFloat(SGrid.Cells[4,i]);
        damo.qry73s.FieldByName('Remark').AsString := SGrid.Cells[5,i];
        damo.qry73s.Post;
       end;
      end;
      
      if not damo.qry73s.IsEmpty  then
      begin
      damo.ADOConnection1.CommitTrans;
      ShowMessage('保存成功！');
      for i:=1 to sgrid.RowCount-1 do sgrid.Rows[i].Clear;
      sgrid.RowCount:=2;
      Edit1.Clear;
      Edit1.SetFocus;
      end;
    except
      on e:Exception do
      begin
        damo.ADOConnection1.RollbackTrans;
        showMessage( '数据保存失败，错误信息： '   +   e.message)
      end;
    end
  else
    if damo.Tag = 1 then//编辑
    try
      j:=0;
      damo.ADOConnection1.BeginTrans;
      with damo.qryTemp do  //更新主表wzcp0072
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'update wzcp0072 set rkey_492= ' + IntToStr(Edit1.Tag)
          + ', Work_Date= ''' + FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)
          + ''', Ent_UserPtr= ' + IntToStr(Edit2.Tag)
          + ', Total_WorkHouse= ' + FloatToStr(TotalWorkHouse)
          + ', Remark= ' + QuotedStr(Memo1.Text)
          + ' where rkey= ' + IntToStr(damo.qry72rkey.Value);
        ExecSQL;
      end;
      with damo.qryTemp1 do  //根据主表wzcp0072的rkey删除子表wzcp0073
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'delete from wzcp0073 where rkey_cp72= ' + IntToStr(damo.qry72rkey.Value);
        ExecSQL;
      end;
      with damo.qryTemp2 do  //重新添加子表数据wzcp0073
      begin
        Close;
      for i := 1 to SGrid.RowCount - 1 do
      begin
        Lsql:='select  SUM(WORKHOUSE)WORKHOUSE '+
        ' from WZCP0072  a'+
        ' inner join WZCP0073 b on a.RKEY=b.rkey_cp72'+
        ' where a.WORK_DATE='''+FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)+''' and b.USR_PTR='+SGrid.Cells[7,i]+' ' ;
       qrytemp.close;
       qrytemp.sql.text:=Lsql;
       qrytemp.open;
       ahour:=0;
      if qrytemp.Fields[0].asfloat>0 then
         ahour:= qrytemp.Fields[0].asfloat;

       if (ahour+StrToFloat(SGrid.Cells[4,i])<=10.5)
         or ((ahour+StrToFloat(SGrid.Cells[4,i])>10.5)
            and (MessageDlg('员工['+SGrid.Cells[2,i]+']当天总工时已超过10.5，是否继续保存?',mtWarning,[mbYes,mbNo],0)=mryes))then
       begin
            SQL.Clear;
            SQL.Text := Format('insert into WZCP0073(Rkey_cp72, usr_ptr, workhouse, remark) '
              + 'values (%d, %d, %f, ''%s'')', [damo.qry72rkey.Value, StrToInt(SGrid.Cells[7,i]), StrToFloat(SGrid.Cells[4,i]), SGrid.Cells[5,i]]);
            ExecSQL;
         j:=1;
       end; 
      end;
     end;

     if j=1 then
     begin
      damo.ADOConnection1.CommitTrans;
      ModalResult:=mrok;
     end;
     
    except
     on e: Exception do
     begin
       damo.ADOConnection1.RollbackTrans;
       ShowMessage('数据保存失败，错误信息： '   +e.Message);
     end;
    end;

end;

procedure TAddFrmMain.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid.RowCount-1 do
  sgrid.Rows[i].Clear;
 sgrid.RowCount:=2;
end;

procedure TAddFrmMain.SGridKeyPress(Sender: TObject; var Key: Char);
begin
  if SGrid.Col = 4 then
  begin
    if not (Key in ['0'..'9', #8, #46]) then Key := #0;
  end;
end;

procedure  TAddFrmMain.DeleteRow(Row: Integer);
var 
  i: integer;
begin
  if (Row < sgrid.RowCount) and (Row > sgrid.FixedRows-1) then
  begin
    if Row < SGrid.RowCount - 1 then
    begin
      for i := Row to SGrid.RowCount - 1 do
      begin
        SGrid.Rows[i] := SGrid.Rows[i + 1];
      end;
    end
    else sgrid.Rows[Row].Clear;
    SGrid.RowCount := SGrid.RowCount - 1;
  end;
end;

procedure TAddFrmMain.N2Click(Sender: TObject);
var
  Sel: TGridRect;
  i: Integer;
begin
  Sel := sgrid.Selection;
  DeleteRow(Sel.Top);
  for i := 0 to SGrid.RowCount - 1 do
  begin
    SGrid.Cells[0, i + 1] := IntToStr(i + 1);
  end;
end;

procedure TAddFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  i := damo.qry72rkey.Value;
  damo.qry72.Close;
  damo.qry72.Open;
  damo.qry72.Locate('rkey',i, []);
  damo.qry73.Close;
  damo.qry73.Parameters[0].Value := damo.qry72RKEY.Value;
  damo.qry73.Open;

end;

end.
