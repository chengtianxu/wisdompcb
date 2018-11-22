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
    function OpenData105():boolean; //根据条件获取凭证
    function GetProfitTrans():boolean;
    function GetcostTrans():boolean;
    { Private declarations }
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


  //user_ptr:='785';
 // dm.ADOCnn.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  DM.tmp.close ;
  DM.tmp.SQL.Text:='select curr_FYEAR,curr_period from data0508';
  DM.tmp.Open ;
  edit1.text:=dm.tmp.fieldbyname('curr_FYEAR').asstring;
  edit2.text:=dm.tmp.fieldbyname('curr_period').asstring;
end;

function TFrmMain.GetProfitTrans():boolean;
begin
  dm.tmp.Close ;       //是否有结转损益的凭证
  dm.tmp.SQL.Text:='select rkey from data0105 '
                  +' where (PERIOD ='+edit2.Text+')'
                  +' AND (FYEAR ='+edit1.Text+')'
                  +' AND (STATUS = 3)'
                  +' and (SPECIAL_POSTING=''Y'''+')';
  dm.tmp.Open ;
  result:=not dm.tmp.IsEmpty ;
end;

function TFrmMain.GetcostTrans():boolean;
begin
  dm.tmp.Close ;
  dm.tmp.SQL.Text:='select rkey from data0105 '   //是否有结转成本的凭证
        +' where (PERIOD ='+edit2.Text+')'
        +' AND (FYEAR ='+edit1.Text+')'
        +' AND (STATUS = 3)'
        +' and (SPECIAL_POSTING=''A'''+')';
  dm.tmp.Open ;
  result:=not dm.tmp.IsEmpty ;
end;

function TFrmMain.OpenData105():boolean;   //根据条件获取凭证
begin
  DM.tmp.close;
  DM.tmp.sql.Text:='select rkey from data0105'+#13+
            ' where data0105.fyear='+edit1.Text+#13+
            ' and data0105.period='+edit2.Text+#13+
            ' and data0105.status=3';
  DM.tmp.open;
  result:=not DM.tmp.isempty;
end;


procedure TFrmMain.BitBtn1Click(Sender: TObject);  //反登帐
begin
  if GetProfitTrans() then
  begin
    messagedlg('当前期间有结转损益的有效凭证,请先反结损益',mterror,[mbcancel],0);
    exit;
  end;

  if GetcostTrans() then
  begin
    messagedlg('当前期间有结转成本费用的有效凭证,请先反结成本费用',mterror,[mbcancel],0);
    exit;
  end;

  if not OpenData105() then//根据条件获取凭证
  begin
    messagedlg('没有找到可以反登账的凭证!',mterror,[mbcancel],0);
    exit ;
  end;

 try
   Dm.tmp.Close;
   Dm.tmp.SQL.Text:='exec DenAcct; 2 '+edit1.Text+','+edit2.Text;
   Dm.tmp.Open;
   if Dm.tmp.Fields[0].AsInteger>0 then
   begin
     BitBtn1.Enabled:=false;
     showmessage('反登帐成功!');
   end else
     showmessage('反登帐失败,请与管理员联系!');
 except
  on E: Exception do
   begin
    showmessage(e.Message);
   end;
 end;
end;


procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
 close;
end;

end.

