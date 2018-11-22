unit uDLShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGridEh, Buttons, ExtCtrls, DBCtrls,ComObj,math;

type
  TFrmDLShow = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBGridEh1: TDBGridEh;
    Label4: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Panel1: TPanel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
    //设置期初余额
    procedure setTryOpen(const pm:integer);
    //获取上期期末余额

    procedure BrowsGL(const pM:integer;var pSumD,pSumC,pSumD_y,pSumC_y:Currency);

    procedure SumDC(const pm:integer;const pSumD,pSumC,pSumD_y,pSumC_y:Currency);    //小计
    procedure setTryD_C(pm,rkey103:integer;var pTatolD,pTatolC,pTatolD_y,pTatolC_y:Currency);
  public
    { Public declarations }

  end;

var
  FrmDLShow: TFrmDLShow;

implementation

uses DM_u, AcctNote;


{$R *.dfm}
procedure TFrmDLShow.setTryD_C(pm,rkey103:integer;var pTatolD,pTatolC,pTatolD_y,pTatolC_y:Currency);
begin      //本年累计
  dm.Tmp1.Close;
  dm.Tmp1.SQL.Clear;
  dm.Tmp1.SQL.Text:=
  'SELECT dbo.Data0106.D_C, SUM(dbo.Data0106.AMOUNT) AS AMOUNT,'+#13+
  'SUM(Isnull(Data0106.PRICE,0)) AS amount_y'+#13+
  'FROM dbo.Data0105 INNER JOIN'+#13+
  'dbo.Data0106 ON'+#13+
      'dbo.Data0105.RKEY = dbo.Data0106.GL_HEADER_PTR INNER JOIN'+#13+
      'dbo.Data0103 ON dbo.Data0106.GL_ACCT_NO_PTR = dbo.Data0103.RKEY'+#13+
  'WHERE (dbo.Data0105.FYEAR = '+edit1.Text+') '+#13+
         'AND (dbo.Data0105.PERIOD <= '+inttostr(pm)+')'+#13+
         'and (Data0106.GL_ACCT_NO_PTR ='+inttostr(rkey103) +') '+#13+
         'AND (dbo.Data0105.STATUS <> 5)'+#13+
  'GROUP BY dbo.Data0106.D_C';
   if not CheckBox3.Checked then      //包括未过帐的
    dm.Tmp1.sql.Insert(dm.Tmp1.sql.Count-1,'and (data0105.status=3)');
  dm.Tmp1.Open;

  while not dm.Tmp1.Eof do
   begin
    if (UpperCase(dm.Tmp1.FieldByName('D_C').Value)='D') then
     begin
      pTatolD:= pTatolD+ dm.Tmp1.FieldByName('AMOUNT').AsCurrency;
      pTatolD_y:= pTatolD_y+ dm.Tmp1.FieldByName('AMOUNT_y').AsCurrency;
     end
    else
     begin
      pTatolC:= pTatolC+ dm.Tmp1.FieldByName('AMOUNT').AsCurrency ;
      pTatolC_y:= pTatolC_y+ dm.Tmp1.FieldByName('AMOUNT_y').AsCurrency ;
     end;
    dm.Tmp1.Next ;
   end;
  dm.Tmp1.Close;

end;

procedure TFrmDLShow.SumDC(const pm:integer;
                           const pSumD,pSumC,pSumD_y,pSumC_y:Currency);//小计
var
  vstr:string;
  vCur,vcur_y,vTatoD,vTatoC,vTatoD_y,vTatoC_y:Currency;
begin
  vstr:=dm.DS526.FieldByName('DB_CR').Value ;
  vCur:=dm.DS526.FieldByName('BALANCE').AsCurrency;
  vCur_y:=dm.DS526orig_amount.Value;

  dm.DS526.Append ;
  dm.DS526.FieldByName('DESCRIPTION').AsString :=inttostr(pm)+'月份:本月合计' ;//摘要
  dm.DS526.FieldByName('DEBIT').AsCurrency :=pSumD;
  dm.DS526.FieldByName('CREDIT').AsCurrency :=pSumC;
  dm.DS526orig_amountD.Value:=pSumD_y;
  dm.DS526orig_amountC.Value:=pSumC_y;
  dm.DS526.FieldByName('DB_CR').AsString :=vstr;
  dm.DS526.FieldByName('BALANCE').AsCurrency :=vCur;
  dm.DS526orig_amount.Value:=vCur_y;

  vTatoD:=0;
  vTatoC:=0;
  vTatoD_y:=0;
  vTatoC_y:=0;
  self.setTryD_C(pm,dm.Qry0103rkey.Value,vTatoD,vTatoC,vTatoD_y,vTatoC_y);

  dm.DS526.Append ;
  dm.DS526.FieldByName('DESCRIPTION').AsString := '本年累计:' ;//摘要
  dm.DS526.FieldByName('DEBIT').AsCurrency :=vTatoD;
  dm.DS526.FieldByName('CREDIT').AsCurrency :=vTatoC;
  dm.DS526orig_amountD.Value:=vTatoD_y;
  dm.DS526orig_amountC.Value:=vTatoC_y;
  dm.DS526.FieldByName('DB_CR').AsString :=vstr;
  dm.DS526.FieldByName('BALANCE').AsCurrency :=vCur;
  dm.DS526orig_amount.Value:=vCur_y;
end;

procedure TFrmDLShow.setTryOpen(const pm:integer);
var                             //设置期初余额
  vClose,vclose_y:Currency;
begin
 if pm>=1 then
  BEGIN
  vClose:=dm.Qry0103.fieldbyname('TYR_PERIOD_'+inttostr(pm)+'_CLOSE').asCurrency;
  vClose_y:=dm.Qry0103.fieldbyname('TYR_PERIOD_'+inttostr(pm)+'_CLOSE_ORIG').asCurrency;
  END
 else
  begin
  vClose:=dm.Qry0103.fieldbyname('TYR_OPEN').asCurrency;
  vClose_y:=dm.Qry0103.fieldbyname('TYR_OPEN_ORIG').asCurrency;
  end;
 dm.DS526.Append ;
 dm.DS526.FieldByName('DESCRIPTION').AsString :=inttostr(pm+1)+'月份期初余额';//摘要
 dm.DS526DB_CR.Value := dm.Qry0103db_cr.Value;
 dm.DS526.FieldByName('BALANCE').AsCurrency := vClose ;              //上期期末余额
 dm.DS526orig_amount.Value:=vclose_y;
end;



procedure TFrmDLShow.BrowsGL(const pM:integer;var pSumD,pSumC,pSumD_y,pSumC_y:Currency);
var                         //已经结帐
  vD_C:string;
  vClose,vClose_y:Currency;
begin
  vD_C:=trim(dm.DS526DB_CR.Value);          //余额方向
  vClose:=dm.DS526BALANCE.Value;         //上期期末余额
  vClose_y:=dm.DS526orig_amount.Value;
  dm.DS526.Append ;

  dm.DS526.FieldByName('TDATE').AsDateTime :=dm.Qry0106.FieldByName('tdate').AsDateTime;  //凭证日期
  dm.DS526.FieldByName('VOUCHER').AsString :=dm.Qry0106.FieldByName('VOUCHER').asstring;  //凭证号
  dm.DS526.FieldByName('DESCRIPTION').AsString :=dm.Qry0106.FieldByName('DESCRIPTION').AsString ;//摘要
  dm.DS526.FieldByName('CURR_CODE').AsString :=dm.Qry0106.FieldByName('CURR_CODE').AsString ;   //币种
  dm.DS526.FieldByName('EXCH_RATE').AsCurrency :=dm.Qry0106.FieldByName('EXCH_RATE').AsCurrency;//汇率

  dm.DS526remark.Value :=dm.Qry0106.FieldByName('remark').asstring ; //往来对方

  if  UpperCase(dm.Qry0106.FieldByName('d_c').AsString)='D' then
    begin
     dm.DS526.FieldByName('DEBIT').AsCurrency :=
       dm.Qry0106.FieldByName('amount').AsCurrency;   //本币金额

     dm.DS526orig_amountD.Value:=                    //原币金额
      dm.Qry0106.fieldbyname('orig_amount').AsCurrency;
     pSumD:=pSumD+dm.Qry0106.FieldByName('amount').AsCurrency;
     pSumD_y:=pSumD_y+dm.Qry0106.FieldByName('orig_amount').AsCurrency;

    end
  else
    begin
     dm.DS526.FieldByName('CREDIT').AsCurrency :=
         dm.Qry0106.FieldByName('amount').AsCurrency;   //本币金额

     dm.DS526orig_amountC.Value:=                    //原币金额
      dm.Qry0106.fieldbyname('orig_amount').AsCurrency;
     pSumC:=pSumC+dm.Qry0106.FieldByName('amount').AsCurrency;
     pSumC_y:=pSumC_y+dm.Qry0106.FieldByName('orig_amount').AsCurrency;
    end;

 if UpperCase(vD_C)='D' then                                 //期末余额方向
  if UpperCase(dm.Qry0106.FieldByName('d_c').AsString)='D' then  //凭证发生金额方向
   begin
    vClose:=vClose+dm.Qry0106.FieldByName('amount').AsCurrency;
    vClose_y:=vClose_y+dm.Qry0106.FieldByName('orig_amount').AsCurrency;
   end
  else
   begin
    vClose:=vClose-dm.Qry0106.FieldByName('amount').AsCurrency;
    vClose_y:=vClose_y-dm.Qry0106.FieldByName('orig_amount').AsCurrency;
   end
 else
  if UpperCase(dm.Qry0106.FieldByName('d_c').AsString)='D' then
   begin
    vClose:=vClose-dm.Qry0106.FieldByName('amount').AsCurrency;
    vClose_y:=vClose_y-dm.Qry0106.FieldByName('orig_amount').AsCurrency;
   end
  else
   begin
    vClose:=vClose+dm.Qry0106.FieldByName('amount').AsCurrency;
    vClose_y:=vClose_y+dm.Qry0106.FieldByName('orig_amount').AsCurrency;
   end;
  dm.DS526.FieldByName('BALANCE').AsCurrency :=vClose;        //期末本币余额
  dm.DS526orig_amount.Value :=vClose_y;        //期末原币余额
  dm.DS526.FieldByName('DB_CR').AsString :=vD_C;             //余额方向

end;



//查询凭证
procedure TFrmDLShow.DBGridEh1DblClick(Sender: TObject);
begin
 try
  if trim(dm.DS526VOUCHER.Value)='' then exit;
 
  Application.CreateForm(TFrmAcctNote, FrmAcctNote);


  dm.Qry105_106.close;
  dm.Qry105_106.Parameters.ParamByName('vVoucher').Value :=
                                 DM.DS526.FieldByName('voucher').asstring;
  dm.Qry105_106.Open ;


  FrmAcctNote.Edit6.text:=DM.Qry105_106.FieldByName('voucher').asstring;
  FrmAcctNote.datetimepicker1.DateTime :=DM.Qry105_106.fieldbyname('ENTERED_DT').asdatetime;
  FrmAcctNote.edit5.Text :=DM.Qry105_106.fieldbyname('attached').asstring;
  FrmAcctNote.edit1.Text:=DM.Qry105_106.fieldbyname('FYEAR').asstring;
  FrmAcctNote.edit4.Text:=DM.Qry105_106.fieldbyname('PERIOD').asstring;
  FrmAcctNote.edit7.Text:=DM.Qry105_106.fieldbyname('EMPLOYEE_NAME').asstring;


  DM.Qry105_106.First ;
  with DM.Qry105_106 do
  while not eof do
  begin
    FrmAcctNote.stringgrid1.RowCount:=FrmAcctNote.stringgrid1.RowCount+1;
    FrmAcctNote.stringgrid1.Cells[0,FrmAcctNote.stringgrid1.RowCount-2]:=
      Fieldbyname('description').asstring;   //摘要
    FrmAcctNote.stringgrid1.Cells[1,FrmAcctNote.stringgrid1.RowCount-2]:=
      trim(Fieldbyname('gl_acc_number').asstring)+'-'+
      Fieldbyname('GL_DESCRIPTION').asstring;

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
   FrmAcctNote.free;;
 end;
end;

procedure TFrmDLShow.SpeedButton1Click(Sender: TObject);
begin
 FrmDLShow.close;
end;

procedure TFrmDLShow.FormShow(Sender: TObject);
var
  i:integer;
  vSumD,vSumC:currency;
  vSumD_y,vSumC_y:currency;
begin

screen.Cursor:=crhourglass;

 with dm.Qry0103 do
  begin
   close;
   parameters.ParamByName('vyear').Value :=strtoint(trim(edit1.Text));
   parameters.ParamByName('rkey').Value :=dm.ADOGLQry.FieldValues['rkey'];
   prepared;
   open;
  end;

edit4.Text:=dm.Qry0103gl_acc_number.Value;
label5.Caption:=dm.Qry0103gl_description.Value;

 if dm.DS526.Active then dm.DS526.CancelBatch();
 dm.DS526.Close;
 dm.DS526.Open;

 setTryOpen(strtoint(edit2.Text)-1);      //设置期初余额

  for i:=strtoint(trim(edit2.Text)) to strtoint(trim(edit3.Text)) do
   begin
    dm.Qry0106.Close ;
    dm.Qry0106.Parameters.ParamByName('rkey').Value:=dm.Qry0103rkey.Value;
    dm.Qry0106.Parameters.ParamByName('vyear').Value:=strtoint(trim(edit1.Text));
    dm.Qry0106.Parameters.ParamByName('vptr1').Value:=i;
    dm.Qry0106.sql.Delete(dm.Qry0106.sql.Count-2);
    if checkbox3.Checked then             //包括未过帐
     dm.Qry0106.sql.Insert(dm.Qry0106.sql.Count-1,'')
    else
     dm.Qry0106.sql.Insert(dm.Qry0106.sql.Count-1,'and data0105.status=3');
    dm.Qry0106.Open ;

    vSumD := 0; vSumC := 0;
    vSumD_y := 0; vSumC_y := 0;
    while not dm.Qry0106.eof do
     begin
      BrowsGL(i,vSumD,vSumC,vSumD_y,vSumC_y);
      dm.Qry0106.Next ;
     end;

     SumDC(i,vSumD,vSumC,vSumD_y,vSumC_y); //设置本月合计,同时设置本年累计
   end;
  screen.Cursor:=crdefault;
  dm.DS526.First ;
  dm.Qry0106.Close;
  dm.Qry0103.Close;
end;

procedure TFrmDLShow.SpeedButton4Click(Sender: TObject);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
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
 XLApp.SheetsInNewWorkbook := 1;

 begin
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

   Sheet.Cells[1, v_cloumn] :='明细帐'+edit3.Text+edit4.Text;

   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;

   Sheet.Cells[2, v_cloumn+1] :='会计期间:'+edit1.Text+'年'+edit2.Text +'月到'+edit3.Text+'月';
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
        begin
         Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=
           TDBGrideh(DBGrideh1).Columns.Items[iCount].Field.AsString;

        end
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrideh(DBGrideh1).DataSource.DataSet.Next;
   end;
   XlApp.Visible := True;
   TDBGrideh(DBGrideh1).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;

end;

procedure TFrmDLShow.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
if odd(dm.DS526.RecNo) then
 begin
  DBGridEh1.Canvas.Brush.Color:=clinfobk;
  DBGridEh1.Canvas.Font.Color:=clblack;
  DBGridEh1.Canvas.FillRect(Rect);
  DBGridEh1.DefaultDrawColumnCell(rect,datacol,column,state);
 end;
end;

procedure TFrmDLShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if dm.DS526.Active then dm.DS526.Close;
end;

procedure TFrmDLShow.CheckBox1Click(Sender: TObject);
begin
  DBGridEh1.Columns[6].Visible:=checkbox1.Checked;
  DBGridEh1.Columns[5].Visible:=checkbox1.Checked;
  DBGridEh1.Columns[11].Visible:=checkbox1.Checked;
end;

procedure TFrmDLShow.CheckBox2Click(Sender: TObject);
begin
  DBGridEh1.Columns[7].Visible:=checkbox2.Checked;
  DBGridEh1.Columns[8].Visible:=checkbox2.Checked;
  DBGridEh1.Columns[10].Visible:=checkbox2.Checked;
end;

end.
