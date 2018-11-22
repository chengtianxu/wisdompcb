unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Mask,
  Menus, ADODB, Buttons, Spin,math;

type
  TFrmMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    RichEdit1: TRichEdit;
    CheckBox1: TCheckBox;
    ProgressBar1: TProgressBar;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    function GetCanceTrans():string;
    function AddNewFass():boolean;
  public
    { Public declarations }
    Function GetDH(const pDt:TDate):string;
    //获取服务器时间
    function getDate():string;
    function MtoSt(const pdt:Tdate):string;
    function GeTrans(const pDh:string):boolean;//删除凭证
  end;

var
  FrmMain: TFrmMain;

implementation

uses udm, DateUtils,common;

{$R *.dfm}

function TFrmMain.AddNewFass():boolean;//本月新增
var
 vy,vm:integer;
begin
try
 vy:=strtoint(edit1.text);
 vm:=strtoint(edit2.Text);
 dm.ADOQ.close;
 dm.ADOQ.SQL.Text:=
  'SELECT dbo.data0326.fasset_ptr, dbo.data0326.dept_ptr,'+#13+
      'data0326.FACCU_DEPT_GL_PTR,'+#13+
      'Data0517.MONTH_DEPRE_AMT * dbo.data0326.PERCENTS * 0.01 AS sum_monthamt,'+#13+
      'Data0517.ORIGINAL_VALUE, dbo.Data0517.SUMMED_DEPRE,'+#13+
      'Data0517.MONTH_DEPRE_RATE, dbo.data0326.PERCENTS,'+#13+
      'Data0517.EXPECTED_LIFE_MONTHS, dbo.Data0517.DEPRED_MONTHS,'+#13+
      'Data0517.DEPRE_MTHD_PTR,Data0517.SURPLUS'+#13+
  'FROM Data0517 INNER JOIN'+#13+
      'Data0516 ON dbo.Data0517.STATUS_PTR = dbo.Data0516.RKEY INNER JOIN'+#13+
      'Data0103 INNER JOIN'+#13+
      'data0326 ON dbo.Data0103.RKEY = dbo.data0326.FACCU_DEPT_GL_PTR ON'+#13+
      'Data0517.RKEY = dbo.data0326.fasset_ptr'+#13+
  'WHERE (dbo.Data0517.DEPRED_MONTHS < dbo.Data0517.EXPECTED_LIFE_MONTHS) AND'+#13+
       '(dbo.Data0516.IN_DEPRECIATION = 1) AND '+#13+
       '(dbo.Data0517.active_flag = 1) AND'+#13+
       '(dbo.Data0517.NET_VALUE >= Data0517.MONTH_DEPRE_AMT) AND'+#13+ //净值>=月折旧额，Jacky Zhong 2016-4-20
      '(dbo.Data0517.BOOK_DATE < '''+datetostr(startOfAMonth(vY,vM))+''')';
 dm.ADOQ.Open;             //1:本月计提的折旧,在本月入帐之前
 dm.DS528.Open;

while not dm.ADOQ.Eof do
begin
 dm.DS528.Append ;
 dm.DS528.FieldValues['FYEAR']:=edit1.Text;
 dm.DS528.FieldValues['PERIOD']:=edit2.Text;
 dm.DS528.FieldValues['D0517_ptr']:=DM.ADOQ.FieldValues['fasset_ptr'];
 dm.DS528.FieldValues['ORIGINAL_VALUE']:=0;  //DM.ADOQ.FieldValues['ORIGINAL_VALUE'];
 dm.DS528.FieldValues['SUMMED_DEPRE']:=0;    //DM.ADOQ.FieldValues['SUMMED_DEPRE']+DM.ADOQ.FieldValues['sum_monthamt'];
 dm.DS528.FieldValues['DEPRE_RATE']:=DM.ADOQ.FieldValues['MONTH_DEPRE_RATE'];
 dm.DS528.FieldValues['DEPRE_AMOUNT']:=DM.ADOQ.FieldValues['sum_monthamt'];
 dm.DS528.FieldValues['dept_ptr']:=DM.ADOQ.FieldValues['dept_ptr'];
 dm.DS528.FieldValues['gl_acct_ptr']:=DM.ADOQ.FieldValues['FACCU_DEPT_GL_PTR'];
 dm.DS528.FieldValues['percents']:=DM.ADOQ.FieldValues['PERCENTS'];
 dm.DS528.FieldValues['accu_depre_months']:=DM.ADOQ.FieldValues['DEPRED_MONTHS']+1; //已计提月份+1，与517表保持同步 Jacky Zhong 2016-4-20
 dm.DS528.FieldValues['expected_depre_months']:=DM.ADOQ.FieldValues['EXPECTED_LIFE_MONTHS'];
 dm.DS528.FieldValues['depre_mthd_ptr']:=DM.ADOQ.FieldValues['depre_mthd_ptr'];
 dm.DS528.FieldValues['month_loading']:=1;
 dm.DS528.FieldValues['surplus']:=DM.ADOQ.FieldValues['surplus'];
 dm.DS528.FieldValues['voucher_ptr']:=dm.DS0105.FieldValues['rkey'];
 dm.DS528.FieldValues['month_depre_amt']:=DM.ADOQ.FieldValues['sum_monthamt'];
 dm.DS528.Post;
 ProgressBar1.Position :=
   trunc(100*dm.ADOQ.recno/dm.ADOQ.recordcount);
 dm.ADOQ.Next;
end;

 dm.ADOQ.close;
 dm.ADOQ.SQL.Text:=
  'SELECT dbo.data0326.fasset_ptr, dbo.data0326.dept_ptr,'+#13+
      'data0326.FACCU_DEPT_GL_PTR,'+#13+
      'Data0517.MONTH_DEPRE_AMT * dbo.data0326.PERCENTS * 0.01 AS sum_monthamt,'+#13+
      'Data0517.ORIGINAL_VALUE, dbo.Data0517.SUMMED_DEPRE,'+#13+
      'Data0517.MONTH_DEPRE_RATE, dbo.data0326.PERCENTS,'+#13+
      'Data0517.EXPECTED_LIFE_MONTHS, dbo.Data0517.DEPRED_MONTHS,'+#13+
      'Data0517.DEPRE_MTHD_PTR,Data0517.SURPLUS'+#13+
  'FROM Data0517 INNER JOIN'+#13+
      'Data0516 ON dbo.Data0517.STATUS_PTR = dbo.Data0516.RKEY INNER JOIN'+#13+
      'Data0103 INNER JOIN'+#13+
      'data0326 ON dbo.Data0103.RKEY = dbo.data0326.FACCU_DEPT_GL_PTR ON'+#13+
      'Data0517.RKEY = dbo.data0326.fasset_ptr'+#13+
  'WHERE (dbo.Data0517.DEPRED_MONTHS < dbo.Data0517.EXPECTED_LIFE_MONTHS) AND'+#13+
       '(dbo.Data0516.IN_DEPRECIATION = 1) AND (dbo.Data0517.active_flag = 1) AND'+#13+
      '(dbo.Data0517.BOOK_DATE >= '+quotedstr(datetostr(startOfAMonth(vY,vM)))+') and'+#13+
      '(dbo.Data0517.BOOK_DATE <= '+quotedstr(datetostr(endOfAMonth(vY,vM)))+')';
 dm.ADOQ.Open;             //2:在当前会计期间入帐的固定资产,本期未计提的折旧,
while not dm.ADOQ.Eof do
begin
 dm.DS528.Append ;
 dm.DS528.FieldValues['FYEAR']:=edit1.Text;
 dm.DS528.FieldValues['PERIOD']:=edit2.Text;
 dm.DS528.FieldValues['D0517_ptr']:=DM.ADOQ.FieldValues['fasset_ptr'];
 dm.DS528.FieldValues['ORIGINAL_VALUE']:=0;//DM.ADOQ.FieldValues['ORIGINAL_VALUE'];
 dm.DS528.FieldValues['SUMMED_DEPRE']:=0; //DM.ADOQ.FieldValues['SUMMED_DEPRE'];
 dm.DS528.FieldValues['DEPRE_RATE']:=DM.ADOQ.FieldValues['MONTH_DEPRE_RATE'];
 dm.DS528.FieldValues['DEPRE_AMOUNT']:=0;
 dm.DS528.FieldValues['dept_ptr']:=DM.ADOQ.FieldValues['dept_ptr'];
 dm.DS528.FieldValues['gl_acct_ptr']:=DM.ADOQ.FieldValues['FACCU_DEPT_GL_PTR'];
 dm.DS528.FieldValues['percents']:=DM.ADOQ.FieldValues['PERCENTS'];
 dm.DS528.FieldValues['accu_depre_months']:=DM.ADOQ.FieldValues['DEPRED_MONTHS'];
 dm.DS528.FieldValues['expected_depre_months']:=DM.ADOQ.FieldValues['EXPECTED_LIFE_MONTHS'];
 dm.DS528.FieldValues['depre_mthd_ptr']:=DM.ADOQ.FieldValues['depre_mthd_ptr'];
 dm.DS528.FieldValues['month_loading']:=2;
 dm.DS528.FieldValues['surplus']:=DM.ADOQ.FieldValues['surplus'];   //净残值
 dm.DS528.FieldValues['voucher_ptr']:=null;
 dm.DS528.FieldValues['month_depre_amt']:=0;    //当月折旧
 dm.DS528.Post;
 ProgressBar1.Position :=
   trunc(100*dm.ADOQ.recno/dm.ADOQ.recordcount);
 dm.ADOQ.Next;
end;

 dm.ADOQ.close;
 dm.ADOQ.SQL.Text:=
  'SELECT dbo.data0326.fasset_ptr, dbo.data0326.dept_ptr,'+#13+
      'data0326.FACCU_DEPT_GL_PTR,'+#13+
      'Data0517.MONTH_DEPRE_AMT * dbo.data0326.PERCENTS * 0.01 AS sum_monthamt,'+#13+
      'Data0517.ORIGINAL_VALUE, dbo.Data0517.SUMMED_DEPRE,'+#13+
      'Data0517.MONTH_DEPRE_RATE, dbo.data0326.PERCENTS,'+#13+
      'Data0517.EXPECTED_LIFE_MONTHS, dbo.Data0517.DEPRED_MONTHS,'+#13+
      'Data0517.DEPRE_MTHD_PTR,Data0517.SURPLUS'+#13+
  'FROM Data0517 INNER JOIN'+#13+
      'Data0516 ON dbo.Data0517.STATUS_PTR = dbo.Data0516.RKEY INNER JOIN'+#13+
      'Data0103 INNER JOIN'+#13+
      'data0326 ON dbo.Data0103.RKEY = dbo.data0326.FACCU_DEPT_GL_PTR ON'+#13+
      'Data0517.RKEY = dbo.data0326.fasset_ptr'+#13+
  'WHERE (Data0517.DEPRED_MONTHS >= Data0517.EXPECTED_LIFE_MONTHS) AND'+#13+
       '(Data0516.IN_DEPRECIATION = 1) AND (Data0517.active_flag = 1)';
 dm.ADOQ.Open;             //3:已计提完成的有效的固定资产,本期未计提折旧,
while not dm.ADOQ.Eof do
begin
 dm.DS528.Append ;
 dm.DS528.FieldValues['FYEAR']:=edit1.Text;
 dm.DS528.FieldValues['PERIOD']:=edit2.Text;
 dm.DS528.FieldValues['D0517_ptr']:=DM.ADOQ.FieldValues['fasset_ptr'];
 dm.DS528.FieldValues['ORIGINAL_VALUE']:=0;//DM.ADOQ.FieldValues['ORIGINAL_VALUE'];
 dm.DS528.FieldValues['SUMMED_DEPRE']:=0;  //DM.ADOQ.FieldValues['SUMMED_DEPRE'];
 dm.DS528.FieldValues['DEPRE_RATE']:=DM.ADOQ.FieldValues['MONTH_DEPRE_RATE'];
 dm.DS528.FieldValues['DEPRE_AMOUNT']:=0;
 dm.DS528.FieldValues['dept_ptr']:=DM.ADOQ.FieldValues['dept_ptr'];
 dm.DS528.FieldValues['gl_acct_ptr']:=DM.ADOQ.FieldValues['FACCU_DEPT_GL_PTR'];
 dm.DS528.FieldValues['percents']:=DM.ADOQ.FieldValues['PERCENTS'];
 dm.DS528.FieldValues['accu_depre_months']:=DM.ADOQ.FieldValues['DEPRED_MONTHS'];
 dm.DS528.FieldValues['expected_depre_months']:=DM.ADOQ.FieldValues['EXPECTED_LIFE_MONTHS'];
 dm.DS528.FieldValues['depre_mthd_ptr']:=DM.ADOQ.FieldValues['depre_mthd_ptr'];
 dm.DS528.FieldValues['month_loading']:=3;
 dm.DS528.FieldValues['surplus']:=DM.ADOQ.FieldValues['surplus'];   //净残值
 dm.DS528.FieldValues['voucher_ptr']:=null;
 dm.DS528.FieldValues['month_depre_amt']:=0;
 dm.DS528.Post;
 ProgressBar1.Position :=
   trunc(100*dm.ADOQ.recno/dm.ADOQ.recordcount);
 dm.ADOQ.Next;
end;

 dm.ADOQ.close;
 dm.ADOQ.SQL.Text:=
  'SELECT dbo.data0326.fasset_ptr, dbo.data0326.dept_ptr,'+#13+
      'data0326.FACCU_DEPT_GL_PTR,'+#13+
      'Data0517.MONTH_DEPRE_AMT * dbo.data0326.PERCENTS * 0.01 AS sum_monthamt,'+#13+
      'Data0517.ORIGINAL_VALUE, dbo.Data0517.SUMMED_DEPRE,'+#13+
      'Data0517.MONTH_DEPRE_RATE, dbo.data0326.PERCENTS,'+#13+
      'Data0517.EXPECTED_LIFE_MONTHS, dbo.Data0517.DEPRED_MONTHS,'+#13+
      'Data0517.DEPRE_MTHD_PTR,Data0517.SURPLUS'+#13+
  'FROM Data0517 INNER JOIN'+#13+
      'Data0516 ON dbo.Data0517.STATUS_PTR = dbo.Data0516.RKEY INNER JOIN'+#13+
      'Data0103 INNER JOIN'+#13+
      'data0326 ON dbo.Data0103.RKEY = dbo.data0326.FACCU_DEPT_GL_PTR ON'+#13+
      'Data0517.RKEY = dbo.data0326.fasset_ptr'+#13+
   'where (Data0516.IN_DEPRECIATION = 0) AND (Data0517.active_flag = 1)';
 dm.ADOQ.Open;             //4:当前有效的,但本期未使用的固定资产,本期未计提折旧,
while not dm.ADOQ.Eof do
begin
 dm.DS528.Append ;
 dm.DS528.FieldValues['FYEAR']:=edit1.Text;
 dm.DS528.FieldValues['PERIOD']:=edit2.Text;
 dm.DS528.FieldValues['D0517_ptr']:=DM.ADOQ.FieldValues['fasset_ptr'];
 dm.DS528.FieldValues['ORIGINAL_VALUE']:=0; //DM.ADOQ.FieldValues['ORIGINAL_VALUE'];
 dm.DS528.FieldValues['SUMMED_DEPRE']:=0;   //DM.ADOQ.FieldValues['SUMMED_DEPRE'];
 dm.DS528.FieldValues['DEPRE_RATE']:=DM.ADOQ.FieldValues['MONTH_DEPRE_RATE'];
 dm.DS528.FieldValues['DEPRE_AMOUNT']:=0;
 dm.DS528.FieldValues['dept_ptr']:=DM.ADOQ.FieldValues['dept_ptr'];
 dm.DS528.FieldValues['gl_acct_ptr']:=DM.ADOQ.FieldValues['FACCU_DEPT_GL_PTR'];
 dm.DS528.FieldValues['percents']:=DM.ADOQ.FieldValues['PERCENTS'];
 dm.DS528.FieldValues['accu_depre_months']:=DM.ADOQ.FieldValues['DEPRED_MONTHS'];
 dm.DS528.FieldValues['expected_depre_months']:=DM.ADOQ.FieldValues['EXPECTED_LIFE_MONTHS'];
 dm.DS528.FieldValues['depre_mthd_ptr']:=DM.ADOQ.FieldValues['depre_mthd_ptr'];
 dm.DS528.FieldValues['month_loading']:=3;
 dm.DS528.FieldValues['surplus']:=DM.ADOQ.FieldValues['surplus'];   //净残值
 dm.DS528.FieldValues['voucher_ptr']:=null;
 dm.DS528.FieldValues['month_depre_amt']:=0;        //当月折旧
 dm.DS528.Post;
 ProgressBar1.Position :=
   trunc(100*dm.ADOQ.recno/dm.ADOQ.recordcount);
 dm.ADOQ.Next;
end;
// Jacky zhong 2016-04-20，增加净值<月折旧额，最后一次不参与折旧的设备
 dm.ADOQ.close;
 dm.ADOQ.SQL.Text:=
  'SELECT dbo.data0326.fasset_ptr, dbo.data0326.dept_ptr,'+#13+
      'data0326.FACCU_DEPT_GL_PTR,'+#13+
      'Data0517.MONTH_DEPRE_AMT * dbo.data0326.PERCENTS * 0.01 AS sum_monthamt,'+#13+
      'Data0517.ORIGINAL_VALUE, dbo.Data0517.SUMMED_DEPRE,'+#13+
      'Data0517.MONTH_DEPRE_RATE, dbo.data0326.PERCENTS,'+#13+
      'Data0517.EXPECTED_LIFE_MONTHS, dbo.Data0517.DEPRED_MONTHS,'+#13+
      'Data0517.DEPRE_MTHD_PTR,Data0517.SURPLUS'+#13+
  'FROM Data0517 INNER JOIN'+#13+
      'Data0516 ON dbo.Data0517.STATUS_PTR = dbo.Data0516.RKEY INNER JOIN'+#13+
      'Data0103 INNER JOIN'+#13+
      'data0326 ON dbo.Data0103.RKEY = dbo.data0326.FACCU_DEPT_GL_PTR ON'+#13+
      'Data0517.RKEY = dbo.data0326.fasset_ptr'+#13+
  'WHERE (dbo.Data0517.DEPRED_MONTHS < dbo.Data0517.EXPECTED_LIFE_MONTHS) AND'+#13+
       '(dbo.Data0516.IN_DEPRECIATION = 1) AND (dbo.Data0517.active_flag = 1) AND'+#13+
       '(dbo.Data0517.NET_VALUE < Data0517.MONTH_DEPRE_AMT) AND'+#13+ //净值<月折旧额，Jacky Zhong 2016-4-20 
      '(dbo.Data0517.BOOK_DATE < '''+datetostr(startOfAMonth(vY,vM))+''')';
 dm.ADOQ.Open;             //5:当前净值少于月折旧额不参于计提
 dm.DS528.Open;

while not dm.ADOQ.Eof do
begin
 dm.DS528.Append ;
 dm.DS528.FieldValues['FYEAR']:=edit1.Text;
 dm.DS528.FieldValues['PERIOD']:=edit2.Text;
 dm.DS528.FieldValues['D0517_ptr']:=DM.ADOQ.FieldValues['fasset_ptr'];
 dm.DS528.FieldValues['ORIGINAL_VALUE']:=0;//DM.ADOQ.FieldValues['ORIGINAL_VALUE'];
 dm.DS528.FieldValues['SUMMED_DEPRE']:=0;  //DM.ADOQ.FieldValues['SUMMED_DEPRE']+DM.ADOQ.FieldValues['sum_monthamt'];
 dm.DS528.FieldValues['DEPRE_RATE']:=DM.ADOQ.FieldValues['MONTH_DEPRE_RATE'];
 dm.DS528.FieldValues['DEPRE_AMOUNT']:=0;              //当前没有折旧额
 dm.DS528.FieldValues['dept_ptr']:=DM.ADOQ.FieldValues['dept_ptr'];
 dm.DS528.FieldValues['gl_acct_ptr']:=DM.ADOQ.FieldValues['FACCU_DEPT_GL_PTR'];
 dm.DS528.FieldValues['percents']:=DM.ADOQ.FieldValues['PERCENTS'];
 dm.DS528.FieldValues['accu_depre_months']:=DM.ADOQ.FieldValues['DEPRED_MONTHS']; 
 dm.DS528.FieldValues['expected_depre_months']:=DM.ADOQ.FieldValues['EXPECTED_LIFE_MONTHS'];
 dm.DS528.FieldValues['depre_mthd_ptr']:=DM.ADOQ.FieldValues['depre_mthd_ptr'];
 dm.DS528.FieldValues['month_loading']:=1;
 dm.DS528.FieldValues['surplus']:=DM.ADOQ.FieldValues['surplus'];
 dm.DS528.FieldValues['voucher_ptr']:=dm.DS0105.FieldValues['rkey'];
 dm.DS528.FieldValues['month_depre_amt']:=DM.ADOQ.FieldValues['sum_monthamt'];
 dm.DS528.Post;
 ProgressBar1.Position :=
   trunc(100*dm.ADOQ.recno/dm.ADOQ.recordcount);
 dm.ADOQ.Next;
end;

 result:=true;
except
  on E: Exception do
   begin
    messagedlg(E.Message,mtinformation,[mbok],0);
    result:=false;
   end;
end;
end;

function TFrmMain.GetCanceTrans():string;
begin
 dm.ADOQ.close;
 dm.ADOQ.SQL.Clear;
 dm.ADOQ.SQL.Text:='select VOUCHER from data0105'+#13+
                   'where FYEAR='+edit1.Text+#13+
                   'and PERIOD='+edit2.Text+#13+
                   'and SPECIAL_POSTING =''D'''+#13+
                   'and STATUS =5';
 dm.ADOQ.Open;
 if dm.ADOQ.IsEmpty  then
  result:=''
 else
  result:=dm.ADOQ.FieldValues['VOUCHER'];
end;

function TFrmMain.GeTrans(const pDh:string):boolean;
var                          //*******生成记帐凭证*******//
  mdt:Tdate;
  vCur,vdur:Currency;
  vY,vM:integer;
begin
 try
   result:=true;
   vY:=strtoint(edit1.Text);
   vM:=strtoint(edit2.Text);
   mdt:=endOfAMonth(vY,vM);   //服务器日期

   dm.Qry326.Close;
   dm.Qry326.Parameters.ParamByName('vBdate').Value:=startOfAMonth(vY,vM);
   dm.Qry326.Open;
   dm.Qry0517.Close;
   dm.Qry0517.Parameters.ParamByName('vBdate').Value:=startOfAMonth(vY,vM);
   dm.Qry0517.Open;
  if (dm.Qry326.IsEmpty) or (dm.Qry0517.IsEmpty) then
   begin                          //无借贷数据操作失败
    result:=false;
    exit;
   end;
   vcur:=0;  //凭证贷方合计
   vdur:=0;  //凭证借方合计
   dm.DS0105.close;
   dm.DS0105.open;
   dm.DS0105.append;

   if pDh='' then
    dm.DS0105.fieldbyname('voucher').Value:=getdh(mdt)
   else
   begin
    dm.ADOQ.Close;
    dm.ADOQ.SQL.Clear;
    dm.ADOQ.SQL.Text:='delete data0105 where VOUCHER='''+pDh+'''';
    dm.ADOQ.ExecSQL;
    dm.DS0105.fieldbyname('voucher').Value:=pDh;
   end;
   dm.DS0105.Fieldbyname('batch_number').Value:='';
   dm.DS0105.Fieldbyname('entered_by_empl_ptr').asstring:=user_ptr;
   dm.DS0105.Fieldbyname('entered_dt').AsString:=datetostr(mdt);
   dm.DS0105.Fieldbyname('FYEAR').Value:=vY;
   dm.DS0105.Fieldbyname('period').Value:=vM;
   dm.DS0105.fieldbyname('vou_type').Value:=4;            //凭证类型
   dm.DS0105.fieldbyname('special_posting').Value:='D';  //折旧凭证标示
   dm.DS0105.fieldbyname('trans_type').Value:=9; //业务类型
   dm.DS0105.FieldByName('BATCH_NUMBER').Value:='计提折旧';
   if CheckBox1.Checked =true then
    begin
     dm.DS0105.fieldbyname('status').Value:=2;           //主管审核状态
     dm.DS0105.Fieldbyname('audited_by_empl_ptr').asstring:=user_ptr;
     dm.DS0105.Fieldbyname('supervisor_ptr').asstring:=user_ptr;
    end
   else
    begin
     dm.DS0105.fieldbyname('status').Value:=0;           //未审核
    end;
   dm.DS0105.Post;                          //新增凭证

  if dm.DS0106.Active =false then  dm.DS0106.open;

  while not dm.Qry326.Eof do     //新增折旧费用借方科目
   with dm.DS0106 do
    begin
     append;
     Fieldbyname('gl_header_ptr').Value:=dm.DS0105.fieldbyname('rkey').Value;
     Fieldbyname('gl_acct_no_ptr').Value:=DM.Qry326FACCU_DEPT_GL_PTR.Value;
     Fieldbyname('ref_number').asstring:=DM.Qry326GL_ACC_NUMBER.Value;
     Fieldbyname('description').Value:='计提本期折旧';
     Fieldbyname('amount').AsCurrency:=dm.Qry326sum_monthamt.Value;    //人民币
     Fieldbyname('price').AsCurrency:=dm.Qry326sum_monthamt.Value;     //外币
     Fieldbyname('d_c').Value:=DM.Qry326DB_CR.Value;
     Fieldbyname('CURR_PTR').Value:=1;  //货币
     Fieldbyname('EXCH_RATE').Value:=1;  //汇率
     if dm.Qry326DB_CR.Value='D' then
      vdur:=vdur+ dm.Qry326sum_monthamt.Value
     else
      vCur:=vCur+ dm.Qry326sum_monthamt.Value;
     dm.Qry326.Next;
     ProgressBar1.Position :=
       trunc(100*dm.Qry326.recno/dm.Qry326.recordcount);
    end;//end  dm.DS0106

  while not dm.Qry0517.Eof do
   with DM.DS0106 do          //凭证分录       //累计折旧贷方科目
    begin
     append;
     Fieldbyname('gl_header_ptr').Value:=dm.DS0105.fieldbyname('rkey').Value;
     Fieldbyname('gl_acct_no_ptr').Value:=DM.Qry0517DEPRE_ACCT_PTR.Value ;
     Fieldbyname('ref_number').asstring:=DM.Qry0517GL_ACC_NUMBER.Value;
     Fieldbyname('description').Value:='计提本期折旧';
     Fieldbyname('srce_ptr').Value:=0;
     Fieldbyname('amount').AsCurrency:=DM.Qry0517sum_monthamt.Value;
     Fieldbyname('price').AsCurrency:=DM.Qry0517sum_monthamt.Value;
     Fieldbyname('d_c').Value:=DM.Qry0517DB_CR.Value;
     Fieldbyname('CURR_PTR').Value:=1;  //货币
     Fieldbyname('EXCH_RATE').Value:=1;  //汇率
     if dm.Qry0517DB_CR.Value='D' then
      vdur:=vdur+ dm.Qry0517sum_monthamt.Value
     else
      vCur:=vCur+ dm.Qry0517sum_monthamt.Value;
     dm.Qry0517.Next ;
     ProgressBar1.Position :=
       trunc(100*dm.Qry0517.recno/dm.Qry0517.recordcount);
    end;//end while not dm.Qry0517.Eof

 if vdur<>vcur then    //凭证借贷不平衡操作失败
  begin
   result:=false;
   exit;
  end;

  dm.DS0106.UpdateBatch();
 except
   result:=false;
 end;
end;


//获取日期
function TFrmMain.getDate():string;
begin
  DM.ADOQ.Close ;
  dm.ADOQ.SQL.Clear ;
  dm.ADOQ.SQL.Text :='select getdate() as dt';
  DM.ADOQ.OPEN;
 result:=datetostr(strtodatetime(dm.ADOQ.Fieldbyname('dt').AsString))
end;

Function TFrmMain.GetDH(const pDt:TDate):string;
var
 voucher:string;
 pr_req:integer;
begin
 voucher:='TA'+copy(inttostr(yearof(pDt)),3,2);  //年度
 if length(inttostr(monthof(pDt))) < 2 then
  voucher := voucher+'0'+inttostr(monthof(pDt))
 else
  voucher := voucher+inttostr(monthof(pDt));      //月份
 with dm.ADOQ do
  begin
   close;
   sql.Clear;
   sql.Add('select top 1 VOUCHER from data0105');
   sql.Add('where VOUCHER like '''+voucher+'%''');
   sql.Add('order by voucher desc');
   open;
  end;
 if dm.ADOQ.IsEmpty then
  begin
   voucher:= voucher+'00001';
  end
 else
  begin
   pr_req := strtoint(copy(dm.ADOQ.fieldvalues['VOUCHER'],
   length(trim(voucher))+1,5));
   pr_req := 100000+pr_req+1;
   voucher := voucher+copy(inttostr(pr_req),2,5);
  end;
 result:=voucher;
end;
//月转成字符
function TFrmMain.MtoSt(const pdt:Tdate):string;
var
  mst:string;
 begin

  mst:=inttostr(monthOf(pdt));
  if Length(mst)<2 then
  mst:='0'+mst;
  result:=mst;
 end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
  application.Terminate;
end;
//*****************************************************************
//********1.生成转帐凭证：借，折旧费，贷：累计折旧           ******
//********2,更新固定资产，"当前已计提月份"=当前已计提月份+1  ******
//********3.更新固定资产，"当前累计折旧"=当前累计折旧+月折旧额*****
//********4.更新固定资产，"净值"=原值-当前累计折旧*****
//*****************************************************************
procedure TFrmMain.BitBtn1Click(Sender: TObject);
var
  vy,vm:integer;
begin
  vy:=strtoint(edit1.text);
  vm:=strtoint(edit2.Text);

  if dm.DS0508.fieldbyname('depre_flag').Value = 1 then
   begin
    messagedlg('本期已经计提折旧！',mtinformation,[mbok],0);
    exit;
   end;

  if messagedlg('开始计提折旧请再次确认!',mtconfirmation,[mbyes,mbno],0)=mryes then
  try
   dm.ADOCnn.BeginTrans ;

    if not geTrans(GetCanceTrans()) then //生成凭证
     begin
      dm.ADOCnn.RollbackTrans ;
      messagedlg('没有可计提的固定资产或者凭证借贷不平衡操作失败!',mterror,[mbcancel],0);
      exit;
     end;

     //本月计提折旧明细,及本月新增的固定资产但没有折旧金额,包括有效的但已计提完成的固定资产
    if not AddNewFass() then
     begin

      dm.ADOCnn.RollbackTrans ;
      messagedlg('新增折旧明细时出现错误请与管理员联系!',mterror,[mbcancel],0);
      exit;

     end;

   dm.ADOQ.Close;
   dm.ADOQ.SQL.Text:='update data0517'+#13+
   'set Data0517.SUMMED_DEPRE='+#13+     //当前累计折旧
                'Data0517.SUMMED_DEPRE + Data0517.MONTH_DEPRE_AMT,'+#13+
   'Data0517.DEPRED_MONTHS=Data0517.DEPRED_MONTHS + 1,'+#13+  //当前计提月份
   'Data0517.NET_VALUE='+#13+               //当前净值
               'Data0517.ORIGINAL_VALUE - Data0517.SUMMED_DEPRE - Data0517.MONTH_DEPRE_AMT'+#13+
   'FROM Data0517 INNER JOIN'+#13+
   'Data0516 ON Data0517.STATUS_PTR = Data0516.RKEY'+#13+
   'WHERE (Data0517.BOOK_DATE < '''+datetostr(startOfAMonth(vY,vM))+''')'+#13+
      'AND (Data0517.active_flag = 1) '+#13+
      'AND (Data0517.NET_VALUE >= Data0517.MONTH_DEPRE_AMT) '+#13+//净值>=月折旧额，jacky zhong 2016-4-20
      'AND (Data0517.DEPRED_MONTHS < Data0517.EXPECTED_LIFE_MONTHS)'+#13+
      'AND (Data0516.IN_DEPRECIATION = 1)';
   dm.ADOQ.ExecSQL;
   //修改517固定资产卡片中的

   dm.ADOQ.Close;
   dm.ADOQ.SQL.Text:= 'update data0528 '+
         'set data0528.ORIGINAL_VALUE=Data0517.ORIGINAL_VALUE,'+
         '    data0528.SUMMED_DEPRE=Data0517.SUMMED_DEPRE '+
         'from data0528 inner join data0517 '+
         ' on data0528.d0517_ptr=data0517.rkey '+
         'where data0528.rkey in(select max(rkey) from data0528 '+
                       'where FYEAR='+edit1.Text+' and PERIOD='+edit2.Text+
                       ' group by d0517_ptr)';
   dm.ADOQ.ExecSQL;
   //更新折旧明细528表中的固定资产原值和累计折旧，同一个资产有多个明细，但累计折旧和资产原值只能更新一条记录

   //计提折旧标志
   dm.DS0508.Edit;
   dm.DS0508.fieldbyname('depre_flag').AsInteger :=1;
   dm.DS0508.Post ;

   dm.ADOCnn.CommitTrans ;

   messagedlg('计提折旧完毕!',mtinformation,[mbok],0);
  except
    on E: Exception do
     begin
      dm.ADOCnn.RollbackTrans ;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
  end;

end;


procedure TFrmMain.FormCreate(Sender: TObject);

begin
  if not App_Init(dm.ADOCnn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
if  dm.ADOCnn.Connected then
  begin

  DM.DS0508.close ;
  DM.DS0508.Open ;
  edit1.text:=DM.DS0508.fieldbyname('curr_FYEAR').asstring;
  edit2.text:=DM.DS0508.fieldbyname('curr_period').asstring;   
  end;
end;

end.

