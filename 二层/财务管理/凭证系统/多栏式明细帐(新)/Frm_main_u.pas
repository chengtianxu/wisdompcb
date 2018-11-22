unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, ExtCtrls, Grids, DBGridEh,DateUtils, DB,Excel2000,
  ClipBrd, ComObj,math, ADODB, DBClient;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    DS: TDataSource;
    CheckBox1: TCheckBox;
    DBGridEh1: TDBGridEh;
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    FsY,FsM:string;
    FD_C:string;
    Frkey:integer;
    Arr_m,Arr_y:array of double;     //Arr_m各子科目的本期累计，Arr_y各子科目的本年累计
    FDate:TDatetime;
    ADOD526: TADODataSet;


    procedure DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;
       Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure glAccNo(edt:TEdit);
    procedure set_field(vfield :string);
    Procedure set_title;
    procedure set_open(pm :integer);
    procedure set_close(pm :integer;var pClose:Currency);
    procedure set_brows(pM:integer);
    procedure SumDC(pm:integer);
    procedure set_Last;

    procedure crtAdo;
  public

    procedure init;
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
 uses DM_u,AcctSearch,AcctNote,common;
{$R *.dfm}


procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;


  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  
  //DM.ADOCon.Open;
  init;
end;

procedure TFrm_main.Edit1Exit(Sender: TObject);
begin
  if trim(Tedit(sender).text)='' then exit;
  DM.Tmp1.close;
  DM.Tmp1.SQL.Text:='SELECT gl_acc_number from data0103 where gl_acc_number='''+trim(Tedit(sender).text)+'''';
  DM.Tmp1.open;
  if DM.Tmp1.RecordCount =0 then
  begin
    messagedlg('科目代码不正确!',mtinformation,[mbok],0);
    Tedit(sender).SetFocus ;
    abort;
  end;
end;

procedure TFrm_main.init;
begin
  DM.Qry508.Open;
  FsY:=DM.Qry508.fieldbyname('curr_FYEAR').asstring;
  FsM:=DM.Qry508.fieldbyname('curr_period').asstring;
  spinedit1.MaxValue :=strtoint(FsY);

  spinedit1.text:=FsY;
  spinedit2.text:='1';
  spinedit3.text:=FsM;
  FD_C:='';
  FDate:=0;
end;

procedure TFrm_main.glAccNo(edt: TEdit);
var sGLno: string;
    i:integer;
begin
  if TFrmAcctSearch.getGL_AccNo(sGLno,FD_C,FRkey) then  edt.Text:=sGLno;

end;


procedure TFrm_main.BitBtn4Click(Sender: TObject);
begin
  glAccNo(Edit1);
end;

procedure TFrm_main.SpeedButton2Click(Sender: TObject);
var i,j :integer;
    v_sql:string;
begin
  if (trim(Edit1.Text)='')  then
   begin
    messagedlg('请输入科目代码!',mtinformation,[mbok],0);
    exit;
   end;
 if spinedit2.Value>spinedit3.Value then
  begin
   showmessage('开始期间不能大于结束期间!');
   spinedit2.SetFocus;
   exit;
  end;
 if spinedit1.Value=DM.Qry508.fieldbyname('curr_FYEAR').AsInteger then
 if spinedit2.Value>DM.Qry508.fieldbyname('curr_period').AsInteger then
  begin
   showmessage('开始期间不能大于当前会计期间!');
   spinedit2.SetFocus;
   exit;
  end;


  DM.Tmp1.Close;

  DM.Tmp1.SQL.Text:='SELECT RKEY,CASE data0103.db_cr WHEN ''D'' THEN ''借'' WHEN ''C'' THEN ''贷'' END AS D_C '+
                    'FROM dbo.Data0103 WHERE (HAS_CHILD> 0) and (multi_column_flag=1) and '+
                    'gl_acc_number='''+Edit1.Text+'''';

  DM.Tmp1.Open;
  if DM.Tmp1.IsEmpty then
  begin
    showmessage('科目输入错误...');
    exit;
  end;
  Frkey:=DM.Tmp1.fields[0].AsInteger;
  FD_C:=DM.Tmp1.fields[1].AsString ;


  with DM.ADOQ103 do
  begin
    Close;
    parameters[0].Value:=Frkey;
    open;
    if not IsEmpty then
    begin
      setlength(Arr_m,RecordCount);
      setlength(Arr_y,RecordCount);
      for i:=low(Arr_m) to high(Arr_m) do begin Arr_m[i]:=0;Arr_y[i]:=0; end;
    end ;
  end;

  Screen.Cursor := crHourGlass;
  crtAdo;
  Set_title;        //设置title栏目
  for i:=strtoint(spinedit2.Text) to strtoint(spinedit3.Text) do
  begin
   set_open(i);    //设置期初余额

   if checkbox1.Checked then
     v_sql:=' and data0105.STATUS<>5 '
   else
     v_sql:=' and data0105.STATUS=3 ';  //只包括过账的凭证

   with DM.ADOQ106 do
   begin
     close;
     SQL.Text:='SELECT Data0106.GL_ACCT_NO_PTR,Data0105.VOUCHER, Data0105.ENTERED_DT AS tdate,Data0106.DESCRIPTION,'+
                'Data0106.D_C,ROUND(Data0106.AMOUNT,2) amount,Data0105.PERIOD,Data0105.STATUS,data0103.gl_description '+
                'FROM Data0105 INNER JOIN '+
                'Data0106 ON Data0105.RKEY=Data0106.GL_HEADER_PTR '+
                'inner join data0103 on data0103.rkey=data0106.gl_acct_no_ptr '+
                'where data0105.fyear='+spinedit1.Text+
                ' and data0103.parent_ptr='+inttostr(Frkey)+
                ' and data0105.period='+inttostr(i)+v_sql+
                ' order by Data0105.ENTERED_DT,data0105.voucher';
     open;
     while not Eof do
     begin
       Set_Brows(i);  //设置本期发生额
       Next;
     end;
     SumDC(i);        //本期小计
     for j:=low(Arr_m) to  high(Arr_m) do
     begin
       Arr_y[j]:=Arr_m[j]+Arr_y[j];  //累计本年
       Arr_m[j]:=0.0;
     end;
   end;
  end;
  set_Last;         //本年累计
  Screen.Cursor := crDefault;
  DBGridEh1.DataSource.DataSet.First;
end;

procedure TFrm_main.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_main.DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;
  Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
   if  DBGridEHName.DataSource.DataSet.RecNo  mod 2=0 then
   begin
        DBGridEHName.Canvas.Brush.Color:=clinfobk;
        DBGridEHName.Canvas.FillRect(rect);
        DBGridEHName.Canvas.font.color:=clblack;
   end
   else
   begin
        DBGridEHName.Canvas.Brush.Color:=clwhite;
        DBGridEHName.Canvas.FillRect(rect);
        DBGridEHName.Canvas.font.color:=clblack;
   end;

   if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
   begin
      DBGridEHName.Canvas.Brush.Color:=RGB(0,224,224);
      DBGridEHName.Canvas.FillRect(rect);
      DBGridEHName.Canvas.font.color:=clblack;
   end;
   DBGridEHName.DefaultDrawColumnCell(rect,datacol,column,state);  
end;

procedure TFrm_main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
end;

procedure TFrm_main.SpeedButton4Click(Sender: TObject);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
 if (ADOD526=nil) or not ADOD526.Active or (ADOD526.RecordCount=0) then exit;
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
   XLApp.SheetsInNewWorkbook := 1;
   XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrideh(self.DBGrideh1).DataSource.DataSet.Active then
     begin
      Screen.Cursor := crDefault;
      Exit;
     end;
   TDBGrideh(DBGrideh1).DataSource.DataSet.DisableControls;
   TDBGrideh(DBGrideh1).DataSource.DataSet.first;
   v_cloumn:=TDBGrideh(DBGrideh1).Columns.Count;
   v_cloumn:=Floor(v_cloumn/2);

   Sheet.Cells[1, v_cloumn] :='多栏明细帐';

   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;

   Sheet.Cells[2, v_cloumn+1] :='会计期间:'+SpinEdit1.Text+'年'+SpinEdit2.Text +'月到'+SpinEdit3.Text+'月';
   Sheet.Cells[2, v_cloumn+1].Font.bold := True;
   v_cloumn:=0;
   //列头
   for iCount := 0 to TDBGrideh(DBGrideh1).Columns.Count - 1 do
     if TDBGrideh(DBGrideh1).Columns.Items[iCount].Visible=true then
       begin
        Sheet.Cells[3, iCount + 1 - v_cloumn] :=
         TDBGrideh(DBGrideh1).Columns.Items[iCount].Title.Caption;
        Sheet.Cells[3, iCount + 1 - v_cloumn].Font.bold := True;
       end
     else
      inc(v_cloumn);
   jCount := 4;
   //行
   while not TDBGrideh(DBGrideh1).DataSource.DataSet.Eof do
     begin
      v_cloumn:=0;
      for iCount := 0 to TDBGrideh(DBGrideh1).Columns.Count - 1 do
       if TDBGrideh(DBGrideh1).Columns.Items[iCount].Visible=true then
          Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=TDBGrideh(DBGrideh1).Columns.Items[iCount].Field.AsString
       else
         inc(v_cloumn);
      Inc(jCount);
      TDBGrideh(DBGrideh1).DataSource.DataSet.Next;
     end;
   XlApp.Visible := True;
   TDBGrideh(DBGrideh1).DataSource.DataSet.EnableControls;

   Screen.Cursor := crDefault;
end;

procedure TFrm_main.DBGridEh1DblClick(Sender: TObject);
begin
  if (ADOD526=nil) or not ADOD526.Active or (ADOD526.RecordCount=0) then exit;

 if ADOD526.FieldByName('voucher').asstring<>'' then
 try
  Application.CreateForm(TFrmAcctNote, FrmAcctNote);
  dm.Qry105_106.close;
  dm.Qry105_106.Parameters.ParamByName('vVoucher').Value :=ADOD526.FieldByName('voucher').asstring;
  dm.Qry105_106.Open ;

  FrmAcctNote.Edit6.text:=DM.Qry105_106.FieldByName('voucher').asstring;
  FrmAcctNote.datetimepicker1.DateTime :=DM.Qry105_106.fieldbyname('ENTERED_DT').asdatetime;
  FrmAcctNote.edit5.Text:=DM.Qry105_106.fieldbyname('attached').asstring;
  FrmAcctNote.edit1.Text:=DM.Qry105_106.fieldbyname('FYEAR').asstring;
  FrmAcctNote.edit4.Text:=DM.Qry105_106.fieldbyname('PERIOD').asstring;
  FrmAcctNote.edit7.Text:=DM.Qry105_106.fieldbyname('EMPLOYEE_NAME').asstring;

  DM.Qry105_106.First ;
  with DM.Qry105_106 do
  while not eof do
  begin
    FrmAcctNote.stringgrid1.RowCount:=FrmAcctNote.stringgrid1.RowCount+1;
    FrmAcctNote.stringgrid1.Cells[0,FrmAcctNote.stringgrid1.RowCount-2]:=
      Fieldbyname('description').asstring;
    FrmAcctNote.stringgrid1.Cells[1,FrmAcctNote.stringgrid1.RowCount-2]:=
      trim(Fieldbyname('gl_acc_number').asstring)+'-'+Fieldbyname('GL_DESCRIPTION').asstring;
    FrmAcctNote.stringgrid1.Cells[2,FrmAcctNote.stringgrid1.RowCount-2]:=
             Fieldbyname('CURR_CODE').asstring;
    FrmAcctNote.stringgrid1.Cells[3,FrmAcctNote.stringgrid1.RowCount-2]:=
                   Fieldbyname('EXCH_RATE').AsString;
    FrmAcctNote.stringgrid1.Cells[4,FrmAcctNote.stringgrid1.RowCount-2]:=
                        Fieldbyname('orig_amount').AsString;

    if UpperCase(Fieldbyname('d_c').asstring)='D' then
      FrmAcctNote.stringgrid1.Cells[5,FrmAcctNote.stringgrid1.RowCount-2]:=
       Fieldbyname('AMOUNT').asstring
    else
      FrmAcctNote.stringgrid1.Cells[6,FrmAcctNote.stringgrid1.RowCount-2]:=
       Fieldbyname('AMOUNT').asstring;
    next;
  end;

  FrmAcctNote.ttype.Caption :='2';
  FrmAcctNote.showmodal;
  dm.Qry105_106.close;
 finally
   FrmAcctNote.free;
 end;
end;

procedure TFrm_main.set_field(vfield: string);
begin
  with ADOD526.FieldDefs do
  begin
    with AddFieldDef do
    begin
       Name := vfield;
       DataType := ftCurrency;
    end;
  end;
end;


procedure TFrm_main.set_title;
begin
  try
    with DM.Tmp1 do
    begin
      close;
      SQl.Text:='select gl_description from data0103 where gl_acc_number like '''+Edit1.Text+'%'' and len(gl_acc_number)>'+
                inttostr(length(Edit1.Text))+' order by gl_acc_number';
      open;
      while not Eof do
      begin
        set_field(fieldbyname('gl_description').asstring);
        DBGridEh1.Columns.Insert(RecNo+2);
        DBGridEh1.Columns[RecNo+2].Title.caption:=FD_C+'|'+FieldValues['gl_description'];
        DBGridEh1.Columns[RecNo+2].FieldName:=fieldbyname('gl_description').Value;
        DBGridEh1.Columns[RecNo+2].Width:=120;
        Next;
      end;
      DBGridEh1.Columns[3+RecordCount].Title.Caption:=FD_C+'|合计';
      ADOD526.CreateDataSet;
    end;
  except
    on E:exception do
    begin
      //ShowMessage(E.Message);
      MessageDlg('创建多栏式列失败！',  mtError, [mbOK], 0);
      Screen.Cursor := crDefault;
      Abort;
    end;
  end;
end;

procedure TFrm_main.set_open(pm: integer);
 var
  vClose:Currency;
begin
   if pm=strtoint(spinedit2.Text) then
     set_close(pm,vClose)       //获取期末余额
   else
     vClose:=ADOD526.fieldbyname('BALANCE').AsCurrency;
   with ADOD526 do
   begin
     append;
     FieldByName('DESCRIPTION').AsString :=inttostr(pm)+'月份期初余额' ;
     if vClose<>0  then
       FieldByName('DB_CR').AsString :=FD_C
     else
       FieldByName('DB_CR').AsString :='平';
     FieldByName('BALANCE').AsCurrency :=vClose;
   end;

end;

procedure TFrm_main.set_close(pm: integer; var pClose: Currency);
var
  vCurrp,vyear:integer;
begin
  vCurrp:=pm;
  vyear:=strtoint(SpinEdit1.text);
  if vCurrp=1 then
  begin
    vyear:=vyear-1;
    vCurrp:=12;
  end else
   vCurrp:=vCurrp-1;

  with DM.Tmp1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from data0110');
    sql.Add('where GL_ACCT_PTR='+inttostr(Frkey));
    sql.Add('and fyear='+inttostr(vyear));
    open;
    if not IsEmpty  then
      pclose:=FieldValues['TYR_PERIOD_'+inttostr(vCurrp)+'_CLOSE']
    else
      pClose:=0.0;
  end;
end;

procedure TFrm_main.set_brows(pM: integer);
var
  vClose:Currency;
begin
  vClose:=ADOD526.FieldByName('BALANCE').AsCurrency ;
  ADOD526.Append;
  if FDate<>dm.ADOQ106.FieldByName('tdate').Value then
    ADOD526.FieldByName('TDATE').Value:=dm.ADOQ106.FieldByName('tdate').Value;
  FDate:=dm.ADOQ106.FieldByName('tdate').AsDateTime;
  ADOD526.FieldByName('VOUCHER').Value:=dm.ADOQ106.FieldByName('VOUCHER').Value;
  ADOD526.FieldByName('DESCRIPTION').Value:=trim(dm.ADOQ106.FieldByName('DESCRIPTION').AsString);

  if FD_C='借' then
  begin
    if dm.ADOQ106.FieldByName('d_c').AsString='D'then
    begin
      ADOD526.FieldByName(dm.ADOQ106.FieldByName('gl_DESCRIPTION').AsString).Value:=dm.ADOQ106.fieldbyname('amount').Value;
      ADOD526.FieldByName('AMOUNT').Value:=dm.ADOQ106.fieldbyname('amount').Value;
    end else
    begin
      ADOD526.FieldByName(dm.ADOQ106.FieldByName('gl_DESCRIPTION').AsString).Value:=-dm.ADOQ106.fieldbyname('amount').Value;
      ADOD526.FieldByName('AMOUNT').Value:=-dm.ADOQ106.fieldbyname('amount').Value;
    end;
  end else begin
    if dm.ADOQ106.FieldByName('d_c').AsString='D'then
    begin
      ADOD526.FieldByName(dm.ADOQ106.FieldByName('gl_DESCRIPTION').AsString).Value:=-dm.ADOQ106.fieldbyname('amount').Value;
      ADOD526.FieldByName('AMOUNT').Value:=-dm.ADOQ106.fieldbyname('amount').Value;
    end else
    begin
      ADOD526.FieldByName(dm.ADOQ106.FieldByName('gl_DESCRIPTION').AsString).Value:=dm.ADOQ106.fieldbyname('amount').Value;
      ADOD526.FieldByName('AMOUNT').Value:=dm.ADOQ106.fieldbyname('amount').Value;
    end;
  end;

  if  dm.ADOQ103.Locate('gl_description',dm.ADOQ106.FieldByName('gl_description').Value,[])then
  begin
    if FD_C='借'  then
    begin
      if dm.ADOQ106.FieldByName('d_c').AsString='D' then
      begin
        Arr_m[dm.ADOQ103.RecNo-1]:=dm.ADOQ106.FieldByName('amount').Value+Arr_m[dm.ADOQ103.RecNo-1]; //计算各子科目的本期累计
        vClose:=vClose+dm.ADOQ106.fieldbyname('amount').Value;                                   //计算各子科目的余额
      end else  if dm.ADOQ106.FieldByName('d_c').AsString='C' then begin
        Arr_m[dm.ADOQ103.RecNo-1]:=Arr_m[dm.ADOQ103.RecNo-1]-dm.ADOQ106.FieldByName('amount').Value;
        vClose:=vClose-dm.ADOQ106.fieldbyname('amount').Value;
      end;
    end else begin
      if dm.ADOQ106.FieldByName('d_c').AsString='C' then
      begin
        Arr_m[dm.ADOQ103.RecNo-1]:=dm.ADOQ106.FieldByName('amount').Value+Arr_m[dm.ADOQ103.RecNo-1];
        vClose:=vClose+dm.ADOQ106.fieldbyname('amount').Value;
      end else begin
        Arr_m[dm.ADOQ103.RecNo-1]:=Arr_m[dm.ADOQ103.RecNo-1]-dm.ADOQ106.FieldByName('amount').Value;
        vClose:=vClose-dm.ADOQ106.fieldbyname('amount').Value;
      end;
    end;
  end;

 if vClose=0 then
   ADOD526.FieldByName('DB_CR').Value :='平'
 else
   ADOD526.FieldByName('DB_CR').Value :=FD_C;
 ADOD526.FieldByName('BALANCE').AsCurrency :=vClose;
end;

procedure TFrm_main.set_Last;
var
  v_des :string;
  v_total,v_k : double;
begin
  v_total:=0;
  v_k:=ADOD526.FieldByName('BALANCE').Value;

  ADOD526.Append;
  ADOD526.FieldByName('DESCRIPTION').Value:='本年累计';
  ADOD526.FieldByName('DB_CR').Value:=FD_C;
  ADOD526.FieldByName('BALANCE').Value:=v_k;
  dm.ADOQ103.First;
  while not dm.ADOQ103.Eof do
  begin
    v_total:=v_total+Arr_y[dm.ADOQ103.RecNo-1];
    v_des:=dm.ADOQ103.fieldbyname('gl_description').Value;
    ADOD526.FieldByName(v_des).Value:=Arr_y[dm.ADOQ103.RecNo-1] ;  //将各明细科目年累计填上
    dm.ADOQ103.Next;
  end;
  ADOD526.FieldByName('AMOUNT').Value:=v_total ;
end;

procedure TFrm_main.SumDC(pm: integer);
var
  v_db,v_des :string;
  v_total,v_k : double;
begin
  v_total:=0;
  v_db:=ADOD526.FieldByName('DB_CR').Value;
  v_k:=ADOD526.FieldByName('BALANCE').Value;

  ADOD526.Append;
  ADOD526.FieldByName('DESCRIPTION').Value:=inttostr(pm)+'月份本期合计';
  ADOD526.FieldByName('DB_CR').Value:=v_db;
  ADOD526.FieldByName('BALANCE').Value:=v_k;

  dm.ADOQ103.First;
  while not dm.ADOQ103.Eof do
  begin
    v_total:=v_total+Arr_m[dm.ADOQ103.RecNo-1];
    v_des:=dm.ADOQ103.fieldbyname('gl_description').Value;
    ADOD526.FieldByName(v_des).Value:=Arr_m[dm.ADOQ103.RecNo-1];
    dm.ADOQ103.Next;
  end;
  ADOD526.FieldByName('AMOUNT').Value:=v_total;

end;

procedure TFrm_main.crtAdo;
var i:integer;
begin
  if DBGridEh1.Columns.Count>6 then
  begin
    ADOD526.Close;
    for i:=3 to DBGridEh1.Columns.Count-4 do DBGridEh1.Columns[3].Free;
  end;
  ADOD526.Free;
  ADOD526:=TADODataSet.Create(self);
  ADOD526.LockType:=ltBatchOptimistic;
  DS.DataSet:=ADOD526;
  with ADOD526.FieldDefs do
  begin
    with AddFieldDef do
    begin
       Name := 'TDATE';
       DataType := ftDate;
    end;
    with AddFieldDef do
    begin
       Name := 'VOUCHER';
       DataType := ftString;
       size:=20;
    end;
    with AddFieldDef do
    begin
       Name := 'DESCRIPTION';
       DataType := ftString;
       size:=80;
    end;
    with AddFieldDef do
    begin
       Name := 'AMOUNT';
       DataType := ftCurrency;
    end;
    with AddFieldDef do
    begin
       Name := 'DB_CR';
       DataType := ftString;
    end;
    with AddFieldDef do
    begin
       Name := 'BALANCE';
       DataType := ftCurrency;
    end;
  end;

end;

end.
