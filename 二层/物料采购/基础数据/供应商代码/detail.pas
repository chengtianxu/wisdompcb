unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Mask, DBCtrls, Buttons, Menus,Db,Adodb;

type
    TMem = record
     fileName:string[255];
     bWhere:boolean;
  end;
  TLog = record
     TRANS_TYPE: integer;
     TRANS_DESCRIPTION: string[255];
     FROM_STRING: string[255];
     TO_STRING: string[255];
  end;
  Tdetail_info = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    HeaderControl1: THeaderControl;
    TreeView1: TTreeView;
    Notebook1: TNotebook;
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
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    DBCheckBox1: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    DBMemo1: TDBMemo;
    DBRadioGroup2: TDBRadioGroup;
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
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Edit3: TEdit;
    DBCheckBox2: TDBCheckBox;
    Bevel1: TBevel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    GroupBox1: TGroupBox;
    Memo3: TMemo;
    Label53: TLabel;
    Memo2: TMemo;
    Label52: TLabel;
    Memo1: TMemo;
    Label51: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label74: TLabel;
    Edit4: TEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBMemo2: TDBMemo;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Bevel8: TBevel;
    GroupBox2: TGroupBox;
    Label67: TLabel;
    Edit5: TEdit;
    BitBtn9: TBitBtn;
    Label75: TLabel;
    Bevel7: TBevel;
    Label70: TLabel;
    Edit6: TEdit;
    Label69: TLabel;
    Label68: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Edit7: TEdit;
    MaskEdit1: TMaskEdit;
    Edit8: TEdit;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Bevel9: TBevel;
    N2: TMenuItem;
    DBCheckBox6: TDBCheckBox;
    DBEdit13: TDBComboBox;
    Label64: TLabel;
    DBEdit40: TDBEdit;
    Label77: TLabel;
    DBEdit52: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label78: TLabel;
    DBEdit53: TDBEdit;
    Label79: TLabel;
    BitBtn12: TBitBtn;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBEdit54: TDBEdit;
    Label80: TLabel;
    Label81: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    dbedtScore: TDBEdit;
    dbedtMen: TDBEdit;
    lbl3: TLabel;
    dbedtEDT_ID: TDBEdit;
    lbl4: TLabel;
    pm2: TPopupMenu;
    NUp: TMenuItem;
    NOpen: TMenuItem;
    lbl5: TLabel;
    btn1: TBitBtn;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure DBEdit50Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key:Word; Shift:TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DBEdit17Exit(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure DBEdit14KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit15KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit16KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit17KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit18KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit48Exit(Sender: TObject);
    procedure DBEdit48KeyPress(Sender: TObject; var Key: Char);
    procedure TreeView1DblClick(Sender: TObject);
    procedure DBRadioGroup2Change(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBCheckBox6Click(Sender: TObject);
    procedure dbedtScoreKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtScoreExit(Sender: TObject);
    procedure lbl4Click(Sender: TObject);
    procedure NUpClick(Sender: TObject);
    procedure NOpenClick(Sender: TObject);
    procedure pm2Popup(Sender: TObject);
  private
    v_close:byte; //是否正常关闭
//    att_status:Byte;//记录附件是否改变
    RKEY23: integer;
    fs:TFileStream;
    note_index:byte; //记录最大节点号
    note_ptr:array [1..2] of integer; //记事本指针
    ship_new:boolean;  //装运地点操作模式(true新建,false编辑)
    FLog :array[0..5] of TLog;
    procedure getnotebook; //获取记事本
    procedure update_04(v_seed: string;ttype:byte); //更新控制码
    procedure openquery(query:Tadoquery;sqlstr:string;para:variant); //打开查询
    procedure save_note; //保存记事本
    procedure getdata; //填写装运,修改用户,国家，货币，总帐信息
    procedure getshipdata; //填写装运子表的国家和增值税信息
    procedure bt_status; //装运信息操作模式，更改按钮状态
    function check_before_save:boolean; //保存前检查
    function ship_before_save:boolean;  //保存装运信息前检查
    { Private declarations }
  public
    is_copy:byte; //状态：1新建2复制3检查
    { Public declarations }
  end;

var
  detail_info: Tdetail_info;
  v_edit:boolean; //数据是否更改
  spec_note_:tstringlist; //供应商特别要求记事本
  note_var:tstringlist; //记事本变量

implementation
uses damo,common,pick_item_single,constvar, main, specical_note,
  Pick_WorkShop, ShellAPI, PubFunc;

{$R *.dfm}

procedure Tdetail_info.openquery(query:Tadoquery;sqlstr:string;para:variant);
begin  //打开查询公共过程
  query.Close;
  query.SQL.Clear;
  query.SQL.Add(sqlstr);
  query.Parameters.ParamByName('p1').Value:=para;
  query.Open;
end;

procedure Tdetail_info.getdata;  //填写装运,修改用户,国家，货币，总帐信息
var sqlstr:string; para:integer;
    node:Ttreenode;
begin
  note_index:=6; //变量赋初始值
  dm.aq24.Open;  //读装运地址
  dm.aq24.First;
  with dm.aq24 do
    while not eof do
    begin
      node:=treeview1.Items.Addchild(treeview1.Items[5],fieldvalues['factory_location']);
      node.SelectedIndex:=note_index;
      note_index:=note_index+1;
      next;
    end;
  treeview1.Items[1].Selected:=true;
  treeview1.FullExpand; //展开树

  sqlstr:='select employee_name from data0005 where rkey=:p1 ';
  para:=dm.aq23user_ptr.Value;
  openquery(dm.aqtmp,sqlstr,para);
  edit8.Text:=dm.aqtmp.fieldbyname('employee_name').AsString; //填入修改用户

  sqlstr:='select country_code,country_name from data0250 where country_rkey=:p1 ';
  para:=dm.aq23COUNTRY_PTR.Value;
  openquery(dm.aqtmp,sqlstr,para);
  edit1.Text:=dm.aqtmp.fieldbyname('country_code').AsString;
  label15.caption:=dm.aqtmp.fieldbyname('country_name').AsString;  //填入国家

  sqlstr:='select curr_code,curr_name from data0001 where rkey=:p1 ';
  para:=dm.aq23CURRENCY_PTR.Value;
  openquery(dm.aqtmp,sqlstr,para);
  edit2.Text:=dm.aqtmp.fieldbyname('curr_code').AsString;
  label16.caption:=dm.aqtmp.fieldbyname('curr_name').AsString;  //填入货币

  sqlstr:='select gl_acc_number,gl_description from data0103 where rkey=:p1 ';
  para:=dm.aq23acc_payable_ptr.Value;
  openquery(dm.aqtmp,sqlstr,para);
  edit3.Text:=dm.aqtmp.Fieldbyname('gl_acc_number').AsString;
  label26.caption:=dm.aqtmp.Fieldbyname('gl_description').AsString;  //填入总账
  
//  dm.aqtmp.Close;
//  dm.aqtmp.SQL.Text := ' select rkey, STATE_ID,STATE_TAX,NAME from data0189';
//  dm.aqtmp.Open;
//  dm.aqtmp.First;
//  DBEdit13.Items.Clear;
//  while not DM.aqtmp.Eof do
//  begin
//    DBEdit13.Items.AddObject(DM.aqtmp.FieldValues['NAME'],Pointer(DM.aqtmp.FieldByName('rkey').AsInteger));
//    DM.aqtmp.Next;
//  end;
end;

procedure Tdetail_info.getshipdata;  //填写装运子表的国家和增值税信息
begin
  with dm.aqtmp do
  begin
    close;
    sql.Clear;
    sql.Add('select country_code,country_name from data0250 where country_rkey=:p1 ');
    parameters.ParamByName('p1').Value:=dm.aq24.fieldbyname('country_ptr').AsInteger;
    open;
    if not isempty then
    begin
      edit4.Text:=FieldValues['country_code'];
      label74.Caption:=FieldValues['country_name'];
    end
    else begin
      edit4.Text:='';
      label74.Caption:='';
    end;
    sql.text:='select state_id,name,state_tax from data0189 where rkey=:p1 ';
    parameters.ParamByName('p1').Value:=dm.aq24.fieldbyname('CITY_TAX_PTR').AsInteger;
    open;
    if not isempty then
    begin
      edit5.Text:=FieldValues['state_id'];
      label75.Caption:=FieldValues['name'];
      edit6.Text:=FieldValues['state_id'];
      edit7.Text:=FieldValues['state_tax'];
    end
    else begin
      edit5.Text:='';
      label75.Caption:='';
      edit6.Text:='';
      edit7.Text:='';
    end;
  end;
end;

procedure Tdetail_info.getnotebook;  //获取记事本
var i:word;
begin
//  note_ptr[1]:=dm.ads23po_note_pad_ptr.Value;

  note_ptr[1]:=dm.ads23debmem_note_pad_ptr.Value;
  note_ptr[2]:=dm.ads23rfq_note_pad_ptr.Value;
//  note_ptr[4]:=dm.ads23common_pad_ptr.Value;

  for i:=1 to 2 do //以下填入复制或者编辑的记事本信息
    with dm.aqtmp do
    begin
      Close;
      sql.Clear;
      SQL.Add('select memo_text from data0011 where rkey=:p1 ');
      Parameters.ParamByName('p1').Value:=note_ptr[i];
      Open;
      case i of
        1:Memo2.Text:=fieldvalues['memo_text'];
        2:Memo3.Text:=fieldvalues['memo_text'];
//        3:Memo3.Text:=fieldvalues['memo_text'];
//        4:spec_note_.Text:=fieldvalues['memo_text'];
      end;
    end;
    Memo1.Text := dm.ads23Remark.AsString;
    spec_note_.Text := dm.ads23RemarkSpec.AsString;
//20150708添加其它信息状态-------
   if dm.ads23edi_out_new_po.Value=1 then GroupBox3.Enabled:=True else GroupBox3.Enabled:=False;
   if (dm.ads23EDI_FLAG_FOR_PO.Value=0) and (GroupBox3.Enabled) then RadioButton1.Checked:=True else RadioButton1.Checked:=False;
   if (dm.ads23EDI_FLAG_FOR_PO.Value=1)  and (GroupBox3.Enabled) then RadioButton2.Checked:=True else RadioButton2.Checked:=False;
end;

procedure Tdetail_info.update_04(v_seed: string;ttype:byte);
var  //ttype为0代表更新04表控制码，1代表从04获取控制掩码
  i,v_length:integer;
  v_last,new_seed:string;
begin
  v_length := length(v_seed);
  for i := v_length downto 1 do
  begin
    if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
      if ttype=0 then
      begin
      v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
      new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
      dm.aq04.Edit; //使前缀不变后缀加1
      dm.aq04SEED_VALUE.Value := new_seed;
      dm.aq04.Post;
      exit;
      end
      else begin//ttype=1从04里取员工代码设置掩码
        maskedit1.editmask:=copy(v_seed,1,i)+'!'+copy('999999999',i+1,v_length-i)+';1;_';
        maskedit1.Text:=copy(v_seed,1,i)+copy(v_seed,i+1,v_length-i);
        exit;
      end;

    if (i=1) and (ttype=0) then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.aq04.Edit;
     dm.aq04SEED_VALUE.Value := new_seed;
     dm.aq04.Post;
    end;
  end;
end;

function Tdetail_info.check_before_save:boolean;  //保存前检查
begin
  result:=true;
  if (trim(maskedit1.Text)='') then
  begin
    messagedlg('供应商代码不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    maskedit1.SetFocus;
    exit;
  end; //-------------
  if not (maskedit1.Text[length(maskedit1.Text)] in ['0'..'9']) then
  begin
    messagedlg('供应商代码最后一位必须为数字！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    maskedit1.SetFocus;
    exit;
  end; //-------------
  if (trim(dbedit3.Text)='') then
  begin
    messagedlg('供应商名称不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    dbedit3.SetFocus;
    exit;
  end; //-------------
  if (trim(dbedit4.Text)='') then
  begin
    messagedlg('名称缩写不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    dbedit4.SetFocus;
    exit;
  end; //-------------
  if trim(edit2.Text)='' then
  begin
    messagedlg('货币不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    edit2.SetFocus;
    exit;
  end; //-------------
  if dm.aq24.IsEmpty then
  begin
    messagedlg('至少需要一个装运地址！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=5;
    treeview1.Items[5].Selected:=true;
    exit;
  end; //-------------
  if DBRadioGroup2.Value='1' then
  begin
    if Trim(DBEdit40.Text)='' then
    begin
      messagedlg('供应商无效说明不能为空！',mtconfirmation,[mbok],0);
      result:=false;
      notebook1.PageIndex:=1;
      DBEdit40.SetFocus;
      exit;
    end;
  end;
//20150709检查是否重名----------
  if dm.aq23.State=dsinsert then
  begin
    dm.aqtmp.Close;
    dm.aqtmp.SQL.Clear;
    dm.aqtmp.SQL.Text:='select top 1 SUPPLIER_NAME from data0023 where SUPPLIER_NAME='''+Trim(DBEdit3.Text)+'''';
    dm.aqtmp.Open;
    if not dm.aqtmp.IsEmpty then
    begin
      ShowMessage('供应商名称重复，请修改！');
      Abort;
    end;
    dm.aqtmp.Close;
    dm.aqtmp.SQL.Clear;
    dm.aqtmp.SQL.Text:='select top 1 ABBR_NAME from data0023 where ABBR_NAME='''+Trim(DBEdit4.Text)+'''';
    dm.aqtmp.Open;
    if not dm.aqtmp.IsEmpty then
    begin
      ShowMessage('供应商简称重复，请修改！');
      Abort;
    end;
  end;
end;

function Tdetail_info.ship_before_save; //保存装运信息前检查
begin
  result:=true;
  if trim(dbedit41.Text)='' then
  begin
    messagedlg('装运地点不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    dbedit41.SetFocus;
    exit;
  end;
  if trim(edit5.Text)='' then
  begin
    messagedlg('对应的增值税不允许为空！',mtconfirmation,[mbok],0);
    result:=false;
    edit5.SetFocus;
    exit;
  end;
  if trim(dbedit48.Text)='' then
  begin
    messagedlg('装运提前天数不允许为空！',mtconfirmation,[mbok],0);
    result:=false;
    dbedit48.SetFocus;
    exit;
  end;
end;

procedure Tdetail_info.save_note;  //保存记事本
var i:byte;
begin
  for i:=1 to 2 do
  begin
   case i of
//    1:note_var.Text:=trim(memo1.Text);
    1:note_var.Text:=trim(memo2.Text);
    2:note_var.Text:=trim(memo3.Text);
//    4:note_var.Text:=spec_note_.Text;
   end;
   with dm.aqtmp do
   if trim(note_var.Text)='' then
   begin
    close;
    sql.Clear;
    sql.Add('delete data0011 where rkey=:h1 ');
    parameters.ParamByName('h1').Value:=note_ptr[i];
    execsql;
    note_ptr[i]:=0;
   end
   else begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0011 where rkey=:h1 ');
    parameters.ParamByName('h1').Value:=note_ptr[i];
    open;
    if not isempty then
    begin
     //close;
     //sql.Clear;
     sql.text:='update data0011 set memo_text=:p1 where rkey=:h1 ';
     parameters.ParamByName('h1').Value:=note_ptr[i];
     parameters.ParamByName('p1').Value:=note_var.Text;
     execsql;
    end
    else begin
     //close;
     //sql.Clear;
     sql.text:='insert into data0011(source_type,file_pointer,memo_text) values(:p1,1,:p2) ';
     if i<3 then
       parameters.ParamByName('p1').Value:=inttostr(i)+'023'
     else parameters.ParamByName('p1').Value:=inttostr(i+1)+'023';
     parameters.ParamByName('p2').Value:=note_var.Text;
     execsql;
     sql.Text:='select max(rkey) from data0011 ';  //获取新增记事本的rkey值
     open;
     note_ptr[i]:=fields[0].AsInteger;
    end;
   end;
  end;

end;

procedure Tdetail_info.bt_status; //装运信息操作模式，更改按钮状态
begin
  treeview1.Enabled:=not treeview1.Enabled;
  bitbtn1.Enabled:=not bitbtn1.Enabled;
  bitbtn2.Enabled:=not bitbtn2.Enabled;
  bitbtn3.Enabled:=not bitbtn3.Enabled;
  dbedit41.Enabled:=not dbedit41.Enabled;
  dbedit42.Enabled:=not dbedit42.Enabled;
  dbedit43.Enabled:=not dbedit43.Enabled;
  dbedit44.Enabled:=not dbedit44.Enabled;
  dbedit45.Enabled:=not dbedit45.Enabled;
  dbedit46.Enabled:=not dbedit46.Enabled;
  dbedit47.Enabled:=not dbedit47.Enabled;
  dbedit48.Enabled:=not dbedit48.Enabled;
  dbedit50.Enabled:=not dbedit50.Enabled;
  dbedit51.Enabled:=not dbedit51.Enabled;
  dbmemo2.Enabled:=not dbmemo2.Enabled;
  edit4.Enabled:=not edit4.Enabled;
  edit5.Enabled:=not edit5.Enabled;
  dbcheckbox3.Enabled:=not dbcheckbox3.Enabled;
  dbcheckbox4.Enabled:=not dbcheckbox4.Enabled;
  dbcheckbox5.Enabled:=not dbcheckbox5.Enabled;
  bitbtn7.Enabled:=not bitbtn7.Enabled;
  bitbtn8.Enabled:=not bitbtn8.Enabled;
  bitbtn9.Enabled:=not bitbtn9.Enabled;
  bitbtn10.Enabled:=not bitbtn10.Enabled;
  bitbtn11.Enabled:=not bitbtn11.Enabled;
end;


procedure Tdetail_info.TreeView1Change(Sender: TObject; Node: TTreeNode);
var i:byte;
begin
  case node.SelectedIndex of //打开相对应的页
    0..4:notebook1.PageIndex:=node.SelectedIndex;
    5:notebook1.PageIndex:=0;
    else notebook1.PageIndex:=5;
  end;
  headercontrol1.Sections[1].Text:=node.Text;
  //如果点击为装运地点则定位到记录并找到相应国家和增值税信息。
  if node.SelectedIndex>5 then
  begin
    dm.aq24.First;
    for i:=1 to node.SelectedIndex-6 do
      dm.aq24.Next; //翻到对应的装运记录
    getshipdata;  //填写装运子表的国家和增值税信息
  end;
end;

procedure Tdetail_info.TreeView1MouseDown(Sender:TObject;Button:TMouseButton; Shift: TShiftState; X, Y: Integer);
begin  //点击treeview时控制装运菜单是否可用
  treeview1.PopupMenu:=nil;
  if button=mbright then
    if treeview1.Selected.SelectedIndex=5 then
    begin
      n1.Enabled:=true;
      n2.Enabled:=false;
      n3.Enabled:=false;
      treeview1.PopupMenu:=PM1;
    end
    else if treeview1.Selected.SelectedIndex>5  then
    begin
      n1.Enabled:=false;
      n2.Enabled:=true;
      n3.Enabled:=true;
      treeview1.PopupMenu:=PM1;
    end
    else treeview1.PopupMenu:=nil;
end;

procedure Tdetail_info.TreeView1DblClick(Sender: TObject);
begin  //双击装运地点可以编辑
  if (treeview1.Selected.SelectedIndex>5) and (dm.aq24.LockType<>ltreadonly) then
    n2click(sender);
end;

procedure Tdetail_info.BitBtn4Click(Sender: TObject);
var inputvar:Pdlginput;
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
 try
  case Tbitbtn(sender).Tag of
  1,4: //国家(1为供应商国家，4为装运地点国家)
    begin
      inputvar.Fields:='country_code/国家代码/130,country_name/国家名称/240';
      inputvar.Sqlstr:='select country_rkey,country_code,country_name from data0250 order by country_code ';
      inputvar.KeyField:='country_code';
      if Tbitbtn(sender).Tag=1 then
        inputvar.InPut_value:=edit1.Text
      else inputvar.InPut_value:=edit4.Text;
    end;
  2: //货币
    begin
      inputvar.Fields:='curr_code/货币代码/130,curr_name/货币名称/240';
      inputvar.Sqlstr:='select rkey,curr_code,curr_name from data0001 order by curr_code ';
      inputvar.KeyField:='curr_code';
      inputvar.InPut_value:=edit2.Text;
    end;
  3: //总账
    begin
      inputvar.Fields:='gl_acc_number/总帐号码/70,description_2/总帐帐目名称/200,db_cr/类型/40,curr_tp/外币核算/60';
      inputvar.Sqlstr:='SELECT Data0103.RKEY, Data0103.GL_ACC_NUMBER,Data0103.gl_description, '+
        'CASE data0103.db_cr WHEN ''D'' THEN ''借方'' WHEN ''C'' THEN ''贷方'' END AS db_cr,'+
        'case data0103.curr_tp when 0 then ''不核算'' when 1 then ''核算'' when 2 then ''核算单一'' end  as curr_tp,'+
        'case when data0103_2.GL_DESCRIPTION is not null '+
        'then data0103_2.GL_DESCRIPTION+''-''+data0103_1.GL_DESCRIPTION+''-''+data0103.GL_DESCRIPTION '+
        'else case when data0103_1.GL_DESCRIPTION is not null then data0103_1.GL_DESCRIPTION+''-''+data0103.GL_DESCRIPTION '+
        'else data0103.GL_DESCRIPTION end end as description_2 '+
        'FROM Data0103 Data0103_2 RIGHT OUTER JOIN Data0103 Data0103_1 ON Data0103_2.RKEY = Data0103_1.PARENT_PTR '+
        'RIGHT OUTER JOIN Data0103 ON Data0103_1.RKEY = Data0103.PARENT_PTR '+
        'where (dbo.Data0103.HAS_CHILD = 0) order by Data0103.gl_acc_number ';
      inputvar.KeyField:='gl_acc_number';
      inputvar.InPut_value:=edit3.Text;
    end;
  5: //装运方法(可以为空)
    begin
      inputvar.Fields:='code/装运代码/130,description/装运方法/240';
      inputvar.Sqlstr:='select rkey,code,description from data0370 order by code ';
      inputvar.KeyField:='description';
      inputvar.InPut_value:=dbedit50.Text;
    end;
  6: //增值税代码(不允许为空)
    begin
      inputvar.Fields:='state_id/增值税代码/130,name/增值税名称/240';
      inputvar.Sqlstr:='select rkey,state_id,state_tax,name from data0189 order by state_id ';
      inputvar.KeyField:='state_id';
      inputvar.InPut_value:=edit5.Text;
    end;
  end; //完成case
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if frmpick_item_single.ShowModal=mrok then
  begin
   case Tbitbtn(sender).Tag of
   1:
   begin
     edit1.Text:=frmpick_item_single.adsPick.FieldValues['country_code'];
     label15.Caption:=frmpick_item_single.adsPick.FieldValues['country_name'];
     dm.aq23country_ptr.Value:=frmpick_item_single.adsPick.FieldValues['country_rkey'];
   end;
   2:
   begin
     edit2.Text:=frmpick_item_single.adsPick.FieldValues['curr_code'];
     label16.Caption:=frmpick_item_single.adsPick.FieldValues['curr_name'];
     dm.aq23CURRENCY_PTR.Value:=frmpick_item_single.adsPick.FieldValues['rkey'];
   end;
   3:
   begin
     edit3.Text:=frmpick_item_single.adsPick.FieldValues['gl_acc_number'];
     label26.Caption:=frmpick_item_single.adsPick.FieldValues['gl_description'];
     dm.aq23acc_payable_ptr.Value:=frmpick_item_single.adsPick.FieldValues['rkey'];
   end;
   4:
   begin
     edit4.Text:=frmpick_item_single.adsPick.FieldValues['country_code'];
     label74.Caption:=frmpick_item_single.adsPick.FieldValues['country_name'];
     dm.aq24COUNTRY_PTR.Value:=frmpick_item_single.adsPick.FieldValues['country_rkey'];
   end;
   5:dm.aq24SHIPPING_METHOD.Value:=frmpick_item_single.adsPick.FieldValues['description'];
   6:
   begin
     edit5.Text:=frmpick_item_single.adsPick.FieldValues['state_id'];
     label75.Caption:=frmpick_item_single.adsPick.FieldValues['name'];
     dm.aq24CITY_TAX_PTR.Value:=frmpick_item_single.adsPick.FieldValues['rkey'];
     edit6.Text:=frmpick_item_single.adsPick.FieldValues['state_id'];
     edit7.Text:=frmpick_item_single.adsPick.FieldValues['state_tax'];
   end;
   end;  //完成case;
  end;
 finally
   frmpick_item_single.adsPick.Close;
   frmpick_item_single.Free;
 end;
end;

procedure Tdetail_info.Edit1Exit(Sender: TObject);
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
      label15.Caption:=dm.aqtmp.fieldbyname('country_name').AsString;
      dm.aq23COUNTRY_PTR.Value:=dm.aqtmp.FieldValues['country_rkey'];
    end;
  end
  else begin
    label15.Caption:='';
    dm.aq23.fieldvalues['COUNTRY_PTR']:=null;
  end;
end;
procedure Tdetail_info.Edit2Exit(Sender: TObject);
var sqlstr,para:string;
begin
  if trim(edit2.Text)<>'' then
  begin
    sqlstr:='select rkey,curr_name from data0001 where curr_code=:p1 ';
    para:=trim(edit2.Text);
    openquery(dm.aqtmp,sqlstr,para);
    if dm.aqtmp.isempty then
    begin
      messagedlg('找不到您输入的货币代码，请重新输入或按钮选择!',mtconfirmation,[mbok],0);
      edit2.Text:='';
      edit2.SetFocus;
    end
    else begin
      label16.Caption:=dm.aqtmp.fieldbyname('curr_name').AsString;
      dm.aq23CURRENCY_PTR.Value:=dm.aqtmp.FieldValues['rkey'];
    end;
  end
  else label16.Caption:='';  //货币指针不允许为空
end;

procedure Tdetail_info.Edit3Exit(Sender: TObject);
var sqlstr,para:string;
begin
  if trim(edit3.Text)<>'' then
  begin
    sqlstr:='select rkey,gl_description from data0103 where gl_acc_number=:p1 ';
    para:=trim(edit3.Text);
    openquery(dm.aqtmp,sqlstr,para);
    if dm.aqtmp.isempty then
    begin
      messagedlg('找不到您输入的总帐帐目，请重新输入或按钮选择!',mtconfirmation,[mbok],0);
      edit3.Text:='';
      edit3.SetFocus;
    end
    else begin
      label26.Caption:=dm.aqtmp.fieldbyname('gl_description').AsString;
      dm.aq23acc_payable_ptr.Value:=dm.aqtmp.fieldvalues['rkey'];
    end;
  end
  else begin
    label26.Caption:='';
    dm.aq23.fieldvalues['acc_payable_ptr']:=null;
  end;
end;

procedure Tdetail_info.Edit4Exit(Sender: TObject);
var sqlstr,para:string;
begin
  if trim(edit4.Text)<>'' then
  begin
    sqlstr:='select country_rkey,country_name from data0250 where country_code=:p1 ';
    para:=trim(edit4.Text);
    openquery(dm.aqtmp,sqlstr,para);
    if dm.aqtmp.isempty then
    begin
      messagedlg('找不到您输入的国家代码，请重新输入或按钮选择!',mtconfirmation,[mbok],0);
      edit4.Text:=''; 
      edit4.SetFocus;
    end
    else begin
      label74.Caption:=dm.aqtmp.fieldbyname('country_name').AsString;
      dm.aq24COUNTRY_PTR.Value:=dm.aqtmp.FieldValues['country_rkey'];
    end;
  end
  else begin
    label74.Caption:='';
    dm.aq24.fieldvalues['country_ptr']:=null;
  end;
end;

procedure Tdetail_info.DBEdit50Exit(Sender: TObject);
var sqlstr,para:string;
begin
  if trim(dbedit50.Text)<>'' then
  begin
    sqlstr:='select description from data0370 where description=:p1 ';
    para:=trim(dbedit50.Text);
    openquery(dm.aqtmp,sqlstr,para);
    if dm.aqtmp.isempty then
    begin
      messagedlg('找不到您输入的装运方法，请重新输入或按钮选择!',mtconfirmation,[mbok],0);
      dm.aq24SHIPPING_METHOD.Value:='';
      dbedit50.SetFocus;
    end;
  end;
end;

procedure Tdetail_info.Edit5Exit(Sender: TObject);
var sqlstr,para:string;
begin
  if trim(edit5.Text)<>'' then
  begin
    sqlstr:='select rkey,state_id,state_tax,name from data0189 where state_id=:p1 ';
    para:=trim(edit5.Text);
    openquery(dm.aqtmp,sqlstr,para);
    if dm.aqtmp.isempty then
    begin
      messagedlg('找不到您输入的增值税类型，请重新输入或按钮选择!',mtconfirmation,[mbok],0);
      edit5.Text:=''; 
      edit5.SetFocus;
    end
    else begin
      label75.Caption:=dm.aqtmp.fieldbyname('name').AsString;
      edit6.Text:=dm.aqtmp.fieldbyname('state_id').AsString;
      edit7.Text:=dm.aqtmp.fieldbyname('state_tax').AsString;
      dm.aq24CITY_TAX_PTR.Value:=dm.aqtmp.FieldValues['rkey'];
    end;
  end
  else begin
    label75.Caption:='';
    edit6.Text:='';
    edit7.Text:='';
  end;  //增值税指针不允许为空
end;

procedure Tdetail_info.FormCreate(Sender: TObject);
begin
  spec_note_:=Tstringlist.Create;
  note_var:=Tstringlist.Create;
  keypreview:=true;  
end;

procedure Tdetail_info.FormCloseQuery(Sender:TObject;var CanClose:Boolean);
begin
  if v_close<>1 then
  begin
    dm.aq23.Cancel;
    if dm.aq24.LockType<>ltreadonly then
      dm.aq24.CancelBatch();
  end;
  mainform.Show;
end;

procedure Tdetail_info.FormDestroy(Sender: TObject);
begin
  spec_note_.Free;
  note_var.Free;
  if Assigned(fs) then fs.Free;
end;

procedure Tdetail_info.FormKeyDown(Sender:TObject; var Key:Word;Shift:TShiftState);
begin
  if not ((ActiveControl is Tmemo) or (ActiveControl is TDBmemo))  then
    if key=vk_return then perform(WM_NEXTDLGCTL,0,0); //按回车光标自动下移
end;

procedure Tdetail_info.FormShow(Sender: TObject);
begin
  v_edit:=false; //判断是否修改过数据的变量
//  att_status:= 0;
  getdata; //读取装运、国家、货币、总帐
  if dm.aq23.State=dsinsert then   //插入状态
  begin
    with dm.aq04 do
    begin
      open;
      if dm.aq04.fieldbyname('seed_flag').AsInteger<>1 then  //从04中读取控制码
      begin
        maskedit1.text := trim(Fieldvalues['seed_value']);
        if FieldValues['seed_flag']=2  then self.update_04(trim(maskedit1.text),1); //如果固定字首则设置掩码
        if FieldValues['seed_flag']=4 then maskedit1.Enabled := false
       end
      else begin maskedit1.Text := '';  end;  //seed_flag=1完全手工输入编号
      dm.aq04.Close;
    end;
    if is_copy=1 then getnotebook;  //如果为复制则从原客户中提取记事本信息，
  end
  else
   begin //编辑状态
    maskedit1.Text:=dm.aq23code.Value;
    getnotebook; //获取记事本信息
////20150708添加其它信息状态-------
//     if dm.aq23edi_out_new_po.Value=1 then GroupBox3.Enabled:=True else GroupBox3.Enabled:=False;
//     if (dm.aq23EDI_FLAG_FOR_PO.Value=0) and (GroupBox3.Enabled) then RadioButton1.Checked:=True else RadioButton1.Checked:=False;
//     if (dm.aq23EDI_FLAG_FOR_PO.Value=1)  and (GroupBox3.Enabled) then RadioButton2.Checked:=True else RadioButton2.Checked:=False;
   end;
  if is_copy = 3 then  //编辑
  begin
    RKEY23:= dm.aq23.FieldByName('RKEY').AsInteger;
    FLog[0].TRANS_TYPE:= 100;
    FLog[0].TRANS_DESCRIPTION:= '更改供应商代码';
    FLog[0].FROM_STRING:= dm.aq23.FieldByName('CODE').AsString;
    FLog[1].TRANS_TYPE:= 101;
    FLog[1].TRANS_DESCRIPTION:= '更改供应商名称';
    FLog[1].FROM_STRING:= dm.aq23.FieldByName('SUPPLIER_NAME').AsString;
    FLog[2].TRANS_TYPE:= 102;
    FLog[2].TRANS_DESCRIPTION:= '更改供应商简称';
    FLog[2].FROM_STRING:= dm.aq23.FieldByName('ABBR_NAME').AsString;
    FLog[3].TRANS_TYPE:= 103;
    FLog[3].TRANS_DESCRIPTION:= '更改状态';
    FLog[3].FROM_STRING:= dm.aq23.FieldByName('status').AsString;
    FLog[4].TRANS_TYPE:= 104;
    FLog[4].TRANS_DESCRIPTION:= '更改暂缓付款';
    FLog[4].FROM_STRING:= dm.aq23.FieldByName('PUT_ALL_INV_HOLD').AsString;
    FLog[5].TRANS_TYPE:= 105;
    FLog[5].TRANS_DESCRIPTION:= '是否VMI采购';
    FLog[5].FROM_STRING:= dm.aq23.FieldByName('EDI_OUT_NEW_PO').AsString;
  end;
  if strtoint(vprev)<=2 then  //right如果无银码权限，不允许查看财务信息
    treeview1.Items[2].SelectedIndex:=0;
end;

procedure Tdetail_info.BitBtn1Click(Sender: TObject);  //保存
var
  j:Integer;
begin
  if check_before_save then
  begin
    dm.aq23CODE.Value:=maskedit1.Text;
    dm.aq23update_date.Value:=getsystem_date(dm.aqtmp,0);
    dm.aq23user_ptr.Value:=strtoint(user_ptr);
    dm.aq23Remark.Value := Memo1.Text;
    dm.aq23RemarkSpec.Value := spec_note_.Text;
    if not dm.ADOConnection1.InTransaction then dm.ADOConnection1.BeginTrans;
    if dm.aq23.State=dsinsert then
    begin
      dm.aq04.Open;
      if dm.aq04.FieldValues['seed_flag']<>1 then
        self.update_04(trim(dm.aq04seed_value.Value),0);
      dm.aq04.Close;
    end;   //以上把新的代应商代码写入控制数据

    save_note; //保存记事本
//    dm.aq23po_note_pad_ptr.Value:=note_ptr[1];
    dm.aq23debmem_note_pad_ptr.Value:=note_ptr[1];
    dm.aq23rfq_note_pad_ptr.Value:=note_ptr[2];
//    dm.aq23common_pad_ptr.Value:=note_ptr[4];

//20150708修改-----
    if (GroupBox3.Enabled) then
    begin
      if RadioButton1.Checked then dm.aq23EDI_FLAG_FOR_PO.Value:=0;
      if RadioButton2.Checked then dm.aq23EDI_FLAG_FOR_PO.Value:=1;
    end else dm.aq23EDI_FLAG_FOR_PO.Value:=0;
    try
      dm.aq23.Post;
    except
      on E: Exception do
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
       treeview1.Items[1].Selected:=true;
       notebook1.PageIndex:=1;
       maskedit1.SetFocus;
       exit;
      end;
    end;
    if Assigned(fs) then
    begin
      with dm.aqtmp do
      begin
        close;
        SQL.Text:= 'Select * from data0023 where rkey=' + dm.aq23rkey.AsString;
        open;
        Edit;
        TBlobField(FieldByName('AttachFile')).LoadFromStream(fs);
        Post;
      end;
    end;
   if is_copy = 3 then  //编辑
   begin

    if not dm.aq23.Active then dm.aq23.Active:= True;
    if dm.aq23.FieldByName('RKEY').AsInteger <> RKEY23 then
     dm.aq23.Locate('RKEY',RKEY23,[]);
    FLog[0].TO_STRING:= dm.aq23.FieldByName('CODE').AsString;
    FLog[1].TO_STRING:= dm.aq23.FieldByName('SUPPLIER_NAME').AsString;
    FLog[2].TO_STRING:= dm.aq23.FieldByName('ABBR_NAME').AsString;
    FLog[3].TO_STRING:= dm.aq23.FieldByName('status').AsString;
    FLog[4].TO_STRING:= dm.aq23.FieldByName('PUT_ALL_INV_HOLD').AsString;
    FLog[5].TO_STRING:= dm.aq23.FieldByName('EDI_OUT_NEW_PO').AsString;
    for j:= 0 to 5 do
    begin
        
      if FLog[j].FROM_STRING<>FLog[j].TO_STRING then
      begin
        with dm.aqtmp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Insert Data0318(supplier_ptr,TRANS_TYPE,TRANS_DESCRIPTION,FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)');
          SQL.Add(Format('Values(%d,%d,''%s'',''%s'',''%s'',%s,%s,%d)',
                 [RKEY23,FLog[j].TRANS_TYPE,FLog[j].TRANS_DESCRIPTION,FLog[j].FROM_STRING,FLog[j].TO_STRING,rkey73,'Getdate()',23]));
          //Showmessage(SQL.Text);
          ExecSQL;
        end;
      end;
    end;
   end;
    dm.aq24.First;
    while not dm.aq24.Eof do
    begin
      dm.aq24.Edit;
      dm.aq24SUPPLIER_PTR.Value:=dm.aq23RKEY.Value;
      dm.aq24.Next;
    end;
    try
      dm.aq24.UpdateBatch();
      dm.ADOConnection1.CommitTrans;
      v_close:=1; //正常退出
      self.ModalResult:=mrok;
    except
      dm.ADOConnection1.RollbackTrans;
      showmessage('装运地点保存失败，可能装运地点已被使用不能删除!');
    end;
  end;
end;

procedure Tdetail_info.BitBtn2Click(Sender: TObject);  //供应商特别说明
begin
  try
    spec_note:=Tspec_note.Create(application);
    if is_copy=2 then  //检查模式
    begin
      spec_note.Button1.Enabled:=false;
      spec_note.Memo1.Enabled:=false;
    end;
    spec_note.Caption:='供应商特别说明：'+dbedit3.Text;
    spec_note.Memo1.Lines.Assign(spec_note_);
    if spec_note.ShowModal=mrok then
    begin
      spec_note_.Text:=spec_note.Memo1.Text;
      v_edit:=true;
    end;
  finally
    spec_note.Free;
  end;
end;

procedure Tdetail_info.BitBtn3Click(Sender: TObject); //退出
begin
  if dm.aq23.State=dsinsert then begin dm.aq23.Cancel;v_close:=1; end
  else if (bitbtn1.Enabled=true) and ((dm.aq23.Modified) or (dm.aq24.Modified) or (v_edit)) then
    if messagedlg('数据已修改，是否保存？',mtconfirmation,[mbyes,mbno],0)=mryes then
      begin bitbtn1click(sender);exit; end
    else begin dm.aq23.Cancel; dm.aq24.Cancel; v_close:=1; end;
  self.ModalResult:=mrcancel;
end;

procedure Tdetail_info.BitBtn10Click(Sender: TObject);  //保存装运地点
var node:Ttreenode;
begin
  if ship_before_save then
  begin
    dm.aq24.Post;
    bt_status;
    v_edit:=true;
    if ship_new then
    begin
      node:=treeview1.Items.AddChild(treeview1.Selected,dm.aq24FACTORY_LOCATION.Value);
      node.SelectedIndex:=note_index;
      note_index:=note_index+1;
      treeview1.Selected:=node;
    end
    else treeview1.Selected.Text:=dbedit41.Text;
  end;
end;

procedure Tdetail_info.BitBtn11Click(Sender: TObject);  //取消保存装运地点
begin
  dm.aq24.Cancel;
  bt_status;
end;

procedure Tdetail_info.N1Click(Sender: TObject);   //新增装运地点
begin
 if treeview1.Selected.SelectedIndex=5 then  //如果当前选中节点为装运地点
   with dm.aq24 do
   begin
     append; // 从供应商主表取信息赋部分默认值
     fieldvalues['country_ptr']:=dm.aq23country_ptr.Value;
     fieldvalues['state']:=dm.aq23state.Value;
     fieldvalues['zip']:=dm.aq23zip.Value;
     fieldvalues['phone']:=dm.aq23phone.Value;
     fieldvalues['fax']:=dm.aq23fax.Value;
     fieldvalues['contact']:=dm.aq23contact_name_1.Value;
     fieldvalues['shipping_lead_time']:=0;
     fieldvalues['state_ship_tax_flag']:='N';
     fieldvalues['STATE_INVT_TAX_FLAG']:='Y';
     fieldvalues['STATE_MISC_TAX_FLAG']:='N';
     getshipdata;
     notebook1.PageIndex:=5;
     bt_status;//控件状态改变
     ship_new:=true;
   end;
end;

procedure Tdetail_info.N2Click(Sender: TObject); //编辑装运地点
begin
  if treeview1.Selected.SelectedIndex>5 then
  begin
    dm.aq24.Edit;
    bt_status;
    ship_new:=false;
  end;
end;

procedure Tdetail_info.N3Click(Sender: TObject); //删除装运地点
begin
  if treeview1.Selected.SelectedIndex>5 then  //如果当前选中节点为装运地点
  begin
    dm.aq24.Delete;
    treeview1.Selected.Delete;
    v_edit:=true;
  end;
end;
//----以下为数据输入格式控制
procedure Tdetail_info.DBEdit14Exit(Sender: TObject);
begin
  if dbedit14.Text='' then dbedit14.Text:='0';
end;

procedure Tdetail_info.DBEdit15Exit(Sender: TObject);
begin
  if dbedit15.Text='' then dbedit15.Text:='0';
  dbedit15.Text:=formatfloat('0.00',strtofloat(dbedit15.Text));
end;

procedure Tdetail_info.DBEdit16Exit(Sender: TObject);
begin
  if dbedit16.Text='' then dbedit16.Text:='0';
end;

procedure Tdetail_info.DBEdit17Exit(Sender: TObject);
begin
  if dbedit17.Text='' then dbedit17.Text:='0';
  dbedit17.Text:=formatfloat('0.00',strtofloat(dbedit17.Text));
end;

procedure Tdetail_info.DBEdit18Exit(Sender: TObject);
begin
  if dbedit18.Text='' then dbedit18.Text:='0';
end;

procedure Tdetail_info.DBEdit48Exit(Sender: TObject);
begin
  if dbedit48.Text='' then dbedit48.Text:='0';
end;

procedure Tdetail_info.DBEdit14KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure Tdetail_info.DBEdit15KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then abort;
  if key = chr(46) then      //判断是否重复输入小数点'.'
    if pos('.',dbedit15.Text)>0 then abort;
end;

procedure Tdetail_info.DBEdit16KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure Tdetail_info.DBEdit17KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then abort;
  if key = chr(46) then      //判断是否重复输入小数点'.'
    if pos('.',dbedit17.Text)>0 then abort;
end;

procedure Tdetail_info.DBEdit18KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure Tdetail_info.DBEdit48KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure Tdetail_info.DBRadioGroup2Change(Sender: TObject);
begin
  if DBRadioGroup2.Value='0' then
    DBEdit40.Enabled:=False
  else
    DBEdit40.Enabled:=True;
end;

procedure Tdetail_info.BitBtn12Click(Sender: TObject);
begin
  with TfrmPick_WorkShop.Create(Application)do
  try

    Enter(0);
    if ShowModal = mrok then
    begin
      cdsPickWorkShop.First;

      while not cdsPickWorkShop.Eof do
      begin
       if cdsPickWorkShop.FieldByName('IsSelected').AsBoolean then
        begin
         dm.aq23ADDRESS1_FOR_FORM.Value:=dm.aq23ADDRESS1_FOR_FORM.Value+
         cdsPickWorkShop.FieldByName('dept_name').AsString;

        end;
        cdsPickWorkShop.next;
      end;
    end;
  finally
    release;
  end;
end;

procedure Tdetail_info.DBCheckBox6Click(Sender: TObject);
begin
  if DBCheckBox6.Checked then
  begin
    RadioButton1.Checked:=True;
    RadioButton2.Checked:=False;
    GroupBox3.Enabled:=True
  end else
  begin
    RadioButton1.Checked:=False;
    RadioButton2.Checked:=False;
    GroupBox3.Enabled:=False;
  end;
end;

procedure Tdetail_info.dbedtScoreKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then abort;
  if key = chr(46) then      //判断是否重复输入小数点'.'
    if pos('.',dbedtScore.Text)>0 then abort;
end;

procedure Tdetail_info.dbedtScoreExit(Sender: TObject);
begin
  if Trim(dbedtScore.Text)='' then dbedtScore.Text:='0';
end;

procedure Tdetail_info.lbl4Click(Sender: TObject);
begin
  pm2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure Tdetail_info.NUpClick(Sender: TObject);
var
  openFile:TOpenDialog;
  fileName: string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起，您只有该程序的只读权限！');
    exit;
  end;
  if dm.aq23.State = dsEdit then
  begin
    with dm.aqtmp do
    begin
      Close;
      SQL.Text:= 'select case when AttachFile IS NULL THEN 0 ELSE 1 END from data0023 where rkey = ' + dm.aq23rkey.AsString;
      Open;
    end;
    if (dm.aqtmp.Fields[0].Value = 1 )
          and (MessageDlg('已经存在附件，是否覆盖？', mtConfirmation, [mbYes,mbNo],0) <> mryes) then
    begin
      exit;
    end;
  end;
  try
    openFile:=TOpenDialog.Create(Application);
    openFile.Filter:='*.pdf|*.pdf';
    if openFile.Execute then
    begin
      fileName:=openFile.FileName;

      fs:= TFileStream.Create(fileName, fmOpenRead);
      if fs.Size > 1024*1024*10 then
      begin
        ShowMessage('文件大于10M，请处理后重新上传！');
        exit;
      end;
      lbl5.Font.Color:= clBlue;
//      TBlobField(dm.aq23AttachFile).LoadFromStream(fs);
//      att_status:= 1;
      ShowMessage('文件已记录但未上传，点保存可上传附件');
    end;
  finally
    openFile.Free;
  end;
end;

procedure Tdetail_info.NOpenClick(Sender: TObject);
var
  ms:TMemoryStream;
  filePath,fileName:string;
begin
  if (dm.aq23.State = dsInsert) or (lbl5.Caption = '未传附件') then exit;

  filePath:='D:\temp\';
  if Assigned(fs) then fs.Free;
  Screen.Cursor:= crHourGlass;
  ms:=TMemoryStream.Create;
  try
    try
      if not DirectoryExists(filePath) then
        if not CreateDir(filePath) then
          begin
            ShowMessage('创建临时文件夹错误：'+ filePath);
            Exit;
          end;
      with dm.aqtmp do
      begin
        Close;
        SQL.Text:= 'select AttachFile from data0023  where rkey = '+ dm.aq23rkey.AsString;
        Open;
        TBlobfield(dm.aqtmp.Fields[0]).SaveToStream(ms);        //把从数据库里的文件写入文件流
      end;
      fileName:= dm.aq23code.AsString + dm.aq23abbr_name.AsString + '.pdf';
      UnPackStream(ms);
      ms.Position:=0;
      ms.SaveToFile(filePath + fileName);
      ShellExecute(0,'open',pchar(filePath + fileName),nil,nil,SW_SHOWNORMAL);
    except
      on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  finally
    Screen.Cursor:= crDefault;
    ms.Free;
  end;
end;

procedure Tdetail_info.pm2Popup(Sender: TObject);
begin
  NOpen.Enabled:= (lbl5.Caption = '已传附件') ;
end;

end.
