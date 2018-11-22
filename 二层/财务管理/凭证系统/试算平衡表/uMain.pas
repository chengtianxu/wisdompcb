unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, Buttons, Spin,
  ExtCtrls, Excel2000,ClipBrd,ComObj,math;

type
  TFMain = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    SpinEdit4: TSpinEdit;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }

    procedure setTryOpen(const pm:integer);

    procedure setamountDC(rkey103:integer); overload; //设置本期金额
    procedure setamountDC(acc_number:string); overload; //设置本期金额
    procedure setSum(pOpenD,pOpenC,pCurrD,pCurrC,pCloseD,pCloseC,
              pOpenD_y,pOpenC_y,pCurrD_y,pCurrC_y,pCloseD_y,pCloseC_y:Currency;
              pACCTp:integer);     //设置小计

  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses uMD, uProgress,DateUtils, uAcctSearch, uDLShow,common;

{$R *.dfm}

 //设置小计
procedure TFMain.setSum(pOpenD,pOpenC,pCurrD,pCurrC,pCloseD,pCloseC,
          pOpenD_y,pOpenC_y,pCurrD_y,pCurrC_y,pCloseD_y,pCloseC_y:Currency;
                        pACCTp:integer);
begin
  case pACCTp of
   1:dm.DS103GL_DESCRIPTION.Value:='资产合计';
   2:dm.DS103GL_DESCRIPTION.Value:='负债合计';
   3:dm.DS103GL_DESCRIPTION.Value:='权益合计';
   4:dm.DS103GL_DESCRIPTION.Value:='成本合计';
   5:dm.DS103GL_DESCRIPTION.Value:='损益合计';
  end;
   dm.DS103.FieldByName('TYR_OPEN').AsCurrency:=pOpenD;
   dm.DS103.FieldByName('TYR_CLOSE').AsCurrency:=pOpenC;
   dm.DS103.FieldByName('CURRENT_PERIOD_DEBIT').AsCurrency:=pCurrD;
   dm.DS103.FieldByName('CURRENT_PERIOD_CREDIT').AsCurrency:=pCurrC;
   dm.DS103.FieldByName('TYR_DEBIT').asCurrency:=pCloseD;
   dm.DS103.FieldByName('TYR_CREDIT').asCurrency:=pCloseC;

   dm.DS103TYR_OPEN_ORIG.Value:=pOpenD_y;
   dm.DS103TYR_CLOSE_ORIG.Value:=pOpenC_y;
   dm.DS103CURRENT_PERIOD_DEBIT_ORIG.Value:=pCurrD_y;
   dm.DS103CURRENT_PERIOD_CREDIT_ORIG.Value:=pCurrC_y;
   dm.DS103TYR_DEBIT_ORIG.Value:=pCloseD_y;
   dm.DS103TYR_CREDIT_ORIG.Value:=pCloseC_y;

   dm.DS103HAS_CHILD.Value:=1;
end;

procedure TFMain.setTryOpen(const pm:integer);   //设置期初余额
var
  vClose,y_vclose:Currency;
begin
if pm>=1 then
 begin
 vClose:=dm.Qry103.fieldbyname('TYR_PERIOD_'+inttostr(pm)+'_CLOSE').asCurrency;
 y_vclose:=dm.Qry103.fieldbyname('TYR_PERIOD_'+inttostr(pm)+'_CLOSE_ORIG').asCurrency;
 end
else
 begin
  vClose:=dm.Qry103.fieldbyname('TYR_OPEN').asCurrency;
  y_vClose:=dm.Qry103.fieldbyname('TYR_OPEN_ORIG').asCurrency;
 end;

  if (UpperCase(dm.Qry103.FieldByName('db_cr').Value)='D') then                                                 //借方期初余额
   begin
    dm.DS103.FieldByName('TYR_OPEN').AsCurrency := vClose;
    dm.DS103.FieldByName('TYR_CLOSE').AsCurrency := 0;
    dm.DS103TYR_OPEN_ORIG.Value:=y_vClose;
    dm.DS103TYR_CLOSE_ORIG.Value:=0;
   end
  else                                         //贷方期初余额
   begin
    dm.DS103.FieldByName('TYR_OPEN').AsCurrency :=0;
    dm.DS103.FieldByName('TYR_CLOSE').AsCurrency :=vClose;
    dm.DS103TYR_OPEN_ORIG.Value := 0;
    dm.DS103TYR_CLOSE_ORIG.Value := y_vClose;
   end;
end;

procedure TFMain.setamountDC(rkey103: integer);
begin
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
         'AND (dbo.Data0105.PERIOD >= '+spinedit2.Text+')'+#13+
         'AND (dbo.Data0105.PERIOD <= '+spinedit3.Text+')'+#13+
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
      dm.DS103.FieldByName('CURRENT_PERIOD_DEBIT').AsCurrency:=
         dm.DS103.FieldByName('CURRENT_PERIOD_DEBIT').AsCurrency+
         dm.ADOQ.FieldByName('AMOUNT').AsCurrency;
      dm.DS103CURRENT_PERIOD_DEBIT_ORIG.Value:=
         dm.DS103CURRENT_PERIOD_DEBIT_ORIG.Value+
         dm.ADOQ.FieldByName('amount_y').AsCurrency;
     end
    else
     begin
      dm.DS103.FieldByName('CURRENT_PERIOD_CREDIT').AsCurrency:=
         dm.DS103.FieldByName('CURRENT_PERIOD_CREDIT').AsCurrency+
         dm.ADOQ.FieldByName('AMOUNT').AsCurrency;
      dm.DS103CURRENT_PERIOD_CREDIT_ORIG.Value:=
         dm.DS103CURRENT_PERIOD_CREDIT_ORIG.Value+
         dm.ADOQ.FieldByName('amount_y').AsCurrency;
     end;
    dm.ADOQ.Next ;
   end;
  dm.ADOQ.Close;
end;

procedure TFMain.setamountDC(acc_number: string);
VAR
 acc_number_c:string;
begin
  acc_number_c:=inttostr((strtoint64(acc_number)+1));
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
         'AND (dbo.Data0105.PERIOD >= '+spinedit2.Text+')'+#13+
         'AND (dbo.Data0105.PERIOD <= '+spinedit3.Text+')'+#13+
         'and (Data0103.GL_ACC_NUMBER >='+QuotedStr(acc_number) +')'+#13+
         'and (Data0103.GL_ACC_NUMBER <'+QuotedStr(acc_number_c) +')'+#13+
         'and (dbo.Data0105.STATUS <> 5)'+#13+
  'GROUP BY dbo.Data0106.D_C';
   if not CheckBox1.Checked then      //包括未过帐的
    dm.ADOQ.sql.Insert(dm.ADOQ.sql.Count-1,'and (data0105.status=3)');
  dm.ADOQ.Open;
  while not dm.ADOQ.Eof do
   begin
    if (UpperCase(dm.ADOQ.FieldByName('D_C').Value)='D') then
     begin
      dm.DS103.FieldByName('CURRENT_PERIOD_DEBIT').AsCurrency:=
         dm.DS103.FieldByName('CURRENT_PERIOD_DEBIT').AsCurrency+
         dm.ADOQ.FieldByName('AMOUNT').AsCurrency;
      dm.DS103CURRENT_PERIOD_DEBIT_ORIG.Value:=
         dm.DS103CURRENT_PERIOD_DEBIT_ORIG.Value+
         dm.ADOQ.FieldByName('amount_y').AsCurrency;
     end
    else
     begin
      dm.DS103.FieldByName('CURRENT_PERIOD_CREDIT').AsCurrency:=
         dm.DS103.FieldByName('CURRENT_PERIOD_CREDIT').AsCurrency+
         dm.ADOQ.FieldByName('AMOUNT').AsCurrency ;
      dm.DS103CURRENT_PERIOD_CREDIT_ORIG.Value:=
         dm.DS103CURRENT_PERIOD_CREDIT_ORIG.Value+
         dm.ADOQ.FieldByName('amount_y').AsCurrency;
     end;
    dm.ADOQ.Next ;
   end;
 dm.ADOQ.Close;
end;

procedure TFMain.SpeedButton2Click(Sender: TObject);//查询
var
  vleng:integer;
  vOpenD,vOpenC,vCurrD,vCurrC,vCloseD,vCloseC:Currency;
  vOpenD_y,vOpenC_y,vCurrD_y,vCurrC_y,vCloseD_y,vCloseC_y:Currency;
  vOpenSumD,vOpenSumC,vCurrSumD,vCurrSumC,vCloseSumD,vCloseSumC:Currency;
  vOpenSumD_y,vOpenSumC_y,vCurrSumD_y,vCurrSumC_y,vCloseSumD_y,vCloseSumC_y:Currency;
  vACCTp,vlen,i:integer;
begin
try
 if spinedit2.Value>spinedit3.Value then
  begin
   showmsg('开始期间不能大于结束期间!',1);
   spinedit2.SetFocus;
   exit;
  end;
 if spinedit1.Value=DM.Qry508.fieldbyname('curr_FYEAR').AsInteger then
 if spinedit2.Value>DM.Qry508.fieldbyname('curr_period').AsInteger then
  begin
   showmsg('开始期间不能大于当前会计期间!',1);
   spinedit2.SetFocus;
   exit;
  end;

 vlen:=0;    //会计科目总长度
 for i:=1 to strtoint(spinedit4.Text) do
  vlen:=vlen+dm.Qry508.fieldbyname('class'+inttostr(i)).AsInteger;

      vOpenD:=0;
      vOpenC:=0;
      vCurrD:=0;
      vCurrC:=0;
      vCloseD:=0;
      vCloseC:=0;  //小计本币
      vOpenD_y:=0;
      vOpenC_y:=0;
      vCurrD_y:=0;
      vCurrC_y:=0;
      vCloseD_y:=0;
      vCloseC_y:=0; //小计原币
      vOpenSumD:=0;
      vOpenSumC:=0;
      vCurrSumD:=0;
      vCurrSumC:=0;
      vCloseSumD:=0;
      vCloseSumC:=0;//累计本币
      vOpenSumD_y:=0;
      vOpenSumC_y:=0;
      vCurrSumD_y:=0;
      vCurrSumC_y:=0;
      vCloseSumD_y:=0;
      vCloseSumC_y:=0;//累计原币

 with dm.Qry103 do
  begin
   close;
   parameters.ParamByName('vyear').Value :=strtoint(spinedit1.Text);
   parameters.ParamByName('vcode1').Value :=trim(Edit1.Text);
   parameters.ParamByName('vcode2').Value :=trim(Edit2.Text);
   parameters.ParamByName('vlen').Value :=vlen;
   prepared;
   open;
  end;

  if dm.Qry103.RecordCount =0 then
   begin
    showmsg('没有找到对应的会计科目!',1);
    exit;
   end;
  if dm.DS103.Active then dm.DS103.CancelBatch();
  dm.DS103.close;
  dm.DS103.Open;
  Application.CreateForm(TFProgress, FProgress);
  FProgress.Show;
  dm.Qry103.First;
  vACCTp:=dm.Qry103.FieldByName('ACC_TP').Value;      //科目分类
  while not dm.Qry103.Eof do
   begin

    dm.DS103.Append ;
    dm.DS103.FieldByName('CURRENT_PERIOD_DEBIT').AsCurrency:=0;
    dm.DS103.FieldByName('CURRENT_PERIOD_CREDIT').AsCurrency:=0;
    dm.DS103CURRENT_PERIOD_DEBIT_ORIG.Value:=0;
    dm.DS103CURRENT_PERIOD_CREDIT_ORIG.Value:=0;

    if  dm.Qry103.FieldByName('ACC_TP').Value=vACCTp then
     begin
      dm.DS103.FieldByName('GL_ACC_NUMBER').Value:=dm.Qry103.FieldByName('gl_acc_number').Value;//设置科目
      dm.DS103.FieldByName('GL_DESCRIPTION').Value:=dm.Qry103.FieldByName('gl_description').Value;//设置名称
      dm.DS103.FieldByName('HAS_CHILD').Value:=dm.Qry103.FieldByName('HAS_CHILD').Value;
      dm.DS103.FieldByName('DB_CR').Value:=dm.Qry103.FieldByName('DB_CR').Value;
      dm.DS103TTYPE.Value:=dm.Qry103.fieldbyname('TTYPE').AsInteger;

      setTryOpen(spinedit2.Value-1);//设置期初余额


     if dm.DS103.FieldByName('HAS_CHILD').Value=0 then //明细科目
      begin
       self.setamountDC(dm.Qry103.Fieldbyname('rkey').AsInteger);//设置本期金额
       if dm.Qry103.FieldByName('curr_tp').AsInteger=0 then
        dm.DS103SPEC_RKEY.Value:='RMB'
       else
        dm.DS103SPEC_RKEY.Value:=dm.Qry103.FieldByName('curr_code').AsString;
      end
     else                                                 //非明细科目
      self.setamountDC(dm.Qry103.Fieldbyname('gl_acc_number').AsString);

     if (UpperCase(dm.DS103.FieldByName('DB_CR').Value)='D') then
      begin                              //设置期未金额
       dm.DS103.FieldByName('TYR_DEBIT').AsCurrency :=
         dm.DS103.FieldByName('TYR_OPEN').AsCurrency+
         dm.DS103.FieldByName('CURRENT_PERIOD_DEBIT').AsCurrency-
         dm.DS103.FieldByName('CURRENT_PERIOD_CREDIT').AsCurrency;
       dm.DS103.FieldByName('TYR_CREDIT').AsCurrency :=0;

       dm.DS103TYR_DEBIT_ORIG.Value:=
         dm.DS103TYR_OPEN_ORIG.Value+
         dm.DS103CURRENT_PERIOD_DEBIT_ORIG.Value-
         dm.DS103CURRENT_PERIOD_CREDIT_ORIG.Value;
       dm.DS103TYR_CREDIT_ORIG.Value:=0;
      end
     else
      begin
       dm.DS103.FieldByName('TYR_CREDIT').AsCurrency :=
         dm.DS103.FieldByName('TYR_CLOSE').AsCurrency+
         dm.DS103.FieldByName('CURRENT_PERIOD_CREDIT').AsCurrency-
         dm.DS103.FieldByName('CURRENT_PERIOD_DEBIT').AsCurrency;
       dm.DS103.FieldByName('TYR_DEBIT').AsCurrency :=0;

       dm.DS103TYR_CREDIT_ORIG.Value:=
         dm.DS103TYR_CLOSE_ORIG.Value+
         dm.DS103CURRENT_PERIOD_CREDIT_ORIG.Value-
         dm.DS103CURRENT_PERIOD_DEBIT_ORIG.Value;
       dm.DS103TYR_DEBIT_ORIG.Value:=0;
      end;

    if combobox1.ItemIndex<>combobox1.Items.Count-1 then
     if dm.DS103TTYPE.Value=combobox1.ItemIndex then  //按科目级别汇总
      begin
       vOpenD:=vOpenD+dm.DS103.FieldByName('TYR_OPEN').AsCurrency;
       vOpenC:=vOpenC+dm.DS103.FieldByName('TYR_CLOSE').AsCurrency;
       vCurrD:=vCurrD+dm.DS103.FieldByName('CURRENT_PERIOD_DEBIT').AsCurrency;
       vCurrC:=vCurrC+dm.DS103.FieldByName('CURRENT_PERIOD_CREDIT').AsCurrency;
       vCloseD:=vCloseD+dm.DS103.FieldByName('TYR_DEBIT').asCurrency ;
       vCloseC:=vCloseC+dm.DS103.FieldByName('TYR_CREDIT').asCurrency ;

       vOpenD_y:=vOpenD_y+dm.DS103TYR_OPEN_ORIG.Value;
       vOpenC_y:=vOpenC_y+dm.DS103TYR_CLOSE_ORIG.Value;
       vCurrD_y:=vCurrD_y+dm.DS103CURRENT_PERIOD_DEBIT_ORIG.Value;
       vCurrC_y:=vCurrC_y+dm.DS103CURRENT_PERIOD_CREDIT_ORIG.Value;
       vCloseD_y:=vCloseD_y+dm.DS103TYR_DEBIT_ORIG.Value;
       vCloseC_y:=vCloseC_y+dm.DS103TYR_CREDIT_ORIG.Value;
      end
     else
    ELSE
     if dm.DS103HAS_CHILD.Value=0 then    //明细类科目汇总
      begin
       vOpenD:=vOpenD+dm.DS103.FieldByName('TYR_OPEN').AsCurrency;
       vOpenC:=vOpenC+dm.DS103.FieldByName('TYR_CLOSE').AsCurrency;
       vCurrD:=vCurrD+dm.DS103.FieldByName('CURRENT_PERIOD_DEBIT').AsCurrency;
       vCurrC:=vCurrC+dm.DS103.FieldByName('CURRENT_PERIOD_CREDIT').AsCurrency;
       vCloseD:=vCloseD+dm.DS103.FieldByName('TYR_DEBIT').asCurrency ;
       vCloseC:=vCloseC+dm.DS103.FieldByName('TYR_CREDIT').asCurrency ;

       vOpenD_y:=vOpenD_y+dm.DS103TYR_OPEN_ORIG.Value;
       vOpenC_y:=vOpenC_y+dm.DS103TYR_CLOSE_ORIG.Value;
       vCurrD_y:=vCurrD_y+dm.DS103CURRENT_PERIOD_DEBIT_ORIG.Value;
       vCurrC_y:=vCurrC_y+dm.DS103CURRENT_PERIOD_CREDIT_ORIG.Value;
       vCloseD_y:=vCloseD_y+dm.DS103TYR_DEBIT_ORIG.Value;
       vCloseC_y:=vCloseC_y+dm.DS103TYR_CREDIT_ORIG.Value;
      end;

      vACCTp:=dm.Qry103.FieldByName('ACC_TP').Value;   //科目分类
      dm.Qry103.Next ;
      vleng:=trunc(100*dm.Qry103.recno/dm.Qry103.recordcount);
      FProgress.ProgressBar1.Position :=vleng;
     end
    else
     begin
      setSum(vOpenD,vOpenC,vCurrD,vCurrC,vCloseD,vCloseC,
             vOpenD_y,vOpenC_y,vCurrD_y,vCurrC_y,vCloseD_y,vCloseC_y,
             vACCTp);  //如遇到科目类别不同则小计
      vOpenSumD:=vOpenSumD+vOpenD;
      vOpenSumC:=vOpenSumC+vOpenC;
      vCurrSumD:=vCurrSumD+vCurrD;
      vCurrSumC:=vCurrSumC+vCurrC;
      vCloseSumD:=vCloseSumD+vCloseD;
      vCloseSumC:=vCloseSumC+vCloseC;

      vOpenSumD_y:=vOpenSumD_y+vOpenD_y;
      vOpenSumC_y:=vOpenSumC_y+vOpenC_y;
      vCurrSumD_y:=vCurrSumD_y+vCurrD_y;
      vCurrSumC_y:=vCurrSumC_y+vCurrC_y;
      vCloseSumD_y:=vCloseSumD_y+vCloseD_y;
      vCloseSumC_y:=vCloseSumC_y+vCloseC_y;

      vOpenD:=0;
      vOpenC:=0;
      vCurrD:=0;
      vCurrC:=0;
      vCloseD:=0;
      vCloseC:=0;
      vOpenD_y:=0;
      vOpenC_y:=0;
      vCurrD_y:=0;
      vCurrC_y:=0;
      vCloseD_y:=0;
      vCloseC_y:=0;
      vACCTp:=dm.Qry103.FieldByName('ACC_TP').Value;                     //科目分类
     end;

   end;//end while

   dm.DS103.Append ;
   setSum(vOpenD,vOpenC,vCurrD,vCurrC,vCloseD,vCloseC,
          vOpenD_y,vOpenC_y,vCurrD_y,vCurrC_y,vCloseD_y,vCloseC_y,
          vACCTp);   //最后一次小计

   vOpenSumD:=vOpenSumD+vOpenD;
   vOpenSumC:=vOpenSumC+vOpenC;
   vCurrSumD:=vCurrSumD+vCurrD;
   vCurrSumC:=vCurrSumC+vCurrC;
   vCloseSumD:=vCloseSumD+vCloseD;
   vCloseSumC:=vCloseSumC+vCloseC;

   vOpenSumD_y:=vOpenSumD_y+vOpenD_y;
   vOpenSumC_y:=vOpenSumC_y+vOpenC_y;
   vCurrSumD_y:=vCurrSumD_y+vCurrD_y;
   vCurrSumC_y:=vCurrSumC_y+vCurrC_y;
   vCloseSumD_y:=vCloseSumD_y+vCloseD_y;
   vCloseSumC_y:=vCloseSumC_y+vCloseC_y;

  FProgress.free;
  dm.DS103.Append ;                     //总计
  dm.DS103GL_DESCRIPTION.Value:='总计:';
  dm.DS103HAS_CHILD.Value:=1;
  dm.DS103.FieldByName('TYR_OPEN').AsCurrency:=vOpenSumD;
  dm.DS103.FieldByName('TYR_CLOSE').AsCurrency:=vOpenSumC;
  dm.DS103.FieldByName('CURRENT_PERIOD_DEBIT').AsCurrency:=vCurrSumD;
  dm.DS103.FieldByName('CURRENT_PERIOD_CREDIT').AsCurrency:=vCurrSumC;
  dm.DS103.FieldByName('TYR_DEBIT').asCurrency:=vCloseSumD;
  dm.DS103.FieldByName('TYR_CREDIT').asCurrency:=vCloseSumC;

  dm.DS103TYR_OPEN_ORIG.Value:=vOpenSumD_y;
  dm.DS103TYR_CLOSE_ORIG.Value:=vOpenSumC_y;
  dm.DS103CURRENT_PERIOD_DEBIT_ORIG.Value:=vCurrSumD_y;
  dm.DS103CURRENT_PERIOD_CREDIT_ORIG.Value:=vCurrSumC_y;
  dm.DS103TYR_DEBIT_ORIG.Value := vCloseSumD_y;
  dm.DS103TYR_CREDIT_ORIG.Value := vCloseSumC_y;

  dm.DS103.First ;
  dm.Qry103.Close;
 except
   on E: Exception do
     begin
      FProgress.free;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;

procedure TFMain.FormShow(Sender: TObject);
begin
 if dm.Conn.Connected then
  begin
   dm.Qry508.Close;
   dm.Qry508.Open ;
   spinedit1.MaxValue :=DM.Qry508.fieldbyname('curr_FYEAR').AsInteger;
   spinedit1.Value:=DM.Qry508.fieldbyname('curr_FYEAR').AsInteger;
   spinedit2.Value:=DM.Qry508.fieldbyname('curr_period').AsInteger;
   spinedit3.Value:=DM.Qry508.fieldbyname('curr_period').AsInteger;
   edit1.SetFocus ;
  end
 else
  application.Terminate ;
end;

procedure TFMain.BitBtn4Click(Sender: TObject);    //查科目
var
  vlen,i:integer;
begin
 try
  Application.CreateForm(TFAcctSearch, FAcctSearch);

  vlen:=0;
  for i:=1 to spinedit4.Value do
    vlen:=vlen+dm.Qry508.fieldbyname('class'+inttostr(i)).AsInteger;
  FAcctSearch.Qry.close;
  FAcctSearch.Qry.parameters.ParamByName('vlen').Value :=vlen;
  FAcctSearch.Qry.Open ;
  if FAcctSearch.Qry.IsEmpty then
    showmsg('没有找到符合条件的会计科目',1)
  else
  if FAcctSearch.showmodal=mrok then
    Edit1.Text :=FAcctSearch.qry.fieldbyname('gl_acc_number').asstring;

  FAcctSearch.FREE;
 except
   on E: Exception do
     begin
      FAcctSearch.FREE;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;

procedure TFMain.Edit1Exit(Sender: TObject);
var
  vsql:string;
  vlen,i:integer;
begin
 if trim(TEdit(Sender).text)='' then exit;

  vlen:=0;
  for i:=1 to strtoint(spinedit4.Text) do
   vlen:=vlen+dm.Qry508.fieldbyname('class'+inttostr(i)).AsInteger;

  dm.ADOQ.close;
  dm.ADOQ.sql.Clear;
  vsql:='SELECT gl_acc_number from data0103';
  vsql:=vsql+' where gl_acc_number='+''''+trim(TEdit(Sender).text)+'''';
  vsql:=vsql+' and LEN(GL_ACC_NUMBER) <='+inttostr(vlen);
  dm.ADOQ.sql.Text :=vsql;
  dm.ADOQ.open;

  if dm.ADOQ.RecordCount =0 then
   begin
    messagedlg('科目代码不正确或者在此级科目范围无此科目!',mtinformation,[mbok],0);
    TEdit(Sender).SetFocus ;
    exit;
   end;
end;

procedure TFMain.BitBtn3Click(Sender: TObject);
var
  vlen,i:integer;
begin
 try
  Application.CreateForm(TFAcctSearch, FAcctSearch);
  vlen:=0;
  for i:=1 to spinedit4.Value do
    vlen:=vlen+dm.Qry508.fieldbyname('class'+inttostr(i)).AsInteger;
  FAcctSearch.Qry.close;
  FAcctSearch.Qry.parameters.ParamByName('vlen').Value :=vlen;
  FAcctSearch.Qry.Open ;
  if FAcctSearch.Qry.IsEmpty then
    showmsg('没有找到符合条件的会计科目',1)
  else
  if FAcctSearch.showmodal=mrok then
    Edit2.Text :=FAcctSearch.qry.fieldbyname('gl_acc_number').asstring;

  FAcctSearch.FREE;
 except
 on E: Exception do
   begin
    FAcctSearch.FREE;
    messagedlg(E.Message,mtinformation,[mbok],0);
   end;
 end;
end;

//导出EXCEL
procedure TFMain.SpeedButton4Click(Sender: TObject);
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

   Sheet.Cells[1, v_cloumn] :='试算平衡表';

   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;

   Sheet.Cells[2, v_cloumn+1] :='会计年度:'+SpinEdit1.Text+'年  '+'会计期间:'+SpinEdit2.Text +'月到'+SpinEdit3.Text+'月';
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
     end; //end while
   XlApp.Visible := True;
   TDBGrideh(DBGrideh1).DataSource.DataSet.EnableControls;

 Screen.Cursor := crDefault;

end;

procedure TFMain.SpeedButton1Click(Sender: TObject);
begin
 close;
 application.Terminate;
end;

//查看明细帐
procedure TFMain.DBGridEh1DblClick(Sender: TObject);

begin
 try
  if dm.DS103HAS_CHILD.Value<>0 then  exit;

  Application.CreateForm(TFrmDLShow, FrmDLShow);

  FrmDLShow.pis:=CheckBox1.Checked;

  FrmDLShow.Edit1.Text:=SpinEdit1.Text;
  FrmDLShow.Edit2.Text:=SpinEdit2.Text;
  FrmDLShow.Edit3.Text:=SpinEdit3.Text;
  frmdlshow.Edit4.Text:=dm.DS103GL_ACC_NUMBER.Value;
  frmdlshow.Label5.Caption:=dm.DS103GL_DESCRIPTION.Value;

  FrmDLShow.ShowModal;
  FrmDLShow.Free;
 except
  on E: Exception do
    begin
     FrmDLShow.Free;
     messagedlg(E.Message,mtinformation,[mbok],0);
    end;
 end;
end;

procedure TFMain.FormCreate(Sender: TObject);

begin

  if not App_Init(dm.conn) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;
 
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

end;

procedure TFMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
if odd(dm.DS103.RecNo) then
 begin
  DBGridEh1.Canvas.Brush.Color:=clinfobk;
  DBGridEh1.Canvas.Font.Color:=clblack;
  DBGridEh1.Canvas.FillRect(Rect);
  DBGridEh1.DefaultDrawColumnCell(rect,datacol,column,state);
 end;
end;

procedure TFMain.CheckBox3Click(Sender: TObject);
begin
  DBGridEh1.Columns[6].Visible:=checkbox3.Checked;
  DBGridEh1.Columns[3].Visible:=checkbox3.Checked;
  DBGridEh1.Columns[4].Visible:=checkbox3.Checked;
  DBGridEh1.Columns[5].Visible:=checkbox3.Checked;

  DBGridEh1.Columns[15].Visible:=checkbox3.Checked;
  DBGridEh1.Columns[14].Visible:=checkbox3.Checked;
end;

procedure TFMain.CheckBox2Click(Sender: TObject);
begin
  DBGridEh1.Columns[10].Visible:=checkbox2.Checked;
  DBGridEh1.Columns[7].Visible:=checkbox2.Checked;
  DBGridEh1.Columns[8].Visible:=checkbox2.Checked;
  DBGridEh1.Columns[9].Visible:=checkbox2.Checked;

  DBGridEh1.Columns[13].Visible:=checkbox2.Checked;
  DBGridEh1.Columns[12].Visible:=checkbox2.Checked;
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if dm.DS103.Active then dm.DS103.Close;
end;

end.
