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

    function Restore103(rkey105:integer):boolean;    //恢复103
    function GetPRkey(prky:integer;var parent_ptr:integer):boolean;    
    function updateGL(const pCurrD,pCurrC:currency;vgl:integer;dbcr:char):boolean;
    procedure DelTrans(const pRkey:integer);              //作废凭证
    function GetProfitTrans():integer;      //获取结转损益凭证
    function SaveProfitTo110():boolean;   //保存损益科目期末余额到110
    procedure update_110_PROFIT(rkey103:integer;typ_close:currency);    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses udm,common;

{$R *.dfm}
function TFrmMain.GetPRkey(prky:integer;var parent_ptr:integer):boolean;
begin
 dm.ADOQ.Close;
 dm.ADOQ.SQL.Text:='SELECT PARENT_PTR'+#13+
                   'FROM Data0103'+#13+
                   'WHERE RKEY ='+inttostr(prky);
 dm.ADOQ.Open;
 if dm.ADOQ.FieldValues['PARENT_PTR']>0 then
  begin
   parent_ptr:=dm.ADOQ.FieldValues['PARENT_PTR'];
   result:=true;
  end
 else
  result:=false;
end;

function TFrmMain.GetProfitTrans():integer;
var                    //获取结转损益凭证
 msql:string;
begin
  dm.ADOQ.Close;
  dm.ADOQ.SQL.Clear ;
  msql:='select rkey from Data0105';
  msql:=msql+' where (FYEAR ='+edit1.Text+' )';
  msql:=msql+' AND ( PERIOD= '+edit2.Text+' )';
  msql:=msql+' AND (STATUS = 3)';
  msql:=msql+' and (SPECIAL_POSTING = ''Y'''+' )';
  dm.ADOQ.SQL.text:=msql;
  dm.ADOQ.open;

  if not dm.ADOQ.IsEmpty then      //是否已经结转损益
   result:=dm.ADOQ.FieldValues['rkey']
  else
   result:=0;
end;

function TFrmMain.updateGL(const pCurrD,pCurrC:currency; vgl:integer;dbcr:char):boolean;
var
  parent_ptr:integer;
begin
 try
 if dbcr='D' then
  begin
  dm.DS0103.Close;
  dm.DS0103.Parameters.ParamValues['debit'] := pCurrD;
  dm.DS0103.Parameters.ParamValues['credit'] := 0;
  dm.DS0103.Parameters.ParamValues['debit_orig'] := pCurrC;
  dm.DS0103.Parameters.ParamValues['credit_orig'] := 0;
  dm.DS0103.Parameters.ParamValues['rkey'] := vgl;
  dm.ds0103.ExecSQL;
  end
 else
  begin
  dm.DS0103.Close;
  dm.DS0103.Parameters.ParamValues['debit'] := 0;
  dm.DS0103.Parameters.ParamValues['credit'] := pCurrD;
  dm.DS0103.Parameters.ParamValues['debit_orig'] := 0;
  dm.DS0103.Parameters.ParamValues['credit_orig'] := pCurrC;
  dm.DS0103.Parameters.ParamValues['rkey'] := vgl;
  dm.ds0103.ExecSQL;
  end;

  dm.DS103P.Close;
  dm.DS103P.Parameters[0].Value:=vgl;
  dm.DS103P.Open;
  dm.DS103P.Edit;

 if dm.DS103PDB_CR.Value ='D' then
  begin
   dm.DS103PTYR_CLOSE.Value:= dm.DS103PTYR_OPEN.Value+
                              dm.DS103PCURRENT_PERIOD_DEBIT.Value-
                              dm.DS103PCURRENT_PERIOD_CREDIT.Value;
   dm.ds103pTYR_CLOSE_ORIG.Value:=dm.ds103pTYR_OPEN_ORIG.Value+
                              dm.ds103pCURRENT_PERIOD_DEBIT_ORIG.Value-
                              dm.ds103pCURRENT_PERIOD_CREDIT_ORIG.Value;
  end
 else
  begin
   dm.DS103PTYR_CLOSE.Value:= dm.DS103PTYR_OPEN.Value+
                              dm.DS103PCURRENT_PERIOD_CREDIT.Value-
                              dm.DS103PCURRENT_PERIOD_DEBIT.Value;
   dm.ds103pTYR_CLOSE_ORIG.Value:= dm.ds103pTYR_OPEN_ORIG.Value+
                              dm.ds103pCURRENT_PERIOD_CREDIT_ORIG.Value-
                              dm.ds103pCURRENT_PERIOD_DEBIT_ORIG.Value;
  end;
 dm.DS103P.Post;

  parent_ptr:=0;
  if self.GetPRkey(vgl,parent_ptr) then
   updateGL(pCurrD,pCurrC,parent_ptr,dbcr);

  result:=true;
 except
  result:=false;
 end;
end;


function TFrmMain.Restore103(rkey105:integer):boolean;
begin    //恢复损益科目到结转损益前状态
 try
  result:=true;
  dm.DS0106.Close;
  dm.DS0106.Parameters.ParamValues['rkey']:=rkey105;
  dm.DS0106.Open;

  dm.DS0106.First;
  while not dm.DS0106.eof do
   begin
    if not updategl(dm.DS0106AMOUNT.Value,dm.DS0106AMOUNT.Value,
                    dm.DS0106GL_ACCT_NO_PTR.Value,
                    dm.DS0106D_C.Value[1]) then
     begin
      result:=false;
      break;
     end;
    dm.DS0106.next;
    ProgressBar1.Position :=
     trunc(100*dm.DS0106.recno/dm.DS0106.recordcount);
   end;//while
 except
  result:=false;
 end;
end;


procedure TFrmMain.DelTrans(const pRkey:integer);
var                          //*******作废记帐凭证*******//
  msql:string;
begin
 dm.ADOQ.Close;
 dm.ADOQ.SQL.Clear ;
 msql:='update Data0105';
 msql:=msql+' set STATUS = 5 ';
 msql:=msql+' where (rkey = '+inttostr(pRkey)+' )';
 dm.ADOQ.SQL.text:=msql;
 dm.ADOQ.ExecSQL;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFrmMain.update_110_PROFIT(rkey103:integer;typ_close:currency);
var
 parent_ptr:integer;
begin
  dm.ds110.Close;
  dm.DS110.Parameters.ParamByName('vY').Value:=strtoint(edit1.Text);
  dm.DS110.Parameters.ParamByName('rkey103').Value:=rkey103;
  dm.ds110.open;

  dm.ds110.edit;
  dm.ds110.fieldbyname('TYR_PERIOD_'+edit2.Text+'_PROFIT').AsCurrency:=typ_close;   //本期贷方发生额
  dm.DS110.Post;

  parent_ptr:=0;
  if self.GetPRkey(rkey103,parent_ptr) then
  update_110_PROFIT(parent_ptr,0);
end;

function TFrmMain.SaveProfitTo110():boolean;   //保存损益科目期末余额到110
begin
 try
  dm.ADOQ.Close;  //保存需要结转的损益科目的余额,因为结转之后就为零了
  dm.ADOQ.SQL.Clear;
  dm.ADOQ.SQL.Text:='update data0110'+#13+
      'set TYR_PERIOD_'+edit2.Text+'_PROFIT = 0'+#13+
      'FROM Data0103 INNER JOIN'+#13+
      'Data0110 ON Data0103.RKEY = Data0110.GL_ACCT_PTR'+#13+
      'WHERE (Data0103.ACC_TP = 5)'+#13+
      'AND (Data0110.FYEAR ='+edit1.Text+')';
  dm.ADOQ.ExecSQL;

  dm.DSProfit.Open;
  update_110_PROFIT(dm.DSProfitrkey.value,0);

  result:=true;
 except
   result:=false;
 end;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
if  GetProfitTrans()=0 then
 messagedlg('本期没有生成结转损益的凭证!',mtinformation,[mbok],0)
else
 try
  dm.ADOCnn.BeginTrans ;
  screen.Cursor:=crHourGlass;

  if not SaveProfitTo110() then //110期未余额到清零
   begin
    dm.ADOCnn.RollbackTrans ;
    screen.Cursor:=crDefault;
    messagedlg('反结转损益前清除余额操作失败!',mterror,[mbcancel],0);
    exit;
   end;

   if Restore103(GetProfitTrans())=false then
    begin
     dm.ADOCnn.RollbackTrans ;
     screen.Cursor:=crDefault;
     messagedlg('反结转损益用操作失败!',mterror,[mbcancel],0);
     exit;
    end;

  DelTrans(GetProfitTrans());                  //作废凭证

  dm.ADOCnn.CommitTrans ;
  screen.Cursor:=crDefault;
  messagedlg('反损益结转完毕!',mtinformation,[mbok],0);
  FrmMain.Close;
 except
  on E: Exception do
    begin
      dm.ADOCnn.RollbackTrans ;
      screen.Cursor:=crDefault;
      showmessage(E.Message);
      FrmMain.Close;
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

   DM.Qry508.close ;
   DM.Qry508.Open ;
   edit1.text:=dm.Qry508.fieldbyname('curr_FYEAR').asstring;
   edit2.text:=dm.Qry508.fieldbyname('curr_period').asstring;
  end;
end;

end.
