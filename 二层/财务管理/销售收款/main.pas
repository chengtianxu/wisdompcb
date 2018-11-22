unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, ToolWin, ComCtrls,
  DateUtils, Menus,Excel2000,ClipBrd, ComObj,DB, ADODB,OleServer,ActiveX;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    user_ptr: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    empl_name: TLabel;
    curr_code: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn6: TBitBtn;
    N23: TMenuItem;
    Popup3: TPopupMenu;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure update_invcre;
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N23Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure item_click(Sender: TObject);
    procedure N32Click(Sender: TObject);

  private
    { Private declarations }
   aqd114_sql:string;
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);

  public
    { Public declarations }
   trans_pl:byte;
   sys_sortdate:tdatetime;
   procedure CopyDbDataToExcel(Args:array of const);    
  end;

var
  Form1: TForm1;

implementation

uses DAMO, term, standard_bill, reserve_fund, account_receivable,common,
  AdvanceDetails,receviable_details;

{$R *.dfm}

procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
  if Message.Msg = WM_MOUSEWHEEL then
  begin
    IsNeg := Short(Message.WParamHi) < 0;
    if IsNeg then
      DBGrid1.DataSource.DataSet.MoveBy(1)
    else
      DBGrid1.DataSource.DataSet.MoveBy(-1)
  end
  else
    OldGridWnd(Message);
end;

procedure TForm1.update_invcre;
begin
  with dm.ADOQuery1 do
  begin
     close;
     sql.Clear;
     sql.Add('update data0112');
     sql.Add('set data0112.INVOICE_STATUS = 1');
     sql.Add('from data0115 inner join data0112');
     sql.Add('on data0115.INV_PTR=data0112.rkey');
     sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
     sql.Add('and data0112.amount_paid+data0112.CASH_DISC>=data0112.INVOICE_TOTAL');
     ExecSQL;
  end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('update data0112');
    sql.Add('set data0112.amount_paid = data0112.amount_paid-data0115.AMOUNT,');
    sql.Add('    data0112.CASH_DISC=data0112.CASH_DISC-data0115.APPL_CASH_DISC');
    sql.Add('from data0115 inner join data0112');
    sql.Add('on data0115.INV_PTR=data0112.rkey');
    sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
    ExecSQL;
  end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('update data0116');
    sql.Add('set data0116.avl_amt = data0116.avl_amt+data0115.AMOUNT');
    sql.Add('from data0115 inner join data0116');
    sql.Add('on data0115.CRE_MEMO_PTR=data0116.rkey');
    sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
    ExecSQL;
  end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('update data0116');
    sql.Add('set data0116.memo_status = 1');
    sql.Add('from data0115 inner join data0116');
    sql.Add('on data0115.CRE_MEMO_PTR=data0116.rkey');
    sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
    sql.Add('and data0116.avl_amt>0');
    ExecSQL;
  end;

   with dm.ADOQuery1 do         //更新预收支票状态
    begin
     close;
     sql.Clear;
     sql.Add('update data0114');
     sql.Add('set status=1');
     sql.Add('from data0115 inner join data0116');
     sql.Add('on data0115.CRE_MEMO_PTR=data0116.rkey');
     sql.Add('inner join data0114 on');
     sql.Add('data0116.srce_ptr=data0114.rkey');
     sql.Add('where data0115.SRCE_PTR='+dm.ADO114RKEY.AsString);
     sql.Add('and data0116.avl_amt>0');
     sql.Add('and data0116.memo_tp=1');
     ExecSQL;
    end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('delete data0115');
    sql.Add('where data0115.SRCE_PTR='+dm.ado114RKEY.AsString);
    ExecSQL;
  end;


end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  n17.Enabled:=true;
  n18.Enabled:=true;
  n19.Enabled:=true;
  case dm.aqd114status114.Value of
    1:;
    2:begin
       n17.Enabled:=false;
       n19.Enabled:=false;
      end;
    3:begin
       n17.Enabled:=false;
       n19.Enabled:=false;
      end;
  else
    begin
      n17.Enabled:=false;
      n18.Enabled:=false;
      n19.Enabled:=false;
    end;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
  if  dm.ADOConnection1.Connected then
  begin
    field_name:='REFERENCE_NO';
    with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select data0073.employee_ptr,data0005.employee_name');
      sql.Add('from data0073 inner join data0005');
      sql.Add('on data0073.employee_ptr=data0005.rkey');
      sql.Add('where data0073.rkey='+rkey73);
      open;
      user_ptr.Caption:=fieldbyname('employee_ptr').AsString;
      empl_name.Caption:=fieldbyname('employee_name').AsString;
    end;

    with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select getdate() as sys_date');
      open;
      sys_sortdate:=strtodate(datetostr(fieldvalues['sys_date']));
    end;
    with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select curr_code from data0001 where rkey=1');
      open;
      self.curr_code.Caption:=fieldvalues['curr_code'];
    end;

    with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select trans_pl from data0192 ');
      open;
      self.trans_pl:=fieldvalues['trans_pl'];
    end;

    dm.AqD114.Close;
    dm.AqD114.Parameters.ParamByName('dtpk1').Value:=self.sys_sortdate-dayof(self.sys_sortdate)+1;
    dm.AqD114.Parameters.ParamByName('dtpk2').Value:=self.sys_sortdate;
    dm.aqd114.Prepared;
    dm.AqD114.Open;
    aqd114_sql:=dm.AqD114.CommandText;
    form_receivable:=tform_receivable.Create(application);

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
end;

procedure TForm1.item_click(Sender: TObject);
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

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.AqD114.CommandText);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.N1Click(Sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i:=0 to dbgrid1.FieldCount-1 do
    if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
    begin
      dbgrid1.Columns[i].Visible:=true;
      break;
    end;
  end
  else
  begin
    for i:=0 to dbgrid1.FieldCount-1 do
    if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
    begin
      dbgrid1.Columns[i].Visible:=false;
      break;
    end;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 rkey114:integer;
begin
  rkey114:=dm.AqD114RKEY.Value;
  dm.AqD114.Close;
  dm.AqD114.Open;
  if rkey114>0 then dm.AqD114.Locate('rkey',rkey114,[]);
end;

procedure Tform1.CopyDbDataToExcel(Args:array of const);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
  Screen.Cursor := crHourGlass;
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
  XLApp.SheetsInNewWorkbook := High(Args) + 1;

  for I := Low(Args) to High(Args) do
  begin
    XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
    Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
    if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
      Screen.Cursor := crDefault;
      Exit;
    end;
    TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
    TDBGrid(Args[I].VObject).DataSource.DataSet.first;

    v_cloumn:=0;
    for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
      TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
      inc(v_cloumn);

    jCount := 1;
    while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
    begin
      v_cloumn:=0;
      for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
        TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
        inc(v_cloumn);
      Inc(jCount);
      TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
    end;

    XlApp.Visible := True;
    TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
  end;
  Screen.Cursor := crDefault;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
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

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dm.AqD114.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
  else
    dm.AqD114.filter := '';
  dm.aqd114.afteropen(dm.aqd114);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  i:byte;
begin
  form_condition:=tform_condition.Create(application);
  form_condition.dtpk1.Date:=dm.AqD114.Parameters.ParamValues['dtpk1'];
  form_condition.dtpk2.Date:=dm.AqD114.Parameters.ParamValues['dtpk2'];
  if form_condition.ShowModal=mrok then
  begin
    dm.AqD114.Close;
    dm.AqD114.CommandText:=self.aqd114_sql;
    for i:=1 to form_condition.SGrid1.RowCount-2 do
      dm.AqD114.CommandText:=dm.AqD114.CommandText+
                             form_condition.SGrid1.Cells[2,i]+#13;
    dm.AqD114.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
    dm.AqD114.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date;
    dm.aqd114.Prepared;
    dm.AqD114.Open;
  end;
  form_condition.Free;
end;

procedure TForm1.N20Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0)
  ELSE
  try
    form2:=tform2.Create(application);
    dm.ado114.Close;
    dm.ado114.Parameters[0].Value:=null;
    dm.ado114.Open;
    dm.ado114.Append;
    dm.ado114TTYPE.Value:=1;  //标准现金收据
    dm.ado114STATUS.Value:=1;//状态
    dm.ado114IF_VOUCHER.AsBoolean:=true;
    dm.ado114CSI_USER_PTR.AsString:=rkey73;
    dm.ado114EMPL_PTR.AsString :=user_ptr.Caption;
    dm.ado114TDATE.Value:=sys_sortdate;
    dm.ado114ENTER_DATE.Value:=sys_sortdate;
    dm.ado114trans_pl.Value:=self.trans_pl;
    dm.ado114AMOUNT.Value:=0;
    form2.BitBtn5.Enabled:=false;
    if form2.ShowModal=mrok then
    begin
      dm.AqD114.Close;
      dm.AqD114.Open;
      dm.AqD114.Locate('rkey',dm.ADO114RKEY.Value,[]);
      dm.ADO114.Close;
      dm.ADO105.Close;
      dm.ADO106.Close;
    end
    else
    begin
      dm.ADO114.Close;
    end;
  finally
    form2.Free;
  end;
end;

procedure TForm1.N21Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0)
  ELSE
  try
    form2:=tform2.Create(application);
    dm.ado114.Close;
    dm.ado114.Parameters[0].Value:=null;
    dm.ado114.Open;
    dm.ado114.Append;
    dm.ado114TTYPE.Value:= 5;  //转帐现金收据(应等于5等帐龄程序做好后再做)
    dm.ado114CSI_USER_PTR.AsString:=rkey73;
    dm.ado114EMPL_PTR.AsString :=user_ptr.Caption;
    dm.ado114TDATE.Value:=sys_sortdate;
    dm.ado114ENTER_DATE.Value:=sys_sortdate;
    dm.ado114STATUS.Value:=1;
    dm.ado114AMOUNT.Value:=0;
    dm.ado114trans_pl.Value:=self.trans_pl;
    dm.ado114IF_VOUCHER.AsBoolean:=true;
    form2.BitBtn6.Enabled:=false;
    if form2.ShowModal=mrok then
    begin
      dm.AqD114.Close;
      dm.AqD114.Open;
      dm.AqD114.Locate('rkey',dm.ADO114RKEY.Value,[]);
      dm.ADO114.Close;
      dm.ADO105.Close;
      dm.ADO106.Close;
      dm.ado116.Close;
    end
    else
    begin
      dm.ado114.Close;
    end;
  finally
    form2.Free;
  end;
end;

procedure TForm1.N17Click(Sender: TObject);     //编辑
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
    exit;
  end;

  dm.ado105.Close;
  dm.ado105.Parameters[0].Value:=dm.Aqd114rkey.Value;
  dm.ado105.Open;
  if dm.ado105STATUS.Value>0 then
  begin
    messagedlg('发票生成的会计凭证已被审核,无法编辑!',mtinformation,[mbok],0);
    dm.ADO105.Close;
    exit;
  end;

  dm.ado116.Close;
  dm.ado116.Parameters[0].Value:=dm.Aqd114rkey.Value;
  dm.ado116.open;
  if (not dm.ado116.IsEmpty) and (dm.ado116AMOUNT.Value<>dm.ado116AVL_AMT.Value) then
  begin
    messagedlg('贷项备忘已被使用,无法编辑!',mtinformation,[mbok],0);
    exit;
  end;

  if dm.aqd114TTYPE.Value<>2 then
    try
      form2:=tform2.Create(application);
      dm.ado114.Close;
      dm.ado114.Parameters[0].Value:=dm.aqd114rkey.Value;
      dm.ado114.Open;
      dm.ado114.Edit;
      with form2 do
      begin
        BitBtn6.Enabled:=false;
        bitbtn5.Enabled:=false;
        bitbtn4.Enabled:=false;
        button1.Enabled:=false;
        button2.Enabled:=false;
        button3.Enabled:=false;
        button4.Enabled:=false;
        ComboBox1.Enabled:=false;
        edit4.Text:=trim(dm.ado114REFERENCE_NO.Value);
        if trim(dm.aqd114BANK_NAME.Value)<>'' then
        begin
          edit3.Text:=dm.aqd114BANK_NAME.Value;
          stext3.Caption:=currtostr(dm.aqd114bal_amount.Value-
                                   dm.aqd114AMOUNT.Value);
        end;
        edit1.Text:=dm.aqd114CUST_CODE.Value;
        abbr_name.Caption:=dm.aqd114ABBR_NAME.Value;
        label14.Caption:=dm.aqd114CUSTOMER_NAME.Value;
        edit2.Text:=dm.aqd114CURR_CODE.Value;
        label15.Caption:=dm.aqd114CURR_NAME.Value;
        edit5.Text:=dm.aqd114EXCHANGE_RATE.AsString;
        edit6.Text:=dm.aqd114AMOUNT.AsString;
        edit15.Text:=dm.aqd114DEBIT_AMOUNT.AsString;
      end;
      if form2.ShowModal=mrok then
      begin
        dm.AqD114.Close;
        dm.AqD114.Open;
        dm.AqD114.Locate('rkey',dm.ADO114RKEY.Value,[]);
        dm.ADO114.Close;
        dm.ADO105.Close;
        dm.ADO106.Close;
        dm.ado116.Close;
        dm.ADO128.Close;
      end
      else
      begin
        dm.ado114.Close;
      end;
    finally
      form2.Free;
    end
  else
    try
      form3:=tform3.Create(application);
      Form3.tag:=0;
      dm.ado114.Close;
      dm.ado114.Parameters[0].Value:=dm.aqd114rkey.Value;
      dm.ado114.Open;
      dm.ado114.Edit;
      with form3 do
      begin
        with ADO152 do
        begin
          Close;
          Parameters[0].Value:=DM.ado114RKEY.Value;
          Open;
        end;

        edit4.Text:=trim(dm.ado114REFERENCE_NO.Value);
        if trim(dm.aqd114BANK_NAME.Value)<>'' then
        begin
          edit3.Text:=dm.aqd114BANK_NAME.Value;
          stext3.Caption:=currtostr(dm.aqd114bal_amount.Value-
                                dm.aqd114AMOUNT.Value);
        end;
        edit1.Text:=dm.aqd114CUST_CODE.Value;
        abbr_name.Caption:=dm.aqd114ABBR_NAME.Value;
        label14.Caption:=dm.aqd114CUSTOMER_NAME.Value;
        edit2.Text:=dm.aqd114CURR_CODE.Value;
        label15.Caption:=dm.aqd114CURR_NAME.Value;
        edit5.Text:=dm.aqd114EXCHANGE_RATE.AsString;
        edit6.Text:=dm.aqd114AMOUNT.AsString;

        edit10.Text:=dm.aqd114DEBIT_AMOUNT.AsString;
        bitbtn4.Enabled:=false;
        bitbtn6.Enabled:=false;
        
      end;
      if form3.ShowModal=mrok then
      begin
        dm.AqD114.Close;
        dm.AqD114.Open;
        dm.AqD114.Locate('rkey',dm.ADO114RKEY.Value,[]);
        dm.ADO114.Close;
        dm.ADO105.Close;
        dm.ADO106.Close;
        dm.ado116.Close;
        dm.ADO128.Close;
      end
      else
       dm.ado114.Close;
    finally
      form3.Free;
    end;
end;

procedure TForm1.N22Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0)
  ELSE
    try
      form3:=tform3.Create(application);
      Form3.tag:=0;
      dm.ado114.Close;
      dm.ado114.Parameters[0].Value:=null;
      dm.ado114.Open;
      dm.ado114.Append;
      dm.ado114TTYPE.Value:=2;  //预收现金收据
      dm.ado114STATUS.Value:=1;//状态
      dm.ado114CSI_USER_PTR.AsString:=rkey73;
      dm.ado114EMPL_PTR.AsString :=user_ptr.Caption;
      dm.ado114TDATE.Value:=sys_sortdate;
      dm.ado114ENTER_DATE.Value:=sys_sortdate;
      dm.ado114AMOUNT.Value:=0;
      dm.ado114trans_pl.Value:=self.trans_pl;
      dm.ado114IF_VOUCHER.AsBoolean:=true;
      dm.ADO04.Close;
      dm.ADO04.Open;
      if dm.ADO04SEED_FLAG.Value<>1 then
        form3.Edit7.Text:=dm.ADO04SEED_VALUE.Value;
      Form3.ADO152.Close;
      Form3.ADO152.Parameters[0].Value:=0;
      Form3.ADO152.Open;

      if form3.ShowModal=mrok then
      begin
        dm.AqD114.Close;
        dm.AqD114.Open;
        dm.AqD114.Locate('rkey',dm.ADO114RKEY.Value,[]);
        dm.ADO114.Close;
        dm.ADO105.Close;
        dm.ADO106.Close;
      end
      else
      begin
        dm.ADO114.Close;
      end;
    finally
      form3.Free;
    end;
end;

procedure TForm1.N18Click(Sender: TObject);
begin
  if dm.aqd114TTYPE.Value<>2 then
    try
      form2:=tform2.Create(application);
      dm.ado114.Close;
      dm.ado114.Parameters[0].Value:=dm.aqd114rkey.Value;
      dm.ado114.Open;

      with form2 do
      begin
        BitBtn6.Enabled:=false;
        bitbtn5.Enabled:=false;
        bitbtn4.Enabled:=false;
        button1.Enabled:=false;
        button2.Enabled:=false;
        ComboBox1.Enabled:=false;

        edit4.Text:=trim(dm.ado114REFERENCE_NO.Value);
        if trim(dm.aqd114BANK_NAME.Value)<>'' then
        begin
          edit3.Text:=dm.aqd114BANK_NAME.Value;
          stext3.Caption:=currtostr(dm.aqd114bal_amount.Value-
                             dm.aqd114AMOUNT.Value);
        end;
        edit1.Text:=dm.aqd114CUST_CODE.Value;
        abbr_name.Caption:=dm.aqd114ABBR_NAME.Value;
        label14.Caption:=dm.aqd114CUSTOMER_NAME.Value;
        edit2.Text:=dm.aqd114CURR_CODE.Value;
        label15.Caption:=dm.aqd114CURR_NAME.Value;
        edit5.Text:=dm.aqd114EXCHANGE_RATE.AsString;
        edit6.Text:=dm.aqd114AMOUNT.AsString;
        edit15.Text:=dm.aqd114DEBIT_AMOUNT.AsString;
        toolbar1.Enabled:=false;
        bitbtn1.Enabled:=false;
        sgrid1.Enabled:=false;
        updown1.Enabled:=false;
        sgrid3.PopupMenu:=nil;
        sgrid3.Options:=sgrid3.Options-[goEditing];
        sgrid4.Options:=sgrid4.Options-[goEditing];
        edit4.Enabled:=false;
        edit5.Enabled:=false;
        edit6.Enabled:=false;
        edit15.Enabled:=false;
        dbedit2.Enabled:=false;
        dbedit3.Enabled:=false;
        DBCheckBox1.Enabled:= false;
      end;
      if form2.ShowModal=mrok then
      begin
        dm.AqD114.Close;
        dm.AqD114.Open;
        dm.AqD114.Locate('rkey',dm.ADO114RKEY.Value,[]);
        dm.ADO114.Close;
        dm.ADO105.Close;
        dm.ADO106.Close;
        dm.ado116.Close;
        dm.ADO128.Close;
      end
      else
      begin
        dm.ado114.Close;
      end;
    finally
      form2.Free;
    end
  else
    try
      form3:=tform3.Create(application);
      Form3.tag:=1;       //检查
      dm.ado114.Close;
      dm.ado114.Parameters[0].Value:=dm.aqd114rkey.Value;
      dm.ado114.Open;

      with form3 do
      begin
        with ADO152 do
        begin
          Close;
          Parameters[0].Value:=DM.ado114RKEY.Value;
          Open;
        end;
        DBGrd.ReadOnly:=True;

        edit4.Text:=trim(dm.ado114REFERENCE_NO.Value);
        edit3.Text:=dm.aqd114BANK_NAME.Value;
        stext3.Caption:=currtostr(dm.aqd114bal_amount.Value-
                                  dm.aqd114AMOUNT.Value);
        edit1.Text:=dm.aqd114CUST_CODE.Value;
        abbr_name.Caption:=dm.aqd114ABBR_NAME.Value;
        label14.Caption:=dm.aqd114CUSTOMER_NAME.Value;
        edit2.Text:=dm.aqd114CURR_CODE.Value;
        label15.Caption:=dm.aqd114CURR_NAME.Value;
        edit5.Text:=dm.aqd114EXCHANGE_RATE.AsString;
        edit6.Text:=dm.aqd114AMOUNT.AsString;

        edit10.Text:=dm.aqd114DEBIT_AMOUNT.AsString;
        edit12.ReadOnly:=true;
        bitbtn4.Enabled:=false;
        bitbtn6.Enabled:=false;
        BitBtn2.Enabled:=False;

        toolbar1.Enabled:=false;
        bitbtn1.Enabled:=false;

        sgrid1.Enabled:=false;
        updown1.Enabled:=false;
        edit4.Enabled:=false;
        edit5.Enabled:=false;
        edit6.Enabled:=false;
        edit7.Enabled:=false;
        edit8.Enabled:=false;
        edit10.Enabled:=false;
        dbedit2.Enabled:=false;
        dbedit3.Enabled:=false;
        DBCheckBox1.Enabled:= false;

      end;
      if form3.ShowModal=mrok then
      begin
        dm.AqD114.Close;
        dm.AqD114.Open;
        dm.AqD114.Locate('rkey',dm.ADO114RKEY.Value,[]);
        dm.ADO114.Close;
        dm.ADO105.Close;
        dm.ADO106.Close;
        dm.ado116.Close;
        dm.ADO128.Close;
      end
      else
        dm.ado114.Close;
    finally
      form3.Free;
    end;
end;

procedure TForm1.N19Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
    exit;
  end;

  if strtoint(self.user_ptr.Caption)<> dm.aqd114empl_ptr.Value then
  begin
    messagedlg('对不起!取消操作必需由创建人自己完成!',mtinformation,[mbok],0);
    exit;
  end;

  dm.ADO114.Close;
  dm.ADO114.Parameters[0].Value:=dm.AqD114rkey.Value;
  dm.ADo114.Open;
  if dm.Aqd114STATUS114.Value<>dm.ADO114STATUS.Value then
  begin
    messagedlg('票据状态发生变化不能取消!',mtinformation,[mbok],0);
    dm.ADO114.Close;
    exit;
  end;

  dm.ado116.Close;
  dm.ado116.Parameters[0].Value:=dm.Aqd114rkey.Value;
  dm.ado116.open;
  if (not dm.ado116.IsEmpty) and (dm.ado116AMOUNT.Value<>dm.ado116AVL_AMT.Value) then
  begin
    messagedlg('贷项备忘已被使用,无法了取消!',mtinformation,[mbok],0);
    exit;
  end;

  dm.ado105.Close;
  dm.ado105.Parameters[0].Value:=dm.Aqd114rkey.Value;
  dm.ado105.Open;
  if dm.ado105STATUS.Value>0 then
  begin
    messagedlg('发票生成的会计凭证已被审核,无法取消!',mtinformation,[mbok],0);
    dm.ADO105.Close;
    exit;
  end;

  if messagedlg('请确认是否要取消该现金收据?',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
    dm.ADOConnection1.BeginTrans;
    try
      if dm.ado114BANK_PTR.Value>0 then
      begin
        dm.ado128.Close;
        dm.ADO128.Parameters[0].Value:=dm.ADO114BANK_PTR.Value;
        dm.ado128.Open;
        dm.ADO128.Edit;
        dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value-
                                  dm.ADO114AMOUNT.Value+dm.ado114DEBIT_AMOUNT.Value;
        dm.ADO128.Post;
      end;
      if dm.ado114TTYPE.Value<>2 then  //不等于预收帐款,现银转帐收款
        self.update_invcre;

      if not dm.ado116.IsEmpty then dm.ado116.Delete;

      if not dm.ado105.isempty then
      begin
        dm.ADO105.Edit;
        dm.ADO105STATUS.Value:=5;
        dm.ADO105.Post;
      end;
      dm.ado114.Edit;
      dm.ado114STATUS.Value:=3;
      dm.ado114.post;

      dm.ADOConnection1.CommitTrans;
      messagedlg('数据取消操作成功!',mtinformation,[mbok],0);
      dm.aqd114.Close;
      dm.aqd114.Open;
      dm.aqd114.Locate('rkey',dm.ado114RKEY.Value,[]);
      dm.ado114.Close;
      dm.ADO105.Close;
    except
      on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TForm1.N23Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0)
  ELSE
  try
    form3:=tform3.Create(application);
    Form3.tag:=0;
    dm.ado114.Close;
    dm.ado114.Parameters[0].Value:=null;
    dm.ado114.Open;
    dm.ado114.Append;
    dm.ado114TTYPE.Value:=2;  //预收现金收据
    dm.ado114STATUS.Value:=1;//状态
    dm.ado114CSI_USER_PTR.AsString:=rkey73;
    dm.ado114EMPL_PTR.AsString :=user_ptr.Caption;
    dm.ado114TDATE.Value:=sys_sortdate;
    dm.ado114ENTER_DATE.Value:=sys_sortdate;
    dm.ado114AMOUNT.Value:=0;
    dm.ado114trans_pl.Value:=self.trans_pl;
    dm.ado114IF_VOUCHER.AsBoolean:=true;
    dm.ADO04.Close;
    dm.ADO04.Open;
    if dm.ADO04SEED_FLAG.Value<>1 then
      form3.Edit7.Text:=dm.ADO04SEED_VALUE.Value;
    form3.BitBtn6.Enabled:=false;   //银行帐号
    form3.BitBtn5.Enabled:=true;    //货币指针
    Form3.ADO152.Close;
    Form3.ADO152.Parameters[0].Value:=0;
    Form3.ADO152.Open;    
    if form3.ShowModal=mrok then
    begin
      dm.AqD114.Close;
      dm.AqD114.Open;
      dm.AqD114.Locate('rkey',dm.ADO114RKEY.Value,[]);
      dm.ADO114.Close;
      dm.ADO105.Close;
      dm.ADO106.Close;
    end
    else
    begin
      dm.ADO114.Close;
    end;
  finally
    form3.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败,请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:= application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

//  rkey73:='1';
//  vprev:='4';

  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  form_receivable.free;
end;

procedure TForm1.N30Click(Sender: TObject);
begin
  form_receivable.show;
end;

procedure TForm1.N31Click(Sender: TObject);
begin
  Frm_AdvanceDetails:=TFrm_AdvanceDetails.Create(Application);
  with Frm_AdvanceDetails do
  begin
    dtpk1.Date:=sys_sortdate-dayof(sys_sortdate)+1;
    dtpk2.Date:=sys_sortdate;
    ADO152.Close;
    ADO152.parameters.ParamByName('vdate1').Value:=formatdatetime('YYYY-MM-DD',dtpk1.Date);
    ADO152.parameters.ParamByName('vdate2').Value:=formatdatetime('YYYY-MM-DD',dtpk2.Date);
    ADO152.Prepared;
    ADO152.Open;
    ShowModal;
  end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  Popup3.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm1.N32Click(Sender: TObject);
begin
   Form4:=TForm4.Create(Application);
  with Form4 do
  begin
    dtp1.Date:=sys_sortdate-dayof(sys_sortdate)+1;
    dtp2.Date:=sys_sortdate;
    ADO115.Close;
    ADO115.parameters.ParamByName('vdate3').Value:=formatdatetime('YYYY-MM-DD',dtp1.Date);
    ADO115.parameters.ParamByName('vdate4').Value:=formatdatetime('YYYY-MM-DD',dtp2.Date);
    ADO115.Prepared;
    ADO115.Open;
    ShowModal;
  end;
end;

end.
