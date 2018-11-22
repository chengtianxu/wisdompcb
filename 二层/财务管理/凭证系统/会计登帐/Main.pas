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
  private
    INITIALIZED:Integer;
    function OpenData105:integer; //根据条件获取凭证
    function find_has_child:string;
    function find_glcurrnum(var gl_number:string):boolean;
  public
    { Public declarations }

  end;

var
  FrmMain: TFrmMain;

implementation

uses udm, common;

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOCnn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
    exit;
  end;
  self.Caption :=Application.Title;

 // vprev:='4';
  //user_ptr:='785';
  //dm.ADOCnn.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  DM.tmp.close ;
  DM.tmp.SQL.Text:='select curr_FYEAR,curr_period,INITIALIZED from data0508';
  DM.tmp.Open ;
  edit1.text:=dm.tmp.fieldbyname('curr_FYEAR').asstring;
  edit2.text:=dm.tmp.fieldbyname('curr_period').asstring;
  INITIALIZED:= dm.tmp.fieldbyname('INITIALIZED').AsInteger;
end;

function TFrmMain.find_glcurrnum(var gl_number: string): boolean;
begin
  with dm.tmp do
  begin
    close;
    sql.Text:='SELECT  dbo.Data0103.GL_ACC_NUMBER'+#13+
             'FROM dbo.Data0103 INNER JOIN'+#13+
      '(SELECT top 100 PERCENT Data0103_1.GL_ACC_NUMBER, dbo.Data0106.CURR_PTR'+#13+
      ' FROM dbo.Data0106 INNER JOIN'+#13+
      'dbo.Data0105 ON dbo.Data0106.GL_HEADER_PTR = dbo.Data0105.RKEY INNER JOIN'+#13+
      'dbo.Data0103 AS Data0103_1 ON dbo.Data0106.GL_ACCT_NO_PTR = Data0103_1.RKEY'+#13+
      'WHERE (dbo.Data0105.FYEAR = '+edit1.Text+')'+#13+
      ' AND (dbo.Data0105.PERIOD ='+edit2.Text+')'+#13+
      ' AND (dbo.Data0105.STATUS <> 5)'+#13+
      'GROUP BY Data0103_1.GL_ACC_NUMBER, dbo.Data0106.CURR_PTR'+#13+
      'ORDER BY Data0103_1.GL_ACC_NUMBER) AS det_1 '+#13+
      'ON dbo.Data0103.GL_ACC_NUMBER = det_1.GL_ACC_NUMBER'+#13+
      'WHERE (dbo.Data0103.HAS_CHILD = 0)'+#13+
      'GROUP BY dbo.Data0103.GL_ACC_NUMBER'+#13+
      'HAVING (COUNT(*) > 1)';
    open;
  end;
  if dm.tmp.IsEmpty then
    result:=false
  else
  begin
    gl_number:=dm.tmp.fieldbyname('GL_ACC_NUMBER').AsString;
    result:=true;
  end;
end;

function TFrmMain.find_has_child:string;
begin
  with dm.tmp do
  begin
    close;
    sql.Text:=
      'SELECT   Data0105.VOUCHER, Data0103.GL_ACC_NUMBER'+#13+
      'FROM  Data0106 INNER JOIN'+#13+
      'dbo.Data0105 ON dbo.Data0106.GL_HEADER_PTR = dbo.Data0105.RKEY INNER JOIN'+#13+
      'dbo.Data0103 ON dbo.Data0106.GL_ACCT_NO_PTR = dbo.Data0103.RKEY'+#13+
      'WHERE (dbo.Data0103.HAS_CHILD <> 0)'+#13+
      'and (Data0105.STATUS <> 5)'+#13+
      'AND (dbo.Data0105.FYEAR ='+EDIT1.Text+')'+#13+
      'AND (dbo.Data0105.PERIOD ='+EDIT2.Text+')';
    open;
  end;
  if dm.tmp.IsEmpty then
    result:=''
  else
    result:=dm.tmp.fieldbyname('VOUCHER').AsString+':'+dm.tmp.fieldbyname('GL_ACC_NUMBER').AsString;
end;

function TFrmMain.OpenData105:integer;//根据条件获取凭证
begin
  with DM.tmp do
  begin
    close;
    sql.Text:='select top 1 rkey from data0105'+#13+
              ' where data0105.fyear='+edit1.Text+#13+
              ' and data0105.period='+edit2.Text+#13+
              ' and data0105.status=2';
    open;
    result:=recordcount;
  end;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);  //登帐
var
  vStr:string;
begin
 if self.INITIALIZED=0 then
 begin
    messagedlg('请首进行账务初始化,设定科目期初余额!',mterror,[mbcancel],0);
    exit;
 end;

  if OpenData105=0 then   //获取要登帐的凭证
  begin
    messagedlg('没有找到可以登帐的凭证!',mterror,[mbcancel],0);
    exit;
  end;

 if self.find_glcurrnum(vstr) then
 begin
   messagedlg('检查到当前会计期间有科目使用不同货币进行了记帐:'+vstr,mterror,[mbcancel],0);
   exit;
 end;

 vStr:=find_has_child();
 if trim(vStr)<>'' then
 begin
   messagedlg('检查到使用了非明细科目记帐,登帐终止'+vStr,mterror,[mbcancel],0);
   exit;
 end;

 with dm.tmp do
 begin
   close;
   sql.Text:=
   'SELECT  dbo.Data0105.VOUCHER,'+#13+
   'abs(SUM(dbo.Data0106.AMOUNT) - d1.amount_c) as chayi'+#13+
   'FROM   dbo.Data0105 INNER JOIN'+#13+
   ' dbo.Data0106 ON dbo.Data0105.RKEY = dbo.Data0106.GL_HEADER_PTR INNER JOIN'+#13+
   ' (SELECT     TOP (100) PERCENT SUM(Data0106_1.AMOUNT) AS amount_c, Data0105_1.VOUCHER'+#13+
   ' FROM   dbo.Data0105 AS Data0105_1 INNER JOIN'+#13+
   ' dbo.Data0106 AS Data0106_1 ON Data0105_1.RKEY = Data0106_1.GL_HEADER_PTR'+#13+
   ' WHERE (Data0105_1.FYEAR = '+edit1.Text+') AND (Data0105_1.PERIOD = '+edit2.Text+')'+#13+
   ' AND (Data0106_1.D_C = ''C'')'+#13+
   ' GROUP BY Data0106_1.D_C, Data0105_1.VOUCHER'+#13+
   ' ORDER BY Data0105_1.VOUCHER) AS d1 ON d1.VOUCHER = dbo.Data0105.VOUCHER'+#13+
   'WHERE (dbo.Data0105.FYEAR = '+edit1.Text+') AND (dbo.Data0105.PERIOD = '+edit2.Text+')'+#13+
   ' AND (dbo.Data0106.D_C = ''D'')'+#13+
   'GROUP BY dbo.Data0106.D_C, dbo.Data0105.VOUCHER, d1.amount_c'+#13+
   'HAVING (SUM(dbo.Data0106.AMOUNT) <> d1.amount_c)'+#13+
   'ORDER BY dbo.Data0105.VOUCHER';
   open;
 end;
 if dm.tmp.fieldbyname('VOUCHER').AsString<>'' then
 begin
   messagedlg('当前会计期间凭证:'+dm.tmp.fieldbyname('VOUCHER').AsString+
      '借贷金额不平衡差异:'+dm.tmp.fieldbyname('chayi').AsString,mterror,[mbcancel],0);
   exit;
 end;

with dm.tmp do
 begin
   close;
   sql.Text:=
    'SELECT  dbo.Data0105.VOUCHER, dbo.Data0103.GL_ACC_NUMBER'+#13+
    'FROM    dbo.Data0105 INNER JOIN'+#13+
    'dbo.Data0106 ON dbo.Data0105.RKEY = dbo.Data0106.GL_HEADER_PTR INNER JOIN'+#13+
    'dbo.Data0103 ON dbo.Data0106.GL_ACCT_NO_PTR = dbo.Data0103.RKEY'+#13+
    'WHERE dbo.Data0105.STATUS <> 5  and (dbo.Data0105.FYEAR = '+edit1.Text+') AND (dbo.Data0105.PERIOD = '+edit2.Text+') '+#13+
    'AND (ABS(dbo.Data0106.PRICE - ROUND(dbo.Data0106.AMOUNT * dbo.Data0106.EXCH_RATE, 2)) > 0.5)';
   open;
 end;
 if not dm.tmp.IsEmpty then
 begin
   messagedlg('当前会计期间凭证:'+dm.tmp.fieldbyname('VOUCHER').AsString+
      '汇率或者原币不正确,科目:'+dm.tmp.fieldbyname('GL_ACC_NUMBER').AsString,mterror,[mbcancel],0);
   exit;
 end;

 try
   Dm.tmp.Close;
   Dm.tmp.SQL.Text:='exec DenAcct '+edit1.Text+','+edit2.Text+','+user_ptr;
   Dm.tmp.Open;
   if Dm.tmp.Fields[0].AsInteger>0 then
    begin
     BitBtn1.Enabled:=false;
     showmessage('登帐成功!');
    end
   else
     showmessage('登帐失败,请与管理员联系!');
 except
  on e:Exception do
   begin
    messagedlg(e.Message,mtinformation,[mbok],0);
   end;
 end;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
 close;
end;

end.
