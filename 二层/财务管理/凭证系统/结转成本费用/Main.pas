unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Mask,
  Menus, ADODB, Buttons, Spin,DateUtils;

type
  TFrmMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    RichEdit1: TRichEdit;
    ProgressBar1: TProgressBar;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    function finderror():string;
    function GetPRkey(prky:integer;var parent_ptr:integer):boolean;
    Function GeTrans(const pDh:string):boolean;    //生成凭证
    Function GetDH(const pDt:TDate):string;
    function updateGL(const pCurrD,pCurrC:currency;vgl:integer;dbcr:char):boolean;
    function GetTrans():integer;
    function GetCancelTrans():string;
    function GetzjTrans():integer;
    function SaveBeforClose():boolean;
    procedure update_110_PROFIT(rkey103:integer;typ_close:currency);
    function GetPRkey_typclose(prky:integer;var parent_ptr:integer;
                                var ty_close:currency):boolean;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses udm,common;

{$R *.dfm}
function TFrmMain.finderror: string;
begin
dm.ADOQ.Close;
dm.ADOQ.SQL.Clear;
dm.ADOQ.SQL.Text:='SELECT top 1 Data0103.gl_acc_number'+#13+
'FROM Data0103 INNER JOIN'+#13+
      'Data0103 Data0103_1 ON Data0103.auto_trans_ptr = Data0103_1.RKEY'+#13+
'WHERE (Data0103.TYR_CLOSE<>0)'+#13+
      'AND (Data0103.HAS_CHILD = 0)'+#13+
      'AND (Data0103.ACC_TP=4)'+#13+
      'AND (data0103.curr_tp<>0)';
dm.ADOQ.Open;
if dm.ADOQ.IsEmpty then
 result:=''
else
 result:=dm.ADOQ.fieldbyname('gl_acc_number').AsString;
dm.ADOQ.Close;
end;

function TFrmMain.GetPRkey_typclose(prky:integer;var parent_ptr:integer;
                              var ty_close:currency):boolean;
begin
 dm.ADOQ.Close;
 dm.ADOQ.SQL.Text:='SELECT Data0103.PARENT_PTR,data0103_1.TYR_CLOSE'+#13+
                   'FROM Data0103 inner join data0103 as data0103_1'+#13+
                   'on data0103.PARENT_PTR=data0103_1.rkey'+#13+
                   'WHERE Data0103.RKEY ='+inttostr(prky);

 dm.ADOQ.Open;
 if dm.ADOQ.FieldValues['PARENT_PTR']>0 then
  begin
   parent_ptr:=dm.ADOQ.FieldValues['PARENT_PTR'];
   ty_close:=dm.ADOQ.Fieldbyname('tyr_close').AsCurrency;
   result:=true;
  end
 else
  result:=false;
end;

procedure TFrmMain.update_110_PROFIT(rkey103:integer;typ_close:currency);
var
 parent_ptr:integer;
 ty_close:currency;
begin
  dm.ds110.Close;
  dm.DS110.Parameters.ParamByName('vY').Value:=strtoint(edit1.Text);
  dm.DS110.Parameters.ParamByName('rkey103').Value:=rkey103;
  dm.ds110.open;

  dm.ds110.edit;
  dm.ds110.fieldbyname('TYR_PERIOD_'+edit2.Text+'_PROFIT').AsCurrency:=typ_close;   //本期贷方发生额
  dm.DS110.Post;

  parent_ptr:=0;
  ty_close:=0;
  if self.GetPRkey_typclose(rkey103,parent_ptr,ty_close) then
  update_110_PROFIT(parent_ptr,ty_close);
end;

function TFrmMain.SaveBeforClose():boolean;
begin
 try
  dm.ADOQ.Close;  //保存需要结转的期未成本费用的余额,因为结转之后就为零了
  dm.ADOQ.SQL.Clear;
  dm.ADOQ.SQL.Text:='update data0110'+#13+
      'set TYR_PERIOD_'+edit2.Text+'_PROFIT = Data0103.TYR_CLOSE'+#13+
      'FROM Data0103 INNER JOIN'+#13+
      'Data0110 ON Data0103.RKEY = Data0110.GL_ACCT_PTR INNER JOIN'+#13+
      'Data0103 Data0103_1 ON Data0103.auto_trans_ptr = Data0103_1.RKEY'+#13+
      'WHERE (dbo.Data0103.ACC_TP = 4)'+#13+
      'AND (Data0103.TYR_CLOSE <> 0)'+#13+
      'AND (Data0110.FYEAR ='+edit1.Text+')';
  dm.ADOQ.ExecSQL;

  dm.ADOQ.Close;  //保存成本费用科目自动结转指定的科目的余额,因为结转之后余额将发生变发
  dm.ADOQ.SQL.Clear;
  dm.ADOQ.SQL.Text:='SELECT Data0103.auto_trans_ptr, Data0103_1.TYR_CLOSE'+#13+
   'FROM Data0103 INNER JOIN'+#13+
   'Data0103 Data0103_1 ON'+#13+
   'Data0103.auto_trans_ptr = Data0103_1.RKEY'+#13+
   'WHERE (Data0103.ACC_TP = 4)'+#13+
   'GROUP BY Data0103.auto_trans_ptr,Data0103_1.TYR_CLOSE';
  dm.ADOQ.Open;

  while not dm.ADOQ.Eof do
   begin
    update_110_PROFIT(dm.ADOQ.Fieldbyname('auto_trans_ptr').AsInteger,
                      dm.ADOQ.Fieldbyname('TYR_CLOSE').AsCurrency);
    dm.ADOQ.Next;
   end;

  result:=true;
 except
  result:=false;
 end;
end;

function TFrmMain.GetzjTrans():integer;
var
 vsql:string;
begin
 vsql:='select rkey from data0105 ';
 vsql:= vsql+' where ';
 vsql:= vsql+' FYEAR='+edit1.Text;
 vsql:= vsql+' and ';
 vsql:= vsql+' PERIOD='+edit2.Text;
 vsql:= vsql+' and ';
 vsql:= vsql+' SPECIAL_POSTING =''D''';
 vsql:= vsql+' and ';
 vsql:= vsql+' STATUS =3';

 dm.ADOQ.close;
 dm.ADOQ.SQL.Clear;
 dm.ADOQ.SQL.Text:=vsql;
 dm.ADOQ.Open;
 if dm.ADOQ.RecordCount=0 then
  result:=0
 else
  result:=dm.ADOQ.FieldValues['rkey'];
end;

function TFrmMain.GetTrans():integer;
var
 vsql:string;
begin
 vsql:='select rkey from data0105 ';
 vsql:= vsql+'where FYEAR='+edit1.Text;
 vsql:= vsql+'and PERIOD='+edit2.Text;
 vsql:= vsql+'and SPECIAL_POSTING =''A''';
 vsql:= vsql+'and STATUS =3';

 dm.ADOQ.close;
 dm.ADOQ.SQL.Clear;
 dm.ADOQ.SQL.Text:=vsql;
 dm.ADOQ.Open;
 if dm.ADOQ.RecordCount=0 then
  result:=0
 else
  result:=dm.ADOQ.FieldValues['rkey'];
end;

function TFrmMain.GetCancelTrans():string;
var
 vsql:string;
begin
 vsql:='select VOUCHER from data0105 ';
 vsql:= vsql+'where FYEAR='+edit1.Text;
 vsql:= vsql+' and PERIOD='+edit2.Text;
 vsql:= vsql+' and SPECIAL_POSTING =''A''';
 vsql:= vsql+' and STATUS =5';

 dm.ADOQ.close;
 dm.ADOQ.SQL.Clear;
 dm.ADOQ.SQL.Text:=vsql;
 dm.ADOQ.Open;
 if dm.ADOQ.IsEmpty then
  result:=''
 else
  result:=dm.ADOQ.FieldValues['VOUCHER'];
end;

function TFrmMain.GetPRkey(prky:integer;var parent_ptr:integer):boolean;
begin
 dm.ADOQ.Close;
 dm.ADOQ.SQL.Text:='SELECT PARENT_PTR'+#13+
                   'FROM Data0103'+#13+
                   'WHERE RKEY ='+inttostr(prky);
 dm.ADOQ.Parameters.Refresh;
 dm.ADOQ.Open;
 if dm.ADOQ.FieldValues['PARENT_PTR']>0 then
  begin
   parent_ptr:=dm.ADOQ.FieldValues['PARENT_PTR'];
   result:=true;
  end
 else
  result:=false;
end;

function TFrmMain.updateGL(const pCurrD,pCurrC:currency;vgl:integer;dbcr:char):boolean;
var
  parent_ptr:integer;
begin
 try
 if dbcr='D' then
  begin
   dm.DS103P.Parameters.ParamValues['debit'] := pCurrD;
   dm.DS103P.Parameters.ParamValues['credit'] := 0;
   dm.DS103P.Parameters.ParamValues['debit_orig'] := pCurrC;
   dm.DS103P.Parameters.ParamValues['credit_orig'] := 0;
   dm.DS103P.Parameters.ParamValues['rkey'] := vgl;
   dm.DS103P.Execute;
  end
 else
  begin
   dm.DS103P.Parameters.ParamValues['debit'] := 0;
   dm.DS103P.Parameters.ParamValues['credit'] := pCurrD;
   dm.DS103P.Parameters.ParamValues['debit_orig'] := 0;
   dm.DS103P.Parameters.ParamValues['credit_orig'] := pCurrC;
   dm.DS103P.Parameters.ParamValues['rkey'] := vgl;
   dm.DS103P.Execute;
  end;

  dm.DS103ZR.Close;
  dm.DS103ZR.Parameters[0].Value:=vgl;
  dm.DS103ZR.Open;

  dm.DS103ZR.Edit;

 if dm.DS103ZRDB_CR.Value ='D' then
  begin
   dm.DS103ZRTYR_CLOSE.Value:= dm.DS103ZRTYR_OPEN.Value+
                               dm.DS103ZRCURRENT_PERIOD_DEBIT.Value-
                               dm.DS103ZRCURRENT_PERIOD_CREDIT.Value;
   dm.DS103ZRTYR_CLOSE_ORIG.Value:=dm.DS103ZRTYR_OPEN_ORIG.Value+
                               dm.DS103ZRCURRENT_PERIOD_DEBIT_ORIG.Value-
                               dm.DS103ZRCURRENT_PERIOD_CREDIT_ORIG.Value;
  end
 else
  begin
   dm.DS103ZRTYR_CLOSE.Value:= dm.DS103ZRTYR_OPEN.Value+
                               dm.DS103ZRCURRENT_PERIOD_CREDIT.Value-
                               dm.DS103ZRCURRENT_PERIOD_DEBIT.Value;
   dm.DS103ZRTYR_CLOSE_ORIG.Value:= dm.DS103ZRTYR_OPEN_ORIG.Value+
                               dm.DS103ZRCURRENT_PERIOD_CREDIT_ORIG.Value-
                               dm.DS103ZRCURRENT_PERIOD_DEBIT_ORIG.Value;
  end;
 dm.DS103ZR.Post;

  parent_ptr:=0;
  if self.GetPRkey(vgl,parent_ptr) then
   updateGL(pCurrD,pCurrC,parent_ptr,dbcr);
 result:=true;
 except
  result:=false;
 end;
end;

function TFrmMain.GeTrans(const pDh:string):boolean;  //*******生成记帐凭证*******
var
  mdt:Tdate;
  vY,vM:integer;
begin
 try
   result:=true;
   vY:=strtoint(edit1.Text);
   vM:=strtoint(edit2.Text);
   mdt:=EndOfAMonth(vY,vM);   //服务器日期当前月份中最后一天

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

   dm.DS0105.Fieldbyname('entered_by_empl_ptr').asstring := user_ptr;
   dm.DS0105.Fieldbyname('audited_by_empl_ptr').asstring := user_ptr;
   dm.DS0105.Fieldbyname('posted_by_empl_ptr').asstring := user_ptr;
   dm.DS0105.Fieldbyname('entered_dt').AsString:=datetostr(mdt);
   dm.DS0105.Fieldbyname('FYEAR').Value := strtoint(edit1.Text);
   dm.DS0105.Fieldbyname('period').Value := strtoint(edit2.Text);
   dm.DS0105.fieldbyname('vou_type').Value:=4;   //凭证类型
   dm.DS0105.fieldbyname('trans_type').asinteger:=9; //业务类型
   dm.DS0105.fieldbyname('special_posting').Value:='A'; //登帐状态
   dm.DS0105.FieldByName('BATCH_NUMBER').Value:='结转成本费用';
   dm.DS0105.fieldbyname('status').Value:=3;     //已登帐
   dm.DS0105.fieldbyname('posted_dt').AsString:=datetostr(mdt);
   dm.DS0105.Fieldbyname('supervisor_ptr').asstring:=user_ptr;
   dm.DS0105.Post;

  dm.DS0103.First ;

  if dm.DS0106.Active =false then  dm.DS0106.open;

  while not dm.DS0103.eof do
  begin

    with DM.DS0106 do      //凭证分录(借:自动结转定义的科目)
     begin
      if UpperCase(dm.DS0103DB_CR.Value)='D' then //期未余额在借方
       begin
        if dm.DS0106.Locate('GL_ACCT_NO_PTR;D_C',
         vararrayof([dm.DS0103auto_trans_ptr.Value,'D']),[]) then
         begin
          edit;
          Fieldbyname('amount').Value:=dm.DS0106AMOUNT.Value+dm.DS0103TYR_CLOSE.Value;
          Fieldbyname('PRICE').Value:=dm.DS0106PRICE.Value+dm.DS0103TYR_CLOSE.Value;
         end
        else
         begin
          append;
          Fieldbyname('gl_header_ptr').Value:=dm.DS0105.fieldbyname('rkey').Value;
          Fieldbyname('gl_acct_no_ptr').Value:=DM.DS0103.fieldbyname('auto_trans_ptr').Value ;
          Fieldbyname('ref_number').Value:=DM.DS0103.fieldbyname('autoAcc').Value;
          Fieldbyname('description').Value:='从制造费用转入';
          Fieldbyname('CURR_PTR').Value:=1;  //货币
          Fieldbyname('EXCH_RATE').Value:=1;  //汇率
          Fieldbyname('amount').Value:=dm.DS0103TYR_CLOSE.Value;
          Fieldbyname('PRICE').Value:=dm.DS0103TYR_CLOSE.Value;
          Fieldbyname('d_c').Value:='D';
         end;

        if not updateGL(dm.DS0103TYR_CLOSE.Value,dm.DS0103TYR_CLOSE.VALUE,
                        dm.DS0106GL_ACCT_NO_PTR.Value,dm.DS0106D_C.value[1]) then
         begin                   //登帐
          result:=false;
          break;
         end;

       end
      else  //期未余额在贷方
       begin
        if dm.DS0106.Locate('GL_ACCT_NO_PTR;D_C',
         vararrayof([dm.DS0103auto_trans_ptr.Value,'C']),[]) then
         begin
          edit;
          Fieldbyname('amount').Value:=dm.DS0106AMOUNT.Value+dm.DS0103TYR_CLOSE.Value;
          Fieldbyname('PRICE').Value:=dm.DS0106PRICE.Value+dm.DS0103TYR_CLOSE.Value;
         end
        else
         begin
          append;
          Fieldbyname('gl_header_ptr').Value:=dm.DS0105.fieldbyname('rkey').Value;
          Fieldbyname('gl_acct_no_ptr').Value:=DM.DS0103.fieldbyname('auto_trans_ptr').Value ;
          Fieldbyname('ref_number').Value:=DM.DS0103.fieldbyname('autoAcc').Value;
          Fieldbyname('description').Value:='从制造费用转入';
          Fieldbyname('CURR_PTR').Value:=1;  //货币
          Fieldbyname('EXCH_RATE').Value:=1;  //汇率
          Fieldbyname('amount').Value:=dm.DS0103TYR_CLOSE.Value;
          Fieldbyname('PRICE').Value:=dm.DS0103TYR_CLOSE.Value;
          Fieldbyname('d_c').Value:='C';
         end;
        if not updateGL(dm.DS0103TYR_CLOSE.Value,dm.DS0103TYR_CLOSE.value,
                        dm.DS0106GL_ACCT_NO_PTR.Value,dm.DS0106D_C.value[1]) then
         begin
          result:=false;
          break;
         end;
       end;
      post;

      append;                   //贷(成本类借贷不平衡的科目)
      Fieldbyname('gl_header_ptr').Value:=dm.DS0105.fieldbyname('rkey').Value;
      Fieldbyname('gl_acct_no_ptr').Value:=DM.DS0103.fieldbyname('rkey').Value ;
      Fieldbyname('ref_number').Value:=DM.DS0103.fieldbyname('gl_acc_number').Value;
      Fieldbyname('description').Value:='结转制造费用到生产成本';
      Fieldbyname('CURR_PTR').Value:=1;    //货币
      Fieldbyname('EXCH_RATE').Value:=1;   //汇率
      if UpperCase(dm.DS0103DB_CR.Value)='D' then //期未余额在借方
       begin
        Fieldbyname('amount').Value := dm.DS0103TYR_CLOSE.Value;
        Fieldbyname('PRICE').Value := dm.DS0103TYR_CLOSE.Value;
        Fieldbyname('d_c').asstring := 'C';
        if not updateGL(dm.DS0103TYR_CLOSE.Value,dm.DS0103TYR_CLOSE.Value,
                        dm.DS0106GL_ACCT_NO_PTR.Value,dm.DS0106D_C.value[1]) then
         begin
          result:=false;
          break;
         end;
       end
      else                             //余额在贷方,结转到借方
       begin
        Fieldbyname('amount').Value:=dm.DS0103TYR_CLOSE.Value;
        Fieldbyname('PRICE').Value:=dm.DS0103TYR_CLOSE.Value;
        Fieldbyname('d_c').asstring:='D';
        if not updateGL(dm.DS0103TYR_CLOSE.Value,dm.DS0103TYR_CLOSE.Value,
                        dm.DS0106GL_ACCT_NO_PTR.Value,dm.DS0106D_C.value[1]) then
         begin
          result:=false;
          break;
         end;
       end;
      post;
     end; //END with DM.ADODS0106
   dm.DS0103.Next ;
   ProgressBar1.Position :=
     trunc(100*dm.DS0103.recno/dm.DS0103.recordcount);
  end;   //end while not DS0103.eof

 except
  result:=false;
 end;
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

 
procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
var
 gl_number:string;
begin

 with dm.ADOQ do
  begin
    close;
    sql.Text:=
    'select rkey,status,voucher,posted_dt from data0105 '+
    'where data0105.fyear= '+QuotedStr(Edit1.Text)+
    ' and data0105.period= '+QuotedStr(Edit2.Text)+
    ' and data0105.status<>3 and data0105.status<>5';
    Open;
   if not IsEmpty then
   begin
    messagedlg('该会计期间存在未登账的凭证,请先登账,再结转!',mterror,[mbcancel],0);
    exit;
   end;
  end;


  dm.DS0103.Close;
  dm.DS0103.open;

  if dm.DS0103.RecordCount =0 then    //是否已经设置自动结转科目
   begin
    messagedlg('没有需要结转的成本费用!',mtinformation,[mbok],0);
    exit;
   end;

 gl_number:=  finderror;
  if gl_number <> '' then
   begin
    messagedlg('发现成本类会计科目没有定义成不核算外币:'+gl_number,mterror,[mbcancel],0);
    exit;
   end;

 if dm.ADODS0508.FieldByName('fasset_initlized').asinteger=1 then
  if GetzjTrans()=0 then
   begin
    messagedlg('还没有计提折旧,请先计提本月折旧并登帐！',mtinformation,[mbok],0);
    exit;
   end;

  if GetTrans<>0 then
   begin
    messagedlg('已经结转成本费用！',mtinformation,[mbok],0);
    exit;
   end;

 try
  dm.ADOCnn.BeginTrans ;
  screen.Cursor:=crHourGlass;

  if not SaveBeforClose() then //保存科目结转之前的期未余额到110
   begin
    dm.ADOCnn.RollbackTrans ;
    screen.Cursor:=crDefault;
    messagedlg('结转成本费用前保存余额操作失败!',mterror,[mbcancel],0);
    exit;
   end;

  if not geTrans(GetCancelTrans()) then  //生成凭证同时自动完成登账
   begin
    dm.ADOCnn.RollbackTrans ;
    screen.Cursor:=crDefault;
    messagedlg('结转成本费用操作失败!',mterror,[mbcancel],0);
    exit;
   end;

  dm.ADOCnn.CommitTrans ;
  messagedlg('结转成本费用完毕!',mtinformation,[mbok],0);
  screen.Cursor:=crDefault;
  FrmMain.close;
 except
  on E: Exception do
   begin
    dm.ADOCnn.RollbackTrans ;
    showmessage(E.Message);
    screen.Cursor:=crDefault;
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
if dm.ADOCnn.Connected then
  begin

  DM.ADODS0508.Open ;
  edit1.text:=DM.ADODS0508.fieldbyname('curr_FYEAR').asstring;
  edit2.text:=DM.ADODS0508.fieldbyname('curr_period').asstring;
  end;
end;


end.

