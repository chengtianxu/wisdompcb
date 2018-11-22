unit uFFass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, Grids,
  DBGrids, DB, ADODB, Spin;

type
  TFrmFass = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    Label10: TLabel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label18: TLabel;
    Edit4: TEdit;
    Label19: TLabel;
    Edit5: TEdit;
    Label20: TLabel;
    Edit6: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    GroupBox7: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    StrGrd: TStringGrid;
    StrGrd1: TStringGrid;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit18: TEdit;
    ComBoxFasTyp: TComboBox;
    GroupBox5: TGroupBox;
    StrGrdOrig1: TStringGrid;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    StrGrdOrig2: TStringGrid;
    ComBoxFasAlt: TComboBox;
    ComBoxFasStat: TComboBox;
    Edit1: TEdit;
    Qery514: TADOQuery;
    Qery515: TADOQuery;
    Qery516: TADOQuery;
    ComboBox2: TComboBox;
    Label12: TLabel;
    Label14: TLabel;
    Edit2: TEdit;
    SpinEdit1: TSpinEdit;
    Memo1: TMemo;
    Label15: TLabel;
    Edit3: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

   // procedure TabSheet2Show(Sender: TObject);



    procedure TabSheet1Show(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComBoxFasTypSelect(Sender: TObject);
    procedure ComBoxFasAltSelect(Sender: TObject);
    procedure ComBoxFasStatSelect(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Select(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);


  private
    { Private declarations }
    _Tpkey: array of integer;
    _Altkey: array of integer;
    _Statkey: array of integer;  //状态
    //_Glkey: array of integer;
    //_DepAckey: array of integer;
    function GetOrigVal():currency; //获取原值
    function CaluMDepr(const pI:integer):boolean;//月折旧率
    function CalDepCurr(const pY:integer;const pI:integer;const pIniCurr:currency):currency;//计算折旧余额
    function New517Rec():boolean;      //新增固定资产
    function Edit517Rec(const pRkey:integer):boolean;     //修改固定资产
    function New325Rec(const prkey:integer):boolean;      //新增固定资产原值
    function Edit325Rec(const prkey:integer):boolean;     //修改固定资产原值
    function New326Rec(const prkey:integer):boolean;      //新增固定资产折旧费用
    function Edit326Rec(const prkey:integer):boolean;     //修改固定资产折旧费用
    function ishasID(const pID:string):boolean;     //是否ID被占用
    function CheckMust():boolean;     //检查必填字段是否填写
    function GetPercents():currency;     //检查费用分滩是否100%
    function SetFassGlVal(const prkey:integer):boolean; //固定资产，
    function SetDeprGlVal(const prkey:integer):boolean;  //累计折旧科目

  public
    { Public declarations }
    _FasTpkey :integer;    //固定资产类别Rkey
    _FasAltkey:integer;    //固定资产增减方式rkey
    _FasStatkey:integer;   //固定资产状态rkey
    _FasGlkey:integer;     //固定资产科目rkey
    _FasDepAckey:integer;  //累计折旧科目rkey
    _isEdit:boolean;       //
    function checkchar(const pstr:string;const pkey:char):boolean;
    function GetID():string;       //获取ID号
  end;

var
  FrmFass: TFrmFass;

implementation

uses uMD, math;

{$R *.dfm}
//固定资产累计折旧科目
function TFrmFass.SetFassGlVal(const prkey:integer):boolean;
var
  vsql:string;
begin
  dm.Qery.Close ;
  dm.Qery.SQL.Clear ;
//  vsql:='SELECT CASE WHEN data0103_1.parent_ptr = 0 THEN data0103_1.GL_DESCRIPTION ELSE Data0103_2.GL_DESCRIPTION';
//  vsql:=vsql+'+'+''''+'─'+''''+'+' + 'Data0103_1.GL_DESCRIPTION  END AS description_2,';
//  vsql:=vsql+' Data0103_1.GL_ACC_NUMBER';
//  vsql:=vsql+' FROM Data0103 Data0103_2 RIGHT OUTER JOIN ';
//  vsql:=vsql+' Data0103 Data0103_1 ON Data0103_2.RKEY = Data0103_1.PARENT_PTR';
//  vsql:=vsql+' WHERE ';
//  vsql:=vsql+' (Data0103_1.rkey='+inttostr(prkey)+')';
  vsql := 'select GL_DESCRIPTION,GL_ACC_NUMBER from data0103 where rkey = ' + inttostr(prkey);
  dm.Qery.SQL.Text :=vsql;
  dm.Qery.Open ;
  
  Edit16.Text:=dm.Qery.fieldbyname('GL_ACC_NUMBER').value;  //科目代码
  label29.Caption:=dm.Qery.fieldbyname('GL_DESCRIPTION').AsString;  //科目名称

  result:=true;
end;
//累计折旧科目
function TFrmFass.SetDeprGlVal(const prkey:integer):boolean;
var
  vsql:string;
begin
  dm.Qery.Close ;
  dm.Qery.SQL.Clear ;
//  vsql:='SELECT CASE WHEN data0103_1.parent_ptr = 0 THEN data0103_1.GL_DESCRIPTION ELSE Data0103_2.GL_DESCRIPTION';
//  vsql:=vsql+'+'+''''+'─'+''''+'+' + 'Data0103_1.GL_DESCRIPTION  END  AS description_2,';
//  vsql:=vsql+' Data0103_1.GL_ACC_NUMBER';
//  vsql:=vsql+' FROM Data0103 Data0103_2 RIGHT OUTER JOIN ';
//  vsql:=vsql+' Data0103 Data0103_1 ON Data0103_2.RKEY = Data0103_1.PARENT_PTR';
//  vsql:=vsql+' WHERE ';
//  vsql:=vsql+' (Data0103_1.rkey='+inttostr(prkey)+')';
  vsql := 'select GL_DESCRIPTION,GL_ACC_NUMBER from data0103 where rkey = ' + inttostr(prkey);
  dm.Qery.SQL.Text :=vsql;
  dm.Qery.Open ;
  Edit17.Text:=dm.Qery.fieldbyname('GL_ACC_NUMBER').value;  //科目代码
  label30.Caption:=dm.Qery.fieldbyname('GL_DESCRIPTION').AsString;  //科目名称
  
 result:=true;
end;
function TFrmFass.GetPercents():currency;     //检查费用分滩是否100%
var
  i:integer;
  vCurr:currency;
begin
vCurr:=0;
if StrGrd.Row = StrGrd.Rowcount-1 then
   begin
    vCurr:=0;
   end;

  for i:=1 to StrGrd.Rowcount-2 do
    begin
      vCurr:=vCurr+strtofloat(StrGrd.Cells[1,i]);
    end;
  result:=vCurr;

end;
//检查必填字段是否填写
function TFrmFass.CheckMust():boolean;
var
  vRes:boolean;
begin

 if trim(Edit15.text)='' then
   begin
    messagedlg('资产名称必须填写！',mtinformation,[mbok],0);
    TabSheet1.Show;
    Edit15.SetFocus;
    vRes:=false;
    exit;
   end;
 if _FasTpkey=0 then
   begin
    messagedlg('资产类别必须填写！',mtinformation,[mbok],0);
    TabSheet1.Show ;
    ComBoxFasTyp.SetFocus;
    vRes:=false;
    exit;
   end;
 if ComBoxFasStat.text='' then
   begin
    messagedlg('资产状况必须填写！',mtinformation,[mbok],0);
    TabSheet1.Show ;
    ComBoxFasStat.SetFocus;
    vRes:=false;
    exit;
   end;
 if _FasGlkey=0 then
   begin
    messagedlg('资产科目必须填写！',mtinformation,[mbok],0);
    edit17.SetFocus;
    vRes:=false;
    exit;
   end;
 if _FasDepAckey=0 then
   begin
    messagedlg('累计折旧科目必须填写！',mtinformation,[mbok],0);
    edit16.SetFocus;
    vRes:=false;
    exit;
   end;
 if getorigval()=0 then
   begin
    messagedlg('资产原值必须填写！',mtinformation,[mbok],0);
    StrGrdOrig1.SetFocus;
    vRes:=false;
    exit;
   end;
 if ComboBox2.Text='' then
   begin
    messagedlg('折旧方法必须填写！',mtinformation,[mbok],0);
    TabSheet2.Show ;
    ComboBox2.SetFocus ;
    vRes:=false;
    exit;
   end;
 if trim(edit9.Text)='' then
   begin
    messagedlg('预计使用年限必须填写！',mtinformation,[mbok],0);
    edit9.SetFocus ;
    vRes:=false;
    exit;
   end;
 if trim(StrGrd.Cells[0,1])='' then
  begin
   messagedlg('折旧费用必须填写！',mtinformation,[mbok],0);
   StrGrd.SetFocus ;
   vRes:=false;
   exit;
  end;
 if GetPercents()<>100 then
  begin
   messagedlg('折旧费用分滩错误！',mtinformation,[mbok],0);
   StrGrd.SetFocus ;
   vRes:=false;
   exit;
  end;
   
 result:=vRes;
end;

function TFrmFass.ishasID(const pID:string):boolean;     //是否ID被占用
begin
 dm.Qery.Close;
 dm.Qery.SQL.Clear ;
 dm.Qery.SQL.Text :=' select FASSET_CODE from data0517 where FASSET_CODE='+''''+pID+'''';
 dm.Qery.Open;
 if dm.Qery.RecordCount =0 then
  result:=false
 else
  result:=true;

end;
//获取ID号
function TFrmFass.GetID():string;
var
  vID:string;
  vPow:currency;
begin
 dm.Qery.Close;
 dm.Qery.SQL.Clear ;
 dm.Qery.SQL.Text :=' select top 1 FASSET_CODE from data0517 ORDER BY FASSET_CODE DESC';
 dm.Qery.Open ;
 if dm.Qery.RecordCount =0 then
  vID:='00001'
 else
  begin
   vID:=dm.Qery.fieldbyname('FASSET_CODE').value;
   vPow:=power(10,length(vID))+1;
   vID:=floattostr(vPow+strtoint(vID));
   vID:=copy(vID,2,length(vID));
  end;
 result:=vid; 
end;
//计算折旧余额
function TFrmFass.CalDepCurr( const pY:integer;const pI:integer;const pIniCurr:currency):currency;
var
  vi,vCurr:currency;
  i:integer;
begin
  vi:=1-2/pY;
  vCurr:=pIniCurr;
  for i:=1 to pI do
    vCurr:=vCurr*vi;

 result:=vCurr;
end;
//计算月折旧率，月折旧额
function TFrmFass.CaluMDepr(const pI:integer):boolean ;
var
   vNetV:currency;
   vY:currency;
   vM:currency;
   vOrVal:currency;//原值
begin
  if (trim(edit7.Text)<>'') and (trim(edit9.Text)<>'') then
    if (strtofloat(trim(edit7.Text))<>0) and (strtofloat(trim(edit9.Text))<>0) then
      begin
       vOrVal:=GetOrigVal();
       vNetV:=vOrVal-(vOrVal*strtofloat(trim(edit7.Text))/100);    //计提折旧额
       case pi of
        1:begin  //平均年限
           vY:=strtofloat(trim(edit9.Text));        //预计折旧月数
           vM:=vNetV/vY;                            //月折旧额
           edit12.Text :=floattostr(vM);            //月折旧额
           edit11.Text :=floattostr(vM*100);        //月折旧率
          end;
        2:begin  //工作量法
           vY:=strtofloat(trim(edit9.Text));        //预计使用总工作量
           vM:=vNetV/vY;                            //单位工作量折旧额
           edit12.Text :=floattostr(vM);            //单位工作量折旧额
          end;
        3:begin  //双倍余额递减法
           if strtofloat(trim(edit9.Text))-strtofloat(SpinEdit1.Text)>2 then
            begin
             if strtofloat(SpinEdit1.Text)<>0 then
               vNetV:=CalDepCurr(strtoint(trim(edit9.Text)),strtoint(SpinEdit1.Text),vNetV);
              
             vY:=strtofloat(trim(edit9.Text));        //预计折旧年限
             vM:=2/vY;                                //年折旧率
             edit11.Text :=floattostr(vM/12*100);     //月折旧率
             edit12.Text :=floattostr(vNetV*vM/12);   //月折旧额
            end
           else
            begin
              vNetV:=CalDepCurr(strtoint(trim(edit9.Text)),strtoint(SpinEdit1.Text),vNetV);
              vM:=(vNetV-vOrVal*strtofloat(trim(edit7.Text))/100)/2;    //年折旧额
              edit11.Text :=floattostr(vM/12*100);      //月折旧率
              edit12.Text :=floattostr(vM/12);          //月折旧额
            end;
          end;
        4:begin  //年数总和法
            vY:=strtofloat(trim(edit9.Text));                           //预计折旧年数
            vM:=(vY-strtofloat(SpinEdit1.Text))/((vY*(vY+1))/2)*100/100;     //年折旧率
            edit11.Text :=floattostr(vM/12);                            //月折旧率
            edit12.Text :=floattostr(vNetV*vM/12);                      //月折旧额
          end;
       end; //end case
      end;
end;
 //获取原值
function TFrmFass.GetOrigVal():currency;
var
  i:integer;
  vCurr:currency;
begin
vCurr:=0;
if StrGrdOrig1.Row = StrGrdOrig1.Rowcount-1 then
   begin
    vCurr:=0;
   end;

  for i:=1 to StrGrdOrig1.Rowcount-2 do
    begin
      vCurr:=vCurr+strtofloat(StrGrdOrig1.Cells[3,i]);
    end;
  result:=vCurr;
end;
//新增固定资产
function TFrmFass.New517Rec():boolean;
begin
 try
  dm.DS517.Close ;
  dm.DS517.CommandText:='select * from Data0517 where rkey is null';
  dm.DS517.Open ;
  if ishasID(trim(edit13.Text)) then
   edit13.Text := getID();

  dm.DS517.Append ;
  dm.DS517.FieldByName('FASSET_CODE').Value:=trim(edit13.Text);        //ID号
  dm.DS517.FieldByName('FASSET_NAME').Value:=trim(edit15.Text);        //名称
  dm.DS517.FieldByName('FASSET_DESC').Value:=trim(edit18.Text);        //规格
  dm.DS517.FieldByName('FASSET_TYPE_PTR').Value:=_FasTpkey;             //类别
  dm.DS517.FieldByName('ALT_TYPE_PTR').Value:=_FasAltkey;               //增减方式
  dm.DS517.FieldByName('STATUS_PTR').Value:=_FasStatkey;                //使用状态
  dm.DS517.FieldByName('ORIGINAL_VALUE').Value:=getorigVal();           //原值
  dm.DS517.FieldByName('LOCATION').Value:=trim(edit1.Text);             //位置
  dm.DS517.FieldByName('BOOK_DATE').Value:=datetostr(datetimepicker1.Date); //入帐日期
  dm.DS517.FieldByName('SURPLUS_RATE').Value:=strtoint(trim(edit7.Text))/100; //预计净残值率(%)
  dm.DS517.FieldByName('SURPLUS').Value:=strtofloat(trim(edit8.Text));  //预计净残值
  dm.DS517.FieldByName('DEPRE_MTHD_PTR').Value:=combobox2.ItemIndex;    //固定资产折旧方法(012345)
  dm.DS517.FieldByName('EXPECTED_LIFE_MONTHS').Value:=strtoint(trim(edit9.Text));  //预计使用月份
  dm.DS517.FieldByName('LOADING_UNIT').Value:=''''+trim(edit2.Text)+'''';         //工作量单位
  dm.DS517.FieldByName('MONTH_DEPRE_RATE').Value:=strtofloat(trim(edit11.Text));   //月折旧率
  dm.DS517.FieldByName('MONTH_DEPRE_AMT').Value:=strtofloat(trim(edit12.Text));    //月折旧额
  dm.DS517.FieldByName('DEPRE_ACCT_PTR').Value:=_FasDepAckey;           //累计折旧科目指针103
  dm.DS517.FieldByName('fasset_gl_ptr').Value:=_FasGlkey;               //固产会计科目指针0103
  dm.DS517.FieldByName('id_code').Value:=trim(edit14.Text);             //固定资产编号
  dm.DS517.FieldByName('REMARK').Value:=trim(Memo1.Text);              //备注

  dm.DS517.Post ;

  result:=true;
 except
   on E: Exception do
     begin
      result:=false;
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//修改固定资产
function TFrmFass.Edit517Rec(const pRkey:integer):boolean;
begin
 try
  dm.DS517.Close ;
  dm.DS517.CommandText:='select * from Data0517 where rkey='+inttostr(pRkey);
  dm.DS517.Open ;

  dm.DS517.edit ;
  dm.DS517.FieldByName('FASSET_CODE').Value:=trim(edit13.Text);        //ID号
  dm.DS517.FieldByName('FASSET_NAME').Value:=trim(edit15.Text);        //名称
  dm.DS517.FieldByName('FASSET_DESC').Value:=trim(edit18.Text);        //规格
  dm.DS517.FieldByName('FASSET_TYPE_PTR').Value:=_FasTpkey;             //类别
  dm.DS517.FieldByName('ALT_TYPE_PTR').Value:=_FasAltkey;               //增减方式
  dm.DS517.FieldByName('STATUS_PTR').Value:=_FasStatkey;                //使用状态
  dm.DS517.FieldByName('ORIGINAL_VALUE').Value:=getorigVal();           //原值
  dm.DS517.FieldByName('LOCATION').Value:=trim(edit1.Text);             //位置
  dm.DS517.FieldByName('BOOK_DATE').Value:=datetostr(datetimepicker1.Date); //入帐日期
  dm.DS517.FieldByName('SURPLUS_RATE').Value:=strtoint(trim(edit7.Text))/100; //预计净残值率(%)
  dm.DS517.FieldByName('SURPLUS').Value:=strtofloat(trim(edit8.Text));  //预计净残值
  dm.DS517.FieldByName('DEPRE_MTHD_PTR').Value:=combobox2.ItemIndex;    //固定资产折旧方法(012345)
  dm.DS517.FieldByName('EXPECTED_LIFE_MONTHS').Value:=strtoint(trim(edit9.Text));  //预计使用月份
  dm.DS517.FieldByName('LOADING_UNIT').Value:=trim(edit2.Text);         //工作量单位
  dm.DS517.FieldByName('MONTH_DEPRE_RATE').Value:=strtofloat(trim(edit11.Text));   //月折旧率
  dm.DS517.FieldByName('MONTH_DEPRE_AMT').Value:=strtofloat(trim(edit12.Text));    //月折旧额
  dm.DS517.FieldByName('DEPRE_ACCT_PTR').Value:=_FasDepAckey;           //累计折旧科目指针103
  dm.DS517.FieldByName('fasset_gl_ptr').Value:=_FasGlkey;               //固产会计科目指针0103
  dm.DS517.FieldByName('id_code').Value:=trim(edit14.Text);             //固定资产编号
  dm.DS517.Post ;

  result:=true;
 except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//新增固定资产原值
function TFrmFass.New325Rec(const prkey:integer):boolean;
var
  i:integer;
begin
 if dm.ds325.active=false then dm.ds325.Open;
 with dm.ds325 do
  begin
   for i:=1 to StrGrdOrig1.Rowcount-2 do
    begin
     append;
     fieldbyname('fasset_ptr').Value:=prkey;
     fieldbyname('curr_ptr').Value:=strtoint(StrGrdOrig2.Cells[0,i]); //币种指针
     fieldbyname('ex_rate').Value:=strtoint(StrGrdOrig1.Cells[1,i]);  //汇率
     fieldbyname('orig_curr_orig_value').Value:=strtofloat(StrGrdOrig1.Cells[2,i]);  //原币
    end;
   UpdateBatch();
  end;
 result:=true;
end;
//修改固定资产原值
function TFrmFass.Edit325Rec(const prkey:integer):boolean;
begin
 dm.Qery.Close;
 dm.Qery.SQL.Clear ;
 dm.Qery.SQL.Text :='delete from data0325 where fasset_ptr='+inttostr(prkey);
 dm.Qery.ExecSQL;
 if not new325rec(prkey) then
  result:=false
 else
  result:=true;

end;
//新增固定资产折旧费用
function TFrmFass.New326Rec(const prkey:integer):boolean;
var
  i:integer;
begin
 if dm.ds326.active=false then dm.ds326.Open;
 with dm.ds326 do
  begin
   for i:=1 to StrGrd.Rowcount-2 do
    begin
     append;
     fieldbyname('fasset_ptr').Value:=prkey;
     fieldbyname('dept_ptr').Value:=strtoint(StrGrd1.Cells[1,i]);   //部门指针
     fieldbyname('FACCU_DEPT_GL_PTR').Value:=strtoint(StrGrd1.Cells[2,i]);  //折旧费用科目指针
     fieldbyname('PERCENTS').Value:=strtofloat(StrGrd.Cells[1,i]);  //百分比
    end;
   UpdateBatch();
  end;
 result:=true;
end;
//修改固定资产折旧费用
function TFrmFass.Edit326Rec(const prkey:integer):boolean;
begin
 dm.Qery.Close;
 dm.Qery.SQL.Clear ;
 dm.Qery.SQL.Text :='delete from data0326 where fasset_ptr='+inttostr(prkey);
 dm.Qery.ExecSQL;
 if not new326rec(prkey) then
  result:=false
 else
  result:=true;

end;

function TFrmFass.checkchar(const pstr:string;const pkey:char):boolean;
begin
if not (pkey in ['0'..'9','.',#8]) then  //判断是否输入数字
  begin
    result:=false
  end
 else
  if pkey = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',pstr)>0  then
      begin
        result:=false;
      end
   else
      result:=true;
end;
//保存
procedure TFrmFass.BitBtn1Click(Sender: TObject);
begin
 try
  if not CheckMust() then exit;

  Edit7Change(nil);   //计算净残值
  Edit4Change(nil);   //计算净值
  ComboBox2Select(nil);//计算月折旧率，月折旧额
  dm.Conn.BeginTrans;
  if _isEdit then     //修改
   begin
    if not Edit517Rec(dm.Qery517.fieldbyname('rkey').Value) then
     begin
      dm.Conn.RollbackTrans;
      exit;
     end;
    if not Edit325Rec(dm.Qery517.fieldbyname('rkey').Value) then
     begin
      dm.Conn.RollbackTrans;
      exit;
     end;
    if not Edit326Rec(dm.Qery517.fieldbyname('rkey').Value) then
     begin
      dm.Conn.RollbackTrans;
      exit;
     end;
   end
  else                //新增
   begin
    if not New517Rec() then
     begin
      dm.Conn.RollbackTrans;
      exit;
     end;
    if not new325rec(dm.DS517.fieldbyname('rkey').value) then
     begin
      dm.Conn.RollbackTrans;
      exit;
     end;
    if not new326rec(dm.DS517.fieldbyname('rkey').value) then
     begin
      dm.Conn.RollbackTrans;
      exit;
     end;
   end;
  dm.Conn.CommitTrans;
  FrmFass.close;
 except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//退出
procedure TFrmFass.BitBtn3Click(Sender: TObject);
begin
 FrmFass.Close ;
end;


//原值
procedure TFrmFass.TabSheet1Show(Sender: TObject);
begin
StrGrdOrig1.Cells[0,0]:='币种';
StrGrdOrig1.Cells[1,0]:='汇率';
StrGrdOrig1.Cells[2,0]:='原币金额';
StrGrdOrig1.Cells[3,0]:='本币金额';

end;

//初始化
procedure TFrmFass.FormShow(Sender: TObject);
begin
 if Qery514.Active =false then Qery514.open;

 SetLength(_Tpkey,Qery514.RecordCount);
 while not Qery514.Eof do
  begin
   ComBoxFasTyp.Items.Add(Qery514.fieldbyname('FASSET_TYPE').value);     //资产类别
   _Tpkey[Qery514.RecNo-1]:=Qery514.fieldbyname('rkey').value;
   Qery514.Next;
  end;
 if Qery515.Active =false then Qery515.open;
 SetLength(_Altkey,Qery515.RecordCount);
 while not Qery515.Eof do
  begin
   ComBoxFasAlt.Items.Add(Qery515.fieldbyname('FASSET_ALT_TYPE').value); //资产增减方式
   _Altkey[Qery515.RecNo-1]:=Qery515.fieldbyname('rkey').value;
   Qery515.Next;
  end;
 if Qery516.Active =false then Qery516.open;
 SetLength(_Statkey,Qery516.RecordCount);
 while not Qery516.Eof do
  begin
   ComBoxFasStat.Items.Add(Qery516.fieldbyname('FASSET_STATUS').value); //资产状态
   _Statkey[Qery516.RecNo-1]:=Qery516.fieldbyname('rkey').value;
   Qery516.Next;
  end;


  if not Qery514.Locate('rkey',_FasTpkey,[]) then  //资产类别
   ComBoxFasTyp.ItemIndex :=0
  else
   ComBoxFasTyp.ItemIndex :=Qery514.RecNo-1;
  if not Qery515.Locate('rkey',_FasAltkey,[]) then  //资产增减方式
   ComBoxFasAlt.ItemIndex :=0
  else
   ComBoxFasAlt.ItemIndex :=Qery515.RecNo-1;
  if not Qery516.Locate('rkey',_FasStatkey,[]) then  //资产状态
   ComBoxFasStat.ItemIndex :=0
  else
   ComBoxFasStat.ItemIndex :=Qery516.RecNo-1;

  SetFassGlVal(_FasGlkey);                     //固定资产
  setDeprGlVal(_FasDepAckey);                     //累计折旧
end;
//固定资产类别
procedure TFrmFass.ComBoxFasTypSelect(Sender: TObject);
begin
 _FasTpkey:=_Tpkey[ComBoxFasTyp.ItemIndex];
end;
//增减方式
procedure TFrmFass.ComBoxFasAltSelect(Sender: TObject);
begin
  _FasAltkey:=_Altkey[ComBoxFasAlt.ItemIndex];
end;
//固产状态
procedure TFrmFass.ComBoxFasStatSelect(Sender: TObject);
begin
 _FasStatkey:=_Statkey[ComBoxFasStat.ItemIndex];
end;
//输入数字
procedure TFrmFass.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 if  checkchar(TEdit(Sender).Text, key)=false then
    begin
      showmessage('输入数据不对！！！');
      abort;
    end;
end;
//折旧方法
procedure TFrmFass.ComboBox2Select(Sender: TObject);
begin
 case combobox2.ItemIndex of
  0:begin                               //不折旧
    
    end;
  1:begin         //平均年限法
     label23.Caption :='预计使用月份：';
     label26.Caption :='月折旧额';
     label24.Caption :='当前已计提月份：';
     label25.Visible :=true;
     edit11.Visible :=true;
     label14.Visible :=false;
     edit2.Visible :=false;
     CaluMDepr(1);
    end;
  2:begin         //工作量法
     label23.Caption :='预计总工作量：';
     label26.Caption :='单位工作量折旧额';
     label24.Caption :='当前已计提工作量：';
     label25.Visible :=false;
     edit11.Visible :=false;
     label14.Visible :=true;
     edit2.Visible :=true;
     CaluMDepr(2);
    end;
  3:begin         //双倍余额递减法
     label23.Caption :='预计使用年限：';
     label26.Caption :='月折旧额';
     label24.Caption :='当前已计提年数：';
     label25.Visible :=true;
     edit11.Visible :=true;
     label14.Visible :=false;
     edit2.Visible :=false;
     CaluMDepr(3);
    end;
  4:begin         //年数总和法
     label23.Caption :='预计使用年限：';
     label26.Caption :='月折旧额';
     label24.Caption :='当前已计提年数：';
     label25.Visible :=true;
     edit11.Visible :=true;
     label14.Visible :=false;
     edit2.Visible :=false;
     CaluMDepr(4);
    end;
 end;
end;
//计算净残值
procedure TFrmFass.Edit7Change(Sender: TObject);
var
 vCurr,vR:currency;
begin
  if trim(edit7.Text)<>'' then
   begin
     vCurr:=getorigval();
     vR:=strtofloat(trim(edit7.Text))/100;
     edit8.Text :=floattostr(vCurr*vR);
   end;
end;
//计算净值
procedure TFrmFass.Edit4Change(Sender: TObject);
var
 vCurr,vTota:currency;
begin
  if trim(edit4.Text)<>'' then
   begin
     vCurr:=getorigval();
     vTota:=strtofloat(trim(edit4.Text));
     edit5.Text :=floattostr(vCurr-vTota);
   end;

end;
 //最大年限
procedure TFrmFass.Edit9Change(Sender: TObject);
begin
 SpinEdit1.MaxValue :=strtoint(trim(edit9.Text));
end;

procedure TFrmFass.TabSheet2Show(Sender: TObject);
begin
StrGrd.Cells[0,0]:='使用部门';
StrGrd.Cells[1,0]:='百分比%';
StrGrd.Cells[2,0]:='折旧费用科目';
StrGrd.Cells[3,0]:='会计科目名称';
end;

end.
