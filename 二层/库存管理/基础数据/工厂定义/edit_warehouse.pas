unit edit_warehouse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, ADODB, ComCtrls;

type
  TForm2 = class(TForm)
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
    Label20: TLabel;
    DBImage1: TDBImage;
    DBEdit13: TDBEdit;
    Label21: TLabel;
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
    Label35: TLabel;
    DBImage2: TDBImage;
    DBEdit26: TDBEdit;
    Label36: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    OpenDialog1: TOpenDialog;
    DBEdit15: TDBEdit;
    Label22: TLabel;
    Label24: TLabel;
    Label37: TLabel;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure DBEdit26Exit(Sender: TObject);
  private
    { Private declarations }
   v_close:byte;    //是否正常退出(0,1)(是,否)    
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses main, empl_search;
{$R *.dfm}

procedure TForm2.BitBtn2Click(Sender: TObject);
var
 v_message:integer;
begin
 if form1.adotable1.State=dsinsert then
  begin
   form1.adotable1.Cancel;
   v_close:=1;
   close;
  end;
if (form1.adotable1.Modified)  then
 begin
 v_message:=messagedlg('数据已修改,是否存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
  if v_message=7 then
    form1.adotable1.Cancel     //no取消对当前记录的修改包括新增
  else
   if v_message=6 then     //yes对修改的记录存盘
    BitBtn1Click(Sender)
   else                    //cancel不存盘也不保存
    exit;
  end;
  v_close:=1;
 close;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
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
    form1.ADOTable1.FieldValues['EMPLOYEE_PTR_1']:=frmemployeesearch.ADOQuery1.FieldValues['rkey'];
    edit2.SetFocus;
   end
  else
   edit1.SetFocus;
 finally
  frmemployeesearch.free;
 end;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i,j:byte;
 v_mask:string;
begin
if form1.ADOTable1.FieldValues['EMPLOYEE_PTR_1']<>null then
 begin
  adoquery1.Close;
  adoquery1.Parameters[0].Value :=form1.ADOTable1.FieldValues['EMPLOYEE_PTR_1'];
  adoquery1.Open;
  edit1.Text := adoquery1.FieldValues['empl_code'];
  edit1.Font.Color := clwindowtext;
  label13.Caption := adoquery1.FieldValues['employee_name'];
 end;
if form1.ADOTable1.FieldValues['EMPLOYEE_PTR_2']<>null then
 begin
  adoquery1.Close;
  adoquery1.Parameters[0].Value :=form1.ADOTable1.FieldValues['EMPLOYEE_PTR_2'];
  adoquery1.Open;
  edit2.Text := adoquery1.FieldValues['empl_code'];
  edit2.Font.Color := clwindowtext;
  label14.Caption := adoquery1.FieldValues['employee_name'];
 end;
if form1.ADOTable1.FieldValues['EMPLOYEE_PTR_3']<>null then
 begin
  adoquery1.Close;
  adoquery1.Parameters[0].Value :=form1.ADOTable1.FieldValues['EMPLOYEE_PTR_3'];
  adoquery1.Open;
  edit3.Text := adoquery1.FieldValues['empl_code'];
  edit3.Font.Color := clwindowtext;
  label15.Caption := adoquery1.FieldValues['employee_name'];
 end;

if form1.ADOTable1.FieldValues['warehouse_code']<>null then //编辑
 begin
  maskedit1.Text := trim(form1.ADOTable1.FieldValues['warehouse_code']);
  if form1.AQ04.FieldValues['seed_flag']=2  then
   begin
    for i:=length(maskedit1.Text) downto 1 do
    if (maskedit1.Text[i]<'0') or (maskedit1.Text[i]>'9') then//找出第几位开始为前缀
     begin                                    //不是数字字符就为前缀
     Maskedit1.editmask := copy(maskedit1.Text,1,i)+copy('99999',1,5-i)+';1; ';
     v_mask :=Maskedit1.editmask;
     for j:=1 to i do
     insert('\',v_mask,2*j-1);      //从奇数位插入
     maskedit1.EditMask := v_mask;
     maskedit1.Text := trim(form1.ADOTable1.FieldValues['warehouse_code']);
     break;
     end;
    end
   else
   if form1.AQ04.FieldValues['seed_flag']=4 then
    begin
     maskedit1.Enabled :=false;
     dbedit2.SetFocus;
    end
   else
    begin
     maskedit1.SetFocus;
     maskedit1.SelectAll;
    end;
 end
else                                                   //新增状态
 if form1.AQ04.FieldValues['seed_flag']<>1 then
  begin
   maskedit1.text := trim(form1.AQ04.Fieldbyname('seed_value').AsString);
   if form1.AQ04.FieldValues['seed_flag']=2  then
    begin
    for i:=length(maskedit1.Text) downto 1 do //设置掩码
    if (maskedit1.Text[i]<'0') or (maskedit1.Text[i]>'9') then//找出第几位开始为前缀
    begin                                    //不是数字字符就为前缀
     Maskedit1.editmask := copy(maskedit1.Text,1,i)+copy('99999',1,5-i)+';1; ';
     v_mask :=Maskedit1.editmask;
     for j:=1 to i do
      insert('\',v_mask,2*j-1);      //从奇数位插入
     maskedit1.EditMask := v_mask;
     maskedit1.Text := trim(form1.AQ04.Fieldbyname('seed_value').AsString);
     break;
    end;
    end
   else
   if form1.AQ04.FieldValues['seed_flag']=4 then
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

procedure TForm2.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color = clwindowtext then
  begin
   edit1.Font.Color := clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
 if edit2.Font.Color = clwindowtext then
  begin
   edit2.Font.Color := clblue;
   edit2.SelectAll;
  end;
end;

procedure TForm2.Edit3Click(Sender: TObject);
begin
 if edit3.Font.Color = clwindowtext then
  begin
   edit3.Font.Color := clblue;
   edit3.SelectAll;
  end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (trim(edit1.Text)<>'')  then
 try
  frmemployeesearch:=Tfrmemployeesearch.Create(application);
  frmemployeesearch.Edit1.Text := trim(edit1.Text);
  if comparetext(trim(edit1.Text),frmemployeesearch.ADOQuery1.fieldbyname('empl_code').AsString)=0 then
   begin
    edit1.Font.Color := clwindowtext;
    label13.Caption := frmemployeesearch.ADOQuery1.FieldValues['employee_name'];
    form1.ADOTable1.FieldValues['EMPLOYEE_PTR_1']:=frmemployeesearch.ADOQuery1.FieldValues['rkey'];
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
  form1.ADOTable1.FieldValues['EMPLOYEE_PTR_1']:=null;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
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
 if form1.aq04seed_flag.Value<>1 then //控制码从04中读取
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
 if trim(dbedit26.Text)='' then
  begin
   messagedlg('国外采购订单初始值不能为空!请重新输入',mterror,[mbok],0);
   pagecontrol1.ActivePage:=Tabsheet2;
   dbedit26.SetFocus;
   exit;
  end;

//****************************************************************************
 form1.ADOTable1.Fieldvalues['warehouse_code']:=maskedit1.Text;//给代码赋值
if form1.ADOTable1.State=dsedit then //如果编辑
 begin
  form1.ADOTable1.Post;
  v_close:=1;
  close;
 end
else                                 //如果新增
 begin
 form1.ADOConnection1.BeginTrans;
 try
  form1.ADOTable1.Post;
{ except
  form1.ADOConnection1.RollbackTrans;
  pagecontrol1.ActivePage:=Tabsheet1;
  maskedit1.SetFocus;
  exit;
 end;
}
 if form1.aq04seed_flag.Value<>1 then //代码由控制码控制
  begin
  v_seed := trim(maskedit1.Text);
  v_length := length(v_seed);
  if v_seed>=trim(form1.AQ04.FieldValues['seed_value']) then    //如果代码是从04中取值
  for i := length(v_seed) downto 1 do                       // 更新data0004
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
   v_last := inttostr(10000+strtoint(copy(v_seed,i+1,v_length-i))+1);
   new_seed := copy(v_seed,1,i)+copy(v_last,5-(v_length-i)+1,v_length-i);
   form1.AQ04.Edit;            //使前缀不变后缀加1
   form1.AQ04.FieldValues['seed_value'] := new_seed;
   form1.AQ04.Post;
   break;
   end
  else
  if i=1 then //如果第一位仍然是数字
   begin
   v_last := inttostr(100000+strtoint(v_seed)+1);
   new_seed := copy(v_last,6-v_length+1,v_length);
   form1.AQ04.Edit;
   form1.AQ04.FieldValues['seed_value'] := new_seed;
   form1.AQ04.Post;
   end;
  end;

  form1.ADOConnection1.CommitTrans;
  except
   on E: Exception do
    begin
     form1.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     pagecontrol1.ActivePage:=Tabsheet1;
     maskedit1.SetFocus;
     exit;
    end;
  end;
  Form1.ADOTable1.Close;
  Form1.ADOTable1.Open; //刷新一下
  form1.ADOTable1.Append;
  pagecontrol1.ActivePage:=Tabsheet1;
  form1.adotable1.FieldValues['WAREHOUSE_TYPE'] :=0;
 if form1.AQ04.FieldValues['seed_flag']<>1 then
  begin
   maskedit1.text := trim(form1.AQ04.Fieldbyname('seed_value').AsString);
   dbedit2.SetFocus;
  end
 else
  begin
   maskedit1.Text := '';
   maskedit1.SetFocus;
  end;
  DBCheckBox1.Checked := True;
  edit1.Text := '';
  edit1.Font.Color :=clblue;
  edit2.Text := '';
  edit2.Font.Color :=clblue;
  edit3.Text := '';
  edit3.Font.Color :=clblue;
  label13.Caption := '';
  label14.Caption := '';
  label15.Caption := '';
end;

end;

procedure TForm2.BitBtn4Click(Sender: TObject);
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
    form1.ADOTable1.FieldValues['EMPLOYEE_PTR_2']:=frmemployeesearch.ADOQuery1.FieldValues['rkey'];
    edit3.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  frmemployeesearch.free;
 end;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (trim(edit2.Text)<>'')  then
 try
  frmemployeesearch:=Tfrmemployeesearch.Create(application);
  frmemployeesearch.Edit1.Text := trim(edit2.Text);
  if comparetext(trim(edit2.Text),frmemployeesearch.ADOQuery1.fieldbyname('empl_code').AsString)=0 then
   begin
    edit2.Font.Color := clwindowtext;
    label14.Caption := frmemployeesearch.ADOQuery1.FieldValues['employee_name'];
    form1.ADOTable1.FieldValues['EMPLOYEE_PTR_2']:=frmemployeesearch.ADOQuery1.FieldValues['rkey'];
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
  form1.ADOTable1.FieldValues['EMPLOYEE_PTR_2']:=null;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
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
    form1.ADOTable1.FieldValues['EMPLOYEE_PTR_3']:=frmemployeesearch.ADOQuery1.FieldValues['rkey'];
   end
  else
   edit3.SetFocus;
 finally
  frmemployeesearch.free;
 end;
end;

procedure TForm2.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn5') and (trim(edit3.Text)<>'')  then
 try
  frmemployeesearch:=Tfrmemployeesearch.Create(application);
  frmemployeesearch.Edit1.Text := trim(edit3.Text);
  if comparetext(trim(edit3.Text),frmemployeesearch.ADOQuery1.fieldbyname('empl_code').AsString)=0 then
   begin
    edit3.Font.Color := clwindowtext;
    label15.Caption := frmemployeesearch.ADOQuery1.FieldValues['employee_name'];
    form1.ADOTable1.FieldValues['EMPLOYEE_PTR_3']:=frmemployeesearch.ADOQuery1.FieldValues['rkey'];
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
  form1.ADOTable1.FieldValues['EMPLOYEE_PTR_3']:=null;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then //非正常退出
 form1.adotable1.Cancel;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin

if OpenDialog1.Execute then
 dbimage1.picture.LoadFromFile(OpenDialog1.filename);

end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
if OpenDialog1.Execute then
 dbimage2.picture.LoadFromFile(OpenDialog1.filename);
end;

procedure TForm2.DBEdit13Exit(Sender: TObject);
var
 v_end:string;
begin
if (activecontrol.Name<>'BitBtn2') then
begin
 v_end:=copy(dbedit13.Text,length(trim(dbedit13.Text)),1);
 if (v_end<'0') or (v_end>'9') then
  begin
   application.MessageBox('最后一位必须是一个整数','控制号码',mb_ok);
   dbedit13.SetFocus;
   exit;
  end;
end;  
end;

procedure TForm2.DBEdit26Exit(Sender: TObject);
var
 v_end:string;
begin
if (activecontrol.Name<>'BitBtn2') then
begin
 v_end:=copy(dbedit26.Text,length(trim(dbedit26.Text)),1);
 if (v_end<'0') or (v_end>'9') then
  begin
   application.MessageBox('最后一位必须是一个整数','控制号码',mb_ok);
   dbedit26.SetFocus;
   exit;
  end;
end;
end;

end.
