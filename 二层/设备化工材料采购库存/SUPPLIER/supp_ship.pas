unit supp_ship;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls, Mask;

type
  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    HeaderControl1: THeaderControl;
    Label1: TLabel;
    DBText1: TDBText;
    TreeView1: TTreeView;
    Notebook1: TNotebook;
    Bevel1: TBevel;
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
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    BitBtn4: TBitBtn;
    Bevel2: TBevel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Bevel3: TBevel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit15: TDBEdit;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    Edit3: TEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    Edit4: TEdit;
    Bevel4: TBevel;
    Label25: TLabel;
    Bevel5: TBevel;
    Label26: TLabel;
    Bevel6: TBevel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    BitBtn6: TBitBtn;
    Label33: TLabel;
    Splitter1: TSplitter;
    DBMemo1: TDBMemo;
    procedure BitBtn2Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
   v_close:byte;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses damo, shipmethod, tax_search, country_search;
{$R *.dfm}

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
 v_close:=1;
 dm.ADOQuery2.Cancel;
 close;
end;

procedure TForm3.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
 case node.SelectedIndex of
 0: notebook1.PageIndex:=0;
 1: notebook1.PageIndex:=1;
 2: notebook1.PageIndex:=2;
// 3: notebook1.PageIndex:=3;  //额处资讯被取消12.6
 end;
 headercontrol1.Sections[1].Text:=node.Text;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
 treeview1.FullExpand;
 treeview1.Items[1].Selected:=true;
 dbedit1.SetFocus;
 dbedit11.Field.Alignment:=taleftjustify; 
if dm.ADOQuery2.fieldvalues['country_ptr']<>null then
 with dm.adoquery1 do
  begin           //查找国家或地区 允许为null
  if active=true then active:=false;
   sql.Clear;
   sql.Add('select country_code,country_name from data0250');
   sql.Add('where country_rkey='+dm.ADOQuery2.fieldbyname('country_ptr').AsString);
   active:=true;
   edit1.Text:=FieldValues['country_code'];
   edit1.Font.Color:=clwindowtext;
   label15.Caption:=FieldValues['country_name'];
  end;
 with dm.adoquery1 do   //新增时已为CITY_TAX_PTR字段赋值
  begin                 //查找增值税不允许为 null
  if active=true then active:=false;
   sql.Clear;
   sql.Add('select state_id,state_tax,name from data0189');
   sql.Add('where rkey='+dm.ADOQuery2.fieldbyname('CITY_TAX_PTR').AsString);
   active:=true;
   edit2.Text:=fieldvalues['state_id'];
   edit2.Font.Color:=clwindowtext;
   edit3.Text:=fieldvalues['state_id'];
   label18.Caption:=fieldvalues['name'];
   edit4.Text:=Formatfloat('0.00',fieldvalues['state_tax']);
  end;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
 try
  shipmethod_form:=tshipmethod_form.Create(application);
 if shipmethod_form.ShowModal=mrok then
  begin
   dbedit13.Field.Value:=shipmethod_form.ADOQuery1.Fieldbyname('description').AsString;
   dbedit14.SetFocus;
  end
 else
  dbedit13.SetFocus;
 finally
 shipmethod_form.free;
 end;
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
 try
  tax_form:=ttax_form.Create(application);
  tax_form.Edit1.Text:=edit2.Text;
 if tax_form.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit2.SetFocus;
   end
 else
  if tax_form.ShowModal=mrok then
   begin
    edit2.Text:=tax_form.ADOQuery1.FieldValues['state_id'];
    edit2.Font.Color:=clwindowtext;
    edit3.Text:=tax_form.ADOQuery1.fieldvalues['state_id'];
    label18.Caption:=tax_form.ADOQuery1.fieldvalues['name'];
    edit4.Text:=Formatfloat('0.00',tax_form.ADOQuery1.fieldvalues['state_tax']);
    dm.adoquery2.FieldValues['CITY_TAX_PTR']:=tax_form.ADOQuery1.FieldValues['rkey'];
   end
  else
   edit2.SetFocus;
 finally
  tax_form.free;
 end;
end;

procedure TForm3.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color=clwindowtext then
 begin
  edit2.SelectAll;
  edit2.Font.Color:=clblue;
 end;
end;

procedure TForm3.Edit2Exit(Sender: TObject);
begin
if activecontrol.Name<>'BitBtn5' then
 try
  tax_form := Ttax_form.Create(Application);
  tax_form.Edit1.Text:=edit2.Text;
 if comparetext(TRIM(edit2.text),TRIM(tax_form.ADOQuery1.Fieldbyname('state_id').AsString))=0 then
  begin
   edit2.Font.Color:=clwindowtext;
   edit3.Text:=tax_form.ADOQuery1.fieldvalues['state_id'];
   label18.Caption:=tax_form.ADOQuery1.fieldvalues['name'];
   edit4.Text:=Formatfloat('0.00',tax_form.ADOQuery1.fieldvalues['state_tax']);
   dm.ADOQuery2.FieldValues['CITY_TAX_PTR']:=tax_form.ADOQuery1.FieldValues['rkey'];
  end
 else
  begin
   messagedlg('代表代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label18.Caption:='';
   edit2.SetFocus;
  end;
 finally
  TAX_form.free;
 end;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
 try
  country_form := Tcountry_form.Create(Application);
  country_form.Edit1.Text:=trim(edit1.Text);
 if country_form.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
  else
 IF country_form.showmodal=mrok then
  begin
   edit1.Text:=country_form.ADOQuery1.FieldValues['country_code'];
   edit1.Font.Color:=clwindowtext;
   label15.Caption:=country_form.ADOQuery1.FieldValues['country_name'];
   dm.ADOQuery2.FieldValues['country_ptr']:=country_form.ADOQuery1.FieldValues['country_rkey'];
   dbedit7.SetFocus;
  end
  else
   edit1.SetFocus;
 finally
  country_form.free;
 end;
end;

procedure TForm3.Edit1Click(Sender: TObject);
begin
if edit1.Font.Color=clwindowtext then
 begin
  edit1.SelectAll;
  edit1.Font.Color:=clblue;
 end;
end;

procedure TForm3.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (trim(edit1.Text)<>'') then
 try
  country_form := Tcountry_form.Create(Application);
  country_form.Edit1.Text:=edit1.Text;
 if comparetext(edit1.text,country_form.ADOQuery1.Fieldbyname('country_code').AsString)=0 then
  begin
   edit1.Font.Color:=clwindowtext;
   label15.Caption:=country_form.ADOQuery1.FieldValues['country_name'];
   dm.adoquery2.FieldValues['country_ptr'] := country_form.ADOQuery1.FieldValues['country_rkey'];
  end
 else
  begin
   messagedlg('国家代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label15.Caption := '';
   edit1.SetFocus;
  end;
 finally
  country_form.free;
 end
else
 if (activecontrol.Name<>'BitBtn3') and (trim(edit1.Text)='') then
  begin
   dm.ADOQuery2.FieldValues['country_ptr'] := null;
   label15.Caption := '';
  end;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
if trim(dbedit1.Text)='' then
 begin
  messagedlg('装运地点不能为空!',mtwarning,[mbok],0);
  notebook1.PageIndex := 1;
  dbedit1.SetFocus;
  exit;
 end;
if trim(dbmemo1.Text)='' then
 begin
  messagedlg('供应商对方送货地址不能为空!',mtwarning,[mbok],0);
  notebook1.PageIndex := 1;
  dbmemo1.SetFocus;
  exit;
 end;

 v_close:=1;
 dm.ADOQuery2.Post;
 ModalResult := mrok;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if v_close<>1 then
 dm.ADOQuery2.Cancel;  
end;

end.
