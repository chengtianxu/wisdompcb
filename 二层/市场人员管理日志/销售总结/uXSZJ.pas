unit uXSZJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, Spin;

type
  TfrmXSZJ = class(TForm)
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    BQDD: TEdit;
    BQSK: TEdit;
    BQTS: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    BQYP: TEdit;
    YPZLC: TEdit;
    YZLBL: TEdit;
    GroupBox3: TGroupBox;
    YPSF: TEdit;
    YPSFJE: TEdit;
    YPMS: TEdit;
    YPMSJE: TEdit;
    YPGZ: TEdit;
    YPGZJE: TEdit;
    YPKZLC: TEdit;
    BQKM: TEdit;
    KMZLC: TEdit;
    KMQR: TEdit;
    KMSF: TEdit;
    KMSFJE: TEdit;
    KMMS: TEdit;
    KMMSJE: TEdit;
    KMGZ: TEdit;
    KMGZJE: TEdit;
    GroupBox4: TGroupBox;
    BQCSJ: TEdit;
    CSJZLC: TEdit;
    CSJQR: TEdit;
    CSJSF: TEdit;
    CSJSFJE: TEdit;
    CSJMS: TEdit;
    CSJMSJE: TEdit;
    CSJGZ: TEdit;
    CSJGZJE: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    CJRQ: TDateTimePicker;
    Label12: TLabel;
    QJStatus: TRadioGroup;
    ZJND: TSpinEdit;
    ZJQJ: TSpinEdit;
    Label34: TLabel;
    Label35: TLabel;
    Note: TMemo;
    ZWPJ: TRadioGroup;
    Label36: TLabel;
    ZJID: TEdit;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Edit3: TEdit;
    Label40: TLabel;
    StatusBar1: TStatusBar;
    Label9: TLabel;
    week_of: TSpinEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure YPZLCExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BQDDKeyPress(Sender: TObject; var Key: Char);
  private
    _EMPPTR:integer;
    _BMPTR:integer;//创建人部门指针
    _ZY:integer;   //创建人职位指针
    function New712():boolean;
    function Edit712():boolean;
    procedure Get712();
    procedure GetID();
    procedure CreateID(pID:string);
    function NumberError(pID:string):boolean;
  public
    _isedit:boolean;
    _704PTR:integer;
  end;

var
  frmXSZJ: TfrmXSZJ;

implementation

uses uEMPInfo, uDM, dateutils, uXSMB, Math;

{$R *.dfm}
function checkchar(const pstr:string;const pkey:char):boolean;
var
 i,iLast:integer;
begin
     result:=true;
 if not (pkey in ['0'..'9','.',#8]) then  //判断是否输入数字
  result:=false
 else
   if pkey='.' then
     begin
      iLast:=0;
      for i:=0 to Length(pstr) do
       if pstr[i]='.' then
        begin
         iLast:=iLast+1;
         if iLast=1 then
          begin
           result:=false;
           break;
          end;
       end;
     end
    else
     result:=true;
end;
procedure TfrmXSZJ.GetID();
begin
 dm.AQery4.Close;
 dm.AQery4.Open;
 if dm.AQery4.FieldValues['SEED_FLAG']<>1 then
  begin
   ZJID.Text:=dm.AQery4.FieldValues['SEED_VALUE'];
   ZJID.Enabled:=false;
  end
 else
  begin
   ZJID.Enabled:=true;
  end;
end;
procedure TfrmXSZJ.CreateID(pID:string);
var
  vID:string;
  vLen,i:integer;
  vLast:string;
begin
 dm.AQery4.Close;
 dm.AQery4.Open;
 if dm.AQery4.FieldValues['SEED_FLAG']=1 then exit; //手动

 vLen := length(pID);
 for i := vLen downto 1 do
  if not (pID[i] in ['0'..'9']) then   //如果不是数字
   begin
    vLast:= floattostr(power(10,vLen-1)+strtofloat(copy(pID,i+1,vLen-i))+1); //后缀加1
    vID := copy(pID,1,i)+copy(vLast,i+1,vLen-i);
    dm.AQery4.Edit; //使前缀不变后缀加1
    dm.AQery4.FieldValues['SEED_VALUE']:= vID;
    dm.AQery4.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     vLast := floattostr(power(10,vLen)+strtofloat(pID)+1);
     vID := copy(vLast,2,vLen);
     dm.AQery4.Edit;
     dm.AQery4.FieldValues['SEED_VALUE']:= vID;
     dm.AQery4.Post;
    end;

end;
//检查编号是否重复
function TfrmXSZJ.NumberError(pID:string):boolean;
begin
with dm.AQery do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0708');
  sql.Add('where RZID='''+pID+'''');
  open;
  if not IsEmpty then
   result:=true
  else
   result:=false;
 end;

end;
function TfrmXSZJ.New712():boolean;
var
 vrkey:integer;
begin
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='SELECT * FROM data0712 WHERE (RKEY IS NULL)';
  dm.AQery.Open ;
  try

    dm.AQery.Append ;
    dm.AQery.FieldValues['PTR704']:=_704PTR;                    //704表指针
    dm.AQery.FieldValues['ZJID']:=trim(ZJID.Text);              //总结ID号
    dm.AQery.FieldValues['BQDD']:=strtofloat(BQDD.Text);        //本期订单
    dm.AQery.FieldValues['BQSK']:=strtofloat(BQSK.Text);        //本期收款
    dm.AQery.FieldValues['BQTS']:=strtofloat(BQTS.Text);        //本期投诉
    dm.AQery.FieldValues['BQYP']:=strtofloat(BQYP.Text);        //本期做样
    dm.AQery.FieldValues['YPZLC']:=strtofloat(YPZLC.Text);      //样转量产
    dm.AQery.FieldValues['YZLBL']:=strtofloat(YZLBL.Text);      //转量/样品
    dm.AQery.FieldValues['YPSF']:=strtofloat(YPSF.Text);        //样品收费
    dm.AQery.FieldValues['YPSFJE']:=strtofloat(YPSFJE.Text);    //样品收费金额
    dm.AQery.FieldValues['YPMS']:=strtofloat(YPMS.Text);        //样品免收
    dm.AQery.FieldValues['YPMSJE']:=strtofloat(YPMSJE.Text);    //样品免收金额
    dm.AQery.FieldValues['YPGZ']:=strtofloat(YPGZ.Text);        //样品挂帐
    dm.AQery.FieldValues['YPGZJE']:=strtofloat(YPGZJE.Text);    //样品挂帐金额
    dm.AQery.FieldValues['YPKZLC']:=strtofloat(YPKZLC.Text);    //计划样品可转量产
    dm.AQery.FieldValues['BQKM']:=strtofloat(BQKM.Text);        //本期开模
    dm.AQery.FieldValues['KMZLC']:=strtofloat(KMZLC.Text);      //开模转量产
    dm.AQery.FieldValues['KMQR']:=strtofloat(KMQR.Text);        //开模确认
    dm.AQery.FieldValues['KMSF']:=strtofloat(KMSF.Text);        //开模收费
    dm.AQery.FieldValues['KMSFJE']:=strtofloat(KMSFJE.Text);    //开模收费金额
    dm.AQery.FieldValues['KMMS']:=strtofloat(KMMS.Text);        //开模免收
    dm.AQery.FieldValues['KMMSJE']:=strtofloat(KMMSJE.Text);    //开模免收金额
    dm.AQery.FieldValues['KMGZ']:=strtofloat(KMGZ.Text);        //开模挂帐
    dm.AQery.FieldValues['KMGZJE']:=strtofloat(KMGZJE.Text);    //开模挂帐金额
    dm.AQery.FieldValues['BQCSJ']:=strtofloat(BQCSJ.Text);      //本期测试架
    dm.AQery.FieldValues['CSJZLC']:=strtofloat(CSJZLC.Text);    //测试架转量产
    dm.AQery.FieldValues['CSJQR']:=strtofloat(CSJQR.Text);      //测试架确认
    dm.AQery.FieldValues['CSJSF']:=strtofloat(CSJSF.Text);      //测试架收费
    dm.AQery.FieldValues['CSJSFJE']:=strtofloat(CSJSFJE.Text);  //测试架收费金额
    dm.AQery.FieldValues['CSJMS']:=strtofloat(CSJMS.Text);      //测试架免收
    dm.AQery.FieldValues['CSJMSJE']:=strtofloat(CSJMSJE.Text);  //测试架免收金额
    dm.AQery.FieldValues['CSJGZ']:=strtofloat(CSJGZ.Text);      //测试架挂帐
    dm.AQery.FieldValues['CSJGZJE']:=strtofloat(CSJGZJE.Text);  //测试架挂帐金额
    dm.AQery.FieldValues['CJRQ']:=CJRQ.Date;                    //创建日期
    dm.AQery.FieldValues['USEPTR']:=_EMPPTR;                    //创建人
    dm.AQery.FieldValues['BMPTR']:=_BMPTR;                      //创建部门指针
    dm.AQery.FieldValues['ZYStatus']:=_ZY;                      //创建职位指针
    dm.AQery.FieldValues['ZWPJ']:=ZWPJ.ItemIndex;               //自我评价(0未审,1已审)
    dm.AQery.FieldValues['ZJND']:=ZJND.Value;                   //总结年度
    dm.AQery.FieldValues['ZJQJ']:=ZJQJ.Value;                   //总结期间
    dm.AQery.FieldValues['QJStatus']:=QJStatus.ItemIndex;       //期间标志(0月份,1周)
    dm.AQery.FieldValues['week_of']:=week_of.Value;              //第几周 
    dm.AQery.FieldValues['Note']:=Note.Lines.Text;              //备注
    dm.AQery.Post;
    messagedlg('保存成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.AQery.FieldValues['rkey'];
    dm.AQery712.Close;
    dm.AQery712.Open ;
    dm.AQery712.Locate('rkey',vrkey,[]);
    result:=true;
  except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
      result:=false;
     end;
  end;
end;
function TfrmXSZJ.Edit712():boolean;
var
 vrkey:integer;
begin
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='SELECT * FROM data0712 WHERE (RKEY ='+dm.AQery712.FieldByName('rkey').AsString+')';
  dm.AQery.Open ;
  try
    dm.AQery.Edit;
    dm.AQery.FieldValues['PTR704']:=_704PTR;                    //704表指针
    dm.AQery.FieldValues['BQDD']:=strtofloat(BQDD.Text);        //本期订单
    dm.AQery.FieldValues['BQSK']:=strtofloat(BQSK.Text);        //本期收款
    dm.AQery.FieldValues['BQTS']:=strtofloat(BQTS.Text);        //本期投诉
    dm.AQery.FieldValues['BQYP']:=strtofloat(BQYP.Text);        //本期做样
    dm.AQery.FieldValues['YPZLC']:=strtofloat(YPZLC.Text);      //样转量产
    dm.AQery.FieldValues['YZLBL']:=strtofloat(YZLBL.Text);      //转量/样品
    dm.AQery.FieldValues['YPSF']:=strtofloat(YPSF.Text);        //样品收费
    dm.AQery.FieldValues['YPSFJE']:=strtofloat(YPSFJE.Text);    //样品收费金额
    dm.AQery.FieldValues['YPMS']:=strtofloat(YPMS.Text);        //样品免收
    dm.AQery.FieldValues['YPMSJE']:=strtofloat(YPMSJE.Text);    //样品免收金额
    dm.AQery.FieldValues['YPGZ']:=strtofloat(YPGZ.Text);        //样品挂帐
    dm.AQery.FieldValues['YPGZJE']:=strtofloat(YPGZJE.Text);    //样品挂帐金额
    dm.AQery.FieldValues['YPKZLC']:=strtofloat(YPKZLC.Text);    //计划样品可转量产
    dm.AQery.FieldValues['BQKM']:=strtofloat(BQKM.Text);        //本期开模
    dm.AQery.FieldValues['KMZLC']:=strtofloat(KMZLC.Text);      //开模转量产
    dm.AQery.FieldValues['KMQR']:=strtofloat(KMQR.Text);        //开模确认
    dm.AQery.FieldValues['KMSF']:=strtofloat(KMSF.Text);        //开模收费
    dm.AQery.FieldValues['KMSFJE']:=strtofloat(KMSFJE.Text);    //开模收费金额
    dm.AQery.FieldValues['KMMS']:=strtofloat(KMMS.Text);        //开模免收
    dm.AQery.FieldValues['KMMSJE']:=strtofloat(KMMSJE.Text);    //开模免收金额
    dm.AQery.FieldValues['KMGZ']:=strtofloat(KMGZ.Text);        //开模挂帐
    dm.AQery.FieldValues['KMGZJE']:=strtofloat(KMGZJE.Text);    //开模挂帐金额
    dm.AQery.FieldValues['BQCSJ']:=strtofloat(BQCSJ.Text);      //本期测试架
    dm.AQery.FieldValues['CSJZLC']:=strtofloat(CSJZLC.Text);    //测试架转量产
    dm.AQery.FieldValues['CSJQR']:=strtofloat(CSJQR.Text);      //测试架确认
    dm.AQery.FieldValues['CSJSF']:=strtofloat(CSJSF.Text);      //测试架收费
    dm.AQery.FieldValues['CSJSFJE']:=strtofloat(CSJSFJE.Text);  //测试架收费金额
    dm.AQery.FieldValues['CSJMS']:=strtofloat(CSJMS.Text);      //测试架免收
    dm.AQery.FieldValues['CSJMSJE']:=strtofloat(CSJMSJE.Text);  //测试架免收金额
    dm.AQery.FieldValues['CSJGZ']:=strtofloat(CSJGZ.Text);      //测试架挂帐
    dm.AQery.FieldValues['CSJGZJE']:=strtofloat(CSJGZJE.Text);  //测试架挂帐金额
    dm.AQery.FieldValues['CJRQ']:=CJRQ.Date;                    //创建日期
    dm.AQery.FieldValues['USEPTR']:=_EMPPTR;                    //创建人
    dm.AQery.FieldValues['BMPTR']:=_BMPTR;                      //创建部门指针
    dm.AQery.FieldValues['ZYStatus']:=_ZY;                      //创建职位指针    
    dm.AQery.FieldValues['ZWPJ']:=ZWPJ.ItemIndex;               //自我评价(0未审,1已审)
    dm.AQery.FieldValues['ZJND']:=ZJND.Value;                   //总结年度
    dm.AQery.FieldValues['ZJQJ']:=ZJQJ.Value;                   //总结期间
    dm.AQery.FieldValues['QJStatus']:=QJStatus.ItemIndex;       //期间标志(0月份,1周)
    dm.AQery.FieldValues['Note']:=Note.Lines.Text;              //备注
    dm.AQery.Post;
    messagedlg('保存成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.AQery712.FieldValues['rkey'];
    dm.AQery712.Close;
    dm.AQery712.Open ;
    dm.AQery712.Locate('rkey',vrkey,[]);
    result:=true;
  except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
      result:=false;
     end;
  end;
end;
procedure TfrmXSZJ.Get712();
var
 i,j,f:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TGroupBox' then
    begin
     for j:=0 to TGroupBox(Controls[i]).ControlCount-1 do
       if TGroupBox(Controls[i]).Controls[j].ClassName ='TEdit' then
        for f:=0 to dm.AQery712.FieldCount-1 do
         if TGroupBox(Controls[i]).Controls[j].Name =dm.AQery712.Fields[f].FieldName then
          (TGroupBox(Controls[i]).Controls[j] as TEdit).Text:=dm.AQery712.Fields[f].Value;
    end;
   if Controls[i].ClassName ='TMemo' then
    for j:=0 to dm.AQery712.FieldCount-1 do
     if Controls[i].Name =dm.AQery712.Fields[j].FieldName then
      (Controls[i] as TMemo).Lines.Text:=dm.AQery712.Fields[j].Value;
   if Controls[i].ClassName ='TDateTimePicker' then
    for j:=0 to dm.AQery712.FieldCount-1 do
     if Controls[i].Name =dm.AQery712.Fields[j].FieldName then
      (Controls[i] as TDateTimePicker).Date :=dm.AQery712.Fields[j].Value;
   if Controls[i].ClassName ='TRadioGroup' then
    for j:=0 to dm.AQery712.FieldCount-1 do
     if Controls[i].Name =dm.AQery712.Fields[j].FieldName then
      (Controls[i] as TRadioGroup).ItemIndex :=dm.AQery712.Fields[j].Value;
   if Controls[i].ClassName ='TSpinEdit' then
    for j:=0 to dm.AQery712.FieldCount-1 do
     if Controls[i].Name =dm.AQery712.Fields[j].FieldName then
      (Controls[i] as TSpinEdit).Value :=dm.AQery712.Fields[j].Value;
  end; //end for
 //总结ID
 ZJID.Text:=dm.AQery712.FieldValues['ZJID'];
 //销售目标
 _704PTR:=dm.AQery712.FieldValues['PTR704'];
 Edit1.Text:=dm.AQery712.FieldByName('MJHJE').AsString;

 //创建人
 dm.AQery5.Close;
 dm.AQery5.Parameters.ParamValues['rky']:=dm.AQery712.FieldByName('USEPTR').Value;
 dm.AQery5.Open;
 _EMPPTR:=dm.AQery5.FieldValues['rkey'];
 edit2.Text:=dm.AQery5.FieldValues['EMPLOYEE_NAME']; //创建人
 edit3.Text:=dm.AQery5.FieldValues['ZY'];            //职位
 _BMPTR:=dm.AQery5.FieldValues['EMPLOYEE_ID'] ;      //部门指针
 _ZY:=dm.AQery5.FieldValues['popedom'];              //职位状态值

end;
procedure TfrmXSZJ.FormShow(Sender: TObject);
begin
 BitBtn2.Enabled:=SpeedButton1.Enabled;

 if not _isedit then
  begin
   _EMPPTR:=dm.AQery5.FieldValues['rkey'];
   edit2.Text:=dm.AQery5.FieldValues['EMPLOYEE_NAME']; //创建人
   edit3.Text:=dm.AQery5.FieldValues['ZY'];            //职位
   _BMPTR:=dm.AQery5.FieldValues['EMPLOYEE_ID'] ;      //部门指针
   _ZY:=dm.AQery5.FieldValues['popedom'];              //职位状态值
  end;
 if _isedit then
   Get712()
 else
   GetID();
end;

//创建人
procedure TfrmXSZJ.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmEMPINFO, frmEMPINFO);
  frmEMPINFO.AQery5.Open ;
  if trim(edit2.Text)<>'' then
   frmEMPINFO.Edit1.Text:=trim(edit2.Text);
  if frmEMPINFO.ShowModal=mrOk then
  begin
   edit2.Text:=frmEMPINFO.AQery5EMPLOYEE_NAME.Value;
   _EMPPTR:=frmEMPINFO.AQery5RKEY.Value;
  end;

  frmEMPINFO.Free();
end;

//保存
procedure TfrmXSZJ.SpeedButton1Click(Sender: TObject);
var
 i,j:integer;
begin

 if _EMPPTR=0 then
  begin
   messagedlg('创建人不能为空！！！',mtinformation,[mbok],0);
   exit;
  end;
 if _704PTR=0 then
  begin
   messagedlg('请选择销售目标！！！',mtinformation,[mbok],0);
   exit;
  end;
 //检查编号
 if not _isedit then
  if NumberError(trim(ZJID.Text)) then
   begin
    dm.AQery4.Close;
    dm.AQery4.Open;
    if dm.AQery4.FieldValues['SEED_FLAG']<>1 then
     begin
      if messagedlg('编号重复可能多人同时新增,是否自动更新编号为:'+
       dm.AQery4.FieldValues['SEED_VALUE'],mtconfirmation,[mbyes,mbno],0)=mryes then
        ZJID.Text:=dm.AQery4.FieldValues['SEED_VALUE']
      else
       exit;
     end
    else
     begin
      messagedlg('编号重复!请手工重新输入',mterror,[mbok],0);
      ZJID.SetFocus;
      exit;
     end;
   end;  //END  _isedit=false
 try
  for i:=0 to ControlCount-1 do
   begin
     if Controls[i].ClassName  ='TEdit' then
      if (Controls[i].Name <>'Edit2') and (Controls[i].Name <>'ZJID') and
       (Controls[i].Name <>'Edit3') then
       strtofloat(TEdit(Controls[i]).Text);
     if Controls[i].ClassName ='TGroupBox' then
      begin
       for j:=0 to TGroupBox(Controls[i]).controlCount-1 do
        if TGroupBox(Controls[i]).Controls[j].ClassName  ='TEdit' then
          strtofloat(TEdit(TGroupBox(Controls[i]).Controls[j]).Text);
      end;
   end; //end for
  if not _isedit then
   begin
    if New712() =false then exit;
    CreateID(trim(ZJID.Text));   //保存编号
   end
  else
   begin
    if Edit712()=false then exit;
   end;
  close;
 except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;

end;
procedure TfrmXSZJ.FormCreate(Sender: TObject);
begin
 ZJND.Value:=Yearof(now);
 ZJQJ.Value:=Monthof(now);
 week_of.Value:=weekof(date());
 CJRQ.Date:=date();
end;
procedure TfrmXSZJ.SpeedButton2Click(Sender: TObject);
begin
 close;
end;
//计算占比例
procedure TfrmXSZJ.YPZLCExit(Sender: TObject);
begin
 try
  strtofloat(BQYP.Text);
  strtofloat(YPZLC.Text);
  YZLBL.Text:= formatfloat('0.00',strtofloat(YPZLC.Text)/strtofloat(BQYP.Text)*100);
 except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//销售计划
procedure TfrmXSZJ.BitBtn2Click(Sender: TObject);
var
 vMJHJE:currency;
begin
  Application.CreateForm(TfrmXSMB, frmXSMB);
  frmXSMB._UserPTR:=_EMPPTR;
  if frmXSMB.ShowModal=mrok then
  begin
   _704PTR:=frmXSMB.AQery704RKEY.Value;
   vMJHJE:=frmXSMB.AQery704MJHJE.Value ;
   Edit1.Text:=floattostr(vMJHJE);
   zjnd.Value:= frmXSMB.AQery704YJH.Value;
   zjqj.Value:= frmXSMB.AQery704MJH.Value;
  end;
  frmXSMB.Free;
end;

procedure TfrmXSZJ.BQDDKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then exit;
 if checkchar(TEdit(Sender).Text, key)=false then
    begin
      showmessage('输入数数字！！！');
      abort;
    end;
end;

end.
