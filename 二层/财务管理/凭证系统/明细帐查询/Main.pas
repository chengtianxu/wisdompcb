unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Mask,
  Menus, ADODB, Buttons, Spin, DBGridEh, Excel2000,
  ClipBrd, ComObj,math;

type
  TFrmMain = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label3: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    CheckBox1: TCheckBox;
    Label8: TLabel;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    SpeedButton3: TSpeedButton;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    DBGridEh1: TDBGridEh;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure SpinEdit1Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2Exit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private

    { Private declarations }
    procedure SumDC(const pm:integer;const pSumD,pSumC,pSumD_y,pSumC_y:Currency);//小计
    procedure setTryOpen(const pm:integer);//设置期初余额
    procedure BrowsGL(const pM:integer;var pSumD,pSumC,pSumD_y,pSumC_y:Currency);
    procedure SetAcc();// 显示明细账
    procedure setTryD_C(pm,rkey103:integer;var pTatolD,pTatolC,pTatolD_y,pTatolC_y:Currency);
  public
    { Public declarations }

  end;

var
  FrmMain: TFrmMain;

implementation

uses uDM, AcctSearch, ProgressBar,DateUtils, AcctNote, ufrmDetail
,common;

{$R *.dfm}
procedure TFrmMain.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.Cnn) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

end;

procedure TFrmMain.setTryOpen(const pm:integer);
var                             //设置期初余额
  vClose,vclose_y:Currency;
begin
 if pm>=1 then
  begin
  vClose:=dm.Qry0103.fieldbyname('TYR_PERIOD_'+inttostr(pm)+'_CLOSE').asCurrency;
  vClose_y:=dm.Qry0103.fieldbyname('TYR_PERIOD_'+inttostr(pm)+'_CLOSE_ORIG').asCurrency;
  end
 else
  begin
  vClose:=dm.Qry0103.fieldbyname('TYR_OPEN').asCurrency;
  vClose_y:=dm.Qry0103.fieldbyname('TYR_OPEN_ORIG').asCurrency;
  end;
 dm.DS526.Append ;

 //dm.DS526.FieldByName('DESCRIPTION').AsString := dm.Qry0103gl_acc_number.Value+':'+inttostr(pm+1)+'月份期初余额';//摘要
 dm.DS526.FieldByName('摘要').AsString := dm.Qry0103gl_acc_number.Value+':'+inttostr(pm+1)+'月份期初余额';//摘要

 //dm.DS526DB_CR.Value := dm.Qry0103db_cr.Value;
 dm.DS526.FieldByName('借贷').Value := dm.Qry0103db_cr.Value;

 //dm.DS526.FieldByName('BALANCE').AsCurrency := vClose ; //上期期末余额本币
 dm.DS526.FieldByName('期末余额_本币').AsCurrency := vClose ; //上期期末余额本币

 //dm.DS526orig_amount.Value:=vclose_y;                   //上期期末余额原币
 dm.DS526.FieldByName('期末余额_原币').AsCurrency := vclose_y;                   //上期期末余额原币
end;

procedure TFrmMain.BrowsGL(const pM:integer;var pSumD,pSumC,pSumD_y,pSumC_y:Currency);
var                         //已经结帐
  vD_C:string;
  vClose,vClose_y:Currency;
begin
  //vD_C:=trim(dm.DS526DB_CR.Value);          //余额方向
  vD_C:=trim(dm.DS526.FieldByName('借贷').AsString);  //余额方向

  //vClose:=dm.DS526BALANCE.Value;   //上期期末余额
  vClose:=dm.DS526.FieldByName('期末余额_本币').AsCurrency;   //上期期末余额

  //vClose_y:=dm.DS526orig_amount.Value;
  vClose_y := dm.DS526.FieldByName('期末余额_原币').AsCurrency;

  dm.DS526.Append ;
  dm.DS526.FieldByName('科目代码').AsString :=dm.Qry0106.FieldByName('GL_ACC_NUMBER').asstring;
  dm.DS526.FieldByName('科目名称').AsString :=dm.Qry0106.FieldByName('GL_DESCRIPTION').asstring;

  //dm.DS526.FieldByName('TDATE').AsDateTime :=dm.Qry0106.FieldByName('tdate').AsDateTime;  //凭证日期
  dm.DS526.FieldByName('日期').AsDateTime :=dm.Qry0106.FieldByName('tdate').AsDateTime;  //凭证日期
  //dm.DS526.FieldByName('VOUCHER').AsString :=dm.Qry0106.FieldByName('VOUCHER').asstring;  //凭证号
  dm.DS526.FieldByName('凭证号').AsString :=dm.Qry0106.FieldByName('VOUCHER').asstring;  //凭证号
  //dm.DS526.FieldByName('DESCRIPTION').AsString :=dm.Qry0106.FieldByName('DESCRIPTION').AsString ;//摘要
  dm.DS526.FieldByName('摘要').AsString :=dm.Qry0106.FieldByName('DESCRIPTION').AsString ;//摘要
  //dm.DS526.FieldByName('CURR_CODE').AsString :=dm.Qry0106.FieldByName('CURR_CODE').AsString ;   //币种
  dm.DS526.FieldByName('货币').AsString :=dm.Qry0106.FieldByName('CURR_CODE').AsString ;   //币种
  //dm.DS526.FieldByName('EXCH_RATE').AsFloat :=dm.Qry0106.FieldByName('EXCH_RATE').AsFloat;//汇率
  dm.DS526.FieldByName('汇率').AsFloat :=dm.Qry0106.FieldByName('EXCH_RATE').AsFloat;//汇率

  //dm.DS526remark.Value :=dm.Qry0106.FieldByName('remark').asstring ; //往来对方
  dm.DS526.FieldByName('往来对方').asstring :=dm.Qry0106.FieldByName('AcctDesc').asstring;//dm.Qry0106.FieldByName('remark').asstring;//往来对方
//  showmessage(dm.DS526.FieldByName('科目代码').AsString+'_'+dm.DS526.FieldByName('科目名称').AsString+'_'+dm.DS526.FieldByName('往来对方').asstring);
  if  UpperCase(dm.Qry0106.FieldByName('d_c').AsString)='D' then
    begin
     //dm.DS526.FieldByName('DEBIT').AsCurrency := dm.Qry0106.FieldByName('amount').AsCurrency; //金额
     dm.DS526.FieldByName('本币_借方').AsCurrency := dm.Qry0106.FieldByName('amount').AsCurrency; //金额

     //dm.DS526orig_amountD.Value:= dm.Qry0106.fieldbyname('orig_amount').AsCurrency;    //原币金额
     dm.DS526.FieldByName('原币_借方').AsCurrency:= dm.Qry0106.fieldbyname('orig_amount').AsCurrency;    //原币金额

     pSumD:=pSumD+dm.Qry0106.FieldByName('amount').AsCurrency;
     pSumD_y:=pSumD_y+dm.Qry0106.FieldByName('orig_amount').AsCurrency;
    end
  else
    begin
     //dm.DS526.FieldByName('CREDIT').AsCurrency := dm.Qry0106.FieldByName('amount').AsCurrency; //金额
     dm.DS526.FieldByName('本币_贷方').AsCurrency := dm.Qry0106.FieldByName('amount').AsCurrency; //金额

     //dm.DS526orig_amountC.Value:=  dm.Qry0106.fieldbyname('orig_amount').AsCurrency;//原币金额
     dm.DS526.FieldByName('原币_贷方').AsCurrency:=  dm.Qry0106.fieldbyname('orig_amount').AsCurrency;//原币金额

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
  //dm.DS526.FieldByName('BALANCE').AsCurrency :=vClose;        //期末余额
  dm.DS526.FieldByName('期末余额_本币').AsCurrency :=vClose;        //期末余额

  //dm.DS526orig_amount.Value :=vClose_y;        //期末原币余额
  dm.DS526.FieldByName('期末余额_原币').AsCurrency :=vClose_y;        //期末原币余额

  //dm.DS526.FieldByName('DB_CR').AsString :=vD_C;             //余额方向
  dm.DS526.FieldByName('借贷').AsString :=vD_C;
  dm.DS526.Post;
end;


procedure TFrmMain.setTryD_C(pm,rkey103:integer;var pTatolD,pTatolC,pTatolD_y,pTatolC_y:Currency);
begin      //本年累计
  dm.ADOQ.Close;
  dm.ADOQ.SQL.Clear;
  dm.ADOQ.SQL.Text:=
  'SELECT dbo.Data0106.D_C, SUM(dbo.Data0106.AMOUNT) AS AMOUNT,'+#13+
  'SUM(Isnull(dbo.Data0106.PRICE,0)) AS amount_y'+#13+
  'FROM dbo.Data0105 INNER JOIN'+#13+
  'dbo.Data0106 ON'+#13+
      'dbo.Data0105.RKEY = dbo.Data0106.GL_HEADER_PTR INNER JOIN'+#13+
      'dbo.Data0103 ON dbo.Data0106.GL_ACCT_NO_PTR = dbo.Data0103.RKEY'+#13+
  'WHERE (dbo.Data0105.FYEAR = '+spinedit1.Text+') '+#13+
         'AND (dbo.Data0105.PERIOD <= '+inttostr(pm)+')'+#13+
         'and (Data0106.GL_ACCT_NO_PTR ='+inttostr(rkey103) +') '+#13+
         'AND (dbo.Data0105.STATUS <> 5)'+#13+
  'GROUP BY dbo.Data0106.D_C';
   if not CheckBox1.Checked then      //包括未过帐的
    dm.ADOQ.sql.Insert(dm.ADOQ.sql.Count-1,'and (data0105.status=3)');
  dm.ADOQ.Open;

  while not dm.ADOQ.Eof do
   begin
    if (UpperCase(dm.ADOQ.FieldByName('D_C').Value)='D') then
     begin
      pTatolD:= pTatolD+ dm.ADOQ.FieldByName('AMOUNT').AsCurrency;
      pTatolD_y:= pTatolD_y+ dm.ADOQ.FieldByName('AMOUNT_y').AsCurrency;
     end
    else
     begin
      pTatolC:= pTatolC+ dm.ADOQ.FieldByName('AMOUNT').AsCurrency ;
      pTatolC_y:= pTatolC_y+ dm.ADOQ.FieldByName('AMOUNT_y').AsCurrency ;
     end;
    dm.ADOQ.Next ;
   end;
  dm.ADOQ.Close;

end;

procedure TFrmMain.SumDC(const pm:integer;const pSumD,pSumC,pSumD_y,pSumC_y:Currency);//小计
var
  vstr:string;
  vCur,vcur_y,vTatoD,vTatoC,vTatoD_y,vTatoC_y:Currency;
begin
  //vstr:=dm.DS526.FieldByName('DB_CR').Value ;
  vstr:=dm.DS526.FieldByName('借贷').Value ;

  //vCur:=dm.DS526.FieldByName('BALANCE').AsCurrency;
  vCur:=dm.DS526.FieldByName('期末余额_本币').AsCurrency;

  //vCur_y:=dm.DS526orig_amount.Value;
  vCur_y:= dm.DS526.FieldByName('期末余额_原币').AsCurrency;

  dm.DS526.Append ;
  //dm.DS526.FieldByName('DESCRIPTION').AsString := dm.Qry0103gl_acc_number.Value+':'+inttostr(pm)+'月份本月合计' ;//摘要
  dm.DS526.FieldByName('摘要').AsString := dm.Qry0103gl_acc_number.Value+':'+inttostr(pm)+'月份本月合计' ;//摘要

  //dm.DS526.FieldByName('DEBIT').AsCurrency :=pSumD;
  dm.DS526.FieldByName('本币_借方').AsCurrency :=pSumD;

  //dm.DS526.FieldByName('CREDIT').AsCurrency :=pSumC;
  dm.DS526.FieldByName('本币_贷方').AsCurrency :=pSumC;

  //dm.DS526orig_amountD.Value:=pSumD_y;
  dm.DS526.FieldByName('原币_借方').Value:=pSumD_y;

  //dm.DS526orig_amountC.Value:=pSumC_y;
  dm.DS526.FieldByName('原币_贷方').Value:=pSumC_y;

  //dm.DS526.FieldByName('DB_CR').AsString :=vstr;
  dm.DS526.FieldByName('借贷').AsString :=vstr;

  //dm.DS526.FieldByName('BALANCE').AsCurrency :=vCur;
  dm.DS526.FieldByName('期末余额_本币').AsCurrency :=vCur;

  //dm.DS526orig_amount.Value:=vCur_y;
  dm.DS526.FieldByName('期末余额_原币').AsCurrency :=vCur_y;

  vTatoD:=0;
  vTatoC:=0;
  vTatoD_y:=0;
  vTatoC_y:=0;
  self.setTryD_C(pm,dm.Qry0103rkey.Value,vTatoD,vTatoC,vTatoD_y,vTatoC_y);
  dm.DS526.Append ;
  //dm.DS526.FieldByName('DESCRIPTION').AsString := dm.Qry0103gl_acc_number.Value+':'+'本年累计:' ;//摘要
  dm.DS526.FieldByName('摘要').AsString := dm.Qry0103gl_acc_number.Value+':'+'本年累计:' ;//摘要

  //dm.DS526.FieldByName('DEBIT').AsCurrency :=vTatoD;
  dm.DS526.FieldByName('本币_借方').AsCurrency :=vTatoD;

  //dm.DS526.FieldByName('CREDIT').AsCurrency :=vTatoC;
  dm.DS526.FieldByName('本币_贷方').AsCurrency :=vTatoC;

  //dm.DS526orig_amountD.Value:= vTatoD_y;
  dm.DS526.FieldByName('原币_借方').AsCurrency :=vTatoD_y;

  //dm.DS526orig_amountC.Value:= vTatoC_y;
  dm.DS526.FieldByName('原币_贷方').AsCurrency :=vTatoC_y;

  //dm.DS526.FieldByName('DB_CR').AsString :=vstr;
  dm.DS526.FieldByName('借贷').AsString :=vstr;

  //dm.DS526.FieldByName('BALANCE').AsCurrency :=vCur;
  dm.DS526.FieldByName('期末余额_本币').AsCurrency :=vCur;

  //dm.DS526orig_amount.Value:=vCur_y;
  dm.DS526.FieldByName('期末余额_原币').AsCurrency :=vCur_y;
end;

procedure TFrmMain.SetAcc();
var
  i:integer;
  vleng,vSumD,vSumC:currency;
    vSumD_y,vSumC_y:currency;
begin

 Application.CreateForm(TFrmProgress, FrmProgress);
 FrmProgress.show;
 setTryOpen(spinedit2.Value-1);      //设置期初余额
  for i:=spinedit2.Value to spinedit3.Value do
   begin
    dm.Qry0106.Close ;
    dm.Qry0106.Parameters.ParamByName('rkey').Value:=dm.Qry0103rkey.Value;
    dm.Qry0106.Parameters.ParamByName('vyear').Value:=spinedit1.Value;
    dm.Qry0106.Parameters.ParamByName('vptr1').Value:=i;
    dm.Qry0106.sql.Delete(dm.Qry0106.sql.Count-2);
    if checkbox1.Checked then             //包括未过帐
     dm.Qry0106.sql.Insert(dm.Qry0106.sql.Count-1,'')
    else
     dm.Qry0106.sql.Insert(dm.Qry0106.sql.Count-1,'and data0105.status=3');
    dm.Qry0106.Prepared; 
    dm.Qry0106.Open ;
    vSumD:=0; vSumC:=0;
    vSumD_y := 0; vSumC_y := 0;
    while not dm.Qry0106.eof do
     begin
      BrowsGL(i,vSumD,vSumC,vSumD_y,vSumC_y);
      dm.Qry0106.Next ;

      vleng:=int(500*dm.Qry0106.recno/dm.Qry0106.recordcount);
      FrmProgress.ProgressBar1.Position :=strtoint(floattostr(vleng));
     end;

     SumDC(i,vSumD,vSumC,vSumD_y,vSumC_y);   //设置本月合计,同时设置本年累计
   end;

  FrmProgress.free;
  dm.DS526.First ;
  dm.Qry0106.Close;
end;


//查科目
procedure TFrmMain.BitBtn4Click(Sender: TObject);
begin
try
  Application.CreateForm(TFrmAcctSearch, FrmAcctSearch);
  FrmAcctSearch.Edit1.Text :=trim(edit1.Text);
  if FrmAcctSearch.showmodal=mrok then
    Edit1.Text :=FrmAcctSearch.ADOData0103GL_ACC_NUMBER.Value
  else
   edit1.SetFocus;
 finally
  FrmAcctSearch.FREE;
 end;

end;

procedure TFrmMain.Edit1Exit(Sender: TObject);
var
  vsql:string;
begin
  if (trim((sender as Tedit).text)<>'') and
     (self.ActiveControl.Name<>'BitBtn4')  then
  begin
  dm.ADOQ.close;
  dm.ADOQ.sql.Clear;
  vsql:='SELECT gl_acc_number from data0103'+#13+
         'where gl_acc_number='+QuotedStr(trim((sender as Tedit).Text))+#13+
         'and Data0103.HAS_CHILD = 0';
  dm.ADOQ.sql.Text :=vsql;
  dm.ADOQ.open;
  if dm.ADOQ.IsEmpty then
   begin
     messagedlg('科目代码不正确!',mtinformation,[mbok],0);
    (sender as Tedit).SetFocus ;
   end;
  dm.ADOQ.close;
 end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
if dm.cnn.Connected then
 begin
  dm.DS0508.Open ;
  spinedit1.MaxValue :=DM.DS0508.fieldbyname('curr_FYEAR').AsInteger;
  spinedit1.text:= DM.DS0508.fieldbyname('curr_FYEAR').asstring;

  spinedit2.text:=DM.DS0508.fieldbyname('curr_period').AsString;
  spinedit3.text:=DM.DS0508.fieldbyname('curr_period').AsString;

  spinedit1.SetFocus ;
 end;
end;

procedure TFrmMain.SpeedButton1Click(Sender: TObject);
begin
 close;
 application.Terminate;
end;
//查询
procedure TFrmMain.SpeedButton2Click(Sender: TObject);
var
  vSql:string;
begin

 if spinedit2.Value>spinedit3.Value then
  begin
   showmsg('开始期间不能大于结束期间!',1);
   spinedit2.SetFocus;
   exit;
  end;
 if spinedit1.Value=DM.DS0508.fieldbyname('curr_FYEAR').AsInteger then
 if spinedit2.Value>DM.DS0508.fieldbyname('curr_period').AsInteger then
  begin
   showmsg('开始期间不能大于当前会计期间!',1);
   spinedit2.SetFocus;
   exit;
  end;
  
 with dm.Qry0103 do
  begin
   close;
   parameters.ParamByName('vyear').Value :=spinedit1.Value;
   parameters.ParamByName('acc_number1').Value :=edit1.Text;
   parameters.ParamByName('acc_number2').Value :=edit2.Text;
   Prepared;
   open;
  end;
  if dm.Qry0103.IsEmpty then
   begin
    showmsg('科目代码设置不正确',1);
    combobox1.Enabled:=false;
   end
  else
   begin
   //初始化下拉框
    combobox1.Enabled:=true;
    combobox1.Items.Clear;
    combobox1.Items.Add('全部');
    while not dm.Qry0103.Eof do
    begin
     vSql:=trim(dm.Qry0103.FieldValues['gl_acc_number'])+'|'+trim(dm.Qry0103.FieldValues['GL_DESCRIPTION']);
     combobox1.Items.Add(vSql);
     dm.Qry0103.Next;
    end;
    dm.Qry0103.First;
    combobox1.ItemIndex:=0;
    ComboBox1Change(sender);
   end;
end;

//导出EXCEL
procedure TFrmMain.SpeedButton4Click(Sender: TObject);
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

//   Sheet.Cells[1, v_cloumn] :='明细帐'+edit3.Text+edit4.Text;

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


//显示凭证
procedure TFrmMain.DBGridEh1DblClick(Sender: TObject);

begin
if trim(dm.DS526.fieldByName('凭证号').Value)<>'' then   //trim(dm.DS526VOUCHER.Value)<>''
 try
  Application.CreateForm(TFrmAcctNote, FrmAcctNote);
  FrmAcctNote.PopupMenu1.Free;
  dm.Qry105_106.close;
  dm.Qry105_106.Parameters.ParamByName('vVoucher').Value := DM.DS526.FieldByName('凭证号').Value;//DM.DS526.FieldByName('voucher').Value;
  dm.Qry105_106.Open ;

  FrmAcctNote.Edit6.text:=DM.Qry105_106.FieldByName('voucher').asstring;
  FrmAcctNote.datetimepicker1.DateTime :=DM.Qry105_106.fieldbyname('ENTERED_DT').asdatetime;

  FrmAcctNote.edit5.Text :=DM.Qry105_106.fieldbyname('attached').asstring;
  FrmAcctNote.edit1.Text :=DM.Qry105_106.fieldbyname('FYEAR').asstring;
  FrmAcctNote.edit4.Text :=DM.Qry105_106.fieldbyname('PERIOD').asstring;
  FrmAcctNote.edit7.Text:=DM.Qry105_106.fieldbyname('EMPLOYEE_NAME').asstring;

  DM.Qry105_106.First ;
  with DM.Qry105_106 do
  while not eof do
  begin
    FrmAcctNote.stringgrid1.RowCount:=FrmAcctNote.stringgrid1.RowCount+1;
    FrmAcctNote.stringgrid1.Cells[0,FrmAcctNote.stringgrid1.RowCount-2]:=
                                    Fieldbyname('description').Value;
    FrmAcctNote.stringgrid1.Cells[1,FrmAcctNote.stringgrid1.RowCount-2]:=
      trim(Fieldbyname('gl_acc_number').Value)+'-'+Fieldbyname('gl_description').Value;
    FrmAcctNote.stringgrid1.Cells[2,FrmAcctNote.stringgrid1.RowCount-2]:=
                        Fieldbyname('CURR_CODE').Value;
    FrmAcctNote.stringgrid1.Cells[3,FrmAcctNote.stringgrid1.RowCount-2]:=
                        Fieldbyname('EXCH_RATE').AsString;
    FrmAcctNote.stringgrid1.Cells[4,FrmAcctNote.stringgrid1.RowCount-2]:=
                        Fieldbyname('orig_amount').AsString;
    if Fieldbyname('d_c').asstring='D' then
      FrmAcctNote.stringgrid1.Cells[5,FrmAcctNote.stringgrid1.RowCount-2]:=
                                Fieldbyname('AMOUNT').asstring
    else
      FrmAcctNote.stringgrid1.Cells[6,FrmAcctNote.stringgrid1.RowCount-2]:=
                                 Fieldbyname('AMOUNT').asstring;
    next;
  end;
  FrmAcctNote.ttype.Caption :='2';
  FrmAcctNote.showmodal;

 finally
   FrmAcctNote.free;
 end;
end;

procedure TFrmMain.SpinEdit1Exit(Sender: TObject);
begin
  if spinedit1.Value<DM.DS0508.fieldbyname('curr_FYEAR').Value then
    spinedit2.MaxValue:=12
  else
    spinedit2.MaxValue:=DM.DS0508.fieldbyname('curr_period').AsInteger;
end;

procedure TFrmMain.ComboBox1Change(Sender: TObject);

begin
 if dm.DS526.Active then dm.DS526.CancelBatch();
 dm.DS526.Close;
 dm.DS526.Open;

 if combobox1.ItemIndex = 0 then      //全部
 begin
  dm.Qry0103.First;
   while not dm.Qry0103.Eof do
    begin
     SetAcc();
     dm.Qry0103.Next
    end;
 end
 else            //单一科目
  begin
   dm.Qry0103.MoveBy(combobox1.ItemIndex-dm.Qry0103.RecNo);
   SetAcc();
  end;
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
begin
 try
  Application.CreateForm(TFrmAcctSearch, FrmAcctSearch);
  FrmAcctSearch.Edit1.Text :=trim(edit2.Text);
  if FrmAcctSearch.showmodal=mrok then
    Edit2.Text := FrmAcctSearch.ADOData0103.fieldbyname('gl_acc_number').asstring
  else
   edit2.SetFocus;
 finally
  FrmAcctSearch.FREE;
 end;
end;
//隐藏
procedure TFrmMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

  {if (dm.DS526.FieldByName('VOUCHER').AsVariant <>null) and
    (dm.DS526.FieldByName('BALANCE').AsVariant=null) then
       begin
         DBGridEh1.Canvas.Brush.Color:=clmoneygreen;
         DBGridEh1.Canvas.FillRect(Rect);
         DBGridEh1.Canvas.Font.Color:=clblack;
         DBGridEh1.DefaultDrawColumnCell(rect,datacol,column,state);
       end;}
  if (dm.DS526.FieldByName('凭证号').AsVariant <>null) and
    (dm.DS526.FieldByName('期末余额_本币').AsVariant=null) then
       begin
         DBGridEh1.Canvas.Brush.Color:=clmoneygreen;
         DBGridEh1.Canvas.FillRect(Rect);
         DBGridEh1.Canvas.Font.Color:=clblack;
         DBGridEh1.DefaultDrawColumnCell(rect,datacol,column,state);
       end;
  {else if odd(dm.DS526.RecNo) then
       begin
         DBGridEh1.Canvas.Brush.Color:=clinfobk;
         DBGridEh1.Canvas.Font.Color:=clblack;
         DBGridEh1.Canvas.FillRect(Rect);
         DBGridEh1.DefaultDrawColumnCell(rect,datacol,column,state);
       end;}
end;

procedure TFrmMain.CheckBox2Click(Sender: TObject);
begin

  DBGridEh1.Columns[11].Visible:=checkbox2.Checked;
  DBGridEh1.Columns[6].Visible:=checkbox2.Checked;
  DBGridEh1.Columns[5].Visible:=checkbox2.Checked;

end;

procedure TFrmMain.CheckBox3Click(Sender: TObject);
begin

  DBGridEh1.Columns[7].Visible:=checkbox3.Checked;
  DBGridEh1.Columns[8].Visible:=checkbox3.Checked;
  DBGridEh1.Columns[10].Visible:=checkbox3.Checked;

end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if dm.DS526.Active then dm.DS526.Close;
if dm.Qry0103.Active then dm.Qry0103.Close;
end;

procedure TFrmMain.Edit2Exit(Sender: TObject);
var
  vsql:string;
begin
  if (trim((sender as Tedit).text)<>'') and
     (self.ActiveControl.Name<>'BitBtn3') then
  begin
  dm.ADOQ.close;
  dm.ADOQ.sql.Clear;
  vsql:='SELECT gl_acc_number from data0103'+#13+
         'where gl_acc_number='+QuotedStr(trim((sender as Tedit).Text))+#13+
         'and Data0103.HAS_CHILD = 0';
  dm.ADOQ.sql.Text :=vsql;
  dm.ADOQ.open;
  if dm.ADOQ.IsEmpty then
   begin
     messagedlg('科目代码不正确!',mtinformation,[mbok],0);
    (sender as Tedit).SetFocus ;
   end;
  dm.ADOQ.close;
 end;
end;

procedure TFrmMain.N1Click(Sender: TObject);
begin
if not  dm.DS526.IsEmpty then
begin
  Form2:=TForm2.create(application);
   Form2.ppReport1.Reset;
   Form2.ppReport1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'DetailRpt.rtm';    //R:\NIERP\Report\DetailRpt.rtm
   Form2.ppReport1.Template.LoadFromFile;
  with DM.qrytemp do
  begin
    Close;
    SQL.clear;
    SQL.text := 'SELECT Data0103.GL_ACC_NUMBER, '
      + ' case when data0103_2.GL_DESCRIPTION is not null then '
      + '   data0103_2.GL_DESCRIPTION +'+ '''-'''
      + '   +data0103_1.GL_DESCRIPTION +'+ '''-''' + ' + data0103.GL_DESCRIPTION '
      + '   else '
      + '     case when data0103_1.GL_DESCRIPTION is not null then '
      + '       data0103_1.GL_DESCRIPTION +' + '''-''' + ' + data0103.GL_DESCRIPTION '
      + '       else data0103.GL_DESCRIPTION '
      + '     end '
      + ' end as description_2 '
      + ' FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN '
      + '      dbo.Data0103 Data0103_1 ON '
      + '      Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN '
      + '      dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR '
      + ' where (dbo.Data0103.HAS_CHILD = 0) '
      + ' and Data0103.GL_ACC_NUMBER =' + QuotedStr(trim(Edit1.text));
    Open;

  end;

  //Form2.ppLabel15.Text:=combobox1.Items[combobox1.ItemIndex];;
  Form2.ppLabel15.Text:= trim(Edit1.text) + '; ' + DM.qrytemp.FieldValues['description_2'];
  Form2.ppreport1.print;
  Form2.free;
end
else
 showmsg('不能打印空报表',1);
end;

procedure TFrmMain.N2Click(Sender: TObject);
begin
  Form2:=TForm2.create(application);
   Form2.ppReport1.Reset;
   Form2.ppReport1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'DetailRpt.rtm';    //R:\NIERP\Report\DetailRpt.rtm
   Form2.ppReport1.Template.LoadFromFile;
   form2.ppReport1.SaveAsTemplate:=true;
//  Form2.ppLabel15.Text:=combobox1.Items[combobox1.ItemIndex];;
  Form2.ppDesigner1.ShowModal;
  Form2.free;
end;

procedure TFrmMain.SpeedButton3Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

end.

