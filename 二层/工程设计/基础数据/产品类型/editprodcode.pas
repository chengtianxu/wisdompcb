unit editprodcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, DB, DBTables, ADODB,
  ExtCtrls;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
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
    Label15: TLabel;
    Label16: TLabel;
    DBText1: TDBText;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    BitBtn3: TBitBtn;
    DBEdit14: TDBEdit;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    Label17: TLabel;
    ADOQuery1: TADOQuery;
    ADOQuery1gl_acc_number: TStringField;
    ADOQuery1gl_description: TStringField;
    Label18: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    Label14: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit15: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    Edit2: TEdit;
    Label29: TLabel;
    BitBtn5: TBitBtn;
    Label30: TLabel;
    ADOQuery2: TADOQuery;
    Edit3: TEdit;
    BitBtn6: TBitBtn;
    Label20: TLabel;
    Label31: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label32: TLabel;
    Label33: TLabel;
    DBEdit20: TDBEdit;
    Label34: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label35: TLabel;
    DBEdit21: TDBEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    v_close:byte;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses main,  searchgroup, accountsearch, iesmodel_search, layerpre_search;
{$R *.dfm}

procedure TForm2.BitBtn2Click(Sender: TObject);
var
v_message:integer;
begin
 if form1.adoTable1.State=dsinsert then
  begin
   form1.adoTable1.Cancel;
   v_close:=1; //正常退出
   close;
   form1.Show;
  end
else
begin
if (dbedit12.Text='') or (dbedit13.Text='') then
   form1.adoTable1.Cancel;
if (form1.adoTable1.Modified)  then
 begin
 v_message:=messagedlg('数据已修改,是否存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
  if v_message=7 then
   form1.adoTable1.Cancel     //no取消对当前记录的修改包括新增
  else
   if v_message=6 then     //yes对修改的记录存盘
    BitBtn1Click(Sender)
  else                    //cancel不存盘也不保存
    exit;
 end;
 v_close:=1; //正常退出
 form1.Show;
 close;
end; 
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
try
 form3 := Tform3.Create(Application);
 form3.ADOQuery1.Open;
 if form3.ADOQuery1.IsEmpty then
  messagedlg('请先建立产品组别资料库!',mtinformation,[mbok],0)
 else
 if form3.showmodal=mrok then
  form1.adoTable1.FieldValues['pr_grp_pointer']:=form3.ADOQuery1.FieldValues['rkey'];
finally
  form3.Free;     //释放资源
end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  if dbedit12.Text='' then
  begin
    messagedlg('请输入一个正确的产品代码!',mtinformation,[mbok],0);
    dbedit12.SetFocus;
    exit;
  end;
  if dbedit13.Text='' then
  begin
    messagedlg('请输入一个正确的产品名称!',mtinformation,[mbok],0);
    dbedit13.SetFocus;
    exit;
  end;
  if dbedit14.Field.Value=null then
  begin
    messagedlg('请选择一个正确的产品组类!',mtinformation,[mbok],0);
    bitbtn3.SetFocus;
    exit;
  end;

  if form1.adoTable1.State=dsinsert then
   begin
    form1.adoTable1.Post;
    form1.adotable1.Append;
    form1.adotable1.FieldValues['lead_time']:=0;
    form1.adotable1.FieldValues['opt_lot_size']:=0;
    form1.adotable1.FieldValues['MAX_DAYS_EARLY_BUILD']:=0;
    form1.adotable1.FieldValues['PROD_SEEDVALUE']:='1';
    //form1.adotable1.FieldValues['PROD_INCREMENTBY']:=1;
    Form1.adotable1.FieldValues['REVIEW_DAYS']:=ReviewDays;
    Edit3.Clear;
    Label32.Caption:='';
    dbedit12.SetFocus;
   end
  else
    begin
     if Form1.adotable1.FieldValues['REVIEW_DAYS']=null then
       Form1.adotable1.FieldValues['REVIEW_DAYS']:=ReviewDays;
     form1.adoTable1.Post;
      v_close:=1; //正常退出
     form1.Show;
     close;
    end;
end;

procedure TForm2.DBEdit7Exit(Sender: TObject);
begin
  if (sender as Tdbedit).Text='' then (sender as Tdbedit).Field.Value:=0;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
 v_close:=0;
 adoquery1.Close;
 adoquery1.Parameters[0].Value:=form1.ADOTable1G_L_POINTER.Value;
 adoquery1.Open;
 if  not adoquery1.IsEmpty  then
  begin
   edit1.Text:=self.ADOQuery1gl_acc_number.Value;
   edit1.Font.Color:=clwindowtext;
   label17.Caption:=self.ADOQuery1gl_description.Value;
  end;
  adoquery1.Close;
if  form1.ADOTable1IESMODEL_PTR.Value>0 then
with self.ADOQuery2 do
begin
 close;
 sql.Text:='select ENG_FLOW_NAME,ENG_FLOW_DESC from data0504'+#13+
            'where rkey='+form1.ADOTable1IESMODEL_PTR.AsString;
 open;
 edit2.Text:=fieldbyname('ENG_FLOW_NAME').AsString;
 label30.Caption:=fieldbyname('ENG_FLOW_DESC').AsString;
end;

if  form1.ADOTable1layer_pre.Value>0 then
with self.ADOQuery2 do
begin
 close;
 sql.Text:='select rkey,layers,PRECHAR1,PRECHAR2,sufchar from data0081'+#13+
            'where rkey='+form1.ADOTable1layer_pre.AsString;
 open;
 edit3.Text := fieldbyname('layers').AsString;
 label32.Caption := fieldbyname('sufchar').AsString;
end;

end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then //非正常退出
 begin
  form1.Show;
  form1.adoTable1.Cancel
 end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
try
 form_acct:=tform_acct.Create(application);
 form_acct.Edit1.Text:=trim(edit1.Text);
 if form_acct.ADOQuery1.IsEmpty then
  begin
   showmessage('没有查找到相关数据!');
   edit1.SetFocus;
  end
 else
 if form_acct.ShowModal=mrok then
  begin
   form1.ADOTable1G_L_POINTER.Value:=form_acct.adoquery1rkey.Value;
   edit1.Text:=form_acct.adoquery1gl_acc_number.Value;
   edit1.Font.Color:=clwindowtext;
   label17.Caption:=form_acct.adoquery1gl_description.Value;
   dbedit2.SetFocus;
  end
 else
  edit1.SetFocus;
finally
 form_acct.free;
end;

end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.Font.Color:=clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn4')
    and (trim(edit1.Text)<>'') then
 try
  form_acct := Tform_acct.Create(Application);
  form_acct.Edit1.Text:=trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_acct.ADOQuery1.Fieldbyname('gl_acc_number').AsString))=0 then
  begin
   edit1.Font.Color:=clwindowtext;
   label17.Caption := form_acct.ADOQuery1.FieldValues['gl_description'];
   form1.ADOTable1G_L_POINTER.Value := form_acct.ADOQuery1rkey.Value;
  end
 else
  begin
   messagedlg('帐目编号不正确,请重新输入或选择',mtinformation,[mbok],0);
   label17.Caption:='';
   edit1.SetFocus;
  end;
 finally
  form_acct.free;
 end
else
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn4')
    and (trim(edit1.Text)='') then
 begin
  form1.ADOTable1G_L_POINTER.AsVariant :=null;
  label17.Caption:='';
 end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
try
 form_iesmodel := Tform_iesmodel.Create(Application);
 form_iesmodel.ADOQuery1.Open;
 if form_iesmodel.ADOQuery1.IsEmpty then
  messagedlg('请先建立智能流程模型库!',mtinformation,[mbok],0)
 else
 if form_iesmodel.showmodal=mrok then
 begin
  form1.ADOTable1IESMODEL_PTR.Value:=form_iesmodel.ADOQuery1RKEY.Value;
  edit2.Text:=form_iesmodel.ADOQuery1ENG_FLOW_NAME.Value;
  label30.Caption:=form_iesmodel.ADOQuery1ENG_FLOW_DESC.Value;
 end;
finally
  form_iesmodel.Free;     //释放资源
end;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if trim(edit2.Text)='' then
 begin
  label30.Caption:='';
  form1.ADOTable1IESMODEL_PTR.AsVariant:=null;
 end
else
 if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn5') then
 begin
  with adoquery2 do
  begin
   close;
   sql.Text:='select rkey,ENG_FLOW_NAME,ENG_FLOW_DESC from data0504'+#13+
              'where ENG_FLOW_NAME='''+trim(edit2.Text)+'''';
   open;
   if isempty then
    begin
     messagedlg('智能模型代码输入错误!',mterror,[mbcancel],0);
     edit2.SetFocus;
    end
   else
    begin
     form1.ADOTable1IESMODEL_PTR.Value:=fieldvalues['RKEY'];
     label30.Caption:=fieldbyname('ENG_FLOW_DESC').AsString;
    end;
  end;

 end;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
try
 form_layerpre := Tform_layerpre.Create(Application);
 if form_layerpre.ADOQuery1.IsEmpty then
  messagedlg('请先建立层数代码初始值!',mtinformation,[mbok],0)
 else
 if form_layerpre.showmodal=mrok then
 begin
  form1.ADOTable1layer_pre.Value:=form_layerpre.ADOQuery1RKEY.Value;
  edit3.Text:=form_layerpre.ADOQuery1layers.AsString;
  label32.Caption:=form_layerpre.ADOQuery1sufchar.Value;
 end;
finally
  form_layerpre.Free;     //释放资源
end;
end;

end.
