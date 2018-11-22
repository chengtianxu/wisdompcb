unit budget;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DB, StdCtrls, DBCtrls, Mask, Buttons, ComCtrls, ExtCtrls;

type
  TForm_budget = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    SpeedButton1: TSpeedButton;
    Label22: TLabel;
    Label24: TLabel;
    Label37: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    MaskEdit1: TMaskEdit;
    DBEdit1: TDBEdit;
    DBEdit12: TDBEdit;
    DBImage1: TDBImage;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    TabSheet2: TTabSheet;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    SpeedButton2: TSpeedButton;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBImage2: TDBImage;
    DBEdit26: TDBEdit;
    OpenDialog1: TOpenDialog;
    Label38: TLabel;
    Label39: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
  private
    { Private declarations }
    v_close:byte;
  public
    { Public declarations }
    rkey15:Integer;
  end;

var
  Form_budget: TForm_budget;

implementation

uses damo, main,common, QrySet, empl_search;

{$R *.dfm}

procedure TForm_budget.FormActivate(Sender: TObject);
var
 i,j:byte;
 v_mask:string;
begin
  if dm.ADS15.FieldValues['EMPLOYEE_PTR_1']<>null then
 begin
  dm.ADS05.Close;
  dm.ADS05.Parameters[0].Value :=dm.ADS15.FieldValues['EMPLOYEE_PTR_1'];
  dm.ADS05.Open;
  edit1.Text := dm.ADS05.FieldValues['empl_code'];
  edit1.Font.Color := clwindowtext;
  label13.Caption := dm.ADS05.FieldValues['employee_name'];
 end;
if dm.ADS15.FieldValues['EMPLOYEE_PTR_2']<>null then
 begin
  dm.ADS05.Close;
  dm.ADS05.Parameters[0].Value :=dm.ADS15.FieldValues['EMPLOYEE_PTR_2'];
  dm.ADS05.Open;
  edit2.Text := dm.ADS05.FieldValues['empl_code'];
  edit2.Font.Color := clwindowtext;
  label14.Caption := dm.ADS05.FieldValues['employee_name'];
 end;
if dm.ADS15.FieldValues['EMPLOYEE_PTR_3']<>null then
 begin
  dm.ADS05.Close;
  dm.ADS05.Parameters[0].Value :=dm.ADS15.FieldValues['EMPLOYEE_PTR_3'];
  dm.ADS05.Open;
  edit3.Text := dm.ADS05.FieldValues['empl_code'];
  edit3.Font.Color := clwindowtext;
  label15.Caption := dm.ADS05.FieldValues['employee_name'];
 end;

if DM.ADS15.FieldValues['warehouse_code']<>null then //编辑
 begin
  maskedit1.Text := trim(DM.ADS15.FieldValues['warehouse_code']);
  if dm.AQ04.FieldValues['seed_flag']=2  then
   begin
    for i:=length(maskedit1.Text) downto 1 do
    if (maskedit1.Text[i]<'0') or (maskedit1.Text[i]>'9') then//找出第几位开始为前缀
     begin                                    //不是数字字符就为前缀
     Maskedit1.editmask := copy(maskedit1.Text,1,i)+copy('99999',1,5-i)+';1; ';
     v_mask :=Maskedit1.editmask;
     for j:=1 to i do
     insert('\',v_mask,2*j-1);      //从奇数位插入
     maskedit1.EditMask := v_mask;
     maskedit1.Text := trim(DM.ADS15.FieldValues['warehouse_code']);
     break;
     end;
    end
   else
   if dm.AQ04.FieldValues['seed_flag']=4 then
    begin
     maskedit1.Enabled :=false;
     dbedit2.SetFocus;
    end
   else
    begin
     maskedit1.SetFocus;
     maskedit1.SelectAll;
    end;
    rkey15:=dm.ADS15RKEY.Value;
 end
else                                                   //新增状态
 if dm.AQ04.FieldValues['seed_flag']<>1 then
  begin
   maskedit1.text := trim(dm.AQ04.Fieldbyname('seed_value').AsString);
   if dm.AQ04.FieldValues['seed_flag']=2  then
    begin
    for i:=length(maskedit1.Text) downto 1 do //设置掩码
    if (maskedit1.Text[i]<'0') or (maskedit1.Text[i]>'9') then//找出第几位开始为前缀
    begin                                    //不是数字字符就为前缀
     Maskedit1.editmask := copy(maskedit1.Text,1,i)+copy('99999',1,5-i)+';1; ';
     v_mask :=Maskedit1.editmask;
     for j:=1 to i do
      insert('\',v_mask,2*j-1);      //从奇数位插入
     maskedit1.EditMask := v_mask;
     maskedit1.Text := trim(dm.AQ04.Fieldbyname('seed_value').AsString);
     break;
    end;
    end
   else
   if dm.AQ04.FieldValues['seed_flag']=4 then
    begin
     maskedit1.Enabled :=false;
     dbedit2.SetFocus;
    end
   else    //等于3
    begin
     maskedit1.SetFocus;
     maskedit1.SelectAll;
    end;
  end
 else      //等于1
  begin
   maskedit1.Text := '';
   maskedit1.SetFocus;
  end;
end;

procedure TForm_budget.BitBtn1Click(Sender: TObject);
var
 v_seed,v_last,new_seed,v_end:string;
 i,v_length:byte;
begin
 if trim(maskedit1.Text)='' then
  begin
   messagedlg('工厂代码不能为空!请重新输入',mterror,[mbok],0);
   pagecontrol1.ActivePage:=Tabsheet1;
   maskedit1.SetFocus;
   exit;
  end
 else
 if DM.aq04seed_flag.Value<>1 then //控制码从04中读取
  begin
   v_end:=copy(maskedit1.Text,length(trim(maskedit1.Text)),1);
   if (v_end<'0') or (v_end>'9') then
   begin
    application.MessageBox('最后一位必须是一个整数','控制号码',mb_ok);
    pagecontrol1.ActivePage:=Tabsheet1;
    maskedit1.SetFocus;
    exit;
   end;
  end;
 if trim(dbedit2.Text)='' then
  begin
   messagedlg('工厂名称不能为空!请重新输入',mterror,[mbok],0);
   pagecontrol1.ActivePage:=Tabsheet1;
   dbedit2.SetFocus;
   exit;
  end;
 if trim(dbedit3.Text)='' then
  begin
   messagedlg('工厂简称不能为空!请重新输入',mterror,[mbok],0);
   pagecontrol1.ActivePage:=Tabsheet1;
   dbedit3.SetFocus;
   exit;
  end;
 if trim(dbedit13.Text)='' then
  begin
   messagedlg('国内采购订单初始值不能为空!请重新输入',mterror,[mbok],0);
   pagecontrol1.ActivePage:=Tabsheet1;
   dbedit13.SetFocus;
   exit;
  end;

   if trim(DBEdit29.Text)='' then
  begin
   messagedlg('每日最多入库面积不能为空!请重新输入',mterror,[mbok],0);
   pagecontrol1.ActivePage:=Tabsheet1;
   DBEdit29.SetFocus;
   exit;
  end;

  if trim(dbedit30.Text)='' then
  begin
   messagedlg('每日最高入库款数不能为空!请重新输入',mterror,[mbok],0);
   pagecontrol1.ActivePage:=Tabsheet1;
   DBEdit30.SetFocus;
   exit;
  end;

 if trim(dbedit26.Text)='' then
  begin
   messagedlg('国外采购订单初始值不能为空!请重新输入',mterror,[mbok],0);
   pagecontrol1.ActivePage:=Tabsheet2;
   dbedit26.SetFocus;
   exit;
  end;


//****************************************************************************
 DM.ADS15.Fieldvalues['warehouse_code']:=maskedit1.Text;//给代码赋值
if DM.ADS15.State=dsedit then //如果编辑
 begin
  DM.ADS15.Post;
  v_close:=1;
  close;
 end
else                                 //如果新增
 begin
 dm.ADOConnection1.BeginTrans;
 try
  DM.ADS15.Post;
 
 if dm.aq04seed_flag.Value<>1 then //代码由控制码控制
  begin
  v_seed := trim(maskedit1.Text);
  v_length := length(v_seed);
  if v_seed>=trim(DM.AQ04.FieldValues['seed_value']) then    //如果代码是从04中取值
  for i := length(v_seed) downto 1 do                       // 更新data0004
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
   v_last := inttostr(10000+strtoint(copy(v_seed,i+1,v_length-i))+1);
   new_seed := copy(v_seed,1,i)+copy(v_last,5-(v_length-i)+1,v_length-i);
   dm.AQ04.Edit;            //使前缀不变后缀加1
   DM.AQ04.FieldValues['seed_value'] := new_seed;
   dm.AQ04.Post;
   break;
   end
  else
  if i=1 then //如果第一位仍然是数字
   begin
   v_last := inttostr(100000+strtoint(v_seed)+1);
   new_seed := copy(v_last,6-v_length+1,v_length);
   dm.AQ04.Edit;
   DM.AQ04.FieldValues['seed_value'] := new_seed;
   DM.AQ04.Post;
   end;
  end;

  DM.ADOConnection1.CommitTrans;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     pagecontrol1.ActivePage:=Tabsheet1;
     maskedit1.SetFocus;
     exit;
    end;
  end;
  DM.ADS15.Close;
  DM.ADS15.Open; //刷新一下
  DM.ADS15.Append;
  pagecontrol1.ActivePage:=Tabsheet1;

 if DM.AQ04.FieldValues['seed_flag']<>1 then
  begin
   maskedit1.text := trim(DM.AQ04.Fieldbyname('seed_value').AsString);
   dbedit2.SetFocus;
  end
 else
  begin
   maskedit1.Text := '';
   maskedit1.SetFocus;
  end;
  DBCheckBox1.Checked := True;


   if Form_main.is_new then
   begin
     dm.ADS15.Append;
     edit1.Text := '';
     edit1.Font.Color :=clblue;
     edit2.Text := '';
     edit2.Font.Color :=clblue;
     edit3.Text := '';
     edit3.Font.Color :=clblue;
     label13.Caption := '';
     label14.Caption := '';
     label15.Caption := '';
     if dm.AQ04.FieldValues['seed_flag']<>1 then
     begin
       maskedit1.text := trim(dm.AQ04.Fieldbyname('seed_value').AsString);
       dbedit2.SetFocus;
     end
     else
     begin
       maskedit1.Text := '';
       maskedit1.SetFocus;
     end;               //以上实现如果是新建的连续增加
     v_close:=1;Close;
     Form_main.btnRefreshClick(Sender);
   end
   else   //如果是复制则保存后正常退出
   begin
      v_close:=1;Close;
      Form_main.btnRefreshClick(Sender);
   end;
  Form_main.btnRefreshClick(Sender);
 end;
end;
procedure TForm_budget.BitBtn2Click(Sender: TObject);
begin
 v_close:=1;
 close;
end;

procedure TForm_budget.SpeedButton1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
 dbimage1.picture.LoadFromFile(OpenDialog1.filename);
end;

procedure TForm_budget.SpeedButton2Click(Sender: TObject);
begin
if OpenDialog1.Execute then
 dbimage2.picture.LoadFromFile(OpenDialog1.filename);
end;
procedure TForm_budget.BitBtn3Click(Sender: TObject);
begin
try
  frmemployeesearch:=Tfrmemployeesearch.Create(application);
  frmemployeesearch.Edit1.Text := trim(edit1.Text);
  if frmemployeesearch.ADOQuery1.IsEmpty then
   begin
    messagedlg('抱歉,没有找到相关记录!',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
  else
  if frmemployeesearch.ShowModal=mrok then
   begin
    edit1.Text := frmemployeesearch.ADOQuery1.FieldValues['empl_code'];
    edit1.Font.Color := clwindowtext;
    label13.Caption := frmemployeesearch.ADOQuery1.FieldValues['employee_name'];
    dm.ADS15.FieldValues['EMPLOYEE_PTR_1']:=frmemployeesearch.ADOQuery1.FieldValues['rkey'];
    edit2.SetFocus;
   end
  else
   edit1.SetFocus;
 finally
  frmemployeesearch.free;
 end;
end;

procedure TForm_budget.Edit1Click(Sender: TObject);
begin
if edit1.Font.Color = clwindowtext then
  begin
   edit1.Font.Color := clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm_budget.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (trim(edit1.Text)<>'')  then
 try
  frmemployeesearch:=Tfrmemployeesearch.Create(application);
  frmemployeesearch.Edit1.Text := trim(edit1.Text);
  if comparetext(trim(edit1.Text),frmemployeesearch.ADOQuery1.fieldbyname('empl_code').AsString)=0 then
   begin
    edit1.Font.Color := clwindowtext;
    label13.Caption := frmemployeesearch.ADOQuery1.FieldValues['employee_name'];
    dm.ADS15.FieldValues['EMPLOYEE_PTR_1']:=frmemployeesearch.ADOQuery1.FieldValues['rkey'];
   end
  else
   begin
    messagedlg('联络人代码不正确!',mterror,[mbcancel],0);
    edit1.SetFocus;
   end;
 finally
  frmemployeesearch.free;
 end
else
 if trim(edit1.Text)='' then
 dm.ADS15.FieldValues['EMPLOYEE_PTR_1']:=null;
end;

procedure TForm_budget.BitBtn4Click(Sender: TObject);
begin
try
  frmemployeesearch:=Tfrmemployeesearch.Create(application);
  frmemployeesearch.Edit1.Text := trim(edit2.Text);
  if frmemployeesearch.ADOQuery1.IsEmpty then
   begin
    messagedlg('抱歉,没有找到相关记录!',mtinformation,[mbok],0);
    edit2.SetFocus;
   end
  else
  if frmemployeesearch.ShowModal=mrok then
   begin
    edit2.Text := frmemployeesearch.ADOQuery1.FieldValues['empl_code'];
    edit2.Font.Color := clwindowtext;
    label14.Caption := frmemployeesearch.ADOQuery1.FieldValues['employee_name'];
    dm.ADS15.FieldValues['EMPLOYEE_PTR_2']:=frmemployeesearch.ADOQuery1.FieldValues['rkey'];
    edit3.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  frmemployeesearch.free;
 end;
end;

procedure TForm_budget.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color = clwindowtext then
  begin
   edit2.Font.Color := clblue;
   edit2.SelectAll;
  end;
end;

procedure TForm_budget.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (trim(edit2.Text)<>'')  then
 try
  frmemployeesearch:=Tfrmemployeesearch.Create(application);
  frmemployeesearch.Edit1.Text := trim(edit2.Text);
  if comparetext(trim(edit2.Text),frmemployeesearch.ADOQuery1.fieldbyname('empl_code').AsString)=0 then
   begin
    edit2.Font.Color := clwindowtext;
    label14.Caption := frmemployeesearch.ADOQuery1.FieldValues['employee_name'];
    dm.ADS15.FieldValues['EMPLOYEE_PTR_2']:=frmemployeesearch.ADOQuery1.FieldValues['rkey'];
   end
  else
   begin
    messagedlg('联络人代码不正确!',mterror,[mbcancel],0);
    edit2.SetFocus;
   end;
 finally
  frmemployeesearch.free;
 end
else
 if trim(edit2.Text)='' then
  dm.ADS15.FieldValues['EMPLOYEE_PTR_2']:=null;
end;

procedure TForm_budget.BitBtn5Click(Sender: TObject);
begin
try
  frmemployeesearch:=Tfrmemployeesearch.Create(application);
  frmemployeesearch.Edit1.Text := trim(edit3.Text);
  if frmemployeesearch.ADOQuery1.IsEmpty then
   begin
    messagedlg('抱歉,没有找到相关记录!',mtinformation,[mbok],0);
    edit3.SetFocus;
   end
  else
  if frmemployeesearch.ShowModal=mrok then
   begin
    edit3.Text := frmemployeesearch.ADOQuery1.FieldValues['empl_code'];
    edit3.Font.Color := clwindowtext;
    label15.Caption := frmemployeesearch.ADOQuery1.FieldValues['employee_name'];
    dm.ADS15.FieldValues['EMPLOYEE_PTR_3']:=frmemployeesearch.ADOQuery1.FieldValues['rkey'];
   end
  else
   edit3.SetFocus;
 finally
  frmemployeesearch.free;
 end;
end;

procedure TForm_budget.Edit3Click(Sender: TObject);
begin
if edit3.Font.Color = clwindowtext then
  begin
   edit3.Font.Color := clblue;
   edit3.SelectAll;
  end;
end;

procedure TForm_budget.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn5') and (trim(edit3.Text)<>'')  then
 try
  frmemployeesearch:=Tfrmemployeesearch.Create(application);
  frmemployeesearch.Edit1.Text := trim(edit3.Text);
  if comparetext(trim(edit3.Text),frmemployeesearch.ADOQuery1.fieldbyname('empl_code').AsString)=0 then
   begin
    edit3.Font.Color := clwindowtext;
    label15.Caption := frmemployeesearch.ADOQuery1.FieldValues['employee_name'];
    DM.ADS15.FieldValues['EMPLOYEE_PTR_3']:=frmemployeesearch.ADOQuery1.FieldValues['rkey'];
   end
  else
   begin
    messagedlg('联络人代码不正确!',mterror,[mbcancel],0);
    edit3.SetFocus;
   end;
 finally
  frmemployeesearch.free;
 end
else
 if trim(edit3.Text)='' then
  DM.ADS15.FieldValues['EMPLOYEE_PTR_3']:=null;
end;

end.
