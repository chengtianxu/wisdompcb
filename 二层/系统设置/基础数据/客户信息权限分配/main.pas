unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, ComCtrls, Menus,
  ImgList, ToolWin, DBGridEh;

type
  Tfrm_main = class(TForm)
    Panel1: TPanel;
    Bar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    ToolButton4: TToolButton;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    N3: TMenuItem;
    Eh1: TDBGridEh;
    ToolButton5: TToolButton;
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Eh1TitleClick(Column: TColumnEh);
    procedure Edit1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    { Private declarations }
    sql_text,sql_text1:string;
    rkey:integer;
    precolumn:Tcolumneh;
    procedure get_detail(ttype,value:integer);
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation
uses damo,common,constvar,pick_item_single,pickitem;

{$R *.dfm}

procedure Tfrm_main.get_detail(ttype,value:integer);
begin //ttype类型(0按用户/1按客户)
  with dm.ADS100 do
  begin
    close;
    if ttype=0 then
      commandtext:=sql_text+' where d100.csi_ptr='+inttostr(value)
    else commandtext:=sql_text+' where d100.customer_ptr='+inttostr(value);
    open;
  end;
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
  if not App_init(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd' ; 
end;

procedure Tfrm_main.FormShow(Sender: TObject);
begin
  sql_text:=copy(dm.ADS100.CommandText,1,pos('where',dm.ADS100.CommandText)-1);
  sql_text1:=dm.aq100.sql.text;
  precolumn:=eh1.Columns[0];
  radiogroup1.OnClick(sender);
end;

procedure Tfrm_main.Eh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.ads100.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.ads100.IndexFieldNames:=column.FieldName;
  end;

  if (column.ReadOnly) and (precolumn.FieldName<>column.FieldName) then
  begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    precolumn.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn:=column;
  end;
end;

procedure Tfrm_main.RadioGroup1Click(Sender: TObject);
begin
  edit1.Text:='';
  label2.Caption:='';
  dm.ADS100.Close;
  if radiogroup1.ItemIndex=0 then
  begin
    label1.Caption:='用户代码：';
    eh1.Columns[0].FieldName:='cust_code';
    eh1.Columns[1].FieldName:='customer_name';
    eh1.Columns[0].Title.caption:='客户代码';
    eh1.Columns[1].Title.caption:='客户名称';
    eh1.Columns[2].FieldName:='ABBR_NAME';
    eh1.Columns[2].Title.caption:='客户简称';
    bar1.Panels[2].Text:='系统有效客户：';
    dm.AQTMP.Close;
    dm.AQTMP.SQL.Text:='select count(rkey) from data0010  ';  //5.20去掉检查客户状态0 where customer_type<>4
    dm.AQTMP.Open;
    bar1.Panels[3].Text:=dm.AQTMP.Fields[0].AsString;
  end
  else begin
    label1.Caption:='客户代码：';
    eh1.Columns[0].FieldName:='user_login_name';
    eh1.Columns[1].FieldName:='user_full_name';
    eh1.Columns[0].Title.caption:='用户代码';
    eh1.Columns[1].Title.caption:='用户名称';
    bar1.Panels[2].Text:='';
    bar1.Panels[3].Text:='';
  end;
end;

procedure Tfrm_main.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
     eh1.SetFocus;
end;

procedure Tfrm_main.Edit1Click(Sender: TObject);
begin
  edit1.SelectAll;
end;

procedure Tfrm_main.Edit1Exit(Sender: TObject);
begin
 if (trim(edit1.Text)<>'') then
  with dm.AQTMP do
  if radiogroup1.ItemIndex=0 then
  begin
    sql.Text:='select rkey,user_full_name from data0073 where active_flag=0 and '+
    'user_group_flag=1 and user_login_name='''+trim(edit1.Text)+'''';
    open;
    if isempty then
    begin
      showmessage('输入的用户代码不存在，请重新输入或选择！');
      edit1.Text:='';
      label2.Caption:='';
      edit1.SetFocus;
      dm.ADS100.Close;
    end
    else begin
      label2.Caption:=fieldvalues['user_full_name'];
      rkey:=fieldvalues['rkey'];
      get_detail(0,rkey);
    end;
  end
  else begin
    sql.Text:='select rkey,customer_name,ABBR_NAME from data0010 where '+ //5.20去掉检查客户状态1 customer_type<>4 and
    'cust_code='''+trim(edit1.Text)+'''';
    open;
    if isempty then
    begin
      showmessage('输入的客户代码不存在，请重新输入或选择！');
      edit1.Text:='';
      label2.Caption:='';
      edit1.SetFocus;
      dm.ADS100.Close;
    end
    else begin
      label2.Caption:=fieldvalues['customer_name'];
      rkey:=fieldvalues['rkey'];
      get_detail(1,rkey);
    end;
  end
 else begin  //edit1为空
   label2.Caption:='';
   dm.ADS100.Close;
 end;
 dm.AQTMP.Close;
end;

procedure Tfrm_main.BitBtn2Click(Sender: TObject);
var inputvar:PDlgInput;
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    if RadioGroup1.ItemIndex=0 then
    begin
      inputvar.Fields:='user_login_name/用户代码/130,user_full_name/用户名称/240';
      inputvar.Sqlstr:='select rkey,user_login_name,user_full_name from data0073 '+
        'where active_flag=0 and user_group_flag=1 order by user_login_name';
      inputvar.KeyField:='user_login_name';
    end
    else begin
      inputvar.Fields:='cust_code/客户代码/130,customer_name/客户名称/240,ABBR_NAME/客户简称/150';
      inputvar.Sqlstr:='select rkey,cust_code,customer_name,ABBR_NAME from data0010 '+
        ' order by cust_code'; // 5.20去掉检查客户状态2 where customer_type<>4
      inputvar.KeyField:='cust_code';
    end;
    inputvar.InPut_value:=edit1.Text;
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if frmpick_item_single.ShowModal=mrok then
      if RadioGroup1.ItemIndex=0 then
      begin
        edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['user_login_name']);
        label2.Caption:=frmpick_item_single.adsPick.FieldValues['user_full_name'];
        rkey:=frmpick_item_single.adsPick.FieldValues['rkey'];
        get_detail(0,rkey);
      end
      else begin
        edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['cust_code']);
        label2.Caption:=frmpick_item_single.adsPick.FieldValues['customer_name'];
        rkey:=frmpick_item_single.adsPick.FieldValues['rkey'];
        get_detail(1,rkey);
      end
    else edit1.SetFocus;
  finally
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
  end;
end;

procedure Tfrm_main.N1Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   showmessage('对不起，您只有该程序的只读权限！')
 else
 try
  frm_pickitem:=Tfrm_pickitem.Create(application);
  with dm.ADS_pickitem do
  if radiogroup1.ItemIndex=0 then
  begin
   dm.AQ100.SQL.Text:=sql_text1+' where csi_ptr='+inttostr(rkey);
   frm_pickitem.Label1.Caption:='搜索（客户代码）：';
   fields[2].FieldName:='cust_code';
   fields[3].FieldName:='customer_name';
   fields[4].FieldName:='ABBR_NAME';
   frm_pickitem.Eh1.Columns[1].FieldName:='cust_code';
   frm_pickitem.Eh1.Columns[1].Title.caption:='客户代码';
   frm_pickitem.Eh1.Columns[2].FieldName:='customer_name';
   frm_pickitem.Eh1.Columns[2].Title.caption:='客户名称';
   frm_pickitem.Eh1.Columns[3].FieldName:='ABBR_NAME';
   frm_pickitem.Eh1.Columns[3].Title.caption:='客户简称';
   commandtext:='declare @isselected bit select @isselected=0 '+#13+
     'select @isselected as isselected,rkey,upper(cust_code) as cust_code,'+
     'upper(customer_name)+'' '' as customer_name,upper(ABBR_NAME)+'' '' as ABBR_NAME '+
     'from data0010  order by cust_code '; //5.20去掉检查客户状态3 where customer_type<>4
  end  //全部转为大写，方便过滤，upper(customer_name)+'' ''为应对clientdataset过滤的bug
  else begin
   dm.AQ100.SQL.Text:=sql_text1+' where customer_ptr='+inttostr(rkey);
   frm_pickitem.Label1.Caption:='搜索（用户代码）：';
   fields[2].FieldName:='cust_code';
   fields[3].FieldName:='customer_name';
   fields[4].FieldName:='ABBR_NAME';
   frm_pickitem.Eh1.Columns[1].FieldName:='cust_code';
   frm_pickitem.Eh1.Columns[1].Title.caption:='用户代码';
   frm_pickitem.Eh1.Columns[2].FieldName:='customer_name';
   frm_pickitem.Eh1.Columns[2].Title.caption:='用户名称';
   frm_pickitem.Eh1.Columns[3].FieldName:='ABBR_NAME';
   frm_pickitem.Eh1.Columns[3].Title.caption:='用户状态';
   commandtext:='declare @isselected bit select @isselected=0 '+#13+
    'select @isselected as isselected,rkey,upper(user_login_name) as cust_code,'+
    'upper(user_full_name)+'' '' as customer_name ,upper(active_flag)+'' '' as ABBR_NAME '+
    'from data0073 where active_flag=0 and user_group_flag=1 order by user_login_name ';
  end;
  dm.ADS_pickitem.Open;
  dm.AQ100.Open;
  dm.AQ100.Edit;
  if frm_pickitem.ShowModal=mrok then
  begin
   dm.CDS_pickitem.First;
   if radiogroup1.ItemIndex=0 then  //按用户
    while not dm.CDS_pickitem.Eof do
    begin
     if dm.CDS_pickitem.FieldByName('isselected').AsBoolean then
      if not (dm.AQ100.Locate('customer_ptr',dm.CDS_pickitem.fieldbyname('rkey').AsInteger,[])) then
      begin
       dm.AQ100.Append;
       dm.AQ100.FieldByName('csi_ptr').Value:=rkey;
       dm.AQ100.FieldByName('customer_ptr').Value:=dm.CDS_pickitem.fieldbyname('rkey').AsInteger;
       dm.AQ100.Post;
      end;
     dm.CDS_pickitem.Next;
    end  //end按用户
   else while not dm.CDS_pickitem.Eof do  //按客户
   begin
    if dm.CDS_pickitem.FieldByName('isselected').AsBoolean then
     if not (dm.AQ100.Locate('csi_ptr',dm.CDS_pickitem.fieldbyname('rkey').AsInteger,[])) then
     begin
      dm.AQ100.Append;
      dm.AQ100.FieldByName('customer_ptr').Value:=rkey;
      dm.AQ100.FieldByName('csi_ptr').Value:=dm.CDS_pickitem.fieldbyname('rkey').AsInteger;
      dm.AQ100.Post;
     end;
    dm.CDS_pickitem.Next;
   end; //end按客户
  dm.ADS100.Close;
  dm.ADS100.Open;
  end;
  finally
   dm.ADS_pickitem.Close;
   dm.AQ100.Close;
   frm_pickitem.Free;
  end;
end;

procedure Tfrm_main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    showmessage('对不起，您只有该程序的只读权限！')
  else
  if messagedlg('你确定删除这条记录吗？',mtwarning,[mbyes,mbno],0)=mryes then
  with dm.AQTMP do
  begin
    SQL.Text:='delete data0100 where csi_ptr=:p1 and customer_ptr=:p2 ';
    Parameters.ParamByName('p1').Value:=dm.ADS100.FieldValues['csi_ptr'];
    Parameters.ParamByName('p2').Value:=dm.ADS100.fieldvalues['customer_ptr'];
    execsql;
    dm.ADS100.Close;
    dm.ADS100.Open;
  end;
end;

procedure Tfrm_main.N3Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    showmessage('对不起，您只有该程序的只读权限！')
  else
  if messagedlg('你确定删除所有记录吗？',mtwarning,[mbyes,mbno],0)=mryes then
  with dm.AQTMP do
  begin
    dm.ADS100.First;
    SQL.Text:='delete data0100 where csi_ptr=:p1 and customer_ptr=:p2 ';
    while not dm.ADS100.eof do
    begin
      Parameters.ParamByName('p1').Value:=dm.ADS100.fieldvalues['csi_ptr'];
      Parameters.ParamByName('p2').Value:=dm.ADS100.fieldvalues['customer_ptr'];
      execsql;
      dm.ADS100.Next;
    end;
    dm.ADS100.Close;
    dm.ADS100.Open;
  end;
end;

procedure Tfrm_main.PopupMenu1Popup(Sender: TObject);
begin
  n1.Enabled:=trim(edit1.Text)<>'';
  n2.Enabled:=not dm.ADS100.IsEmpty;
  n3.Enabled:=not dm.ADS100.IsEmpty;
end;

procedure Tfrm_main.ToolButton1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure Tfrm_main.ToolButton2Click(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
     N1.Click
  else showmessage('请先确定需要分配权限的'+copy(label1.Caption,1,8)+'！');
end;

procedure Tfrm_main.ToolButton3Click(Sender: TObject);
begin
  if not dm.ADS100.IsEmpty then
    N2.Click;
end;

procedure Tfrm_main.ToolButton4Click(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
  begin
    dm.ADS100.Close;
    dm.ADS100.Open;
  end;
end;

procedure Tfrm_main.ToolButton5Click(Sender: TObject);
begin
Export_dbGridEH_to_Excel(eh1,'客户信息权限分配')
end;

end.
