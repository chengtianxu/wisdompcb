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
    function find_fasdim(year,month:integer):boolean;
    function GetTrans():integer;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses udm, DateUtils,common;

{$R *.dfm}

function TFrmMain.GetTrans():integer;
begin
 dm.ADOQ.close;
 dm.ADOQ.SQL.Clear;
 dm.ADOQ.SQL.Text:='select rkey from data0105'+#13+
                   'where FYEAR='+edit1.Text+#13+
                   'and PERIOD='+edit2.Text+#13+
                   'and SPECIAL_POSTING =''D'''+#13+
                   'and STATUS <> 5'+#13+
                   'and status <>3';
 dm.ADOQ.Open;
 if dm.ADOQ.IsEmpty then
  result:=0
 else
  result:=dm.ADOQ.FieldByName('rkey').Value;
end;

function TFrmMain.find_fasdim(year,month:integer): boolean;
begin
with dm.ADOQ do
 begin
  close;
  sql.Text:='select rkey from data0525 '+
            'where year(dimi_date)='+inttostr(year)+
            ' and MONTH(dimi_date)='+inttostr(month);
  open;
  if isempty then
   result:=false
  else
   result:=true;
 end;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
 close;
 application.Terminate;
end;
//*****************************************************************
//********1.生成转帐凭证：借，折旧费，贷：累计折旧           ******
//********2,更新固定资产，"当前已计提月份"=当前已计提月份-1  ******
//********3.更新固定资产，"当前累计折旧"=当前累计折旧-月折旧额*****
//*****************************************************************
procedure TFrmMain.BitBtn1Click(Sender: TObject);
var
  vSql:string;
  vrkey:integer;

begin
 if dm.DS0508.fieldbyname('depre_flag').AsInteger = 0  then
  begin
   messagedlg('本期未计提折旧!',mtinformation,[mbcancel],0);
   exit;
  end;

 if self.find_fasdim(strtoint(edit1.text),strtoint(edit2.Text)) then
  begin
   messagedlg('本期有减少的固定资产请先删除减少!',mtinformation,[mbcancel],0);
   exit;
  end;

 if messagedlg('开始反计提折旧请再次确认!!',mtconfirmation,[mbyes,mbno],0)=mryes then
 try
   dm.ADOCnn.BeginTrans;
   screen.Cursor:=crAppstart;
   dm.ADOQ.Close;
   dm.ADOQ.SQL.Text:='update data0517'+#13+
   'set Data0517.SUMMED_DEPRE='+#13+     //当前累计折旧
   'Data0517.SUMMED_DEPRE - Data0517.MONTH_DEPRE_AMT,'+#13+
   'Data0517.DEPRED_MONTHS=Data0517.DEPRED_MONTHS - 1,'+#13+  //当前计提月份
   'Data0517.NET_VALUE='+#13+               //当前净值
   'Data0517.ORIGINAL_VALUE - Data0517.SUMMED_DEPRE + Data0517.MONTH_DEPRE_AMT'+#13+
   'FROM Data0517 INNER JOIN'+#13+

   '(SELECT Data0528.D0517_ptr'+#13+
   'FROM Data0528'+#13+
   'WHERE (Data0528.FYEAR ='+edit1.Text+')'+#13+
   'AND (Data0528.PERIOD ='+edit2.Text+')'+#13+
   'AND (Data0528.DEPRE_AMOUNT > 0)'+#13+
   'GROUP BY Data0528.D0517_ptr) d1'+#13+
    'ON Data0517.rkey = d1.D0517_ptr';

{   'Data0516 ON Data0517.STATUS_PTR = Data0516.RKEY'+#13+
   'WHERE (Data0517.BOOK_DATE < '''+datetostr(startOfAMonth(vY,vM))+''')'+#13+
      'AND (Data0517.active_flag = 1)'+#13+
      'AND (Data0517.DEPRED_MONTHS <= Data0517.EXPECTED_LIFE_MONTHS)'+#13+
      'AND (Data0516.IN_DEPRECIATION = 1)';
 }
   dm.ADOQ.ExecSQL;  //修改517固定资产卡片中的已计提折旧

   vrkey:=GetTrans();
   if vrkey > 0 then
   begin
    vSql:='update data0105 ';
    vSql:=vSql+' set STATUS=5';
    vSql:=vSql+' where rkey='+inttostr(vrkey);    //删除凭证
    dm.ADOQ.Close ;
    dm.ADOQ.SQL.Clear ;
    dm.ADOQ.SQL.Text :=vSql;
    dm.ADOQ.ExecSQL ;
   end
   else
    begin
     dm.ADOCnn.RollbackTrans ;
     screen.Cursor:=crDefault;
     messagedlg('没有找到本期已经计提折旧并且未登账的会计凭证!',
                    mtinformation,[mbcancel],0);
     exit;
    end;

   //删除折旧
   vSql:='delete data0528 ';
   vSql:=vSql+' where FYEAR='+edit1.Text;
   vSql:=vSql+' and PERIOD='+edit2.Text;
   dm.ADOQ.Close ;
   dm.ADOQ.SQL.Clear ;
   dm.ADOQ.SQL.Text :=vSql;
   dm.ADOQ.ExecSQL ;

   dm.DS0508.Edit;
   dm.DS0508.fieldbyname('depre_flag').AsInteger := 0;  //未计提折旧标志
   dm.DS0508.Post ;

   dm.ADOCnn.CommitTrans ;
   screen.Cursor:=crDefault;
   messagedlg('成功反计提折旧!',mtinformation,[mbok],0);
  except
   on E: Exception do
    begin
     dm.ADOCnn.RollbackTrans;
     screen.Cursor:=crDefault;
     showmessage(E.Message);
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
   DM.DS0508.close ;
   DM.DS0508.Open ;
   edit1.text:=DM.DS0508.fieldbyname('curr_FYEAR').asstring;
   edit2.text:=DM.DS0508.fieldbyname('curr_period').asstring;
  end;
end;

end.

