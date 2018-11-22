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
    cbbJS: TComboBox;
    Panel3: TPanel;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    pnl1: TPanel;
    cbx1: TComboBox;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl1: TLabel;
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure edtValueKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dtpk1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure update_sgrid(sgrid_row:byte) ;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private

    { Private declarations }

    v_Field_List_CN,v_Field_List_EN:Variant;
    grid_add_flag : Integer;
  public
    { Public declarations }
  end;

var
  frmQuerySet: TfrmQuerySet = nil;

implementation
uses common,MainFrm,Pick_Item_Single,ConstVar, DM;
{$R *.dfm}

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
//var tmpstr:string;
  var InputVar: PDlgInput ;
      s:string;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case ListBox3.ItemIndex of
      0,1,2: begin
          InputVar.Fields := 'ListNumber/父清单编号/120,MANU_PART_NUMBER/本厂编号/150,MANU_PART_DESC/客户型号/150';
          InputVar.Sqlstr := 'SELECT Data0800.RKEY, Data0800.RKEY25, Data0800.ListNumber, Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC'+
                            ' FROM Data0800 INNER JOIN Data0025 ON Data0800.RKEY25 = Data0025.RKEY';
          inputvar.KeyField:='Dept_Code';
         end;
      3,4: begin
          InputVar.Fields := 'CreateUser/创建人员/220,AuditUser/审核人员/250';
          InputVar.Sqlstr := ' SELECT Data0800.CreateBy_PTR, Data0800.AuditBy_PTR, Data0005.EMPLOYEE_NAME AS CreateUser, Data0005_1.EMPLOYEE_NAME AS AuditUser ' +
' FROM Data0800 INNER JOIN Data0025 ON Data0800.RKEY25 = Data0025.RKEY INNER JOIN Data0005 ON Data0800.CreateBy_PTR = Data0005.RKEY ' +
' INNER JOIN Data0005 AS Data0005_1 ON Data0800.AuditBy_PTR = Data0005_1.RKEY ' +
' GROUP BY Data0800.CreateBy_PTR, Data0800.AuditBy_PTR, Data0005.EMPLOYEE_NAME,Data0005_1.EMPLOYEE_NAME ';
          inputvar.KeyField:='PROD_code';
         end;
    end;

    InputVar.AdoConn := dm1.con1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    case ListBox3.ItemIndex of
       0:edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('ListNumber').AsString;
       1:edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('MANU_PART_NUMBER').AsString;
       2:edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('MANU_PART_DESC').AsString;
       
       3:
       begin
         edtValue.Tag := frmPick_Item_Single.adsPick.fieldbyname('CreateBy_PTR').AsInteger;
       edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('CreateUser').AsString;
       end;

       4:
       begin
         edtValue.Tag := frmPick_Item_Single.adsPick.fieldbyname('AuditBy_PTR').AsInteger;
       edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('AuditUser').AsString;
       end;
 
    end;
  finally
    frmPick_Item_Single.Free;
  end;

  {case ListBox3.ItemIndex of
    2:tmpstr:=pick_eng_flow(edtValue.Text,frmmain.ADOConnection1,2);
    4:tmpstr:= Pick_Prod_Type(edtValue.Text,frmMain.ADOConnection1,2);
    7:tmpstr:=Pick_Cust_ID(edtValue.Text,frmMain.ADOConnection1,2);
    12:tmpstr:=Pick_Value(edtValue.Text, frmMain.ADOConnection1, 2,1);
    else tmpstr:='';
  end;
  if tmpstr <> '' then
    edtValue.Text := tmpstr;  }
  button3.Enabled:= trim(edtValue.Text) <> '';
end;

procedure TfrmQuerySet.Button3Click(Sender: TObject);
var i:byte;
    flag : Integer;
    
begin
  flag := 0;
  grid_add_flag := 0;

  if (edtValue.Visible) and (trim(edtValue.Text)='') then exit;
  if (cbbJS.Visible) and (Trim(cbbJS.Text)='') then Exit;

  //此处判断重复，应该考虑覆盖，见A_EP002
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
   begin
    self.update_sgrid(i);
    exit;
   end;

 self.update_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;

end;


procedure TfrmQuerySet.edtValueKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{  if trim(edtValue.Text)<>'' then
   button3.Enabled:=true
  else button3.Enabled:=false;}
end;

procedure TfrmQuerySet.ListBox3Click(Sender: TObject);
begin
  //ShowMessage(IntToStr(ListBox3.ItemIndex));  层数是16
  //'父清单编号','本厂编号','客户型号','创建人员','审核人员','审核状态','有效状态'
  edtValue.Text:='';
  edtValue.Tag := 0;
  BitBtn6.visible := listbox3.ItemIndex in[0,1,2,3,4];
  cbbJS.Visible:= listbox3.ItemIndex in[5,6];
  Panel3.Visible:=ListBox3.ItemIndex=19;
  if ListBox3.ItemIndex=19 then Edit1.SetFocus;
//  (listbox3.ItemIndex = 2) or (listbox3.ItemIndex = 4)
//                 or (listbox3.ItemIndex = 7) or (listbox3.ItemIndex = 12);
  edtValue.Visible := BitBtn6.Visible;
 // rgType.Visible := not edtValue.Visible;
  rgType.Visible:= True;
  if (ListBox3.Items[ListBox3.ItemIndex] = '父清单编号') or
    (ListBox3.Items[ListBox3.ItemIndex] = '本厂编号') or
    (ListBox3.Items[ListBox3.ItemIndex] = '客户型号')
  then
  begin
    rgType.Items.Clear;
    rgType.Items.Add('相似');
    rgType.Items.Add('等于');
  end;

  if (ListBox3.Items[ListBox3.ItemIndex] = '创建人员') or
    (ListBox3.Items[ListBox3.ItemIndex] = '审核人员')
  then
  begin
    rgType.Items.Clear;
    rgType.Items.Add('等于');
  end;

  if (ListBox3.Items[ListBox3.ItemIndex] = '审核状态') or
    (ListBox3.Items[ListBox3.ItemIndex] = '有效状态')
  then
  begin
    rgType.Items.Clear;
    rgType.Items.Add('等于');
    cbbJS.Items.Clear;
    if (ListBox3.Items[ListBox3.ItemIndex] = '审核状态') then
    begin
      cbbJS.Items.Add('待审核');
      cbbJS.Items.Add('已审核');
    end;
    if (ListBox3.Items[ListBox3.ItemIndex] = '有效状态') then
    begin
      cbbJS.Items.Add('无效');
      cbbJS.Items.Add('有效');
    end;    
  end;
  if cbbJS.Items.Count > 0 then
    cbbJS.ItemIndex := 0;
  cbbJS.Style := csDropDownList;

  
  rgType.ItemIndex := 0;
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
end;

procedure TfrmQuerySet.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button3Click(sender);
end;

procedure TfrmQuerySet.Button4Click(Sender: TObject);
var i:byte;
begin
 if sgrid1.RowCount <= 2 then exit;
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmQuerySet.dtpk1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Button1.Click;
end;

procedure TfrmQuerySet.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN :=
  VarArrayOf(['父清单编号','本厂编号','客户型号','创建人员','审核人员','审核状态','有效状态'
  ]);
  v_Field_List_EN := VarArrayOf(['data0800.ListNumber','data0025.MANU_PART_NUMBER',
   'data0025.Manu_Part_Desc','data0800.CreateBy_PTR','data0800.AuditBy_PTR',
   'data0800.Status','data0800.active']);

  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  ListBox3Click(ListBox3);
end;

 procedure TfrmQuerySet.update_sgrid(sgrid_row:byte);
 begin

  if edtValue.Visible then
  begin
    if not BitBtn6.Visible then
    begin
    if grid_add_flag =2 then grid_add_flag := 1;  //不用判断，在新增情况下，窗格加 1
    if  rgType.ItemIndex = 0 then
    begin
      sgrid1.Cells[1,sgrid_row]:=' like '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%'''
    end else begin
      sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''' ;
    end;
    end else
    begin
    if grid_add_flag =2 then grid_add_flag := 1;  //不用判断，在新增情况下，窗格加 1
    if  rgType.ItemIndex = 0 then
    begin
      sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+ IntToStr(edtValue.Tag) ;
    end;
    end;
  end else
  if cbbJS.Visible then
  begin
    sgrid1.Cells[1,sgrid_row]:=' = '+ cbbJS.Text;
    sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+ IntToStr(cbbJS.ItemIndex) ;
  end;
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 end;

procedure TfrmQuerySet.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
   abort
  else
  if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',(sender as TEdit).Text)>0 then  //小数点不能重复
  abort;


end;

end.
