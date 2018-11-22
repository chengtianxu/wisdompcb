unit QuerySet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus;

type
  TfrmQuerySet = class(TForm)
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    rgType: TRadioGroup;
    rgRptType: TRadioGroup;
    rgUnit: TRadioGroup;
    rgSumType: TRadioGroup;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox3: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBox4: TGroupBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    rgBB: TRadioGroup;
    Panel3: TPanel;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dtpk1KeyPress(Sender: TObject; var Key: Char);
    procedure edtValueChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
  end;

var
  frmQuerySet: TfrmQuerySet;

implementation
uses common,DataSheet,Pick_Item_Single,ConstVar,dm;
{$R *.dfm}

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
//var tmpstr:string;
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox3.ItemIndex of
    0:
    begin
      InputVar.Fields := 'Cust_Code/客户编号/200,Customer_name/客户名称/200';
      InputVar.Sqlstr :='select rKey,Cust_Code,Customer_name from data0010 order by Cust_Code';
      inputvar.KeyField:='Cust_Code';
    end;
    5:
    begin
      InputVar.Fields := 'warehouse_code/工厂编号/200,warehouse_name/工厂名称/200';
      InputVar.Sqlstr :='select rkey,(warehouse_code+''      '') as warehouse_code,warehouse_name from data0015';
      inputvar.KeyField:='warehouse_code';
    end;
    8:
    begin
      InputVar.Fields := 'dept_code/工序编号/120,dept_name/工序名称/200,Seq_Nr/WIP序号/80';
      InputVar.Sqlstr :='select dept_code,dept_name,seq_nr from data0034 '+
      'where TTYPE=''1'' and seq_nr is not null  order by seq_nr';
      inputvar.KeyField:='dept_code';
    end;
    11:
    begin
      InputVar.Fields := 'warehouse_code/工厂编号/200,warehouse_name/工厂名称/200';
      InputVar.Sqlstr :='select rkey,(warehouse_code+''      '') as warehouse_code,warehouse_name from data0015';
      inputvar.KeyField:='rkey';
    end;
    12:
    begin
      InputVar.Fields := 'Cust_Code/客户编号/200,abbr_name/客户简称/120,Customer_name/客户名称/200';
      InputVar.Sqlstr :='select rKey,Cust_Code,Customer_name,abbr_name from data0010 order by Cust_Code';
      inputvar.KeyField:='abbr_name';
    end;
    14://产品阶数
    begin
      InputVar.Fields := 'TVALUE/产品阶数/400';
//      InputVar.Sqlstr :='select rKey,Cust_Code,Customer_name,abbr_name from data0010 order by Cust_Code';
      InputVar.Sqlstr := ' SELECT d338.TVALUE FROM data0278 d278 ' +
                        ' INNER JOIN data0338 d338 on d278.RKEY = d338.PARAMETER_PTR ' +
                        ' WHERE d278.SPEC_RKEY = ''js'' ';
      inputvar.KeyField:='TVALUE';
    end;
    15://产品类别
    begin
      InputVar.Fields := 'PROD_CODE/类别代码/200,PRODUCT_NAME/类别名/200';
      InputVar.Sqlstr := 'SELECT RKEY,PROD_CODE,PRODUCT_NAME FROM data0008';
      InputVar.KeyField:= 'rkey';
    end;
    16://产品组别
    begin
      InputVar.Fields := 'PR_GRP_CODE/组别代码/200,PRODUCT_GROUP_NAME/组别名称/200';
      InputVar.Sqlstr := 'SELECT RKEY,PR_GRP_CODE,PRODUCT_GROUP_NAME FROM Data0007';
      InputVar.KeyField:= 'rkey';
    end;
    17://配料单
    begin
      InputVar.Fields := 'CUT_NO/配料单号/200,SO_NO/销售订单号/200';
      InputVar.Sqlstr := 'SELECT RKEY,CUT_NO,SO_NO FROM Data0492';
      InputVar.KeyField:= 'rkey';
    end;
  end;
  inputvar.InPut_value:=edtValue.Text;
  InputVar.AdoConn := dmcon.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     0:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Cust_Code']);
     5:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
     8:begin
        edtValue.Text:=trim(frmPick_Item_Single.adsPick.Fieldbyname('dept_code').asstring);
        edtValue.tag:=frmPick_Item_Single.adsPick.Fieldbyname('seq_nr').AsInteger;
       end;
     11:
     begin
        edtValue.Text:=trim(frmPick_Item_Single.adsPick.Fieldbyname('warehouse_code').asstring);
        edtValue.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
     end;
     12:
     begin
        edtValue.Text:=trim(frmPick_Item_Single.adsPick.Fieldbyname('abbr_name').asstring);
     end;
     14:
     begin
        edtValue.Text:=trim(frmPick_Item_Single.adsPick.Fieldbyname('TVALUE').asstring);
     end;
     15:
     begin
        edtValue.Text:=trim(frmPick_Item_Single.adsPick.Fieldbyname('PRODUCT_NAME').asstring);
        edtValue.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
     end;
     16:
     begin
        edtValue.Text:=trim(frmPick_Item_Single.adsPick.Fieldbyname('PRODUCT_GROUP_NAME').asstring);
        edtValue.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
     end;
     17:
     begin
        edtValue.Text:=trim(frmPick_Item_Single.adsPick.Fieldbyname('CUT_NO').asstring);
        edtValue.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
     end;
    end;
    button3.SetFocus;
  end else edtValue.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;

  button3.Enabled:= trim(edtValue.Text) <> '';
end;

procedure TfrmQuerySet.Button3Click(Sender: TObject);
var i,j:byte;  //修改andy081028,相同的条件项可修改值，不需先删除再增加
    sTp:string;
begin
  if ((listbox3.itemindex < 3) or (listbox3.itemindex = 18)) and (trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-1 do
  begin
   if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
   begin
     j:=i;
     break;
   end;
   j:=sgrid1.RowCount-1;
  end;

  sgrid1.Cells[0,j]:=listbox3.Items[listbox3.itemindex];
  if listbox3.itemindex < 3 then
  begin
    sgrid1.Cells[1,j]:=edtValue.Text;
    sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
  end
  else begin
    if listbox3.itemindex = 3 then
    begin
      sgrid1.Cells[1,j]:=rgType.Items[rgType.itemindex];
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ' +IntToStr(rgType.ItemIndex);
    end
    else if listbox3.itemindex = 5 then
    begin
      dmcon.tmp.Close;
      dmcon.tmp.SQL.Text:='select rkey from data0015 where warehouse_code='''+edtValue.Text+'''';
      dmcon.tmp.Open;
      if dmcon.tmp.IsEmpty then
      begin
        sgrid1.Cells[0,j]:='';
        showmessage('工厂代码不存在...');
        edtValue.SetFocus;
        exit;
      end ;
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+dmcon.tmp.Fields[0].AsString;
    end else
    if listbox3.itemindex = 11 then
    begin
      dmcon.tmp.Close;
      dmcon.tmp.SQL.Text:='select rkey from data0015 where warehouse_code like ''%'+edtValue.Text+'%''';
      dmcon.tmp.Open;
      if dmcon.tmp.IsEmpty then
      begin
        sgrid1.Cells[0,j]:='';
        showmessage('工厂代码不存在...');
        edtValue.SetFocus;
        exit;
      end ;
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+dmcon.tmp.Fields[0].AsString;
    end
    else if listbox3.itemindex = 4 then
    begin // listbox3.itemindex = 4
      if rgType.itemindex =0 then
      begin
        sgrid1.Cells[1,j]:=rgType.Items[rgType.itemindex];
        sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ' +IntToStr(rgType.ItemIndex);
      end
      else begin
        sgrid1.Cells[1,j]:=rgType.Items[rgType.itemindex];
        sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' > 0' ;
      end
    end else if listbox3.itemindex = 6 then
    begin
      sgrid1.Cells[1,j]:=ComboBox1.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+inttostr(ComboBox1.ItemIndex);
    end else if listbox3.itemindex = 7 then
    begin
      sgrid1.Cells[1,j]:='从:'+datetostr(DateTimePicker1.Date)+'到:'+datetostr(DateTimePicker2.Date);
      sgrid1.Cells[2,j]:=' and isnull('+v_Field_List_EN[ListBox3.ItemIndex]+',0)>='''+datetostr(DateTimePicker1.Date)+
                         ''' and isnull('+v_Field_List_EN[ListBox3.ItemIndex]+',0)<='''+datetostr(DateTimePicker2.Date)+'''';
    end else if listbox3.itemindex = 8 then
    begin
      if RadioButton3.Checked then
      begin
        sgrid1.Cells[1,j]:=RadioButton3.Caption+edtValue.Text;
        sgrid1.Cells[2,j]:=' and isnull(d34.seq_nr,0)<='+inttostr(edtValue.Tag);
      end else if RadioButton2.Checked then
      begin
        sgrid1.Cells[1,j]:=RadioButton2.Caption+edtValue.Text;
        sgrid1.Cells[2,j]:=' and isnull(d34.seq_nr,0)>= '+inttostr(edtValue.Tag);
      end else  begin
        sgrid1.Cells[1,j]:=RadioButton1.Caption+edtValue.Text;
        sgrid1.Cells[2,j]:=' and isnull(d34.seq_nr,0) = '+inttostr(edtValue.Tag);
      end  ;
    end else if listbox3.itemindex = 9 then
    begin
       sTp:='';
       for i:=0 to GroupBox3.ControlCount-1 do
         if TCheckBox(GroupBox3.Controls[i]).Checked then
           sTp:=sTp+inttostr(TCheckBox(GroupBox3.Controls[i]).Tag)+',';
      if sTp<>'' then
      begin
        sgrid1.Cells[1,j]:=copy(sTp,1,length(sTp)-1);
        sgrid1.Cells[2,j]:=' and d492.Ttype in ('+sTp+'159)';
      end;
    end else if listbox3.itemindex = 10 then
    begin
      if rgType.ItemIndex=0 then
      begin
        sgrid1.Cells[1,j]:='正常';
        sgrid1.Cells[2,j]:=' and isnull(d56.wType,0)=0';
      end else
      begin
        sgrid1.Cells[1,j]:='返工';
        sgrid1.Cells[2,j]:=' and isnull(d56.wType,0)>0';
      end;
    end else
    if ListBox3.ItemIndex = 12 then //关联原客户
    begin
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ' + QuotedStr(edtValue.Text);
    end else
    if ListBox3.ItemIndex = 13 then //测试成型备注
    begin
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ' + QuotedStr('%'+edtValue.Text+'%');
    end else
    if ListBox3.ItemIndex = 14 then //CPJS
    begin
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ' + QuotedStr('%'+edtValue.Text+'%');
    end else
    if ListBox3.ItemIndex = 15 then //产品类别
    begin
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ' + inttostr(edtValue.Tag);
    end else
    if ListBox3.ItemIndex = 16 then //产品组别
    begin
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ' + inttostr(edtValue.Tag);
    end else
    if ListBox3.ItemIndex = 17 then //配料单
    begin
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ' + QuotedStr(edtValue.Text);
    end;
    if listbox3.itemindex = 18 then //客户物料号
    begin
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
    end ;

    if listbox3.itemindex = 19 then //定单面积
    begin
      sgrid1.Cells[1,j]:=ComboBox3.Text+edit1.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+ComboBox3.Text+edit1.Text;
    end;
    if listbox3.itemindex =20 then //层数
    begin
      if RadioButton3.Checked then
      begin
        sgrid1.Cells[1,j]:=RadioButton3.Caption+edtValue.Text;
        sgrid1.Cells[2,j]:=' and isnull(d25.LAYERS,0)<='+edtValue.Text;
      end else if RadioButton2.Checked then
      begin
        sgrid1.Cells[1,j]:=RadioButton2.Caption+edtValue.Text;
        sgrid1.Cells[2,j]:=' and isnull(d25.LAYERS,0)>= '+edtValue.Text;
      end else  begin
        sgrid1.Cells[1,j]:=RadioButton1.Caption+edtValue.Text;
        sgrid1.Cells[2,j]:=' and isnull(d25.LAYERS,0) = '+edtValue.Text;
      end;
    end;
  end;
  if j=sgrid1.RowCount-1 then
    sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TfrmQuerySet.FormShow(Sender: TObject);
var i:integer;
begin
  listbox3.Items.clear;
  v_Field_List_CN := VarArrayOf(['客户代码','本厂编号','客户型号','批量类型','产品类别','投产工厂代码','加工方式','计划完工期','工序','投产类型','在线状态','当前工厂','关联原客户','测试成型备注','产品阶数','产品类型','产品组别','配料单编号','客户物料号','定单面积','层数']);
  v_Field_List_EN := VarArrayOf(['D10.Cust_Code','d25.MANU_PART_NUMBER','d25.Manu_Part_Desc','D25.TType','IsNULL(D25.Parent_ptr,0)','d492.whouse_ptr','d60.so_tp','d492.SCH_COMPL_DATE','d34.Seq_Nr','d492.ttype','d56.wtype','d56.loc_ptr','d25.ORIG_CUSTOMER','d25.SAMPLE_NR','d25.CPJS','d25.PROD_CODE_PTR','d08.PR_GRP_POINTER','d492.CUT_NO','D25.ANALYSIS_CODE_2',' d60.parts_ordered * d25.unit_sq','d25.LAYERS']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 1;
  ListBox3.OnClick(sender);
  edtValue.Text:='';
  ComboBox1.ItemIndex:=-1;
  DateTimePicker1.Date:=date;
  DateTimePicker2.Date:=date;
end;

procedure TfrmQuerySet.ListBox3Click(Sender: TObject);
begin
  edtValue.text:='';
  Button3.Enabled:=listbox3.ItemIndex in [3,4,7,9,10,20];
  BitBtn6.visible :=listbox3.ItemIndex in [0,5,8,11,12,14,15,16,17];
  edtValue.Visible := (listbox3.ItemIndex <3) or (listbox3.ItemIndex = 5) or (listbox3.ItemIndex = 11) or (listbox3.ItemIndex = 8) or (listbox3.ItemIndex = 12) or (ListBox3.ItemIndex = 13) or (ListBox3.ItemIndex in [14,15,16,17,18,20]);
  rgType.Visible := listbox3.ItemIndex in [3,4,10];

  ComboBox1.Visible:=listbox3.ItemIndex = 6;
  GroupBox1.Visible:=listbox3.ItemIndex = 7;
  GroupBox2.Visible:=listbox3.ItemIndex in [8,20];

  edtValue.ReadOnly:=listbox3.ItemIndex=8;
  GroupBox3.Visible:=listbox3.ItemIndex = 9;

  Panel3.Visible:=ListBox3.ItemIndex=19;
  if ListBox3.ItemIndex=19 then
  begin
   Edit1.SetFocus;
   Edit1.Clear;
   end;
  
  if listbox3.ItemIndex =3 then
  begin
    rgType.Items.Clear;
    rgType.Items.Add('量产板');
    rgType.Items.Add('样板板');
    rgType.ItemIndex:=0;
  end
  else if listbox3.ItemIndex =4 then
  begin
    rgType.Items.Clear;
    rgType.Items.Add('外层');
    rgType.Items.Add('内层');
    rgType.ItemIndex:=0;
  end
  else if listbox3.ItemIndex =10 then
  begin
    rgType.Items.Clear;
    rgType.Items.Add('正常');
    rgType.Items.Add('返工');
    rgType.ItemIndex:=0;
  end;
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];

end;

procedure TfrmQuerySet.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
  if (ListBox3.ItemIndex=20) then
  begin
    if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
      abort
  end;
  if key=#13 then
    Button3Click(sender);
end;

procedure TfrmQuerySet.N1Click(Sender: TObject);
var i:byte;
begin
 if sgrid1.RowCount <= 2 then exit;
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmQuerySet.Button4Click(Sender: TObject);
var i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TfrmQuerySet.dtpk1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Button1.Click;
end;

procedure TfrmQuerySet.edtValueChange(Sender: TObject);
begin
  Button3.Enabled:=edtValue.Text<>'';
end;

procedure TfrmQuerySet.ComboBox1Change(Sender: TObject);
begin
  Button3.Enabled:=ComboBox1.Text<>'';
end;

procedure TfrmQuerySet.Button1Click(Sender: TObject);
var i:integer;

begin
  if rgSumType.ItemIndex=0 then
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]='工序' then
      begin
        showmessage('按班组汇总不能加工序条件...') ;
        exit;
      end ;
  end;
  modalresult:=mrok;
end;

procedure TfrmQuerySet.CheckBox1Click(Sender: TObject);
var i:integer;
begin
  Button3.Enabled:=false;
  for i:=0 to GroupBox3.ControlCount-1 do
   if TCheckBox(GroupBox3.Controls[i]).Checked then
  begin  Button3.Enabled:=true;exit; end;
end;

procedure TfrmQuerySet.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
   abort
  else
  if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',(sender as TEdit).Text)>0 then  //小数点不能重复
  abort;

  Button3.Enabled:=Trim(Edit1.Text)<>'';


end;

procedure TfrmQuerySet.Edit1Change(Sender: TObject);
begin
  Button3.Enabled:=Edit1.Text<>'';
end;

end.
