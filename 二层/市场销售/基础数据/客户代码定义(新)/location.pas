unit location;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Grids, ComCtrls, Mask, Buttons,
  Menus, DBCtrlsEh;

type
  Tship_location = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    HeaderControl1: THeaderControl;
    TreeView1: TTreeView;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label39: TLabel;
    DBEdit2: TDBEdit;
    Notebook1: TNotebook;
    Label2: TLabel;
    Bevel1: TBevel;
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
    Label12: TLabel;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBMemo1: TDBMemo;
    DBEdit10: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBDateTimeEh1: TDBDateTimeEditEh;
    Label23: TLabel;
    Bevel2: TBevel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox1: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label33: TLabel;
    Label32: TLabel;
    Label31: TLabel;
    Label42: TLabel;
    BitBtn5: TBitBtn;
    Edit2: TEdit;
    DBEdit17: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit14: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit24: TDBEdit;
    rgrpttype: TDBRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    is_new:byte;
    v_close:byte; //是否正常退出(0非正常退出，1正常退出)
    rep_ptr,rep_name:string;
    function check_before_post:boolean;
  public
    { Public declarations }
  end;

var
  ship_location: Tship_location;

implementation
uses damo,detail,pick_item_single,constvar;

{$R *.dfm}

function Tship_location.check_before_post:boolean;
begin
  result:=true;
  if trim(dbedit3.Text)='' then
  begin
    messagedlg('装运地点不允许为空！',mtconfirmation,[mbok],0);
    result:=false;
    treeview1.Items[1].Selected:=true;
    notebook1.PageIndex:=1;
    dbedit3.SetFocus;
    exit;
  end;
  if trim(dbedit12.Text)='' then
  begin
    messagedlg('装运提前天数不允许为空！',mtconfirmation,[mbok],0);
    result:=false;
    treeview1.Items[1].Selected:=true;
    notebook1.PageIndex:=1;
    dbedit12.SetFocus;
    exit;
  end;
  if trim(edit2.Text)='' then
  begin
    messagedlg('对应的增值税不允许为空！',mtconfirmation,[mbok],0);
    result:=false;
    treeview1.Items[2].Selected:=true;
    notebook1.PageIndex:=2;
    edit2.SetFocus;
    exit;
  end;

end;

procedure Tship_location.FormShow(Sender: TObject);
var sqlstr:string;para:integer;i:word;
begin
  treeview1.FullExpand;


  sqlstr:='select country_code,country_name from data0250 where country_rkey=:p1 ';
  para:=dm.aq12.fieldbyname('country_ptr').AsInteger;
  openquery(dm.aqtmp,sqlstr,para);
  edit1.Text:=dm.aqtmp.fieldbyname('country_code').AsString;
  label12.Caption:=dm.aqtmp.fieldbyname('country_name').AsString; //填入国家代码

  sqlstr:='select state_id,name,state_tax from data0189 where rkey=:p1 ';
  para:=dm.aq12.fieldbyname('ship_ctax_ptr').AsInteger;
  openquery(dm.aqtmp,sqlstr,para);
  edit2.Text:=dm.aqtmp.fieldbyname('state_id').AsString;
  label42.Caption:=dm.aqtmp.fieldbyname('name').AsString;
  edit3.Text:=dm.aqtmp.fieldbyname('state_id').AsString;
  edit4.Text:=dm.aqtmp.fieldbyname('state_tax').AsString;//填入增值税信息


end;

procedure Tship_location.FormCreate(Sender: TObject);
begin
  keypreview:=true;
end;

procedure Tship_location.FormKeyDown(Sender:TObject; var Key:Word;Shift:TShiftState);
begin
  if not (ActiveControl is TDBmemo) then
    if key=vk_return then perform(WM_NEXTDLGCTL,0,0);
end;

procedure Tship_location.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  notebook1.PageIndex:=node.SelectedIndex;
  headercontrol1.Sections[1].Text:=node.Text;
end;

procedure Tship_location.BitBtn1Click(Sender: TObject);

begin
 if check_before_post then
 begin

  dm.aq12.Post;
  v_close:=1;
  self.ModalResult:=mrok;  //手工关闭窗口，
 end;
end;

procedure Tship_location.BitBtn2Click(Sender: TObject);
begin
  dm.aq12.Cancel;
  v_close:=1;
end;

procedure Tship_location.BitBtn3Click(Sender: TObject);
var inputvar:Pdlginput;
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
 try
  case Tbitbtn(sender).Tag of
  1: //国家(可以为空)
    begin
      inputvar.Fields:='country_code/国家代码/130,country_name/国家名称/240';
      inputvar.Sqlstr:='select country_rkey,country_code,country_name from data0250 order by country_code ';
      inputvar.KeyField:='country_code';
      inputvar.InPut_value:=edit1.Text;
    end;
  2: //装运方法(可以为空)
    begin
      inputvar.Fields:='code/装运代码/130,description/装运方法/240';
      inputvar.Sqlstr:='select rkey,code,description from data0370 order by code ';
      inputvar.KeyField:='description';
      inputvar.InPut_value:=dbedit11.Text;
    end;
  3: //销售代表(可以为空)
    begin

    end;
  4: //增值税代码(不允许为空)
    begin
      inputvar.Fields:='state_id/增值税代码/130,name/增值税名称/240';
      inputvar.Sqlstr:='select rkey,state_id,state_tax,name from data0189 order by state_id ';
      inputvar.KeyField:='state_id';
      inputvar.InPut_value:=edit2.Text;
    end;
  end;
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if frmpick_item_single.ShowModal=mrok then
  begin
   case Tbitbtn(sender).Tag of
   1:
   begin
     edit1.Text:=frmpick_item_single.adsPick.FieldValues['country_code'];
     label12.Caption:=frmpick_item_single.adsPick.FieldValues['country_name'];
     dm.aq12COUNTRY_PTR.Value:=frmpick_item_single.adsPick.FieldValues['country_rkey'];
   end;
   2:dm.aq12SHIP_SHIPPING_METHOD.Value:=frmpick_item_single.adsPick.FieldValues['description'];
   3:
   begin

   end;
   4:
   begin
     edit2.Text:=frmpick_item_single.adsPick.FieldValues['state_id'];
     label42.Caption:=frmpick_item_single.adsPick.FieldValues['name'];
     dm.aq12SHIP_CTAX_PTR.Value:=frmpick_item_single.adsPick.FieldValues['rkey'];
     edit3.Text:=frmpick_item_single.adsPick.FieldValues['state_id'];
     edit4.Text:=frmpick_item_single.adsPick.FieldValues['state_tax'];
   end;
   end; //完成case
  end;
 finally
   frmpick_item_single.adsPick.Close;
   frmpick_item_single.Free;
 end;
end;

procedure Tship_location.Edit1Exit(Sender: TObject);
var sqlstr,para:string;
begin
  if trim(edit1.Text)<>'' then
  begin
    sqlstr:='select country_rkey,country_name from data0250 where country_code=:p1 ';
    para:=trim(edit1.Text);
    openquery(dm.aqtmp,sqlstr,para);
    if dm.aqtmp.isempty then
    begin
      messagedlg('找不到您输入的国家代码，请重新输入或按钮选择!',mtconfirmation,[mbok],0);
      edit1.Text:='';
      edit1.SetFocus;
    end
    else begin
      label12.Caption:=dm.aqtmp.fieldbyname('country_name').AsString;
      dm.aq12COUNTRY_PTR.Value:=dm.aqtmp.FieldValues['country_rkey'];
    end;
  end
  else label12.Caption:='';
end;

procedure Tship_location.DBEdit11Exit(Sender: TObject);
var sqlstr,para:string;
begin
  if trim(dbedit11.Text)<>'' then
  begin
    sqlstr:='select description from data0370 where description=:p1 ';
    para:=trim(dbedit11.Text);
    openquery(dm.aqtmp,sqlstr,para);
    if dm.aqtmp.isempty then
    begin
      messagedlg('找不到您输入的装运方法，请重新输入或按钮选择!',mtconfirmation,[mbok],0);
      dbedit11.Text:='';
      dbedit11.SetFocus;
    end;
  end;
end;

procedure Tship_location.Edit2Exit(Sender: TObject);
var sqlstr,para:string;
begin
  if trim(edit2.Text)<>'' then
  begin
    sqlstr:='select rkey,state_id,state_tax,name from data0189 where state_id=:p1 ';
    para:=trim(edit2.Text);
    openquery(dm.aqtmp,sqlstr,para);
    if dm.aqtmp.isempty then
    begin
      messagedlg('找不到您输入的增值税类型，请重新输入或按钮选择!',mtconfirmation,[mbok],0);
      edit2.Text:='';
      edit2.SetFocus;
    end
    else begin
      label42.Caption:=dm.aqtmp.fieldbyname('name').AsString;
      edit3.Text:=dm.aqtmp.fieldbyname('state_id').AsString;
      edit4.Text:=dm.aqtmp.fieldbyname('state_tax').AsString;
      dm.aq12SHIP_CTAX_PTR.Value:=dm.aqtmp.FieldValues['rkey'];
    end;
  end
  else begin
    label42.Caption:='';
    edit3.Text:='';
    edit4.Text:='';
  end;
end;

procedure Tship_location.FormCloseQuery(Sender: TObject;var CanClose: Boolean);
begin
  if v_close<>1 then
    dm.aq12.Cancel;
end;

end.
