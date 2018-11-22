unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFrmQuery = class(TForm)
    Panel2: TPanel;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
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
    DTPk1: TDateTimePicker;
    DTTm1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    DTTm2: TDateTimePicker;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    GroupBox5: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Label6: TLabel;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
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
uses Pick_Item_Single,ConstVar,common, PasDM;

{$R *.dfm}

procedure TFrmQuery.FormShow(Sender: TObject);
var i:integer;
begin
  AddSQLTxt:='';
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['装运单号','客户代码','装运地址','装运员工','工厂代码','出具发票','业务员','市场提交时间','仓库接收时间','仓库提交时间','财务接收时间']);
  v_Field_List_EN := VarArrayOf(['data0439.delivery_no','data0010.cust_code','data0012.location','data0005.employee_name','data0015.warehouse_code','data0439.print_date','D5_5.employee_name','data0439.SALES_REP_Date','data0439.depotAccept_Date','data0439.depotSubmit_Date','data0439.Finance_Date']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  if (iItem=0) then
  begin
    ListBox3.ItemIndex := 2;
    ListBox3.OnClick(sender);
  end else ListBox3.ItemIndex:=iItem;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  Button3.Enabled:=true;
  edtValue.Text:='';
  ComboBox1.ItemIndex:=-1;
  DTPk1.Date:=DateTimePicker3.Date;
  DTPk2.Date:=DateTimePicker5.Date;
  DTTm1.Time:=DateTimePicker4.Time;
  DTTm2.Time:=DateTimePicker6.Time;
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
  Button3.Enabled:=listbox3.ItemIndex in [5,7,8,9,10];
  BitBtn6.visible :=listbox3.ItemIndex in [1,3,4,6];
  edtValue.Visible := (listbox3.ItemIndex <5) or (listbox3.ItemIndex =6);
  rgType.Visible := listbox3.ItemIndex = 5 ;

  GroupBox1.Visible:=listbox3.ItemIndex in [7,8,9,10];
  edtValue.ReadOnly:=listbox3.ItemIndex in [1,3,4,6];

  if listbox3.ItemIndex =5 then
  begin
    rgType.Items.Clear;
    rgType.Items.Add('已出具');
    rgType.Items.Add('未出具');
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
  if (listbox3.itemindex =0) or (listbox3.itemindex =2) then
  begin
    sgrid1.Cells[1,j]:=edtValue.Text;
    sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
  end
  else begin
    if listbox3.itemindex =5 then
    begin
      if rgType.ItemIndex=0 then sTp:=' <>Null' else sTp:=' is NULL';
      sgrid1.Cells[1,j]:=rgType.Items[rgType.itemindex];
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+''+sTp+'';
//    end
//    else if listbox3.itemindex = 4 then
//    begin
//      dm.tmp.Close;
//      dm.tmp.SQL.Text:='select rkey from data0015 where warehouse_code='''+edtValue.Text+'''';
//      dm.tmp.Open;
//      if dm.tmp.IsEmpty then
//      begin
//        sgrid1.Cells[0,j]:='';
//        showmessage('工厂代码不存在...');
//        edtValue.SetFocus;
//        exit;
//      end ;
//      sgrid1.Cells[1,j]:=edtValue.Text;
//      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+dm.tmp.Fields[0].AsString;
    end else
    if (listbox3.itemindex = 7) or (listbox3.itemindex = 8) or (listbox3.itemindex = 9) or (listbox3.itemindex = 10)then
    begin
      sgrid1.Cells[1,j]:='从:'+datetostr(dtpk1.Date)+'到:'+datetostr(dtpk2.Date);
      sgrid1.Cells[2,j]:=' and isnull('+v_Field_List_EN[ListBox3.ItemIndex]+',0)>='''+datetostr(dtpk1.date)+formatdatetime(' hh:nn:ss',DTTm1.Time)+
                         ''' and isnull('+v_Field_List_EN[ListBox3.ItemIndex]+',0)<='''+datetostr(dtpk2.date)+formatdatetime(' hh:nn:ss',DTTm2.Time)+'''';
    end else
    if ListBox3.ItemIndex = 3 then
    begin
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
    end else
    if (ListBox3.ItemIndex = 1) or (ListBox3.ItemIndex = 6) or (listbox3.itemindex = 4) then
    begin
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
    end;
  end;
  if j=sgrid1.RowCount-1 then
    sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrmQuery.ComboBox3Change(Sender: TObject);
begin
  if (ComboBox1.ItemIndex=0) then iType2:=0; //正常领料
  if (ComboBox1.ItemIndex=1) then iType2:=1; //损耗领料
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
    1:
    begin
      InputVar.Fields := 'CUST_CODE/客户编号/150,CUSTOMER_NAME/客户名称/350';
      InputVar.Sqlstr :='select rKey,CUST_CODE,CUSTOMER_NAME from data0010 order by CUST_CODE';
      inputvar.KeyField:='CUST_CODE';
    end;
    3,6:
    begin
      InputVar.Fields := 'EMPL_CODE/员工编号/220,EMPLOYEE_NAME/员工姓名/230';
      InputVar.Sqlstr :='select rKey,EMPL_CODE,EMPLOYEE_NAME from data0005 order by EMPL_CODE';
      inputvar.KeyField:='EMPL_CODE';
    end;
    4:
    begin
      InputVar.Fields := 'warehouse_code/工厂编号/120,warehouse_name/工厂名称/300';
      InputVar.Sqlstr :='select rkey,(warehouse_code+''      '') as warehouse_code,warehouse_name from data0015';
      inputvar.KeyField:='warehouse_code';
    end;
  end;
  inputvar.InPut_value:=edtValue.Text;
  InputVar.AdoConn :=DM.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     1:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
     3,6:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']);
     4:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
    end;
    button3.SetFocus;
  end else edtValue.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;

  button3.Enabled:= trim(edtValue.Text) <> '';
end;

procedure TFrmQuery.BitBtn1Click(Sender: TObject);
begin
  iItem:=ListBox3.ItemIndex;
end;

end.
