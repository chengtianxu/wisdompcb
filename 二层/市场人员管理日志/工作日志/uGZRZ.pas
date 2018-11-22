unit uGZRZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons,Math;

type
  TfrmGZRZ = class(TForm)
    TJSTATUS: TRadioGroup;
    YSSTATUS: TRadioGroup;
    Memo1: TMemo;
    Label1: TLabel;
    Edit2: TEdit;
    CJRQ: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BRLJ: TEdit;
    RZYBL: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn2: TBitBtn;
    RZID: TEdit;
    Label7: TLabel;
    Edit3: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BRLJExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BRLJKeyPress(Sender: TObject; var Key: Char);
  private
    _EMPPTR:integer;
    _BMPTR:integer;//创建人部门指针
    _ZY:integer;//创建人职位指针
    function New708():boolean;
    function Edit708():boolean;
    procedure Get708();
    procedure GetID();
    procedure CreateID(pID:string);
    function NumberError(pID:string):boolean;
  public
    _isedit:boolean;
    _704PTR:integer;
  end;

var
  frmGZRZ: TfrmGZRZ;

implementation

uses uEMPInfo, uDM, uXSMB, common;

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

procedure TfrmGZRZ.GetID();

begin
 dm.AQery4.Close;
 dm.AQery4.Open;
 if dm.AQery4.FieldValues['SEED_FLAG']<>1 then
  begin
   RZID.Text:=dm.AQery4.FieldValues['SEED_VALUE'];
   RZID.Enabled:=false;
  end
 else
  begin
   RZID.Enabled:=true;
  end;
end;

procedure TfrmGZRZ.CreateID(pID:string);
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
function TfrmGZRZ.NumberError(pID:string):boolean;
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
//新增
function TfrmGZRZ.New708():boolean;
var
 vrkey:integer;
 sys_date:tdatetime;
begin
  sys_date:=getsystem_date(dm.AQery,0);
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='SELECT * FROM data0708 WHERE (RKEY IS NULL)';
  dm.AQery.Open ;
  try

    dm.AQery.Append ;
    dm.AQery.FieldValues['PTR704']:=_704PTR;                  //704表指针
    dm.AQery.FieldValues['RZID']:=trim(RZID.Text);            //ID号
    dm.AQery.FieldValues['BRLJ']:=strtofloat(BRLJ.Text);      //本日累计
    dm.AQery.FieldValues['RZYBL']:=strtofloat(RZYBL.Text);    //本日累计占月计划比例
    dm.AQery.FieldValues['TJSTATUS']:=TJSTATUS.ItemIndex;     //特急产品是否落实(0是,1否)
    dm.AQery.FieldValues['YSSTATUS']:=YSSTATUS.ItemIndex;     //应收是否落实(0是,1否)
    dm.AQery.FieldValues['USEPTR']:=_EMPPTR;                  //创建人指针
    dm.AQery.FieldValues['BMPTR']:=_BMPTR;                    //创建部门指针
    dm.AQery.FieldValues['ZYStatus']:=_ZY;                    //创建职位指针
    dm.AQery.FieldValues['CJRQ']:=CJRQ.Date;       //创建日期
    dm.AQery.FieldValues['enter_date']:=sys_date; //系统日期不可修改
    dm.AQery.FieldValues['Note']:=memo1.Lines.Text;           //备注

    dm.AQery.Post;
    messagedlg('保存成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.AQery.FieldValues['rkey'];
    dm.AQery708.Close;
    dm.AQery708.Open ;
    dm.AQery708.Locate('rkey',vrkey,[]);
    result:=true;
  except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
      result:=false;
     end;
  end;
end;
//编辑
function TfrmGZRZ.Edit708():boolean;
var
 vrkey:integer;
begin
  dm.AQery.Close ;
  dm.AQery.SQL.Text:='SELECT * FROM data0708 WHERE (RKEY ='+dm.AQery708.FieldByName('rkey').AsString+')';
  dm.AQery.Open ;
  try
    dm.AQery.Edit;
    dm.AQery.FieldValues['PTR704']:=_704PTR;
    dm.AQery.FieldValues['BRLJ']:=strtofloat(BRLJ.Text);      //本日累计
    dm.AQery.FieldValues['RZYBL']:=strtofloat(RZYBL.Text);    //本日累计占月计划比例
    dm.AQery.FieldValues['TJSTATUS']:=TJSTATUS.ItemIndex;     //特急产品是否落实(0是,1否)
    dm.AQery.FieldValues['YSSTATUS']:=YSSTATUS.ItemIndex;     //应收是否落实(0是,1否)
    dm.AQery.FieldValues['USEPTR']:=_EMPPTR;                  //创建人指针
    dm.AQery.FieldValues['BMPTR']:=_BMPTR;                    //创建部门指针
    dm.AQery.FieldValues['ZYStatus']:=_ZY;                    //创建职位指针
    dm.AQery.FieldValues['CJRQ']:=CJRQ.Date;       //创建日期
    dm.AQery.FieldValues['Note']:=memo1.Lines.Text;           //备注
    dm.AQery.Post;
    messagedlg('保存成功！！！',mtinformation,[mbok],0);
    vrkey:=dm.AQery708.FieldValues['rkey'];
    dm.AQery708.Close;
    dm.AQery708.Open ;
    dm.AQery708.Locate('rkey',vrkey,[]);
    result:=true;
  except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
      result:=false;
     end;
  end;
end;
//获取信息
procedure TfrmGZRZ.Get708();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.AQery708.FieldCount-1 do
     if Controls[i].Name =dm.AQery708.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.AQery708.Fields[j].Value;

   if Controls[i].ClassName ='TDateTimePicker' then
    for j:=0 to dm.AQery708.FieldCount-1 do
     if Controls[i].Name =dm.AQery708.Fields[j].FieldName then
      (Controls[i] as TDateTimePicker).Date :=dm.AQery708.Fields[j].Value;

   if Controls[i].ClassName ='TRadioGroup' then
    for j:=0 to dm.AQery708.FieldCount-1 do
     if Controls[i].Name =dm.AQery708.Fields[j].FieldName then
      (Controls[i] as TRadioGroup).ItemIndex:=dm.AQery708.Fields[j].Value;
  end; //end for
 // 创建人
 dm.AQery5.Close;
 dm.AQery5.Parameters.ParamValues['rky']:=dm.AQery708.FieldByName('USEPTR').Value;
 dm.AQery5.Open;
 edit2.Text :=dm.AQery5.FieldValues['EMPLOYEE_NAME'];
 _EMPPTR:=dm.AQery5.FieldValues['rkey'];
 edit3.Text:=dm.AQery5.FieldValues['ZY'];//职位
 _BMPTR:=dm.AQery5.FieldValues['EMPLOYEE_ID'] ;  //部门指针
 _ZY:=dm.AQery5.FieldValues['popedom'];     //职位状态值
 //704 rkey
 _704PTR:=dm.AQery708.FieldByName('PTR704').Value;
 memo1.Text:=dm.AQery708Note.Value;
end;

procedure TfrmGZRZ.FormShow(Sender: TObject);
begin

 BitBtn2.Enabled:=SpeedButton1.Enabled;

 if not _isedit then       //新增
  begin
   _EMPPTR:=dm.AQery5.FieldValues['rkey'];
   edit2.Text:=dm.AQery5.FieldValues['EMPLOYEE_NAME']; //创建人
   edit3.Text:=dm.AQery5.FieldValues['ZY'];            //职位
   _BMPTR:=dm.AQery5.FieldValues['EMPLOYEE_ID'] ;      //部门指针
   _ZY:=dm.AQery5.FieldValues['popedom'];              //职位状态值
  end
 else
  begin
    brlj.Enabled:=true;
  end;
 if _isedit then
   Get708()
 else
   GetID();

end;
procedure TfrmGZRZ.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmEMPINFO, frmEMPINFO);
  frmEMPINFO.AQery5.Open ;
  if trim(edit1.Text)<>'' then
   frmEMPINFO.Edit1.Text:=trim(edit2.Text);
  if frmEMPINFO.ShowModal=mrOk then
  begin
   edit2.Text:=frmEMPINFO.AQery5EMPLOYEE_NAME.Value;
   _EMPPTR:=frmEMPINFO.AQery5RKEY.Value;
  end;

  frmEMPINFO.Free();
end;
//保存
procedure TfrmGZRZ.SpeedButton1Click(Sender: TObject);
begin
 if _EMPPTR=0 then
  begin
   messagedlg('创建人不能为空！！！',mtinformation,[mbok],0);
   exit;
  end;
 if _704PTR=0 then
  begin
   messagedlg('请选择计划！！！',mtinformation,[mbok],0);
   exit;
  end;
 //检查编号
 if not _isedit then
  if NumberError(trim(RZID.Text)) then
   begin
    dm.AQery4.Close;
    dm.AQery4.Open;
    if dm.AQery4.FieldValues['SEED_FLAG']<>1 then
     begin
      if messagedlg('编号重复可能多人同时新增,是否自动更新编号为:'+
       dm.AQery4.FieldValues['SEED_VALUE'],mtconfirmation,[mbyes,mbno],0)=mryes then
        RZID.Text:=dm.AQery4.FieldValues['SEED_VALUE']
      else
       exit;
     end
    else
     begin
      messagedlg('编号重复!请手工重新输入',mterror,[mbok],0);
      RZID.SetFocus;
      exit;
     end;
   end;  //END  _isedit=false

 try
  strtofloat(BRLJ.Text);
  strtofloat(RZYBL.Text);
 if not _isedit then
   begin
    if New708() =false then exit;
    CreateID(trim(RZID.Text));     //保存编号    
   end
  else
   begin
    if Edit708()=false then exit;
   end;
  close;
 except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//计算百分比
procedure TfrmGZRZ.BRLJExit(Sender: TObject);
begin
 try
  strtofloat(BRLJ.Text);

  RZYBL.Text:= FormatFloat('0.00',strtofloat(BRLJ.Text)/strtofloat(edit1.Text)*100);
 except
   on E: Exception do
     begin
      messagedlg(E.Message,mtinformation,[mbok],0);
     end;
 end;
end;
//
procedure TfrmGZRZ.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmGZRZ.FormCreate(Sender: TObject);
begin
 CJRQ.Date:=date();
end;
//销售目标
procedure TfrmGZRZ.BitBtn2Click(Sender: TObject);
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
  brlj.Enabled:=true;
  end;
  frmXSMB.Free;
end;

procedure TfrmGZRZ.BRLJKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then exit;
 if checkchar(TEdit(Sender).Text, key)=false then
    begin
      showmessage('输入数数字！！！');
      abort;
    end;
end;

end.
