unit uCondition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, Grids, Buttons, StdCtrls,DateUtils;

type
  TfrmCondition = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Edit3: TEdit;
    ListBox3: TListBox;
    StaticText4: TStaticText;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    RadioGroup1: TRadioGroup;
    BitBtn3: TBitBtn;
    StaticText2: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label9: TLabel;
    Label7: TLabel;
    DTPk5: TDateTimePicker;
    DTPk6: TDateTimePicker;
    ComboBox2: TComboBox;
    dp1: TDateTimePicker;
    dp2: TDateTimePicker;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    StaticText1: TStaticText;
    StringGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label3: TLabel;
    edtValue: TEdit;
    Button1: TButton;
    BitBtn8: TBitBtn;
    ListBox1: TListBox;
    StaticText7: TStaticText;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    Label4: TLabel;
    Panel3: TPanel;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    procedure BitBtn6Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit3Exit(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn7Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);

  private
    warehouse_ptr:integer;
    procedure item_Click(Sender: TObject);
  public
    _SearchStr:string;
    _SortStr:string;
  end;

var
  frmCondition: TfrmCondition;

implementation

uses common,uCostom, uEmployee, uMain, constvar, pick_item_single, uDM, DBGrids;

{$R *.dfm}

//查询条件
procedure TfrmCondition.BitBtn6Click(Sender: TObject);
var
  inputvar:PDlgInput;
  i: integer;
  s: string;
  dx: TDBGridOptions;
begin
  if PageControl1.ActivePageIndex=0 then
  case listbox3.ItemIndex of
   0:     //客户编号
   begin
    frmCostom:=TfrmCostom.Create(application);
    if frmCostom.ShowModal=mrok then
    begin
      edit3.Text:=trim(frmCostom.Query1CUST_CODE.Value);
      button3.Enabled:=true;
      button3.SetFocus;
    end
    else edit3.SetFocus;
    frmCostom.free;
   end;
   5:           //业务员
   begin
    frmEmployee:=TfrmEmployee.Create(application);
    if frmEmployee.ShowModal=mrok then
     begin
      edit3.Text:=trim(frmEmployee.Query1REP_CODE.Value);
      button3.Enabled:=true;
      button3.SetFocus;
     end
    else
     edit3.SetFocus;
    frmEmployee.free;
   end;
   7:
    begin
      frmpick_item_single:=Tfrmpick_item_single.Create(application);
      inputvar.Fields:='warehouse_code/工厂代码/60,warehouse_name/工厂名称/200,abbr_name/工厂简称/100';
      inputvar.Sqlstr:='select rkey,warehouse_code,warehouse_name,abbr_name from data0015 order by warehouse_code';
      inputvar.KeyField:='warehouse_code';
      inputvar.InPut_value:=edit3.Text;
      inputvar.AdoConn:=dm.conn;
      frmpick_item_single.InitForm_New(inputvar);
      if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
      begin
        edit3.Text:=trim(frmpick_item_single.adsPick.FieldValues['warehouse_code']);
        warehouse_ptr:=frmpick_item_single.adsPick.FieldValues['rkey'];
        button3.Enabled:=true;
        button3.SetFocus;
      end
      else edit3.SetFocus;
      frmpick_item_single.adsPick.Close;
      frmpick_item_single.Free;
    end;
    15:     //关联原客户
   begin
    frmCostom:=TfrmCostom.Create(application);
    if frmCostom.ShowModal=mrok then
    begin
      edit3.Text:=trim(frmCostom.Query1ABBR_NAME.Value);
      button3.Enabled:=true;
      button3.SetFocus;
    end
    else edit3.SetFocus;
    frmCostom.free;
   end;
  end;
  if PageControl1.ActivePageIndex=1 then
  case ListBox1.ItemIndex of
 1,2:begin
      frmpick_item_single:=Tfrmpick_item_single.Create(application);
      frmpick_item_single.DBGrid1.Options := frmpick_item_single.DBGrid1.Options+[dgMultiSelect];
      inputvar.Fields:='CODE/仓库代码/160,LOCATION/仓库名称/200';
      inputvar.Sqlstr:='select RKEY,CODE,LOCATION from data0016 where LOCATION_TYPE=1';
      inputvar.KeyField:='CODE';
      inputvar.InPut_value:=edtValue.Text;
      inputvar.AdoConn:=dm.conn;
      frmpick_item_single.InitForm_New(inputvar);
      if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
      begin
        if frmpick_item_single.DBGrid1.SelectedRows.Count>0 then
        begin
          with frmpick_item_single.DBGrid1.DataSource.DataSet do
          for i:=0 to frmpick_item_single.DBGrid1.SelectedRows.Count-1 do
          begin
            GotoBookmark(pointer(frmpick_item_single.DBGrid1.SelectedRows.Items[i]));
            if s='' then
              s:=trim(frmpick_item_single.adsPick.FieldValues['CODE'])
            else
              s:=s+','+trim(frmpick_item_single.adsPick.FieldValues['CODE']);
          end;
          edtValue.Text:=s;
        end
        else
          edtValue.Text:=trim(frmpick_item_single.adsPick.FieldValues['CODE']);
        Button1.Enabled:=true;
        Button1.SetFocus;
      end
      else edtValue.SetFocus;
      frmpick_item_single.adsPick.Close;
      frmpick_item_single.Free;
     end;
  end;
end;

procedure TfrmCondition.ListBox3Click(Sender: TObject);
begin
  label8.Caption:=listbox3.Items[listbox3.itemindex];

  edit3.Text:='';
  edit3.Visible:=listbox3.itemindex in [0..5,7,13,14,15];
  bitbtn6.Visible:=listbox3.itemindex in [0,5,7,15];
  button3.Enabled:=listbox3.itemindex in [6,8..12,16,17];
  combobox1.Visible:=listbox3.itemindex in [6,8,9,10,12,16];
  GroupBox1.Visible:=listbox3.itemindex=11;
  RadioGroup1.Visible:=listbox3.itemindex=13;
  Panel3.Visible:= listbox3.itemindex=17;

  if listbox3.itemindex=17 then Edit1.SetFocus;

  case listbox3.ItemIndex of
  6:
  begin
    ComboBox1.Style:=csOwnerDrawFixed;
    ComboBox1.Items.Clear;
    ComboBox1.Items.Append('正式订单');
    ComboBox1.Items.Append('备品订单');
    ComboBox1.ItemIndex:=0;
  end;
  8:
  begin
    ComboBox1.Items.Clear;
    ComboBox1.Style:=csOwnerDrawFixed;
    combobox1.Items.Add('新单');
    combobox1.Items.Add('返单');
    combobox1.Items.Add('样板转生产');
    combobox1.Items.Add('返单有改');

    ComboBox1.ItemIndex:=0;
  end;
  9:
  begin
    ComboBox1.Items.Clear;
    ComboBox1.Style:=csOwnerDrawFixed;
    ComboBox1.Items.Append('量产');
    ComboBox1.Items.Append('样板');
    ComboBox1.ItemIndex:=0;
  end;

  10:
  begin
    ComboBox1.Items.Clear;
    ComboBox1.Style:=csOwnerDrawFixed;
    ComboBox1.Items.Append('自制');
    ComboBox1.Items.Append('外发');
    ComboBox1.Items.Append('半制程');
    ComboBox1.ItemIndex:=0;
  end;
  12:
  begin
    ComboBox1.Items.Clear;
    ComboBox1.Style:=csOwnerDrawFixed;
    ComboBox1.Items.Append('未确认');
    ComboBox1.Items.Append('已确认');
    ComboBox1.Items.Append('已投产');
    ComboBox1.ItemIndex:=0;
  end;
  16:
  begin
    ComboBox1.Items.Clear;
    ComboBox1.Style:=csDropDown;
    dm.aqtmp.Close;
    DM.aqtmp.SQL.Text:='select data0338.tvalue from data0278 inner join data0338 on data0278.Rkey=data0338.parameter_ptr where  data0278.SPEC_RKEY=''js''';
    dm.aqtmp.Open;
    while not dm.aqtmp.Eof do
    begin
      ComboBox1.Items.Add(dm.aqtmp.FieldBYName('tvalue').AsString);
      DM.aqtmp.Next;
    end;
    ComboBox1.ItemIndex:=-1;
  end;
  end; 
end;

procedure TfrmCondition.Edit3KeyUp(Sender:TObject;var Key:Word;Shift:TShiftState);
begin
  button3.Enabled:=trim(edit3.Text)<>'' ;
end;

procedure TfrmCondition.Button3Click(Sender: TObject);
var i:integer;
    s:string;
begin
  for i:=1 to sgrid1.RowCount-1 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
  begin
    messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
    exit;
  end;

 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid1.RowCount-1]:=edit3.Text;

 case listbox3.ItemIndex of
 0:sgrid1.Cells[2,sgrid1.RowCount-1]:='data0010.cust_code = '''+edit3.Text+'''';      //客户编号
 1:                                                                          //客户型号
  sgrid1.Cells[2,sgrid1.RowCount-1]:='data0025.MANU_PART_DESC like ''%'+edit3.Text+'%''';
 2:                                                                          //本厂编号
  sgrid1.Cells[2,sgrid1.RowCount-1]:='data0025.MANU_PART_NUMBER like ''%'+edit3.Text+'%''';
 3:                                                                          //订单号
  sgrid1.Cells[2,sgrid1.RowCount-1]:='data0060.sales_order LIKE ''%'+edit3.Text+'%''';
 4:begin                                                                     //采购单号
   sgrid1.Cells[2,sgrid1.RowCount-1]:='data0097.po_number LIKE '''+edit3.Text+'%''';
  end;
 5:                                                                         //业务员
  begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='data0005.EMPL_CODE like '''+edit3.Text+'%''';
  end;
 6:
 begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='data0060.so_style='+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
 end;
 7:
 begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='data0060.ship_reg_tax_id='+inttostr(warehouse_ptr);
   sgrid1.Cells[1,sgrid1.RowCount-1]:=edit3.Text;
 end;
 8:
 begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='data0060.so_oldnew= '''+combobox1.Text+'''';
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
 end;

 9:
 begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='data0025.ttype= '+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
 end;
  10:
 begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='Data0060.so_tp ='+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
 end;

 11:
 begin
   s:='-1';
   for i:=0 to GroupBox1.ControlCount-1 do
     if TCheckBox(GroupBox1.Controls[i]).Checked then s:=s+','+inttostr(TCheckBox(GroupBox1.Controls[i]).Tag);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=' data0060.status in ('+s+')';
   sgrid1.Cells[1,sgrid1.RowCount-1]:=s;
 end;
 12:
 begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='data0060.prod_rel= '+inttostr(combobox1.ItemIndex+1);
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
 end;
 13:
 begin
   if RadioGroup1.ItemIndex=0 then
     sgrid1.Cells[2,sgrid1.RowCount-1]:='data0025.LAYERS='+edit3.Text
   else if RadioGroup1.ItemIndex=1 then
     sgrid1.Cells[2,sgrid1.RowCount-1]:='data0025.LAYERS>'+edit3.Text
   else
     sgrid1.Cells[2,sgrid1.RowCount-1]:='data0025.LAYERS<'+edit3.Text;
   sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioGroup1.Items[RadioGroup1.ItemIndex]+edit3.Text;
 end;
 14:
 begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='data0025.ANALYSIS_CODE_2 like ''%'+edit3.Text+'%''';
   sgrid1.Cells[1,sgrid1.RowCount-1]:=edit3.Text;
 end;
 15:sgrid1.Cells[2,sgrid1.RowCount-1]:='data0060.ORIG_CUSTOMER = '''+edit3.Text+'''';
 16:
 begin
   if (Trim(combobox1.Text)='') then
   begin
     sgrid1.Cells[2,sgrid1.RowCount-1]:='1=1';
     sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
   end else
   begin
     sgrid1.Cells[2,sgrid1.RowCount-1]:='data0025.CPJS like ''%'+combobox1.Text+'%''';
     sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
   end;
 end;
  17:
  begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='data0060.parts_ordered * data0025.unit_sq'+combobox3.text+ ' '+Edit1.text;
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox3.text+edit1.Text;
  end;

 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;
 //开始查询
procedure TfrmCondition.BitBtn1Click(Sender: TObject);
var i:integer;
    vstr:string;
    sD1,sD2:string;
begin
  frmMain.PageControl1.ActivePageIndex:=0;
   sD1:=formatdatetime('YYYY-MM-DD',DTPk5.Date)+' '+formatdatetime('hh:nn:ss',dp1.Time);
   sD2:=formatdatetime('YYYY-MM-DD',DTPk6.Date)+' '+formatdatetime('hh:nn:ss',dp2.Time);
   vstr:='';  //WHERE
   case combobox2.ItemIndex of       //日期
    0:begin
      vstr:=vstr+' and data0060.ent_date>='''+sD1+'''';
      vstr:=vstr+' and data0060.ent_date <= '''+sD2+'''';
      end;
    1:begin
      vstr:=vstr+' and data0060.orig_sched_ship_date>='''+sD1+'''';
      vstr:=vstr+' and data0060.orig_sched_ship_date <= '''+sD2+'''';
      end;
    2:begin
      vstr:=vstr+' and data0060.sch_date >= '''+sD1+'''';
      vstr:=vstr+' and data0060.sch_date <= '''+sD2+'''';
      end;
   end;
   for i:=1 to sgrid1.RowCount-2 do
   begin
     vstr:=vstr+' and ';
     vstr:=vstr+sgrid1.Cells[2,i];
   end;



 _SearchStr:=vstr;
 if RadioGroup5.ItemIndex=0 then _SortStr:='layers,'
 else _SortStr:='';
 case RadioGroup6.ItemIndex of
  0: _SortStr:=_SortStr+'sales_order';       // 销售单号
  1: _SortStr:=_SortStr+'cust_code,MANU_PART_NUMBER';       //客户+本厂编号
  2: _SortStr:=_SortStr+'po_number';       //客户单号
  3: _SortStr:=_SortStr+'prod_code,cust_code,MANU_PART_NUMBER';       //产品类别+客户+本厂编号
  4: _SortStr:=_SortStr+'orig_request_date';       //客户交期
  5: _SortStr:=_SortStr+'MANU_PART_NUMBER';       //本厂编号
 end;

 
end;

procedure TfrmCondition.BitBtn2Click(Sender: TObject); //清除条件
var i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
   sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TfrmCondition.N1Click(Sender: TObject); //删除条件
var i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i]:=sgrid1.Rows[i+1];
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

//增加条件
procedure TfrmCondition.SGrid1MouseDown(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
var column, row:longint;//右键选择stringgrid控件的方法
begin
 if button=mbright then
 begin
   SGrid1.MouseToCell(x, y, column ,row);
   SGrid1.Row:=row;
   SGrid1.Col:=column;
 end;
end;

procedure TfrmCondition.Edit3Exit(Sender: TObject);
begin
  if (trim(edit3.Text)<>'') and (listbox3.ItemIndex in [0,5,7]) then
  with dm.aqtmp do
  begin
    Close;
    case listbox3.ItemIndex of
      0: if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
           sql.Text:='select cust_code from data0010 where cust_code='''+trim(edit3.text)+''' and rkey in (SELECT customer_ptr from data0100 WHERE csi_ptr='+rkey73+')'
         else
           sql.Text:='select cust_code from data0010 where cust_code='''+trim(edit3.text)+'''';
      5:sql.Text:='select rep_code from data0009 where rep_code='''+trim(edit3.text)+'''';
      7:sql.Text:='select rkey,warehouse_code from data0015 where warehouse_code='''+trim(edit3.text)+'''';
     15: if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
           sql.Text:='select ABBR_NAME from data0010 where ABBR_NAME='''+trim(edit3.text)+''' and rkey in (SELECT customer_ptr from data0100 WHERE csi_ptr='+rkey73+')'
         else
           sql.Text:='select ABBR_NAME from data0010 where ABBR_NAME='''+trim(edit3.text)+'''';
    end;
    open;
    if isempty then
    begin
      case listbox3.ItemIndex of
        0:showmessage('找不到您输入的客户代码，请重输！');
        5:showmessage('找不到您输入的销售代表，请重输！');
        7:showmessage('找不到您输入的工厂代码，请重输！');
       15:showmessage('找不到您输入的客户代码，请重输！');
      end; //case结束
      edit3.Text:='';
      edit3.SetFocus;
    end
    else if listbox3.ItemIndex=7 then
      warehouse_ptr:=fieldvalues['rkey'];
  end;
end;

procedure TfrmCondition.PopupMenu1Popup(Sender: TObject);
begin
  n1.Enabled:=(sgrid1.Row>0) and (sgrid1.Row<sgrid1.RowCount-1);
end;

procedure TfrmCondition.FormCreate(Sender: TObject);
begin
  SGrid1.Cells[0,0]:='条件名';
  SGrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex:=0;
  SGrid1.ColWidths[2]:=-1;
  StringGrid1.Cells[0,0]:='条件名';
  StringGrid1.Cells[1,0]:='条件值';
  ListBox1.ItemIndex:=0;
  StringGrid1.ColWidths[2]:=-1;
end;

procedure TfrmCondition.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if (ListBox3.ItemIndex=13) and not (key in ['0'..'9',#8]) then abort;
end;

procedure TfrmCondition.BitBtn7Click(Sender: TObject);
var i,j:integer;
    vstr:string;
    sD1,sD2:string;
    item: TMenuItem;
begin
  frmMain.PageControl1.ActivePageIndex:=1;
   sD1:=formatdatetime('YYYY-MM-DD',DateTimePicker1.Date)+' '+formatdatetime('hh:nn:ss',DateTimePicker3.Time);
   sD2:=formatdatetime('YYYY-MM-DD',DateTimePicker2.Date)+' '+formatdatetime('hh:nn:ss',DateTimePicker4.Time);
   with dm.aqTotal do
   begin
     close;
     Parameters.ParamByName('BPODate').Value:= sD1;
     Parameters.ParamByName('EPODate').Value:= sD2;
     Parameters.ParamByName('MANU_PART_NUMBER').Value:= '';
     Parameters.ParamByName('WAREHOUSE1').Value:= '';
     Parameters.ParamByName('WAREHOUSE2').Value:= '';
   end;
   for i:=1 to StringGrid1.RowCount-2 do
   begin
     dm.aqTotal.Parameters.ParamByName(StringGrid1.Cells[2,i]).Value:= StringGrid1.Cells[1,i];
   end;
   dm.aqTotal.Open;
  frmMain.pmColumn.Items.Clear;
  for j:= 1 to frmMain.DBGridEh2.FieldCount do
  begin
    item:= TMenuItem.Create(self);
    item.Caption:= frmMain.DBGridEh2.Columns[j-1].Title.Caption;
    if frmMain.DBGridEh2.Columns[j-1].Visible then item.Checked:= true;
    item.OnClick:= item_Click;
    frmMain.pmColumn.Items.Add(item);
  end;
end;

procedure TfrmCondition.ListBox1Click(Sender: TObject);
begin
  Label3.Caption:=listbox1.Items[listbox1.itemindex];
  edtValue.Text:='';
  case listbox1.ItemIndex of
  0:begin
      BitBtn8.Visible:=False;
      Label4.Visible:=False;
    end;
  1:begin
      BitBtn8.Visible:=True;
      Label4.Visible:=True;
    end;
  2:begin
      BitBtn8.Visible:=True;
      Label4.Visible:=True;
    end;
  end;
end;

procedure TfrmCondition.Button1Click(Sender: TObject);
var i:integer;
    s:string;
begin
  for i:=1 to StringGrid1.RowCount-1 do
  if StringGrid1.Cells[0,i]=ListBox1.Items[ListBox1.itemindex]  then
  begin
    messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
    exit;
  end;

 StringGrid1.Cells[0,StringGrid1.RowCount-1]:=ListBox1.Items[ListBox1.itemindex];
 StringGrid1.Cells[1,StringGrid1.RowCount-1]:=edtValue.Text;
 
 case ListBox1.ItemIndex of
 0:
  StringGrid1.Cells[2,StringGrid1.RowCount-1]:='MANU_PART_NUMBER';
 1:
  StringGrid1.Cells[2,StringGrid1.RowCount-1]:='WAREHOUSE1';
 2:
  StringGrid1.Cells[2,StringGrid1.RowCount-1]:='WAREHOUSE2';
 end;
 StringGrid1.RowCount:=StringGrid1.RowCount+1;
end;

procedure TfrmCondition.MenuItem1Click(Sender: TObject);
var i:byte;
begin
 for i:=StringGrid1.Row to StringGrid1.RowCount-2 do
  StringGrid1.Rows[i]:=StringGrid1.Rows[i+1];
 StringGrid1.RowCount:=StringGrid1.RowCount-1;
end;

procedure TfrmCondition.BitBtn4Click(Sender: TObject);
var i:byte;
begin
 for i:=1 to StringGrid1.RowCount-1 do
   StringGrid1.Rows[i].Clear;
 StringGrid1.RowCount:=2;
end;

procedure TfrmCondition.item_Click(Sender: TObject);
var
  i:byte;
begin
  (sender as TMenuItem).Checked := not ((sender as TMenuItem).Checked);
  if (sender as TMenuItem).Checked then
  begin
    for i:= 0 to frmMain.DBGridEh2.FieldCount - 1 do
    if frmMain.DBGridEh2.Columns[i].Title.Caption = (sender as TMenuItem).Caption then
    begin
      frmMain.DBGridEh2.Columns[i].Visible:= True;
      break;
    end;
  end
  else
  begin
    for i:= 0 to frmMain.DBGridEh2.FieldCount - 1 do
    if frmMain.DBGridEh2.Columns[i].Title.Caption = (sender as TMenuItem).Caption then
    begin
      frmMain.DBGridEh2.Columns[i].Visible:= False;
      break;
    end;
  end;
end;

procedure TfrmCondition.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
   abort
  else
  if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',(sender as TEdit).Text)>0 then  //小数点不能重复
  abort;


end;

end.
