unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Mask,
  Menus, ADODB, Buttons, Spin;

type
  TFrmMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    RichEdit1: TRichEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    function GetTrans():boolean;
    function GetFYTrans():boolean;
    function Get_profit_loss():boolean;   //结转损益科目
    procedure AddACCTo110();
  public
    { Public declarations }

  end;

var
  FrmMain: TFrmMain;

implementation

uses Datamodule,common;

{$R *.dfm}


function TFrmMain.GetFYTrans():boolean; //结转成本费用科目
var
 vsql:string;
begin
 vsql:='SELECT Data0103.rkey from data0103';
 vsql:= vsql+' where Data0103.auto_trans_ptr > 0';
 vsql:= vsql+' and Data0103.tyr_close<>0';
 dm.ADOQ.close;
 dm.ADOQ.SQL.Clear;
 dm.ADOQ.SQL.Text:=vsql;
 dm.ADOQ.Open;
 if dm.ADOQ.IsEmpty then        //已结转成本费用
  result:=true
 else
  result:=false;
end;

function TFrmMain.Get_profit_loss():boolean;   //结转损益科目
var
 vsql:string;
begin
  dm.ADOQ.Close ;
  dm.ADOQ.SQL.Clear ;
  vSql :='select rkey from data0103';
  vSql:=vSql+' where ACC_TP=5';
  vSql:=vSql+' and tyr_close<>0';
  dm.ADOQ.SQL.Text :=vSql;
  dm.ADOQ.Open ;
 if dm.ADOQ.IsEmpty then
  result := true                //已结转损益
 else
  result := false;
end;

function TFrmMain.GetTrans():boolean;
var
 vsql:string;
begin
 vsql:='select rkey from data0105 ';
 vsql:= vsql+' where FYEAR='+edit1.Text;
 vsql:= vsql+' and PERIOD='+edit2.Text;
 vsql:= vsql+' and SPECIAL_POSTING =''D''';
 vsql:= vsql+' and STATUS =3';
 dm.ADOQ.close;
 dm.ADOQ.SQL.Clear;
 dm.ADOQ.SQL.Text:=vsql;
 dm.ADOQ.Open;
 if dm.ADOQ.IsEmpty then
  result:=false
 else
  result:=true;     //已提折旧
end;

procedure TFrmMain.AddACCTo110();   //新增科目到110
begin
 with dm.ADOQ do
 begin
  close;
  sql.Text:='SELECT RKEY,TYR_OPEN,TYR_OPEN_ORIG'+#13+
     'FROM dbo.Data0103'+#13+
     'WHERE (RKEY NOT IN'+#13+
          '(SELECT GL_ACCT_PTR'+#13+
         'FROM data0110'+#13+
         'WHERE FYEAR ='+edit1.Text+'))';
  open;
 end;

 with dm.ds0110 do
  begin
   close;
   sql.Text:='select FYEAR,GL_ACCT_PTR,TYR_OPEN,TYR_CLOSE,'+#13+
              'TYR_OPEN_ORIG,TYR_CLOSE_ORIG from data0110'+#13+
   'where rkey is null';
   open;
  end;

 while not dm.ADOQ.Eof do
  begin
   dm.ds0110.AppendRecord([strtoint(edit1.Text),
                           dm.ADOQ.FieldValues['RKEY'],
                           dm.ADOQ.FieldValues['TYR_OPEN'],
                           0,
                           dm.ADOQ.FieldValues['TYR_OPEN_ORIG'],
                           0]);
   dm.ADOQ.Next;
  end;
end;


procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
var tmpQry: TADOQuery;
begin
  WITH DM.DS0105 do
  begin
   close;
   parameters.ParamByName('vfyear').Value :=strtoint(edit1.Text);
   parameters.ParamByName('vperiod').Value :=strtoint(edit2.Text);
   open;
  end;
 if not dm.DS0105.IsEmpty then
  begin
   messagedlg('检查到本会计期间还有未登帐的记帐凭证，请先进行登帐后再结帐！',mtinformation,[mbok],0);
   exit;
  end;

 if dm.DS0508.FieldByName('fasset_initlized').asinteger=1 then
  if not GetTrans() then
   begin
    messagedlg('检查到本会计期间还有计提折旧费用，请先计提折旧！',mtinformation,[mbok],0);
    exit;
   end;

  if not GetFYTrans() then
  begin
   messagedlg('检查到还没有结转的成本费用，请先进行分配再结帐！',mtinformation,[mbok],0);
   exit;
  end;

  if not Get_profit_loss() then
  begin
   messagedlg('检查到还没有结转本期损益科目，请先进行结转后再结帐！',mtinformation,[mbok],0);
   exit;
  end;

  tmpQry:= TADOQuery.Create(nil);
  with tmpQry do
  try
    Connection:= dm.Conn;
    Close;
    SQL.Clear;
//    SQL.Add('select t103.rkey from data0103 t103 ');
//    SQL.Add('where not exists(select t110.GL_ACCT_PTR from Data0110 t110');
//    SQL.Add(' where t110.FYEAR = '''+Edit1.Text+'''');
//    SQL.Add(' and t110.GL_ACCT_PTR = t103.RKEY)');

    SQL.Add('select t106.GL_ACCT_NO_PTR');
    SQL.Add('from data0105 t105 inner join data0106 t106 on t105.RKEY=t106.GL_HEADER_PTR');
    SQL.Add('where t105.fyear='''+Edit1.Text+'''');
    SQL.Add('and t105.period='''+Edit2.Text+'''');
    SQL.Add('and not exists(select t110.GL_ACCT_PTR from Data0110 t110');
    SQL.Add('				        where t110.FYEAR = '''+Edit1.Text+'''');
    SQL.Add('				        and t110.GL_ACCT_PTR = t106.GL_ACCT_NO_PTR)');
    Open;
    if RecordCount<>0 then
    begin
      messagedlg('凭证中存在新会计科目，请联系系统管理员！',mtinformation,[mbok],0);
      Exit;
    end;
  finally
    Free;
  end;
  
 if messagedlg('是否确认要结束当前会计期间？',mtconfirmation,[mbYes,mbNo],0)<>mrYes
  then exit;

  try
   dm.Conn.BeginTrans ;

   with dm.ADOQ do       //修改本期没有发生额的科目
    begin               //期未余额等于期初余额
     close;
     sql.Text:='update data0103'+#13+
              'set tyr_close=TYR_OPEN'+#13+
              'where (CURRENT_PERIOD_DEBIT=0) and '+#13+
              '(CURRENT_PERIOD_CREDIT=0)';
     ExecSQL;
    end;
   with dm.ADOQ do       //修改本期没有发生额的科目
    begin               //期未余额等于期初余额
     close;
     sql.Text:='update data0103'+#13+
              'set tyr_close_orig=TYR_OPEN_orig'+#13+
              'where (CURRENT_PERIOD_DEBIT_ORIG=0) and '+#13+
              '(CURRENT_PERIOD_CREDIT_ORIG=0)';
     ExecSQL;
    end;

    WITH DM.DS0110 do
     begin
      close;
      sql.Text:='update data0110'+#13+
        'set TYR_PERIOD_'+edit2.Text+'_DEBIT=Data0103.CURRENT_PERIOD_DEBIT,'+#13+
        'TYR_PERIOD_'+edit2.Text+'_CREDIT=Data0103.CURRENT_PERIOD_CREDIT,'+#13+
        'TYR_PERIOD_'+edit2.Text+'_CLOSE=Data0103.TYR_CLOSE,'+#13+
        'TYR_PERIOD_'+edit2.Text+'_DEBIT_ORIG=Data0103.CURRENT_PERIOD_DEBIT_ORIG,'+#13+
        'TYR_PERIOD_'+edit2.Text+'_CREDIT_ORIG=Data0103.CURRENT_PERIOD_CREDIT_ORIG,'+#13+
        'TYR_PERIOD_'+edit2.Text+'_CLOSE_ORIG=Data0103.TYR_CLOSE_ORIG,'+#13+
        'TYR_DEBIT=data0110.TYR_DEBIT+Data0103.CURRENT_PERIOD_DEBIT,'+#13+
        'TYR_CREDIT=data0110.TYR_CREDIT+Data0103.CURRENT_PERIOD_CREDIT,'+#13+
        'TYR_DEBIT_ORIG=data0110.TYR_DEBIT_ORIG+Data0103.CURRENT_PERIOD_DEBIT_ORIG,'+#13+
        'TYR_CREDIT_ORIG=data0110.TYR_CREDIT_ORIG+Data0103.CURRENT_PERIOD_CREDIT_ORIG,'+#13+
        'TYR_CLOSE = Data0103.TYR_CLOSE,'+#13+
        'TYR_CLOSE_ORIG = Data0103.TYR_CLOSE_ORIG'+#13+
        'FROM dbo.Data0110 INNER JOIN'+#13+
        'dbo.Data0103 ON dbo.Data0110.GL_ACCT_PTR = dbo.Data0103.RKEY'+#13+
        'WHERE dbo.Data0110.FYEAR ='+edit1.Text;
      execsql;
     end;

    if  strtoint(edit2.text)=1 then  //如果当前会计期间为一月份
     with dm.ADOQ do            //清徐本期借贷合计
      begin
       close;
       sql.Text:='update data0103'+#13+
                'set TYR_DEBIT=0,'+#13+
                'TYR_CREDIT=0,'+#13+
                'TYR_DEBIT_ORIG=0,'+#13+
                'TYR_CREDIT_ORIG=0';
       ExecSQL;
      end;

    with dm.ds0103 do   //累计本年借贷,清徐当前期间借贷,期未余额
     begin
      close;
      execsql;
     end;

    {*****结账检查 Begin*****}
    if Edit2.Text = '1' then
    with dm.ADOQ do            //跨年度处理
    begin
      close;
      sql.Text:=
      'select t1.GL_ACCT_PTR,t2.GL_ACC_NUMBER from Data0110 t1 inner join Data0103 t2 on t1.GL_ACCT_PTR = t2.RKEY'+#13+
      'where t1.FYEAR = '+edit1.Text+' and t2.DB_CR = ''D'''+#13+
      'and t1.TYR_OPEN+t1.TYR_PERIOD_1_DEBIT-t1.TYR_PERIOD_1_CREDIT<>t1.TYR_PERIOD_1_CLOSE'+#13+
      'union'+#13+
      'select t1.GL_ACCT_PTR,t2.GL_ACC_NUMBER from Data0110 t1 inner join Data0103 t2 on t1.GL_ACCT_PTR = t2.RKEY'+#13+
      'where t1.FYEAR = '+edit1.Text+' and t2.DB_CR = ''C'''+#13+
      'and t1.TYR_OPEN+t1.TYR_PERIOD_1_CREDIT-t1.TYR_PERIOD_1_DEBIT<>t1.TYR_PERIOD_1_CLOSE';
      open;
    end
    else
    {如果会计科目在借方: 上期期末余额+本期借方金额-本期贷方金额 = 本期期末余额
     如果会计科目在贷方: 上期期末余额+本期贷方金额-本期借方金额 = 本期期末余额}
    with dm.ADOQ do
    begin
      close;
      sql.Text:=
      'select t1.GL_ACCT_PTR,t2.GL_ACC_NUMBER from Data0110 t1'+#13+
      'inner join Data0103 t2 on t1.GL_ACCT_PTR = t2.RKEY'+#13+
      'where t1.FYEAR = '+edit1.Text+' and t2.DB_CR =''D'''+#13+
      'and t1.TYR_PERIOD_'+IntToStr(StrToInt(edit2.Text)-1)+'_CLOSE+t1.TYR_PERIOD_'+edit2.Text+'_DEBIT-t1.TYR_PERIOD_'+edit2.Text+'_CREDIT<>t1.TYR_PERIOD_'+edit2.Text+'_CLOSE'+#13+
      'union'+#13+
      'select t1.GL_ACCT_PTR,t2.GL_ACC_NUMBER from Data0110 t1'+#13+
      'inner join Data0103 t2 on t1.GL_ACCT_PTR = t2.RKEY'+#13+
      'where t1.FYEAR = '+edit1.Text+' and t2.DB_CR =''C'''+#13+
      'and t1.TYR_PERIOD_'+IntToStr(StrToInt(edit2.Text)-1)+'_CLOSE+t1.TYR_PERIOD_'+edit2.Text+'_CREDIT-t1.TYR_PERIOD_'+edit2.Text+'_DEBIT<>t1.TYR_PERIOD_'+edit2.Text+'_CLOSE';
      open;
    end;
    if dm.ADOQ.RecordCount <> 0 then
    begin
      dm.Conn.RollbackTrans;
      MessageDlg('结账失败,请检查:'+dm.ADOQ.fieldbyname('GL_ACC_NUMBER').AsString,  mtError, [mbOK], 0);
      Exit;
    end;
    {*****结账检查   End*****}

    {*****结账外币检查 Begin*****}
    if Edit2.Text = '1' then
    with dm.ADOQ do            //跨年度处理
    begin
      close;
      sql.Text:=
      'select t1.GL_ACCT_PTR,t2.GL_ACC_NUMBER from Data0110 t1 inner join Data0103 t2 on t1.GL_ACCT_PTR = t2.RKEY'+#13+
      'where t1.FYEAR = '+edit1.Text+' and t2.DB_CR = ''D'' and t2.CURR_TP = 2 and t2.HAS_CHILD = 0'+#13+
      'and t1.TYR_OPEN_ORIG+t1.TYR_PERIOD_1_DEBIT_ORIG-t1.TYR_PERIOD_1_CREDIT_ORIG<>t1.TYR_PERIOD_1_CLOSE_ORIG'+#13+
      'union'+#13+
      'select t1.GL_ACCT_PTR,t2.GL_ACC_NUMBER from Data0110 t1 inner join Data0103 t2 on t1.GL_ACCT_PTR = t2.RKEY'+#13+
      'where t1.FYEAR = '+edit1.Text+' and t2.DB_CR = ''C'' and t2.CURR_TP = 2 and t2.HAS_CHILD = 0'+#13+
      'and t1.TYR_OPEN_ORIG+t1.TYR_PERIOD_1_CREDIT_ORIG-t1.TYR_PERIOD_1_DEBIT_ORIG<>t1.TYR_PERIOD_1_CLOSE_ORIG';
      open;
    end
    else
    {如果会计科目在借方: 上期期末余额+本期借方金额-本期贷方金额 = 本期期末余额
     如果会计科目在贷方: 上期期末余额+本期贷方金额-本期借方金额 = 本期期末余额}
    with dm.ADOQ do
    begin
      close;
      sql.Text:=
      'select t1.GL_ACCT_PTR,t2.GL_ACC_NUMBER from Data0110 t1'+#13+
      'inner join Data0103 t2 on t1.GL_ACCT_PTR = t2.RKEY'+#13+
      'where t1.FYEAR = '+edit1.Text+' and t2.DB_CR =''D'' and t2.CURR_TP = 2 and t2.HAS_CHILD = 0'+#13+
      'and t1.TYR_PERIOD_'+IntToStr(StrToInt(edit2.Text)-1)+'_CLOSE_ORIG+t1.TYR_PERIOD_'+edit2.Text+'_DEBIT_ORIG-t1.TYR_PERIOD_'+edit2.Text+'_CREDIT_ORIG<>t1.TYR_PERIOD_'+edit2.Text+'_CLOSE_ORIG'+#13+
      'union'+#13+
      'select t1.GL_ACCT_PTR,t2.GL_ACC_NUMBER from Data0110 t1'+#13+
      'inner join Data0103 t2 on t1.GL_ACCT_PTR = t2.RKEY'+#13+
      'where t1.FYEAR = '+edit1.Text+' and t2.DB_CR =''C'' and t2.CURR_TP = 2 and t2.HAS_CHILD = 0'+#13+
      'and t1.TYR_PERIOD_'+IntToStr(StrToInt(edit2.Text)-1)+'_CLOSE_ORIG+t1.TYR_PERIOD_'+edit2.Text+'_CREDIT_ORIG-t1.TYR_PERIOD_'+edit2.Text+'_DEBIT_ORIG<>t1.TYR_PERIOD_'+edit2.Text+'_CLOSE_ORIG';
      open;
    end;
    if dm.ADOQ.RecordCount <> 0 then
    begin
      dm.Conn.RollbackTrans;
      MessageDlg('外币余额结账失败,请检查:'+dm.ADOQ.fieldbyname('GL_ACC_NUMBER').AsString,  mtError, [mbOK], 0);
      Exit;
    end;
    {*****结账外币检查   End*****}

    dm.DS0508.edit;
    dm.DS0508.FieldByName('depre_flag').asinteger:=0;              //计提折旧
    dm.DS0508.fieldbyname('curr_period').Value:=
    dm.DS0508.fieldbyname('curr_period').Value+1;                //会计期间

    if dm.DS0508.fieldbyname('curr_period').Value>12 then          //第12期
     begin
      dm.DS0508.fieldbyname('curr_fyear').Value:=
      dm.DS0508.fieldbyname('curr_fyear').Value+1;              //会计年度
      dm.DS0508.fieldbyname('curr_period').Value:=1;
     end;
    dm.DS0508.Post;

   edit1.text:=DM.DS0508.fieldbyname('curr_FYEAR').asstring;
   edit2.text:=DM.DS0508.fieldbyname('curr_period').asstring;

   AddACCTo110;

    dm.Conn.CommitTrans ;
    messagedlg('已经开始新的会计期间!',mtinformation,[mbok],0);
    FrmMain.close;
  except
   on E: Exception do
     begin
      dm.Conn.RollbackTrans ;
      messagedlg(e.Message,mtinformation,[mbok],0);
     end;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);

begin
  if not App_Init(dm.Conn) then
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
if dm.Conn.Connected then
  begin

   DM.DS0508.close ;
   DM.DS0508.Open ;

   edit1.text:=DM.DS0508.fieldbyname('curr_FYEAR').asstring;
   edit2.text:=DM.DS0508.fieldbyname('curr_period').asstring;
  end;
end;

end.

