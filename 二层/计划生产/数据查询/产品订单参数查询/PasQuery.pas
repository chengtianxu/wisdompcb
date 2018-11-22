unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFrmQuery = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    GroupBox4: TGroupBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    rgType: TRadioGroup;
    edtValue: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    DTPk1: TDateTimePicker;
    DTTm1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    DTTm2: TDateTimePicker;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    GroupBox5: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioGroup2: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   v_Field_List_CN,v_Field_List_EN:Variant;
   iType2:Integer;
  public
    { Public declarations }
    iItem:Integer;
    AddSQLTxt:string;
  end;

var
  FrmQuery: TFrmQuery;

implementation
uses Pick_Item_Single,ConstVar,common, PasOrderParameter;

{$R *.dfm}

procedure TFrmQuery.FormShow(Sender: TObject);
var i:integer;
begin
  AddSQLTxt:='';
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['客户代码','本厂编号','客户型号','批量类型','产品类别','投产工厂代码','加工方式','计划完工日期','投产日期','投产类型','在线状态','当前工厂','关联原客户','测试成型备注','工序']);
  v_Field_List_EN := VarArrayOf(['Data0010.CUST_CODE','d25.MANU_PART_NUMBER','d25.Manu_Part_Desc','D25.TType','IsNULL(D25.Parent_ptr,0)','d492.whouse_ptr','Data0060.so_tp','d492.SCH_COMPL_DATE','d492.ISSUE_DATE','d492.ttype','d56.wtype','d56.loc_ptr','d25.ORIG_CUSTOMER','d25.SAMPLE_NR','data0034.Seq_Nr']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  if (iItem=0) then
  begin
    ListBox3.ItemIndex := 1;
    ListBox3.OnClick(sender);
  end else ListBox3.ItemIndex:=iItem;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  Button3.Enabled:=true;
  edtValue.Text:='';
  ComboBox1.ItemIndex:=-1;
  DTPk1.Date:=date;
  DTPk2.Date:=date;
  DTPk1.Time:=Time;
  DTPk2.Time:=Time;
  DateTimePicker1.Date:=Date-2;
  DateTimePicker2.Date:=Date;
end;

procedure TFrmQuery.N1Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQuery.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var column,row:longint;//右键选择stringgrid控件的方法
begin
  if button=mbright then
  begin
    SGrid1.MouseToCell(x,y,column,row);
    if row<>0 then SGrid1.Row:=row;
  end;
end;

procedure TFrmQuery.ListBox3Click(Sender: TObject);
var i:integer;
begin
  edtValue.text:='';
  Button3.Enabled:=listbox3.ItemIndex in [3,4,7,8,9,10];
  BitBtn6.visible :=listbox3.ItemIndex in [0,5,11,12,14];
  edtValue.Visible := (listbox3.ItemIndex <3) or (listbox3.ItemIndex = 5) or (listbox3.ItemIndex = 11) or (listbox3.ItemIndex = 12) or (ListBox3.ItemIndex = 13) or (ListBox3.ItemIndex = 14);
  rgType.Visible := not edtValue.Visible and (listbox3.ItemIndex <> 6) and (listbox3.ItemIndex <> 7) and (listbox3.ItemIndex <> 8) ;

  ComboBox1.Visible:=listbox3.ItemIndex = 6;
  GroupBox1.Visible:=listbox3.ItemIndex = 7;
  GroupBox2.Visible:=listbox3.ItemIndex = 8;
  edtValue.ReadOnly:=listbox3.ItemIndex = 8;
  GroupBox3.Visible:=listbox3.ItemIndex = 9;
  edtValue.ReadOnly:=listbox3.ItemIndex = 14;
  GroupBox5.Visible:=listbox3.ItemIndex = 14;

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
  iItem:=listbox3.ItemIndex;
end;

procedure TFrmQuery.Button4Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQuery.Button3Click(Sender: TObject);
var i,j:byte;  //修改andy081028,相同的条件项可修改值，不需先删除再增加
    sTp:string;
begin
  if (listbox3.itemindex < 3) and (trim(edtValue.Text)='') then exit;
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
    sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''''%'+edtValue.Text+'%''''';
  end
  else begin
    if listbox3.itemindex = 3 then
    begin
      sgrid1.Cells[1,j]:=rgType.Items[rgType.itemindex];
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ' +IntToStr(rgType.ItemIndex);
    end
    else if listbox3.itemindex = 5 then
    begin
      FrmOrderParameter.tmp.Close;
      FrmOrderParameter.tmp.SQL.Text:='select rkey from data0015 where warehouse_code='''+edtValue.Text+'''';
      FrmOrderParameter.tmp.Open;
      if FrmOrderParameter.tmp.IsEmpty then
      begin
        sgrid1.Cells[0,j]:='';
        showmessage('工厂代码不存在...');
        edtValue.SetFocus;
        exit;
      end ;
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+FrmOrderParameter.tmp.Fields[0].AsString;
    end else
    if listbox3.itemindex = 11 then
    begin
      FrmOrderParameter.tmp.Close;
      FrmOrderParameter.tmp.SQL.Text:='select rkey from data0015 where warehouse_code ='''+edtValue.Text+'''';
      FrmOrderParameter.tmp.Open;
      if FrmOrderParameter.tmp.IsEmpty then
      begin
        sgrid1.Cells[0,j]:='';
        showmessage('工厂代码不存在...');
        edtValue.SetFocus;
        exit;
      end ;
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+FrmOrderParameter.tmp.Fields[0].AsString;
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
      sgrid1.Cells[1,j]:='从:'+datetostr(dtpk1.Date)+'到:'+datetostr(dtpk2.Date);
      sgrid1.Cells[2,j]:=' and isnull('+v_Field_List_EN[ListBox3.ItemIndex]+',0)>='''''+datetostr(dtpk1.date)+formatdatetime(' hh:nn:ss',DTTm1.Time)+
                         ''''' and isnull('+v_Field_List_EN[ListBox3.ItemIndex]+',0)<='''''+datetostr(dtpk2.date)+formatdatetime(' hh:nn:ss',DTTm2.Time)+'''''';
    end else if listbox3.itemindex = 8 then
    begin
      sgrid1.Cells[1,j]:='从:'+datetostr(DateTimePicker1.Date)+'到:'+datetostr(DateTimePicker2.Date);
      sgrid1.Cells[2,j]:=' and isnull('+v_Field_List_EN[ListBox3.ItemIndex]+',0)>='''''+datetostr(DateTimePicker1.date)+
                         ''''' and isnull('+v_Field_List_EN[ListBox3.ItemIndex]+',0)<='''''+datetostr(DateTimePicker2.date)+'''''';
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
    if ListBox3.ItemIndex = 12 then
    begin
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''''%'+edtValue.Text+'%''''';
    end else
    if ListBox3.ItemIndex = 13 then
    begin
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''''%'+edtValue.Text+'%''''';
    end;
    if ListBox3.ItemIndex=14 then
    begin
      if RadioButton3.Checked then
      begin
        sgrid1.Cells[1,j]:=RadioButton3.Caption+edtValue.Text;
        sgrid1.Cells[2,j]:=' and isnull(data0034.seq_nr,0)<='+inttostr(edtValue.Tag);
      end else if RadioButton2.Checked then
      begin
        sgrid1.Cells[1,j]:=RadioButton2.Caption+edtValue.Text;
        sgrid1.Cells[2,j]:=' and isnull(data0034.seq_nr,0)>= '+inttostr(edtValue.Tag);
      end else  begin
        sgrid1.Cells[1,j]:=RadioButton1.Caption+edtValue.Text;
        sgrid1.Cells[2,j]:=' and isnull(data0034.seq_nr,0) = '+inttostr(edtValue.Tag);
      end  ;
    end;
  end;
  if j=sgrid1.RowCount-1 then
    sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrmQuery.ComboBox3Change(Sender: TObject);
begin
  if (ComboBox1.ItemIndex=0) then iType2:=0; //量板
  if (ComboBox1.ItemIndex=1) then iType2:=1; //样板
end;

procedure TFrmQuery.edtValueChange(Sender: TObject);
begin
  Button3.Enabled:=edtValue.Text<>'';
end;

procedure TFrmQuery.ComboBox1Change(Sender: TObject);
begin
  Button3.Enabled:=ComboBox1.Text<>'';
end;

procedure TFrmQuery.BitBtn6Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox3.ItemIndex of
    0:
    begin
      InputVar.Fields := 'Cust_Code/客户编号/100,Customer_name/客户名称/350';
      InputVar.Sqlstr :='select rKey,Cust_Code,Customer_name from data0010 order by Cust_Code';
      inputvar.KeyField:='Cust_Code';
    end;
    5:
    begin
      InputVar.Fields := 'warehouse_code/工厂编号/120,warehouse_name/工厂名称/300';
      InputVar.Sqlstr :='select rkey,(warehouse_code+''      '') as warehouse_code,warehouse_name from data0015';
      inputvar.KeyField:='warehouse_code';
    end;
    11:
    begin
      InputVar.Fields := 'warehouse_code/工厂编号/120,warehouse_name/工厂名称/300';
      InputVar.Sqlstr :='select rkey,(warehouse_code+''      '') as warehouse_code,warehouse_name from data0015';
      inputvar.KeyField:='rkey';
    end;
    12:
    begin
      InputVar.Fields := 'Cust_Code/客户编号/200,abbr_name/客户简称/120,Customer_name/客户名称/200';
      InputVar.Sqlstr :='select rKey,Cust_Code,Customer_name,abbr_name from data0010 order by Cust_Code';
      inputvar.KeyField:='abbr_name';
    end;
    14:
    begin
      InputVar.Fields := 'dept_code/工序编号/120,dept_name/工序名称/200,seq_nr/WIP序号/80';
      InputVar.Sqlstr :='select dept_code,dept_name,seq_nr from data0034 where TTYPE=''1'' and seq_nr is not null order by seq_nr';
      inputvar.KeyField:='dept_code';
    end;
  end;
  inputvar.InPut_value:=edtValue.Text;
  InputVar.AdoConn :=FrmOrderParameter.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     0:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Cust_Code']);
     5:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
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
       edtValue.Text:=trim(frmPick_Item_Single.adsPick.Fieldbyname('dept_code').asstring);
       edtValue.tag:=frmPick_Item_Single.adsPick.Fieldbyname('seq_nr').AsInteger;
     end;
    end;
    button3.SetFocus;
  end else edtValue.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;

  button3.Enabled:= trim(edtValue.Text) <> '';
end;

procedure TFrmQuery.BitBtn1Click(Sender: TObject);
var sqltmp,wo_status,sqltmp2:string;
    i:Integer;
begin
  sqltmp:='';
  sqltmp2:='';
  for i := 0 to GroupBox4.ControlCount - 1 do
    if TCheckBox(GroupBox4.Controls[i]).Checked then
      wo_status := wo_status + IntToStr
        (TCheckBox(GroupBox4.Controls[i]).Tag) + ',';
  if wo_status <> '' then
  begin
    wo_status := copy(wo_status, 1, length(wo_status) - 1);
    sqltmp := sqltmp + ' and d06.prod_status in (' + wo_status + ') ';
  end
  else
  begin
    showmessage('您必须选一个生产状态条件才能查询!');
    exit;
  end;
  if radiogroup1.ItemIndex = 0 then // 订单状态
    sqltmp2 := ' and data0060.Status<>4 '
  else if radiogroup1.ItemIndex = 1 then
    sqltmp2 := ' and data0060.Status=4 '
  else
    sqltmp2 := '';
  AddSQLTxt:=sqltmp+sqltmp2;
end;

procedure TFrmQuery.FormCreate(Sender: TObject);
begin
  iItem:=0;
end;

end.
