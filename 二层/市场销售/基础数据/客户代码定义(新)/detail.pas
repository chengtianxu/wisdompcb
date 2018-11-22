unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, ImgList, Mask, DBCtrls,
  DBGrids, ValEdit, Grids, Menus,Math,DB,ADODB, DBCtrlsEh, DBGridEh;

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
  Tcust_detail = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    HeaderControl1: THeaderControl;
    TreeView1: TTreeView;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Notebook1: TNotebook;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    MaskEdit1: TMaskEdit;
    DBMemo1: TDBMemo;
    DBEdit4: TDBEdit;
    DBCheckBox9: TDBCheckBox;
    DBRadioGroup8: TDBRadioGroup;
    DBEdit12: TDBEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
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
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBCheckBox2: TDBCheckBox;
    DBEdit27: TDBEdit;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    ComboBox1: TComboBox;
    DBCheckBox3: TDBCheckBox;
    Edit4: TEdit;
    BitBtn7: TBitBtn;
    Label53: TLabel;
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
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    GroupBox3: TGroupBox;
    Edit8: TEdit;
    Edit7: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    GroupBox4: TGroupBox;
    Label71: TLabel;
    Label73: TLabel;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    Label79: TLabel;
    DBEdit64: TDBEdit;
    Label80: TLabel;
    DBEdit65: TDBEdit;
    Label81: TLabel;
    DBEdit66: TDBEdit;
    Label82: TLabel;
    Label83: TLabel;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    Label84: TLabel;
    DBEdit69: TDBEdit;
    Label85: TLabel;
    Label86: TLabel;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    Label87: TLabel;
    DBEdit72: TDBEdit;
    Label88: TLabel;
    Label89: TLabel;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    Label90: TLabel;
    DBEdit75: TDBEdit;
    Bevel8: TBevel;
    DBEdit76: TDBEdit;
    Label91: TLabel;
    Label92: TLabel;
    DBEdit77: TDBEdit;
    Label93: TLabel;
    DBEdit78: TDBEdit;
    Label94: TLabel;
    Label95: TLabel;
    DBEdit79: TDBEdit;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    DBEdit84: TDBEdit;
    DBEdit85: TDBEdit;
    DBEdit86: TDBEdit;
    DBEdit87: TDBEdit;
    DBCheckBox4: TDBCheckBox;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DBDateTimeEh1: TDBDateTimeEditEh;
    DBDateTimeEh2: TDBDateTimeEditEh;
    DBDateTimeEh3: TDBDateTimeEditEh;
    DBDateTimeEh4: TDBDateTimeEditEh;
    DBDateTimeEh5: TDBDateTimeEditEh;
    DBDateTimeEditEh6: TDBDateTimeEditEh;
    Label51: TLabel;
    Label110: TLabel;
    DBEdit18: TDBEdit;
    DBEdit24: TDBEdit;
    Label111: TLabel;
    Label112: TLabel;
    DBEdit35: TDBEdit;
    DBEdit52: TDBEdit;
    Bevel2: TBevel;
    DBGridEh1: TDBGridEh;
    DBEdit53: TDBEdit;
    DBMemo2: TDBMemo;
    Label113: TLabel;
    Label114: TLabel;
    BtnUpload: TSpeedButton;
    Pop20: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    OpenDialog1: TOpenDialog;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label115: TLabel;
    DBCheckBox5: TDBCheckBox;
    Label116: TLabel;
    DBEdit54: TDBEdit;
    Label117: TLabel;
    DBEdit55: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    SGrid: TStringGrid;
    Label52: TLabel;
    PopupMenu1: TPopupMenu;
    N6: TMenuItem;
    N8: TMenuItem;
    DBCheckBox8: TDBCheckBox;
    Label74: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    DBComboBox2: TDBComboBox;
    Label72: TLabel;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    Label75: TLabel;
    Label118: TLabel;
    DBCheckBox10: TDBCheckBox;
    mmo1: TMemo;
    lbl1: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeView1MouseDown(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEdit26Exit(Sender: TObject);
    procedure DBEdit26KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit29KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit29Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit27Exit(Sender: TObject);
    procedure DBEdit27KeyPress(Sender: TObject; var Key: Char);
    procedure MenuItem1Click(Sender: TObject);
    procedure BtnUploadClick(Sender: TObject);
    procedure Pop20Popup(Sender: TObject);
    procedure DBEdit53Exit(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure DBCheckBox3Click(Sender: TObject);
  private
    { Private declarations }
    note_index:byte;
    v_close:byte; //是否正常退出(0非正常退出，1正常退出)
    RKEY10: integer;
    v_str:string;//信息变动原因
    Fmem :array[0..49] of  TMem;
    FLog :array[0..10] of TLog;

    procedure update_04(v_seed:string;ttype:byte);  //对04表的关联处理
    procedure getnotebook;  //获取记事本，用于编辑和复制状态
    procedure getdata;
    procedure gethistory;
//    procedure save_note;
    procedure check_status;
    function check_before_save:boolean;
  public
    { Public declarations }
    is_copy:byte; //新建0,复制1,检查2,编辑3
  end;

var
  cust_detail: Tcust_detail;
  spec_note_:tstringlist; //客户特别要求记事本
  note_var:tstringlist;
  v_edit:boolean;
const
  TmpFileDir = 'c:\tmp\';

  Procedure openquery(query:Tadoquery;sqlstr:string;para:variant); //带参数打开query

implementation
uses main,damo,common,location,pick_item_single,constvar,specific_note,shellAPI,
  Usms,pubfunc;

{$R *.dfm}

procedure Tcust_detail.update_04(v_seed: string;ttype:byte);
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

procedure Tcust_detail.getnotebook;
var i:word;
begin
  for i:=1 to 5 do //以下填入复制或者编辑的记事本信息
    with dm.aqtmp do
    begin
      Close;
      sql.Clear;
      SQL.Add('select source_type,memo_text from data0011 '+
        'where source_type='+inttostr(i)+'010 and file_pointer=:cust_ptr ');
      Parameters.ParamByName('cust_ptr').Value:=dm.ads10rkey.Value;
      Open;
      case i of
        1:Memo1.Text:=fieldvalues['memo_text'];
        2:Memo2.Text:=fieldvalues['memo_text'];
        3:Memo3.Text:=fieldvalues['memo_text'];
        4:Memo4.Text:=fieldvalues['memo_text'];
        5:Memo5.Text:=fieldvalues['memo_text'];
//        7:Memo6.Text:=fieldvalues['memo_text'];
//        6:spec_note_.Text:=fieldvalues['memo_text'];

      end;
    end;
    Memo6.Text:=dm.aq10Remark.AsString;
    spec_note_.Text:=dm.aq10RemarkSpec.AsString;

end;

procedure Tcust_detail.getdata;
var sqlstr:string;para:integer;
    node:Ttreenode;
begin
  note_index:=9; //变量赋初始值
  dm.aq12.Open;  //读装运地址
  dm.aq12.First;
  with dm.aq12 do
    while not eof do
    begin
      node:=treeview1.Items.Addchild(treeview1.Items[7],fieldvalues['location']);
      node.SelectedIndex:=note_index;
      note_index:=note_index+1;
      next;
    end;
  treeview1.Items[1].Selected:=true;
  treeview1.FullExpand; //展开树

  sqlstr:='select EMPL_CODE,EMPLOYEE_NAME from data0005 where rkey=:p1 ';
  para:=dm.aq10SALES_REP_PTR.Value;
  openquery(dm.aqtmp,sqlstr,para);
  edit1.Text:=dm.aqtmp.fieldbyname('EMPL_CODE').AsString;
  label18.caption:=dm.aqtmp.Fieldbyname('EMPLOYEE_NAME').AsString;  //填入销售代表

  sqlstr:='select country_code,country_name from data0250 where country_rkey=:p1 ';
  para:=dm.aq10COUNTRY_PTR.Value;
  openquery(dm.aqtmp,sqlstr,para);
  edit2.Text:=dm.aqtmp.fieldbyname('country_code').AsString;
  label19.caption:=dm.aqtmp.fieldbyname('country_name').AsString;  //填入国家

  sqlstr:='select curr_code,curr_name from data0001 where rkey=:p1 ';
  para:=dm.aq10CURRENCY_PTR.Value;
  openquery(dm.aqtmp,sqlstr,para);
  edit3.Text:=dm.aqtmp.fieldbyname('curr_code').AsString;
  label20.caption:=dm.aqtmp.fieldbyname('curr_name').AsString;  //填入货币

  sqlstr:='select gl_acc_number,gl_description from data0103 where rkey=:p1 ';
  para:=dm.aq10ACC_REC_PTR.Value;
  openquery(dm.aqtmp,sqlstr,para);
  edit4.Text:=dm.aqtmp.Fieldbyname('gl_acc_number').AsString;
  label46.caption:=dm.aqtmp.Fieldbyname('gl_description').AsString;  //填入总账

  combobox1.ItemIndex:=dm.aq10CREDIT_RATING.Value-1;  //信用等级
end;

procedure Tcust_detail.gethistory;
var sqlstr:string;para:integer;
begin
  sqlstr:='select sales_order,ent_date from data0060 where customer_ptr=:p1 order by ent_date ';
  para:=dm.aq10RKEY.Value;
  openquery(dm.aqtmp,sqlstr,para);
  edit5.Text:=dm.aqtmp.fieldbyname('sales_order').AsString+'  ('+dm.aqtmp.fieldbyname('ent_date').AsString+')';
  dm.aqtmp.Last;
  edit7.Text:=dm.aqtmp.fieldbyname('sales_order').AsString+'  ('+dm.aqtmp.fieldbyname('ent_date').AsString+')';
  //以下查找发票历史信息
  sqlstr:='select invoice_number,invoice_date from data0112 where customer_ptr=:p1 order by invoice_date ';
  para:=dm.aq10RKEY.Value;
  openquery(dm.aqtmp,sqlstr,para);
  edit6.Text:=dm.aqtmp.fieldbyname('invoice_number').AsString+'  ('+dm.aqtmp.fieldbyname('invoice_date').AsString+')';
  dm.aqtmp.Last;
  edit8.Text:=dm.aqtmp.fieldbyname('invoice_number').AsString+'  ('+dm.aqtmp.fieldbyname('invoice_date').AsString+')';
end;
{
procedure Tcust_detail.save_note;
var i:byte;
begin
  for i:=1 to 7 do
  begin
   case i of
    1:note_var.Text:=trim(memo1.Text);
    2:note_var.Text:=trim(memo2.Text);
    3:note_var.Text:=trim(memo3.Text);
    4:note_var.Text:=trim(memo4.Text);
    5:note_var.Text:=trim(memo5.Text);
//    7:note_var.Text:=trim(memo6.Text);
//    6:note_var.Text:=spec_note_.Text;
   end;
   if trim(note_var.Text)='' then
    with dm.aqtmp do
    begin
     close;
     sql.Clear;
     sql.Add('delete data0011 where source_type=:h1 and file_pointer=:h2 ');
     parameters.ParamByName('h1').Value:=inttostr(i)+'010';
     parameters.ParamByName('h2').Value:=dm.aq10RKEY.Value;
     execsql;
    end
   else with dm.aqtmp do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0011 where source_type=:h1 and file_pointer=:h2 ');
    parameters.ParamByName('h1').Value:=inttostr(i)+'010';
    parameters.ParamByName('h2').Value:=dm.aq10RKEY.Value;
    open;
    if not isempty then
    begin
     close;
     sql.Clear;
     sql.Add('update data0011 set memo_text=:p1 where source_type=:h1 and file_pointer=:h2 ');
     parameters.ParamByName('h1').Value:=inttostr(i)+'010';
     parameters.ParamByName('h2').Value:=dm.aq10RKEY.Value;
     parameters.ParamByName('p1').Value:=note_var.Text;
     execsql;
    end
    else begin
     close;
     sql.Clear;
     sql.Add('insert into data0011(source_type,file_pointer,memo_text) values(:p1,:p2,:p3) ');
     parameters.ParamByName('p1').Value:=inttostr(i)+'010';
     parameters.ParamByName('p2').Value:=dm.aq10RKEY.Value;
     parameters.ParamByName('p3').Value:=note_var.Text;
     execsql;
    end;
   end;
  end;
end;  }

function Tcust_detail.check_before_save:boolean;
var
  v_bian:Boolean;
  j:Integer;
begin
  result:=true;
  dm.aq04.Open;
  if (trim(maskedit1.Text)='') then
  begin
    messagedlg('客户代码不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    maskedit1.SetFocus;
    exit;
  end; //-------------

  if dm.aq04seed_flag.Value<>1 then
  if not (maskedit1.Text[length(maskedit1.Text)] in ['0'..'9']) then
  begin
    messagedlg('客户代码最后一位必须为数字！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    maskedit1.SetFocus;
    exit;
  end; //-------------

  if (trim(dbedit3.Text)='') then
  begin
    messagedlg('客户名称不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    dbedit3.SetFocus;
    exit;
  end; //-------------

  if (trim(dbedit5.Text)='') then
  begin
    messagedlg('名称缩写不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    dbedit5.SetFocus;
    exit;
  end; //-------------

  if trim(edit1.Text)='' then
  begin
    messagedlg('销售代表不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    edit1.SetFocus;
    exit;
  end; //-------------

  if trim(edit3.Text)='' then
  begin
    messagedlg('货币不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=1;
    edit3.SetFocus;
    exit;
  end; //-------------

  if trim(dbdatetimeeh1.Text)='' then
  begin
    messagedlg('开始合作日期不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=2;
    dbdatetimeeh1.SetFocus;
    exit;
  end; //-------------

  if trim(dbedit19.Text)='' then
  begin
    messagedlg('员工人数不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=2;
    dbedit19.SetFocus;
    exit;
  end;  //-------------

  if trim(dbedit33.Text)='' then
  begin
    messagedlg('信用限额不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=3;
    dbedit33.SetFocus;
    exit;
  end;  //-------------

  if trim(dbedit34.Text)='' then
  begin
    messagedlg('报价承受能力不能为空！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=3;
    dbedit34.SetFocus;
    exit;
  end; //-------------

  if dm.aq12.IsEmpty then
  begin
    messagedlg('至少需要一个装运地址！',mtconfirmation,[mbok],0);
    result:=false;
    notebook1.PageIndex:=7;
    treeview1.Items[7].Selected:=true;
    exit;
  end; //-------------

  if (DBRadioGroup8.ItemIndex = 3) and (Trim(Memo6.Text) = '') then
  begin
    ShowMessage('当前【一般信息】页面, 客户状态为【停止】' + #13 + #13
    + '请在【计划安排】页面, 一般信息记事本中输入原因');
    result:=false;
    Notebook1.PageIndex := 6;
    TreeView1.Items[6].Selected := True;
    Memo6.SetFocus;
    Exit;
  end;

  if (ComboBox1.Text = '差') and (Trim(Memo6.Text) = '') then
  begin
    ShowMessage('当前【财务信息】页面, 信誉等级为【差】' + #13 + #13
    + '请在【计划安排】页面, 一般信息记事本中输入原因');
    result:=false;
    Notebook1.PageIndex := 6;
    TreeView1.Items[6].Selected := True;
    Memo6.SetFocus;
    Exit;
  end;

  if is_copy = 3 then  //编辑
  begin
    v_bian:=false;
    FLog[0].TO_STRING:= maskedit1.Text;
    FLog[1].TO_STRING:= dm.aq10.FieldByName('CUSTOMER_NAME').AsString;
    FLog[2].TO_STRING:= dm.aq10.FieldByName('ABBR_NAME').AsString;
    FLog[3].TO_STRING:= dm.aq10.FieldByName('FED_TAX_ID_NO').AsString;  //付款方式
    FLog[4].TO_STRING:= IntToStr(combobox1.ItemIndex+1);    //信用等级
    FLog[5].TO_STRING:= dm.aq10.FieldByName('CREDIT_LIMIT').AsString;   //信用限额
    FLog[6].TO_STRING:= dm.aq10.FieldByName('COD_FLAG').AsString;      //更改款到发货标识
    FLog[7].TO_STRING:= dm.aq10.FieldByName('INVOICE_NOTE_PAD_PTR').AsString;   //未付款最多超期
    FLog[8].TO_STRING:= dm.aq10.FieldByName('SALES_DISCOUNT').AsString;    //销售奖金分配
    FLog[9].TO_STRING:= dm.aq10.FieldByName('NET_PAY').AsString;          //月结天数
    FLog[10].TO_STRING:= DBRadioGroup8.Items[DBRadioGroup8.itemindex];    //状态

    for j:= 0 to 10 do
    begin
     if FLog[j].FROM_STRING<>FLog[j].TO_STRING then
      begin
       v_bian:=True;
       Break;
      end;
    end;

    if v_bian then
    begin
     v_str:=InputBox('关键信息变动','必须输入变动原因','');
     if trim(v_str)='' then
     begin
      messagedlg('关键信息变动原因不能为空！',mtconfirmation,[mbok],0);
      result:=false;
     end;
    end;
  end;

end;

procedure Tcust_detail.check_status; //检查模式
begin
  ship_location.BitBtn1.Enabled:=false;

  ship_location.Edit1.Enabled:=false;
  ship_location.Edit2.Enabled:=false;
  ship_location.BitBtn3.Enabled:=false;
  ship_location.BitBtn4.Enabled:=false;
  ship_location.BitBtn5.Enabled:=false;
end;

procedure openquery(query:Tadoquery;sqlstr:string;para:variant);
begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add(sqlstr);
  query.Parameters.ParamByName('p1').Value:=para;
  query.Open;
end;

procedure Tcust_detail.FormShow(Sender: TObject);
var
    i:Integer;
begin
  v_edit:=false; //判断是否修改过数据的变量
  getdata; //读取装运、销售代表、国家、货币、总帐及信用等级
  dbcheckbox8.Enabled:= dbcheckbox3.Checked;
  DBEdit54.Enabled:=strtoint(vprev)=4;
  DBEdit55.Enabled:=strtoint(vprev)=4;
  if dm.aq10.State=dsinsert then   //插入状态
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
      else
       begin maskedit1.Text := '';  end;  //seed_flag=1完全手工输入编号
      dm.aq04.Close;
    end;
    if is_copy=1 then getnotebook;  //如果为复制则从原客户中提取记事本信息，
  end
  else
   begin //编辑状态
    maskedit1.Text:=dm.aq10CUST_CODE.Value;
    mmo1.Text:= dm.aq10RemarkSpec.AsString;
    Memo6.Text:=dm.aq10Remark.AsString;
    gethistory;  //查找销售订单及发票历史信息
//    getnotebook; //获取记事本信息
   end;

  if strtoint(vprev)<=2 then  //right如果无银码权限，不允许查看财务及销售佣金信息
  begin
    label35.Visible:=false;
    label36.Visible:=false;
    dbedit26.Visible:=false;
    groupbox1.Visible:=false;
  end;

  dm.ADO20.Close;
  if (is_copy=2) or (is_copy=3) then  //新建0,复制1,检查2,编辑3
    dm.ADO20.Parameters[0].Value:=dm.ads10.fieldbyname('rkey').AsInteger
  else
    dm.ADO20.Parameters[0].Value:=0;
  dm.ADO20.Open;

  DM.ADO20.First;
  while not DM.ADO20.Eof do
  begin
    Fmem[DM.ADO20.RecNo-1].fileName:=DM.ADO20.Fieldbyname('file_name').AsString ;
    Fmem[DM.ADO20.RecNo-1].bWhere:=true;  //true for exist database ;false for local disc
    DM.ADO20.Next;
  end;
  DM.ADO20.First;

 {   case Self.Tag of
    0:Self.Caption:='新增' ;
    1:Self.Caption:='编辑' ;
  end;}

  SGrid.Cells[0,0]:='工号';
  SGrid.Cells[1,0]:='姓名';
  SGrid.Cells[2,0]:='职位';
  SGrid.Cells[3,0]:='rkey73';
  SGrid.ColWidths[0]:=100;
  SGrid.ColWidths[1]:=100;
  SGrid.ColWidths[2]:=200;
  SGrid.ColWidths[3]:=-1;
  if (is_copy=2) or (is_copy=3) then
  begin
    if dm.ADOConnection1.Connected then
    begin
      DM.ADO248.Close;
      DM.ADO248.Parameters[0].Value:=dm.ads10.fieldbyname('rkey').AsInteger;
      DM.ADO248.Open;            //帐龄短信接收人
      dm.ADO248.First;
       if not dm.ADO248.IsEmpty  then
        begin
          for i:=1 to dm.ADO248.RecordCount do
          begin
              SGrid.Cells[0,i] := dm.ADO248.FieldValues['USER_LOGIN_NAME'];
              SGrid.Cells[1,i] := dm.ADO248.FieldValues['USER_FULL_NAME'];
              if dm.ADO248.FieldValues['position'] = null then
              SGrid.Cells[2,i] := '无'
              else
              SGrid.Cells[2,i] := dm.ADO248.FieldValues['position'];
              SGrid.Cells[3,i] := dm.ADO248.FieldValues['sys_ptr'];
              SGrid.RowCount:=SGrid.RowCount+1;
              dm.ADO248.Next;
          end;
        end;
        dm.ADO248.First;
    end;
  end;
  if is_copy = 3 then  //编辑
  begin
    RKEY10:= dm.aq10.FieldByName('RKEY').AsInteger;
    FLog[0].TRANS_TYPE:= 100;
    FLog[0].TRANS_DESCRIPTION:= '更改客户代码';
    FLog[0].FROM_STRING:= dm.aq10.FieldByName('CUST_CODE').AsString;
    FLog[1].TRANS_TYPE:= 101;
    FLog[1].TRANS_DESCRIPTION:= '更改客户名称(中文)';
    FLog[1].FROM_STRING:= dm.aq10.FieldByName('CUSTOMER_NAME').AsString;
    FLog[2].TRANS_TYPE:= 102;
    FLog[2].TRANS_DESCRIPTION:= '更改客户简称';
    FLog[2].FROM_STRING:= dm.aq10.FieldByName('ABBR_NAME').AsString;
    FLog[3].TRANS_TYPE:= 103;
    FLog[3].TRANS_DESCRIPTION:= '更改付款方式';
    FLog[3].FROM_STRING:= dm.aq10.FieldByName('FED_TAX_ID_NO').AsString;
    FLog[4].TRANS_TYPE:= 104;
    FLog[4].TRANS_DESCRIPTION:= '更改信用等级';
    FLog[4].FROM_STRING:= dm.aq10.FieldByName('CREDIT_RATING').AsString;
    FLog[5].TRANS_TYPE:= 105;
    FLog[5].TRANS_DESCRIPTION:= '更改信用限额';
    FLog[5].FROM_STRING:= dm.aq10.FieldByName('CREDIT_LIMIT').AsString;
    FLog[6].TRANS_TYPE:= 106;
    FLog[6].TRANS_DESCRIPTION:= '更改款到发货标识';
    FLog[6].FROM_STRING:= dm.aq10.FieldByName('COD_FLAG').AsString;
    FLog[7].TRANS_TYPE:= 107;
    FLog[7].TRANS_DESCRIPTION:= '更改未付款最多超期天数';
    FLog[7].FROM_STRING:= dm.aq10.FieldByName('INVOICE_NOTE_PAD_PTR').AsString;
    FLog[8].TRANS_TYPE:= 108;
    FLog[8].TRANS_DESCRIPTION:= '更改销售奖金分配';
    FLog[8].FROM_STRING:= dm.aq10.FieldByName('SALES_DISCOUNT').AsString;
    FLog[9].TRANS_TYPE:= 109;
    FLog[9].TRANS_DESCRIPTION:= '更改月结天数';
    FLog[9].FROM_STRING:= dm.aq10.FieldByName('NET_PAY').AsString;
    FLog[10].TRANS_TYPE:= 110;
    FLog[10].TRANS_DESCRIPTION:= '更改状态';
    FLog[10].FROM_STRING:= DBRadioGroup8.Items[DBRadioGroup8.itemindex];
  end;
end;

procedure Tcust_detail.TreeView1Change(Sender: TObject; Node: TTreeNode);
var i:byte;
begin
  case node.SelectedIndex of
    0..6,8:notebook1.PageIndex:=node.SelectedIndex;
    7:notebook1.PageIndex:=0;
   else
    notebook1.PageIndex:=7;
  end;

  headercontrol1.Sections[1].Text:=node.Text;

  dm.aq12.First;
  for i:=1 to node.SelectedIndex-9 do
    dm.aq12.Next;
end;

procedure Tcust_detail.FormCreate(Sender: TObject);
begin
  spec_note_:=Tstringlist.Create;
  note_var:=Tstringlist.Create;
  keypreview:=true;  
end;

procedure Tcust_detail.FormDestroy(Sender: TObject);
var
  sr: TSearchRec;
begin
  dm.ADO20.Close;
  spec_note_.Free;
  note_var.Free;
  if FindFirst(TmpFileDir+'*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      DeleteFile(TmpFileDir+sr.Name);
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure Tcust_detail.TreeView1MouseDown(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
begin
  treeview1.PopupMenu:=nil;
  if button=mbright then
    if treeview1.Selected.SelectedIndex=7 then
    begin
      n1.Enabled:=true;
      n2.Enabled:=false;
      n3.Enabled:=false;
      treeview1.PopupMenu:=PM1;
    end
    else if treeview1.Selected.SelectedIndex>8  then
    begin
      n1.Enabled:=false;
      n2.Enabled:=true;
      n3.Enabled:=true;
      treeview1.PopupMenu:=PM1;
    end
    else treeview1.PopupMenu:=nil;
end;

procedure Tcust_detail.N1Click(Sender: TObject);
var i:word;
    v_copy:array[3..48] of variant;
    node:Ttreenode;
begin
 if treeview1.Selected.SelectedIndex=7 then  //如果当前选中节点为装运地点
 begin
  try
   with dm.aq12 do
   begin
    if not isempty then
    begin
     for i:=3 to 48 do  //除rkey,customer_ptr,location不复制
      v_copy[i]:=fieldvalues[fields[i].FieldName];
     append;
     for i:=3 to 48 do
      fieldvalues[fields[i].FieldName]:=v_copy[i];
    end
    else begin
     append;
     fieldvalues['language_flag']:='Y'; // 如果为空则赋部分默认值
     fieldvalues['ship_lead_time']:=1;
     fieldvalues['state_ship_tax_flag']:='N';
     fieldvalues['state_prod_tax_flag']:='Y';
     fieldvalues['state_tool_tax_flag']:='N';
    end;
   end;

   ship_location:=Tship_location.Create(application);
   if ship_location.ShowModal=mrok then
   begin
    node:=treeview1.Items.AddChild(treeview1.Selected,dm.aq12LOCATION.Value);
    node.SelectedIndex:=note_index;
    note_index:=note_index+1;
    treeview1.Selected:=node;
    v_edit:=true;
   end;
  finally
   ship_location.Free;
  end;
 end;
end;

procedure Tcust_detail.N2Click(Sender: TObject);
begin
  if treeview1.Selected.SelectedIndex>7 then  //如果当前选中节点为装运子节点
  begin
    ship_location:=Tship_location.Create(application);
    if is_copy=2 then check_status else dm.aq12.Edit;
    try
      if ship_location.ShowModal=mrok then
      begin
        v_edit:=true;
        treeview1.Selected.Text:=dm.aq12LOCATION.Value;
      end;
    finally
      ship_location.Free;
    end;
  end;
end;

procedure Tcust_detail.N3Click(Sender: TObject);
begin
  if treeview1.Selected.SelectedIndex>7 then  //如果当前选中节点为装运地点
  begin
    dm.aq12.Delete;
    treeview1.Selected.Delete;
    v_edit:=true;
  end;
end;

procedure Tcust_detail.BitBtn1Click(Sender: TObject);
var M: TMemoryStream;
    i,j:Integer;
begin
 if check_before_save then
 begin
  dm.aq10CUST_CODE.Value:=maskedit1.Text;
  dm.aq10CREDIT_RATING.Value:=combobox1.ItemIndex+1;
  dm.aq10Remark.Value := Trim(Memo6.Text);
  dm.aq10RemarkSpec.Value :=  Trim(mmo1.Text);
  dm.aq10last_updt.Value:=common.getsystem_date(dm.aqtmp,0);   //最后保存修改日期
  if not dm.ADOConnection1.InTransaction then
   dm.ADOConnection1.BeginTrans;
  if dm.aq10.State=dsinsert then
  begin
    dm.aq04.Open;
    if dm.aq04.FieldValues['seed_flag']<>1 then
      self.update_04(trim(maskedit1.Text),0);
    dm.aq04.Close;
  end;   //以上把新的客户代码写入控制数据
  try
    dm.aq10.Post;
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

  dm.aq12.First;
  while not dm.aq12.Eof do
  begin
    dm.aq12.Edit;
    dm.aq12CUSTOMER_PTR.Value:=dm.aq10RKEY.Value;
    dm.aq12.Next;
  end;

  try
    dm.aq12.UpdateBatch();
    dm.ADO20.First;
    while not dm.ADO20.Eof do
    begin
      dm.ADO20.Edit;
      dm.ADO20SOURCE_PTR.Value:=dm.aq10RKEY.Value;
      dm.ADO20.Post;
      dm.ADO20.next;
    end;

    dm.ADO20.UpdateBatch(arAll);

    dm.ADO20.First;
    while not dm.ADO20.Eof do
    begin
      if not Fmem[dm.ADO20.RecNo-1].bWhere and (Fmem[dm.ADO20.RecNo-1].fileName<>'') then
      begin
        dm.tmp.Close;
        dm.tmp.SQL.text:='update data0020 set file_content=:F where rkey='+dm.ADO20rkey.AsString;
        if M=nil then M:=TMemoryStream.Create;
        M.Clear;
        M.LoadFromFile(Fmem[dm.ADO20.RecNo-1].fileName);
        PackStream(M);
        dm.tmp.Parameters[0].LoadFromStream(M,ftblob);
        dm.tmp.ExecSQL;
      end;
      dm.ADO20.next;
    end;
    M.Free;

    dm.ADOConnection1.CommitTrans;
    v_close:=1; //正常退出
    self.ModalResult:=mrok;
  except
    dm.ADOConnection1.RollbackTrans;
    showmessage('装运地点保存失败，可能装运地点已被使用不能删除!');
  end;
 end
 else
  exit;

  if (is_copy=0) then   //新建0,复制1,检查2,编辑3
  begin
    if  SGrid.Cells[0,1] <> '' then
    begin
      if dm.ADOConnection1.Connected then
      begin
        DM.ADOConnection1.BeginTrans;
        DM.ADO248_1.Close;
        DM.ADO248_1.Parameters[0].Value:=0;
        DM.ADO248_1.Open;
        while not DM.ADO248_1.IsEmpty do
        DM.ADO248_1.Delete;
        DM.ADO248_1.Close;
        DM.ADO248.Close;
        DM.ADO248_1.Open;
        DM.ADO248.Parameters[0].Value:=0;
        DM.ADO248.Open;
        while not DM.ADO248.IsEmpty do
        DM.ADO248.Delete;

       try
          DM.ADO248.Append;
          for  i:= 1 to SGrid.RowCount-2 do
          begin
            DM.ADO248CUST_PTR.Value:= dm.ads10rkey.Value;
            DM.ADO248sys_ptr.Value:=strtoint(SGrid.Cells[3,i]);
            DM.ADO248position.Value:=SGrid.Cells[2,i];
          end;
          DM.ADO248.Post;
          DM.ADO248.UpdateBatch();
          DM.ADO248.Close;
       except
          on e:Exception do
          begin
            DM.ADOConnection1.RollbackTrans;
            ShowMessage('保存过程中出现错误！'+#13+'出错原因：'+e.Message);
          end;
       end;
       DM.ADOConnection1.CommitTrans;
      end;
    end;
  end;

  if (is_copy=2) or (is_copy=3) then   //新建0,复制1,检查2,编辑3
  begin
    if  SGrid.Cells[0,1] <> '' then
    begin
      if dm.ADOConnection1.Connected then
      begin
        DM.ADOConnection1.BeginTrans;
        DM.ADO248_1.Close;
        DM.ADO248_1.Parameters[0].Value:=dm.ads10rkey.Value;
        DM.ADO248_1.Open;
        while not DM.ADO248_1.IsEmpty do
        DM.ADO248_1.Delete;
        DM.ADO248_1.Close;
        DM.ADO248_1.Open;
        DM.ADO248.Close;
        DM.ADO248.Parameters[0].Value:=dm.ads10rkey.Value;
        DM.ADO248.Open;

       try
          for  i:= 1 to SGrid.RowCount-2 do
          begin
            DM.ADO248.Append;
            DM.ADO248CUST_PTR.Value:= dm.ads10rkey.Value;
            DM.ADO248sys_ptr.Value:=strtoint(SGrid.Cells[3,i]);
            DM.ADO248position.Value:=SGrid.Cells[2,i];
          end;
          DM.ADO248.Post;
          DM.ADO248.UpdateBatch();
          DM.ADO248.Close;
       except
          on e:Exception do
          begin
            DM.ADOConnection1.RollbackTrans;
            ShowMessage('保存过程中出现错误！'+#13+'出错原因：'+e.Message);
          end;
       end;
        DM.ADOConnection1.CommitTrans;
      end;
    end;
  end;
  
  if is_copy = 3 then  //编辑
  begin

    if not dm.aq10.Active then dm.aq10.Active:= True;
    if dm.aq10.FieldByName('RKEY').AsInteger <> RKEY10 then
     dm.aq10.Locate('RKEY',RKEY10,[]);

    for j:= 0 to 10 do
    begin
     if FLog[j].FROM_STRING<>FLog[j].TO_STRING then
      begin
        with dm.tmp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Insert Data0318(WORK_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,file_number)');
          SQL.Add(Format('Values(%d,%d,''%s'',''%s'',''%s'',%s,%s,%d,''%s'')',
                 [RKEY10,FLog[j].TRANS_TYPE,FLog[j].TRANS_DESCRIPTION,FLog[j].FROM_STRING,FLog[j].TO_STRING,rkey73,'Getdate()',135,v_str]));
          ExecSQL;
        end;
      end;
    end;
  end;

end;


procedure Tcust_detail.BitBtn4Click(Sender: TObject);
var inputvar:Pdlginput;
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
 try
  case Tbitbtn(sender).Tag of
  1: //销售代表
    begin
      inputvar.Fields:='EMPL_CODE/业务员代码/130,EMPLOYEE_NAME/业务员姓名/240';
      inputvar.Sqlstr:='select rkey,EMPL_CODE,EMPLOYEE_NAME from data0005  where active_flag=''Y'' order by EMPL_CODE';
      inputvar.KeyField:='EMPL_CODE';
      inputvar.InPut_value:=edit1.Text;
    end;
  2: //国家
    begin
      inputvar.Fields:='country_code/国家代码/130,country_name/国家名称/240';
      inputvar.Sqlstr:='select country_rkey,country_code,country_name from data0250 order by country_code ';
      inputvar.KeyField:='country_code';
      inputvar.InPut_value:=edit2.Text;
    end;
  3: //货币
    begin
      inputvar.Fields:='curr_code/货币代码/130,curr_name/货币名称/240';
      inputvar.Sqlstr:='select rkey,curr_code,curr_name from data0001 order by curr_code ';
      inputvar.KeyField:='curr_code';
      inputvar.InPut_value:=edit3.Text;
    end;
  4: //总账
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
      inputvar.InPut_value:=edit4.Text;
    end;
  end;
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if frmpick_item_single.ShowModal=mrok then
  begin
   case Tbitbtn(sender).Tag of
   1:
    begin
     edit1.Text:=frmpick_item_single.adsPick.FieldValues['empl_code'];
     label18.Caption:=frmpick_item_single.adsPick.FieldValues['EMPLOYEE_NAME'];
     dm.aq10SALES_REP_PTR.Value:=frmpick_item_single.adsPick.FieldValues['rkey'];
    end;
   2:
    begin
     edit2.Text:=frmpick_item_single.adsPick.FieldValues['country_code'];
     label19.Caption:=frmpick_item_single.adsPick.FieldValues['country_name'];
     dm.aq10COUNTRY_PTR.Value:=frmpick_item_single.adsPick.FieldValues['country_rkey'];
    end;
   3:
    begin
     edit3.Text:=frmpick_item_single.adsPick.FieldValues['curr_code'];
     label20.Caption:=frmpick_item_single.adsPick.FieldValues['curr_name'];
     dm.aq10CURRENCY_PTR.Value:=frmpick_item_single.adsPick.FieldValues['rkey'];
    end;
   4:
    begin
     edit4.Text:=frmpick_item_single.adsPick.FieldValues['gl_acc_number'];
     label46.Caption:=frmpick_item_single.adsPick.FieldValues['gl_description'];
     dm.aq10ACC_REC_PTR.Value:=frmpick_item_single.adsPick.FieldValues['rkey'];
    end;
   end;  //完成case;
  end;
 finally
   frmpick_item_single.adsPick.Close;
   frmpick_item_single.Free;
 end;
end;

procedure Tcust_detail.Edit2Exit(Sender: TObject);
var sqlstr,para:string;
begin
  if trim(edit2.Text)<>'' then
  begin
    sqlstr:='select country_rkey,country_name from data0250 where country_code=:p1 ';
    para:=trim(edit2.Text);
    openquery(dm.aqtmp,sqlstr,para);
    if dm.aqtmp.isempty then
    begin
      messagedlg('找不到您输入的国家代码，请重新输入或按钮选择!',mtconfirmation,[mbok],0);
      edit2.Text:='';
      edit2.SetFocus;
    end
    else begin
      label19.Caption:=dm.aqtmp.fieldbyname('country_name').AsString;
      dm.aq10COUNTRY_PTR.Value:=dm.aqtmp.FieldValues['country_rkey'];
    end;
  end
  else begin
    label19.Caption:='';
    dm.aq10.fieldvalues['COUNTRY_PTR']:=null;
  end;
end;

procedure Tcust_detail.Edit1Exit(Sender: TObject);
var sqlstr,para:string;
begin
  if trim(edit1.Text)<>'' then
  begin
    sqlstr:='select rkey,EMPL_CODE,EMPLOYEE_NAME from data0005 where empl_code=:p1 ';
    para:=trim(edit1.Text);
    openquery(dm.aqtmp,sqlstr,para);
    if dm.aqtmp.isempty then
    begin
      messagedlg('找不到您输入的销售代表，请重新输入或按钮选择!',mtconfirmation,[mbok],0);
      edit1.Text:='';
      edit1.SetFocus;
    end
    else begin
      label18.Caption:=dm.aqtmp.fieldbyname('EMPLOYEE_NAME').AsString;
      dm.aq10SALES_REP_PTR.Value:=dm.aqtmp.FieldValues['rkey'];
    end;
  end
  else label18.Caption:='';  //销售代表不允许为空,不能赋为空值
end;

procedure Tcust_detail.Edit3Exit(Sender: TObject);
var sqlstr,para:string;
begin
  if trim(edit3.Text)<>'' then
  begin
    sqlstr:='select rkey,curr_name from data0001 where curr_code=:p1 ';
    para:=trim(edit3.Text);
    openquery(dm.aqtmp,sqlstr,para);
    if dm.aqtmp.isempty then
    begin
      messagedlg('找不到您输入的货币代码，请重新输入或按钮选择!',mtconfirmation,[mbok],0);
      edit3.Text:='';
      edit3.SetFocus;
    end
    else begin
      label20.Caption:=dm.aqtmp.fieldbyname('curr_name').AsString;
      dm.aq10CURRENCY_PTR.Value:=dm.aqtmp.FieldValues['rkey'];
    end;
  end
  else label20.Caption:='';  //货币指针不允许为空
end;

procedure Tcust_detail.Edit4Exit(Sender: TObject);
var sqlstr,para:string;
begin
  if trim(edit4.Text)<>'' then
  begin
    sqlstr:='select rkey,gl_description from data0103 where gl_acc_number=:p1 ';
    para:=trim(edit4.Text);
    openquery(dm.aqtmp,sqlstr,para);
    if dm.aqtmp.isempty then
    begin
      messagedlg('找不到您输入的总帐帐目，请重新输入或按钮选择!',mtconfirmation,[mbok],0);
      edit4.Text:='';
      edit4.SetFocus;
    end
    else begin
      label46.Caption:=dm.aqtmp.fieldbyname('gl_description').AsString;
      dm.aq10ACC_REC_PTR.Value:=dm.aqtmp.fieldvalues['rkey'];
    end;
  end
  else begin
    label46.Caption:='';
    dm.aq10.fieldvalues['ACC_REC_PTR']:=null;
  end;
end;

procedure Tcust_detail.BitBtn2Click(Sender: TObject);
begin
try
  spec_note:=Tspec_note.Create(application);
  if is_copy=2 then
  begin
    spec_note.Button1.Enabled:=false;
    spec_note.Memo1.Enabled:=false;
  end;
  spec_note.Caption:='客户特别要求：'+dbedit3.Text;
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

procedure Tcust_detail.DBEdit26Exit(Sender: TObject);
begin
  if (DBEdit26.Text)='' then DBEdit26.Text:='0';
  if strtofloat(dbedit26.Text)>=100 then
    if messagedlg('您输入的数据超出范围，是否替换成系统最大值？',mtwarning,[mbyes,mbno],0)=mryes then
      dm.aq10SALES_DISCOUNT.Value:=strtofloat('99.99')
    else begin dm.aq10SALES_DISCOUNT.Value:=strtofloat('0'); dbedit26.SetFocus; end;
  DBEdit26.Text:=formatfloat('0.00',strtofloat(DBEdit26.text));
end;

procedure Tcust_detail.DBEdit26KeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(46) then      //判断是否重复输入小数点'.'
    if pos('.',DBEdit26.Text)>0 then abort;
end;

procedure Tcust_detail.DBEdit29Exit(Sender: TObject);
begin
  if (DBEdit29.Text)='' then DBEdit29.Text:='0';
  if strtofloat(dbedit29.Text)>=100 then
    if messagedlg('您输入的数据超出范围，是否替换成系统最大值？',mtwarning,[mbyes,mbno],0)=mryes then
      dm.aq10DISCOUNT_PCT.Value:=strtofloat('99.99')
    else begin dm.aq10DISCOUNT_PCT.Value:=strtofloat('0'); dbedit29.SetFocus; end;
  DBEdit29.Text:=formatfloat('0.00',strtofloat(DBEdit29.text));
end;

procedure Tcust_detail.DBEdit29KeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(46) then      //判断是否重复输入小数点'.'
    if pos('.',DBEdit29.Text)>0 then abort;
end;

procedure Tcust_detail.BitBtn3Click(Sender: TObject);
begin
  if dm.aq10.State=dsinsert then begin dm.aq10.Cancel;v_close:=1; end
  else if (bitbtn1.Enabled=true) and ((dm.aq10.Modified) or (dm.aq12.Modified) or (v_edit)) then
    if messagedlg('数据已修改，是否保存？',mtconfirmation,[mbyes,mbno],0)=mryes then
      bitbtn1click(sender)
    else begin dm.aq10.Cancel; dm.aq12.Cancel; v_close:=1; end;
end;

procedure Tcust_detail.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if v_close<>1 then
  begin
    dm.aq10.Cancel;
    if dm.aq12.LockType<>ltreadonly then
      dm.aq12.CancelBatch();
  end;
  mainform.Show;
end;

procedure Tcust_detail.DBEdit27Exit(Sender: TObject);
begin
  if (DBEdit27.Text)='' then DBEdit27.Text:='0';
  if strtoint(dbedit27.Text)>31 then
    if messagedlg('您输入的数据超出范围，是否替换成系统最大值？',mtwarning,[mbyes,mbno],0)=mryes then
      dm.aq10EDI_FLAG_CREDIT_MEMO.Value:=strtoint('31')
    else begin dm.aq10EDI_FLAG_CREDIT_MEMO.Value:=strtoint('0'); dbedit27.SetFocus; end;
end;

procedure Tcust_detail.DBEdit27KeyPress(Sender: TObject; var Key: Char);
begin
 if (trim(dbedit27.text)<>'') and (strtoint(dbedit27.Text)>=31) and (key<>chr(8)) then abort;
end;

procedure Tcust_detail.MenuItem1Click(Sender: TObject);
var
  f:string;
  fs: TMemoryStream;
  i:integer;
begin
  BtnUpload.Enabled:=(TMenuItem(Sender).Tag=10) or (TMenuItem(Sender).Tag=11);
  case  TMenuItem(Sender).Tag of
  10: begin DBMemo2.SetFocus; dm.ADO20.Append; end;
  11: dm.ADO20.Edit;
  12: begin
        for i:=dm.ADO20.RecNo-1 to dm.ADO20.RecordCount-2 do
        begin
          Fmem[i].fileName:=Fmem[i+1].fileName;
          Fmem[i].bWhere:=Fmem[i+1].bWhere;
        end;
        Fmem[dm.ADO20.RecordCount-1].fileName:='';
        Fmem[dm.ADO20.RecordCount-1].bWhere:=false;
        dm.ADO20.Delete;
      end;
  13: begin     //open
        i:=dm.ADO20.RecNo-1;
        if Fmem[i].bWhere then  //exist database
        begin
          DM.tmp.Close;
          DM.tmp.SQL.Text:='select file_content FROM Data0020 where rkey='+dm.ADO20.fieldbyname('rkey').AsString;
          DM.tmp.Open;
          if dm.tmp.fieldbyname('file_content').IsNull then
          begin
            showmessage('此文档为空...');
            exit;
          end;
          fs := TMemoryStream.Create;
          TBlobfield(dm.tmp.fieldbyname('file_content')).SaveToStream(fs);
          UnPackStream(fs);
          if not DirectoryExists(TmpFileDir) then
            if not CreateDir(TmpFileDir) then  raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
          f:=TmpFileDir+dm.ADO20file_Name.AsString;
          fs.SaveToFile(f);
          fs.Free;
          ShellExecute(self.Handle,nil,pchar(f),nil,nil,SW_SHOWNORMAL);
        end
        else
          ShellExecute(self.Handle,nil,@Fmem[i].fileName[0],nil,nil,SW_SHOWNORMAL);
      end;
  end;
end;

procedure Tcust_detail.BtnUploadClick(Sender: TObject);
var i:integer;
    s:string;
    fs: TMemoryStream;  
begin
  if OpenDialog1.Execute then
  begin
    for i:=length(OpenDialog1.FileName) downto 1 do
    begin
      if  OpenDialog1.FileName[i]<>'\' then
         s:=OpenDialog1.FileName[i]+s
      else
         break;
    end;
    fs := TMemoryStream.Create;
    fs.LoadFromFile(OpenDialog1.FileName);
    if fs.Size>10*1024*1024 then
    begin
      showmessage('文件大小不能超过10M,请重新整理文件再保存...');
      fs.Free;
      exit;
    end;
   { if pos('.BMP',uppercase(s))>0 then
    begin
       showmessage('图片不能为BMP文件格式,请重新整理文件再保存...');
       fs.Free;
       exit;
    end; }
    dm.tmp.Close;
    dm.tmp.SQL.Text:='select getdate()';
    dm.tmp.Open;
    PackStream(fs);
    dm.ADO20.Edit;
    dm.ADO20file_name.Value:=s;
    dm.ADO20Indate.Value:=dm.tmp.Fields[0].AsDateTime;
    dm.ADO20.Post;
    Fmem[dm.ADO20.RecNo-1].fileName:=OpenDialog1.FileName;
    Fmem[dm.ADO20.RecNo-1].bWhere:=false;
    fs.Free;
    dm.tmp.Close;
  end;
end;

procedure Tcust_detail.Pop20Popup(Sender: TObject);
begin
  MenuItem1.Enabled:=not (is_copy=2); //新建0,复制1,检查2,编辑3
  MenuItem2.Enabled:=MenuItem1.Enabled and not dm.ADO20.IsEmpty;
  MenuItem3.Enabled:=MenuItem2.Enabled;
  N5.Enabled:=(dm.ADO20.RecordCount>0);// and not dm.ADO20file_content.IsNull;
end;

procedure Tcust_detail.DBEdit53Exit(Sender: TObject);
begin
  if (trim(DBEdit53.Text)='') and (dm.ADO20.State in [dsEdit,dsInsert]) then
  begin
    showmessage('文件名称不能为空...');
    DBEdit53.SetFocus;
    abort;
  end;
end;

procedure Tcust_detail.N6Click(Sender: TObject);
begin
 TSMS_Frm.InitEdt(SGrid,Tcomponent(Sender).Tag);
end;

procedure Tcust_detail.N8Click(Sender: TObject);
var
  i:integer;
begin
    if SGrid.cells[1,SGrid.Row] <> '' then
    begin
       if   SGrid.RowCount <> 2 then
       begin
              for i:=SGrid.Row to SGrid.RowCount -1 do
              begin
                SGrid.Rows[i]:=SGrid.Rows[i+1];
              end;
              SGrid.RowCount:=SGrid.RowCount-1;
       end else  if SGrid.RowCount = 2  then
                  begin
                        SGrid.Rows[1].Clear;
                  end;

    end;
end;

procedure Tcust_detail.DBCheckBox3Click(Sender: TObject);
begin
dbcheckbox8.Enabled:= dbcheckbox3.Checked;
end;

end.
