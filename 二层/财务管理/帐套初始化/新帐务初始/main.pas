unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Spin, Grids, DBGridEh, ComCtrls,DateUtils;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    ADS103: TADODataSet;
    ADS103GL_ACC_NUMBER: TStringField;
    ADS103GL_DESCRIPTION: TStringField;
    ADS103CURR_CODE: TStringField;
    ADS103CURR_NAME: TStringField;
    ADS103BASE_TO_OTHER: TFloatField;
    ADS103TYR_OPEN_ORIG: TBCDField;
    ADS103dbcr: TStringField;
    ADS103TYR_DEBIT_ORIG: TBCDField;
    ADS103TYR_CREDIT_ORIG: TBCDField;
    ADS103PARENT_PTR: TIntegerField;
    DataSource1: TDataSource;
    ADS103TYR_OPEN: TBCDField;
    ADS103TYR_DEBIT: TBCDField;
    ADS103TYR_CREDIT: TBCDField;
    ADS508: TADODataSet;
    ADS508CURR_FYEAR: TIntegerField;
    ADS508CURR_PERIOD: TSmallintField;
    ADS508INITIALIZED: TSmallintField;
    DBGridEh1: TDBGridEh;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ADOCommand1: TADOCommand;
    ADOQuery1: TADOQuery;
    adstype0_103: TADODataSet;
    ADStype0_103GL_ACC_NUMBER: TStringField;
    ADStype0_103gl_description: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField1: TFloatField;
    ADStype0_103dbcr: TStringField;
    IntegerField1: TIntegerField;
    ADStype0_103tyr_open_orig: TBCDField;
    BCDField2: TBCDField;
    BCDField3: TBCDField;
    ADStype0_103tyr_open: TBCDField;
    BCDField5: TBCDField;
    BCDField6: TBCDField;
    DataSource2: TDataSource;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    Label3: TLabel;
    adstype0_103OPEN_DEBIT: TCurrencyField;
    adstype0_103OPEN_CREDIT: TCurrencyField;
    adstype0_103OPEN_ORIG_DEBIT: TCurrencyField;
    adstype0_103OPEN_ORIG_CREDIT: TCurrencyField;
    ADS508CONTROL_DATE: TDateTimeField;
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ADS103AfterScroll(DataSet: TDataSet);
    procedure DBGridEh1ColExit(Sender: TObject);
    procedure adstype0_103CalcFields(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
   function GetPRkey(prky:integer;var parent_ptr:integer):boolean;
   function updateGL(const open,debit,credit,tyr_open,tyr_d,try_c:currency;vgl:integer):boolean;
   function find_error():boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
 uses common;
{$R *.dfm}
function TForm1.find_error: boolean;
var
 open_total,open_fs:currency;
begin
self.ADOQuery1.Close;
self.ADOQuery1.SQL.Text:=
' SELECT     SUM(TYR_OPEN) AS open_amount'+#13+
  'FROM         Data0103'+#13+
  'WHERE     (DB_CR = ''D'') AND (TTYPE = 0)';
self.ADOQuery1.open;
open_total:=self.ADOQuery1.fieldbyname('open_amount').AsCurrency;

self.ADOQuery1.Close;
self.ADOQuery1.SQL.Text:=
'SELECT     SUM(TYR_OPEN) AS open_amount'+#13+
'FROM         dbo.Data0103'+#13+
'WHERE     (DB_CR = ''C'') AND (TTYPE = 0)';
self.ADOQuery1.open;
open_fs:=self.ADOQuery1.fieldbyname('open_amount').AsCurrency;

if open_total <>  open_fs then
 result:=true
else
 result:=false;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
self.ADS103.Close;
if self.adstype0_103.Active then
 self.adstype0_103.Close;
application.Terminate;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (ADS103.RecNo=ADS103.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录

end;

procedure TForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
if odd(ads103.RecNo) then
 begin
  DBGridEh1.Canvas.Brush.Color:=clinfobk;
  DBGridEh1.Canvas.Font.Color:=clblack;
  DBGridEh1.Canvas.FillRect(Rect);
  DBGridEh1.DefaultDrawColumnCell(rect,datacol,column,state);
 end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
self.ADS508.Close;
self.ADS508.Open;
self.SpinEdit1.Value:=self.ADS508CURR_FYEAR.Value;
self.SpinEdit2.Value:=self.ADS508CURR_PERIOD.Value;
self.ADS103.Open;
if self.ADS508INITIALIZED.Value=1 then
 begin
  button2.Enabled:=false;
  self.DBGridEh1.ReadOnly:=true;
  spinedit1.Enabled:=false;
  spinedit2.Enabled:=false;
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 self.ADOConnection1.BeginTrans;
 try
 self.ADS103.DisableControls;
 self.ADS103.First;
 while not ads103.Eof do
 begin
  if self.ADS103CURR_CODE.AsVariant=null then
  begin
  self.ADS103.Edit;
  self.ADS103TYR_OPEN_ORIG.Value:=self.ADS103TYR_OPEN.Value;
  self.ADS103TYR_DEBIT_ORIG.Value:=self.ADS103TYR_DEBIT.Value;
  self.ADS103TYR_CREDIT_ORIG.Value:=self.ADS103TYR_CREDIT.Value;
  end;
  self.ADS103.Next;
 end;
 self.ADS103.UpdateBatch(); 
 self.ADS103.EnableControls;
 self.ADOConnection1.CommitTrans;
 self.ADS103.Close;
 self.ADS103.Open;
 showmsg('更新成功',1);
 except
  self.ADOConnection1.RollbackTrans;
  showmsg('更新失败!!!',1);
 end;

end;

function TForm1.GetPRkey(prky:integer;var parent_ptr:integer):boolean;
begin
 adoquery1.Close;
 adoquery1.SQL.Text:='SELECT PARENT_PTR'+#13+
                   'FROM Data0103'+#13+
                   'WHERE RKEY ='+inttostr(prky);
 adoquery1.Open;
 if adoquery1.FieldValues['PARENT_PTR']>0 then
  begin
   parent_ptr:=adoquery1.FieldValues['PARENT_PTR'];
   result:=true;
  end
 else
  result:=false;
end;

function TForm1.updateGL(const open,debit,credit,tyr_open,tyr_d,try_c:currency;vgl:integer):boolean;
var
  parent_ptr:integer;
begin
 try
  self.ADOCommand1.Parameters.ParamValues['open']:=open;
  self.ADOCommand1.Parameters.ParamValues['debit']:=debit;
  self.ADOCommand1.Parameters.ParamValues['credit']:=credit;
  self.ADOCommand1.Parameters.ParamValues['open_orig']:=tyr_open;
  self.ADOCommand1.Parameters.ParamValues['debit_orig']:=tyr_d;
  self.ADOCommand1.Parameters.ParamValues['credit_orig']:=try_c;
  self.ADOCommand1.Parameters.ParamValues['rkey']:=vgl;
  self.ADOCommand1.Execute;
  parent_ptr:=0;
  if self.GetPRkey(vgl,parent_ptr) then
   updateGL(open,debit,credit,tyr_open,tyr_d,try_c,parent_ptr); //更新父科目
  result:=true;
 except
  result:=false;
 end;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
if (pagecontrol1.ActivePageIndex=1) and (self.ADS508INITIALIZED.Value=0) then
 try
  self.ADOConnection1.BeginTrans;
  adoquery1.Close;
  adoquery1.SQL.Text:='UPDATE Data0103'+#13+
       ' SET TYR_OPEN= 0,'+#13+
            'TYR_DEBIT= 0,'+#13+
            'TYR_CREDIT=0,'+#13+
            'TYR_OPEN_ORIG= 0,'+#13+
            'TYR_DEBIT_ORIG= 0,'+#13+
            'TYR_CREDIT_ORIG=0'+#13+
        'WHERE  (dbo.Data0103.HAS_CHILD <> 0)';
  adoquery1.ExecSQL;

 self.ads103.First;
 self.ads103.DisableControls;
 while not self.ads103.Eof do
 begin
  if self.ADS103CURR_CODE.AsVariant=null then
   begin
    self.ADS103.Edit;
    self.ADS103TYR_OPEN_ORIG.Value:=self.ADS103TYR_OPEN.Value;
    self.ADS103TYR_DEBIT_ORIG.Value:=self.ADS103TYR_DEBIT.Value;
    self.ADS103TYR_CREDIT_ORIG.Value:=self.ADS103TYR_CREDIT.Value;
   end;
  if self.ads103PARENT_PTR.Value>0 then
   self.updateGL(self.ADS103TYR_OPEN.Value,
                 self.ADS103TYR_DEBIT.Value,
                 self.ADS103TYR_CREDIT.Value,
                 self.ads103TYR_OPEN_ORIG.Value,
                 self.ads103TYR_DEBIT_ORIG.Value,
                 self.ads103TYR_CREDIT_ORIG.Value,
                 self.ads103PARENT_PTR.Value);
  self.ads103.Next;
 end;
 self.ADS103.UpdateBatch();
 self.ads103.EnableControls;
 self.ADOConnection1.CommitTrans;
 self.ADS103.Close;
 self.ADS103.Open;
 adstype0_103.Close;
 adstype0_103.Open;

if not find_error then
 begin
   button3.Enabled:=true;
   label3.Visible:=true;
 end
else
 begin
  button3.Enabled:=false;
  label3.Visible:=false;
  showmsg('试算平衡操作失败,请修改明细科目使资产等于负债加所有者权益',1);
 end;

 except

    on e :exception do
     begin
      ADOConnection1.RollbackTrans ;
      showmsg('试算平衡操作失败!'+#13#10+e.Message,1);
     end;

 // self.ADOConnection1.RollbackTrans;
//  showmsg('试算平衡操作失败',1);
 end
else
begin
 if not adstype0_103.Active then
 adstype0_103.Open;
end;
 
end;

procedure TForm1.ADS103AfterScroll(DataSet: TDataSet);
begin
if self.ADS103CURR_CODE.AsVariant=null then
 begin
  dbgrideh1.Columns[8].ReadOnly:=true;
  dbgrideh1.Columns[9].ReadOnly:=true;
  dbgrideh1.Columns[10].ReadOnly:=true;
 end
else
 begin
  dbgrideh1.Columns[8].ReadOnly:=false;
  dbgrideh1.Columns[9].ReadOnly:=false;
  dbgrideh1.Columns[10].ReadOnly:=false;
 end;
end;

procedure TForm1.DBGridEh1ColExit(Sender: TObject);
begin
if self.ADS103CURR_CODE.AsVariant=null then
 begin
  self.ADS103.Edit;
  self.ADS103TYR_OPEN_ORIG.Value:=self.ADS103TYR_OPEN.Value;
  self.ADS103TYR_DEBIT_ORIG.Value:=self.ADS103TYR_DEBIT.Value;
  self.ADS103TYR_CREDIT_ORIG.Value:=self.ADS103TYR_CREDIT.Value;
 end;
end;


procedure TForm1.adstype0_103CalcFields(DataSet: TDataSet);
begin
if self.ADStype0_103dbcr.Value='借' then
 begin
  self.adstype0_103OPEN_DEBIT.Value:=self.ADStype0_103tyr_open.Value;
  self.adstype0_103OPEN_ORIG_DEBIT.Value:=self.ADStype0_103tyr_open_orig.Value;
 end
else
 begin
  self.adstype0_103OPEN_CREDIT.Value:=self.ADStype0_103tyr_open.Value;
  self.adstype0_103OPEN_ORIG_CREDIT.Value:=self.ADStype0_103tyr_open_orig.Value;
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 try
   self.ADOConnection1.BeginTrans;
   self.ADS508.Edit;
   self.ADS508CURR_FYEAR.Value:=self.SpinEdit1.Value;
   self.ADS508CURR_PERIOD.Value:=self.SpinEdit2.Value;
   self.ADS508INITIALIZED.Value:=1;
   Self.ADS508CONTROL_DATE.Value:=StartOfAMonth(SpinEdit1.Value,SpinEdit2.Value);
   self.ADS508.Post;

   self.ADOQuery1.Close;
   self.ADOQuery1.SQL.Text:='delete data0110';
   self.ADOQuery1.ExecSQL;

   self.ADOQuery1.Close;
   self.ADOQuery1.SQL.Text:='DBCC CHECKIDENT (''data0110'', RESEED, 0)'+#13+
                            'WITH NO_INFOMSGS ';
   self.ADOQuery1.ExecSQL;

   self.ADOQuery1.Close;
   self.ADOQuery1.SQL.Text:=
    'INSERT INTO Data0110'+#13+
    ' (FYEAR, GL_ACCT_PTR, TYR_OPEN, TYR_DEBIT, TYR_CREDIT, TYR_OPEN_ORIG, TYR_DEBIT_ORIG, TYR_CREDIT_ORIG)'+#13+
    'SELECT '+spinedit1.Text+' AS FYEAR, RKEY, TYR_OPEN, TYR_DEBIT, TYR_CREDIT, TYR_OPEN_ORIG, TYR_DEBIT_ORIG, TYR_CREDIT_ORIG'+#13+
    'FROM   Data0103';
   self.ADOQuery1.ExecSQL;

    if spinedit2.Value-1 > 0 then
    begin
     self.ADOQuery1.Close;
     self.ADOQuery1.SQL.Text:='update data0110'+#13+
       'set TYR_PERIOD_'+inttostr(spinedit2.Value-1)+'_CLOSE_ORIG ='+#13+
       'Data0103.TYR_OPEN_ORIG,'+#13+
       'TYR_PERIOD_'+inttostr(spinedit2.Value-1)+'_CLOSE ='+#13+
       'Data0103.TYR_OPEN'+#13+
       'FROM  dbo.Data0110 INNER JOIN'+#13+
        'dbo.Data0103 ON dbo.Data0110.GL_ACCT_PTR = dbo.Data0103.RKEY'+#13+
         'where (dbo.Data0110.FYEAR = '+spinedit1.Text+')';
     self.ADOQuery1.ExecSQL;
    end;
  self.ADOConnection1.CommitTrans;
  showmsg('更新帐套,初始数据成功',1);
  self.ADS103.Close;
  if self.adstype0_103.Active then
   self.adstype0_103.Close;
  application.Terminate;
 except
  self.ADOConnection1.RollbackTrans;
  showmsg('更新失败!!!',1);
 end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not App_Init(self.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if self.PageControl1.ActivePageIndex=0 then
 Export_dbGridEH_to_Excel(dbgrideh1,self.Caption)
else
 Export_dbGridEH_to_Excel(dbgrideh2,self.Caption);
end;

end.
