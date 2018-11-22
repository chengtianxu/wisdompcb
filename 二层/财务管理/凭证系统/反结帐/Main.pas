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

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses Datamodule,common;

{$R *.dfm}

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
var
  CurrDate: TDatetime;
begin
  CurrDate:= EncodeDate(StrToInt(Edit1.Text), StrToInt(Edit2.Text), 1);
  if dm.DS0508.fieldbyname('CONTROL_DATE').AsDateTime>=CurrDate then
  begin
    messagedlg('当前会计期间必须在财务初始账目日期之后！',mtinformation,[mbok],0);
    exit;
  end;

 WITH DM.DS0105 do
  begin
   close;
   parameters.ParamByName('vfyear').Value :=strtoint(edit1.Text);
   parameters.ParamByName('vperiod').Value :=strtoint(edit2.Text);
   open;
  end;

 if dm.DS0105.recordcount>0 then
  begin
   messagedlg('检查到当前会计期间有已登账的凭证请先进行反登账！',mtinformation,[mbok],0);
   exit;
  end;

if dm.DS0508.fieldbyname('fasset_initlized').AsInteger = 1 then //已启用固定资产
if dm.DS0508.fieldbyname('depre_flag').Value = 1 then      //已计提折旧
 begin
  messagedlg('本期已经计提折旧！请先反计提折旧',mtinformation,[mbok],0);
  exit;
 end;

 if  messagedlg('确认要对当前会计期间进行反结帐吗？',mtconfirmation,[mbYes,mbNo],0)=mrYes then 
 try
  dm.Conn.BeginTrans ;

  dm.DS0508.edit;

  if dm.DS0508.fieldbyname('fasset_initlized').AsInteger = 1 then //已启用固定资产
  dm.DS0508.FieldByName('depre_flag').asinteger:=1;             //已计提折旧

  dm.DS0508.fieldbyname('curr_period').Value:=
    dm.DS0508.fieldbyname('curr_period').Value-1;                //会计期间

  if dm.DS0508.fieldbyname('curr_period').Value < 1 then          //第12期
   begin
    dm.ADOQ.Close ;
    dm.ADOQ.SQL.Text:='DELETE Data0110 WHERE FYEAR ='+edit1.Text;
    dm.ADOQ.ExecSQL;
    dm.DS0508.fieldbyname('curr_fyear').Value:=
    dm.DS0508.fieldbyname('curr_fyear').Value-1;              //会计年度
    dm.DS0508.fieldbyname('curr_period').Value:=12;
   end;
  dm.DS0508.Post;

 edit1.text:=DM.DS0508.fieldbyname('curr_FYEAR').asstring;
 edit2.text:=DM.DS0508.fieldbyname('curr_period').asstring;

  WITH DM.DS0110 do //更新103从110中取回值当前借贷,期未余额,本年累计(本币原币)
   begin
    close;
    sql.Text:='update data0103'+#13+
      'set CURRENT_PERIOD_DEBIT = Data0110.TYR_PERIOD_'+edit2.Text+'_DEBIT,'+#13+
      'CURRENT_PERIOD_CREDIT = Data0110.TYR_PERIOD_'+edit2.Text+'_CREDIT,'+#13+
      'TYR_CLOSE = Data0110.TYR_PERIOD_'+edit2.Text+'_CLOSE,'+#13+
      'CURRENT_PERIOD_DEBIT_ORIG = Data0110.TYR_PERIOD_'+edit2.Text+'_DEBIT_ORIG,'+#13+
      'CURRENT_PERIOD_CREDIT_ORIG = Data0110.TYR_PERIOD_'+edit2.Text+'_CREDIT_ORIG,'+#13+
      'TYR_CLOSE_ORIG = Data0110.TYR_PERIOD_'+edit2.Text+'_CLOSE_ORIG,'+#13+
      'TYR_DEBIT=data0103.TYR_DEBIT-Data0110.TYR_PERIOD_'+edit2.Text+'_DEBIT,'+#13+
      'TYR_CREDIT=data0103.TYR_CREDIT-Data0110.TYR_PERIOD_'+edit2.Text+'_CREDIT,'+#13+
      'TYR_DEBIT_ORIG=data0103.TYR_DEBIT_ORIG-Data0110.TYR_PERIOD_'+edit2.Text+'_DEBIT_ORIG,'+#13+
      'TYR_CREDIT_ORIG=data0103.TYR_CREDIT_ORIG-Data0110.TYR_PERIOD_'+edit2.Text+'_CREDIT_ORIG'+#13+
      'FROM Data0110 INNER JOIN'+#13+
      'Data0103 ON dbo.Data0110.GL_ACCT_PTR = dbo.Data0103.RKEY'+#13+
      'WHERE Data0110.FYEAR ='+edit1.Text;
    execsql;
   end;

  //从1月份反结账到上一年度12月份时候,如果是1月份新增的科目需要在此处进行特殊处理
  WITH DM.DS0110 do
   begin
    close;
    sql.Text:='update Data0103'+#13+
              'set CURRENT_PERIOD_DEBIT=0,CURRENT_PERIOD_CREDIT=0,TYR_CLOSE=0,'+#13+
              'CURRENT_PERIOD_DEBIT_ORIG=0,CURRENT_PERIOD_CREDIT_ORIG=0,TYR_CLOSE_ORIG=0'+#13+
              'where not exists(select 1 from Data0110 t110'+#13+
              '                 where Data0103.RKEY = t110.GL_ACCT_PTR'+#13+
              '                 and t110.FYEAR = '+edit1.Text+')';
    execsql;
   end;

  if strtoint(edit2.Text)-1 > 0 then//返结帐之后的期间大于等于2
  WITH DM.DS0110 do //更新110本年期未余额
   begin
    close;
    sql.Text:='update data0110'+#13+
          'set TYR_CLOSE = TYR_PERIOD_'+inttostr(strtoint(edit2.Text)-1)+'_CLOSE,'+#13+
          'TYR_CLOSE_ORIG = TYR_PERIOD_'+inttostr(strtoint(edit2.Text)-1)+'_CLOSE_ORIG'+#13+
      'FROM Data0110'+#13+
      'WHERE Data0110.FYEAR ='+edit1.Text;
    execsql;
   end
  else
    WITH DM.DS0110 do //更新110本年期未余额
     begin
      close;
      sql.Text:='update data0110'+#13+
                'set TYR_CLOSE=0,'+#13+
                'TYR_CLOSE_ORIG=0'+#13+
        'FROM Data0110'+#13+
        'WHERE Data0110.FYEAR ='+edit1.Text;
      execsql;
     end;

  WITH DM.DS0110 do //更新110当前借贷,期未余额 ,本年累计(原币,本币)
   begin
    close;
    sql.Text:='update data0110'+#13+
          'set TYR_DEBIT=TYR_DEBIT-TYR_PERIOD_'+edit2.Text+'_DEBIT,'+#13+
          'TYR_CREDIT=TYR_CREDIT-TYR_PERIOD_'+edit2.Text+'_CREDIT,'+#13+
          'TYR_DEBIT_ORIG=TYR_DEBIT_ORIG-TYR_PERIOD_'+edit2.Text+'_DEBIT_ORIG,'+#13+
          'TYR_CREDIT_ORIG=TYR_CREDIT_ORIG-TYR_PERIOD_'+edit2.Text+'_CREDIT_ORIG,'+#13+
          'TYR_PERIOD_'+edit2.Text+'_DEBIT=0,'+#13+
          'TYR_PERIOD_'+edit2.Text+'_CREDIT=0,'+#13+
          'TYR_PERIOD_'+edit2.Text+'_CLOSE=0,'+#13+
          'TYR_PERIOD_'+edit2.Text+'_DEBIT_ORIG=0,'+#13+
          'TYR_PERIOD_'+edit2.Text+'_CREDIT_ORIG=0,'+#13+
          'TYR_PERIOD_'+edit2.Text+'_CLOSE_ORIG=0'+#13+
      'FROM Data0110'+#13+
      'WHERE Data0110.FYEAR ='+edit1.Text;
    execsql;
   end;

  with dm.ADOQ do     //更新103期初余额
   begin
    close;
    sql.Text:='update data0103'+#13+
      'set TYR_OPEN=tyr_close+current_period_credit-current_period_debit,'+#13+
      'TYR_OPEN_ORIG=tyr_close_orig+current_period_credit_orig-current_period_debit_orig'+#13+
      'where DB_CR=''D''';
    ExecSQL;
   end;

  with dm.ADOQ do
   begin
    close;
    sql.Text:='update data0103'+#13+
      'set TYR_OPEN=tyr_close+current_period_debit-current_period_credit,'+#13+
      'TYR_OPEN_ORIG=tyr_close_orig+current_period_debit_orig-current_period_credit_orig'+#13+
      'where DB_CR=''C''';
    ExecSQL;
   end;

  dm.Conn.CommitTrans ;
  messagedlg('成功返回到上一个会计期间!',mtinformation,[mbok],0);
  FrmMain.close;
 except
  on E: Exception do
   begin
    dm.Conn.RollbackTrans ;
    showmessage(e.Message);
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
if  dm.Conn.Connected then
  begin
   DM.DS0508.close ;
   DM.DS0508.Open ;
   edit1.text:=DM.DS0508.fieldbyname('curr_FYEAR').asstring;
   edit2.text:=DM.DS0508.fieldbyname('curr_period').asstring;
  end;
end;

end.

