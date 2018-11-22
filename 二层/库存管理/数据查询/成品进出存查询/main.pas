unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, Buttons, ComCtrls, DB, ADODB, Menus;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Button1: TButton;
    BitBtn4: TBitBtn;
    ListBox1: TListBox;
    StaticText1: TStaticText;
    Edit1: TEdit;
    RGp2: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    RadioGroup1: TRadioGroup;
    ADOConnection1: TADOConnection;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DTpk4: TDateTimePicker;
    DTPk3: TDateTimePicker;
    Button2: TButton;
    BitBtn5: TBitBtn;
    ListBox2: TListBox;
    StaticText3: TStaticText;
    Edit2: TEdit;
    RGp3: TRadioGroup;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DTPk6: TDateTimePicker;
    DTPk5: TDateTimePicker;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText4: TStaticText;
    Edit3: TEdit;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DTpk8: TDateTimePicker;
    DTPk7: TDateTimePicker;
    Button4: TButton;
    BitBtn7: TBitBtn;
    StaticText5: TStaticText;
    Edit4: TEdit;
    ListBox4: TListBox;
    RadioGroup2: TRadioGroup;
    RGp4: TRadioGroup;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Button5: TButton;
    BitBtn8: TBitBtn;
    ListBox5: TListBox;
    StaticText6: TStaticText;
    Edit5: TEdit;
    GroupBox6: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DTPk12: TDateTimePicker;
    DTPk11: TDateTimePicker;
    Button6: TButton;
    BitBtn9: TBitBtn;
    ListBox6: TListBox;
    StaticText7: TStaticText;
    Edit6: TEdit;
    BitBtn10: TBitBtn;
    Label_rkey15: TLabel;
    GroupBox7: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DTPk14: TDateTimePicker;
    DTPk13: TDateTimePicker;
    Button7: TButton;
    BitBtn11: TBitBtn;
    ListBox7: TListBox;
    StaticText8: TStaticText;
    Edit7: TEdit;
    RadioGroup3: TRadioGroup;
    Label_rkey16: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    RadioGroup4: TRadioGroup;
    ADOQuery1: TADOQuery;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    DateTimePicker7: TDateTimePicker;
    DateTimePicker8: TDateTimePicker;
    dttm3: TDateTimePicker;
    dttm4: TDateTimePicker;
    dttm11: TDateTimePicker;
    dttm12: TDateTimePicker;
    ComboBox1: TComboBox;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    RadioGroup7: TRadioGroup;
    RadioGroup8: TRadioGroup;
    Label22: TLabel;
    Label23: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    rgIsChaBan: TRadioGroup;
    rg1: TRadioGroup;
    rg2: TRadioGroup;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RGp4Click(Sender: TObject);
    procedure ListBox5Click(Sender: TObject);
    procedure Edit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ListBox6Click(Sender: TObject);
    procedure Edit6KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure ListBox7Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Edit7DblClick(Sender: TObject);
    procedure Edit3DblClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    IsFirstShow:Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses //part_search, warehouse_search, location_search,customer_search, prod_search,Employee_search,
   common,part_in,Pick_Item_Single,ConstVar,
   part_out, part_quantity, fgtransfer,
   rece_total, putout_total, rece_put_stock, warehouse_mixi, wh_search;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;


//   rkey73:='3';
//   vprev:='4';
//   ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  listbox1.Selected[0]:=true;

  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  IsFirstShow:=True;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
label2.Caption:=listbox1.Items[listbox1.itemindex];
 label3.Visible:=false;
 label4.Visible:=false;

 self.DateTimePicker1.Visible:=false;
 self.DateTimePicker2.Visible:=false;

 self.DateTimePicker3.Visible:=false;
 self.DateTimePicker4.Visible:=false;
 bitbtn4.Visible:=false;
 button1.Enabled:=false;
 rgp2.Visible:=false;
 edit1.Visible:=true;
 edit1.Text:='';
 rgIsChaBan.Visible := False;
 ComboBox7.Visible:=False;
case listbox1.ItemIndex of
 0:;
 1,2,3,4:
 begin
  bitbtn4.Visible:=true;
 end;

 5:
 begin
  edit1.Visible:=false;
  button1.Enabled:=true;
  label3.Visible:=true;
  label4.Visible:=true;

  self.DateTimePicker1.Visible:=true;
  self.DateTimePicker2.Visible:=true;

  self.DateTimePicker3.Visible:=true;
  self.DateTimePicker4.Visible:=true;
 end;

 6,11:rgp2.Visible:=true;

 7,13,17,18:bitbtn4.Visible:=true;
 8:;
 9:;
 10:;
 12:;
 14:
 begin
   rgIsChaBan.Visible := True;
   Edit1.Visible := False;
   button1.Enabled:=True;
 end;
 16:
 begin
   ComboBox7.Visible:=True;
   ComboBox7.Items.Clear;
   ComboBox7.Style:=csDropDown;
   ADOQuery1.Close;
   ADOQuery1.SQL.Text:='select data0338.tvalue from data0278 inner join data0338 on data0278.Rkey=data0338.parameter_ptr where  data0278.SPEC_RKEY=''js''';
   ADOQuery1.Open;
   while not ADOQuery1.Eof do
   begin
     ComboBox7.Items.Add(ADOQuery1.FieldBYName('tvalue').AsString);
     ADOQuery1.Next;
   end;
    ComboBox7.ItemIndex:=-1;
    Edit1.Visible:=False;
    button1.Enabled:=True;
 end;
end;

end;

procedure TForm1.BitBtn4Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case listbox1.ItemIndex of
    1:
    begin
      InputVar.Fields := 'manu_part_number/本厂编号/100,manu_part_desc/客户型号/150,bath_former/性质/100';
      InputVar.Sqlstr :='select  rkey,manu_part_number,manu_part_desc, customer_ptr,'+
                        'case data0025.ttype when 0 then ''批量'' when 1 then ''样板'' end bath_former '+
                        'from  data0025 '+
                        'where data0025.PARENT_PTR is null '+
                        'order by manu_part_number';
      inputvar.KeyField:='manu_part_number';
    end;
    2:
    begin
      InputVar.Fields :='PR_GRP_CODE/组别代码/100,PRODUCT_GROUP_NAME/组别名称/250';
      InputVar.Sqlstr :='select rkey,PR_GRP_CODE,product_group_name from data0007 order by pr_grp_code';
      InputVar.KeyField:='PR_GRP_CODE';
    end;
    3:
    begin
      InputVar.Fields := 'CODE/仓库代码/200,LOCATION/仓库名称/250';
      InputVar.Sqlstr :='SELECT RKEY,CODE,LOCATION FROM Data0016 where location_type=1 ORDER BY CODE';
      inputvar.KeyField:='CODE';
    end;

    4:
    begin
      InputVar.Fields := 'cust_code/客户代码/200,customer_name/客户名称/250';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
    end;
    7:
    begin
      InputVar.Fields := 'prod_code/产品类别/200,product_name/类别名称/250';
      InputVar.Sqlstr := 'select rkey,prod_code,product_name from data0008 order by prod_code';
      inputvar.KeyField := 'prod_code';
    end;
   13:
    begin
      InputVar.Fields := 'cust_code/客户代码/100,customer_name/客户名称/250,ABBR_NAME/客户简称/150';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name,ABBR_NAME '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='ABBR_NAME';
    end;
    17:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,ABBR_NAME/工厂简称/150,WAREHOUSE_NAME/工厂全称/250';
      InputVar.Sqlstr :='SELECT  RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME,ABBR_NAME '+
                        'FROM  Data0015 ORDER BY  WAREHOUSE_CODE';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;
    18:
    begin
      InputVar.Fields := 'CURR_CODE/货币代码/200,CURR_NAME/货币名称/250';
      InputVar.Sqlstr :='select rkey,CURR_CODE,CURR_NAME from data0001 order by CURR_CODE';
      inputvar.KeyField:='CURR_CODE';
    end;
  end;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case listbox1.ItemIndex of
     1:begin
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_number']);
         button1.Enabled:=true;
         button1.SetFocus;
       end;
     2: begin
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PR_GRP_CODE']);
         button1.Enabled:=true;
         button1.SetFocus;
        end;


     3:begin
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
         button1.Enabled:=true;
         button1.SetFocus;
       end;
     4:begin
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
         button1.Enabled:=true;
         button1.SetFocus;
       end;
     7:begin
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['prod_code']);
         button1.Enabled:=true;
         button1.SetFocus;
       end;
     13:begin
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME']);
         button1.Enabled:=true;
         button1.SetFocus;
        end;
     17:
        begin
//          Edit1.Text:=trim(frmPick_Item_Single.adsPick.Fieldbyname('PRODUCT_GROUP_NAME').asstring);
//          Edit1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
//          Button1.Enabled:=True;
//          Button1.SetFocus;
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         button1.Enabled:=true;
         button1.SetFocus;
        end;

     18:begin
         edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CURR_CODE']);
         button1.Enabled:=true;
         button1.SetFocus;
        end;


    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;

end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if trim(edit1.Text)<>'' then
  button1.Enabled:=true
 else
  button1.Enabled:=false;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if listbox1.ItemIndex=6then
if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
 abort
else
 if key = chr(46) then      //判断是否重复输入小数点'.'
  if pos('.',edit1.Text)>0
   then abort;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
 i:byte;
 quantity,total_lucre,total_taxlucre,mianji,weight,total_tax_amount,totalInventory,totalProportion,totalQuantity,totalmianji:double;
begin
 quantity:=0;
 total_lucre:=0;
 total_taxlucre:=0;
 mianji:=0;
 weight:=0;
 total_tax_amount:=0;
 totalInventory:=0;
 totalProportion:=0;
 totalQuantity:=0;
 totalmianji:=0;
 screen.Cursor:=crsqlwait;
case radiogroup1.ItemIndex of
0:
 begin
 if rgp4.ItemIndex=0 then //入仓明细
 begin
  if sgrid1.RowCount=2 then
   begin
    messagedlg('请首先定义查询条件!',mtinformation,[mbok],0);
    screen.Cursor:=crdefault;
   end
  else
  begin
    form2:=tform2.Create(application);
    with form2.ado53 do
     begin
      close;
      for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
      if radiogroup3.ItemIndex<>2 then
       sql.Insert(sql.Count-1,'and data0025.ttype='+inttostr(radiogroup3.ItemIndex));
      if combobox4.ItemIndex<>combobox4.Items.Count-1 then
       sql.Insert(sql.Count-1,'and data0053.rma_ptr='+inttostr(combobox4.ItemIndex));
      if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
       sql.Insert(sql.Count-1,'and data0010_2.rkey in (SELECT CUSTOMER_PTR '+
                              'FROM dbo.DATA0100 '+
                              'WHERE CSI_PTR = '+ rkey73+')');
      Prepared;                        
      open;
     end;

   while not form2.ado53.Eof do
    begin
     quantity:=quantity+form2.ADO53QUANTITY.Value;
     total_lucre:=total_lucre+form2.ado53QUANTITY.Value*
                              form2.ado53latest_PRICE.Value;
     total_taxlucre:=total_taxlucre+form2.ado53QUANTITY.Value*
                              form2.ado53taxlatest_PRICE.Value;
     if RadioGroup8.ItemIndex=0 then
      mianji:=mianji+form2.ADO53so_mianqi.Value  //不含板边面积
     else
      mianji:=mianji+form2.ADO53total_sq.Value;  //含板边面积
     form2.ado53.Next;
    end;
   form2.ado53.First;

   if RadioGroup8.ItemIndex=0 then
     Form2.DBGrid1.Columns[13].FieldName:='so_mianqi'
   else
     Form2.DBGrid1.Columns[13].FieldName:='total_sq';

  form2.Edit1.Text:=formatfloat('0.00',quantity);
  form2.Edit2.Text:=formatfloat('0.0000',total_lucre);
  form2.Edit3.Text:=formatfloat('0.00000',mianji);
  form2.Edit4.Text:=formatfloat('0.0000',total_taxlucre);
  if strtoint(vprev) <= 2 then
   begin
    form2.Edit2.Visible := false;
    form2.Label2.Visible := false;
    form2.Edit4.Visible :=false;
    form2.Label5.Visible :=false;
    form2.DBGrid1.Columns[17].Visible := false;
    form2.DBGrid1.Columns[18].Visible := false;
    form2.DBGrid1.Columns[19].Visible := false;
    form2.DBGrid1.Columns[20].Visible := false;
    form2.DBGrid1.Columns[21].Visible := false;
    form2.DBGrid1.Columns[23].Visible := false;
   end;
  form1.Hide;
  form2.ShowModal;
  form2.free;
  end;
 end
else //入仓汇总
 begin
  form6 := tform6.Create(application);
  with form6.adoquery1 do
   begin
    close;
    for i := 1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);
    if radiogroup3.ItemIndex<>2 then
     sql.Insert(sql.Count-2,'and data0025.ttype='+inttostr(radiogroup3.ItemIndex));
    if combobox4.ItemIndex<>combobox4.Items.Count-1 then
     sql.Insert(sql.Count-2,'and data0053.rma_ptr='+inttostr(combobox4.ItemIndex));
    if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
     sql.Insert(sql.Count-2,'and data0010.rkey in (SELECT CUSTOMER_PTR '+
                            'FROM dbo.DATA0100 '+
                            'WHERE CSI_PTR = '+ rkey73+')');
    Prepared;                              
    open;
   end;

 {  while not form6.adoquery1.Eof do
   begin
    quantity:=quantity+form6.ADOQuery1rece_total.Value;
    total_lucre := total_lucre+form6.ADOQuery1so_mianqi.Value;
    form6.adoquery1.Next;
   end;
   form6.adoquery1.First;
   form6.Edit1.Text:=formatfloat('0',quantity);
   form6.Edit2.Text:=formatfloat('0.0000',total_lucre);
}
   if strtoint(vprev)<=2 then       //权限
    begin
     //form6.DBGrideh1.Columns[10].Visible :=false;
    //form6.DBGrideh1.Columns[11].Visible :=false;
     //form6.DBGrideh1.Columns[12].Visible :=false;

     form6.DBGrideh1.Columns[12].Visible :=false;
     form6.DBGrideh1.Columns[13].Visible :=false;
     form6.DBGrideh1.Columns[14].Visible :=false;

    end;
   form1.Hide;
   form6.ShowModal;
   form6.Free;

 end;
end;
1:
 begin
 if rgp4.ItemIndex=0 then //出仓明细
 begin
 if sgrid1.RowCount=2 then
  begin
   messagedlg('请首先定义查询条件!',mtinformation,[mbok],0);
   screen.Cursor:=crdefault;
  end
 else
  begin
   form3:=tform3.Create(application);
   with form3.ado52 do
   begin
    close;
    for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
    case rgp3.ItemIndex of
     0:sql.Insert(sql.Count-1,'and data0064.PACKING_SLIP_FLAG=''1''');
     1:sql.Insert(sql.Count-1,'and data0064.PACKING_SLIP_FLAG=''0''');
    end;
    if radiogroup3.ItemIndex<>2 then
     sql.Insert(sql.Count-1,'and data0025.ttype='+inttostr(radiogroup3.ItemIndex));
    if radiogroup4.ItemIndex<>2 then
     sql.Insert(sql.Count-1,'and data0064.assign_type='+inttostr(radiogroup4.ItemIndex));
    if combobox4.ItemIndex<>combobox4.Items.Count-1 then
     sql.Insert(sql.Count-1,'and data0053.rma_ptr='+inttostr(combobox4.ItemIndex));
    if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
     sql.Insert(sql.Count-1,'and data0010.rkey in (SELECT CUSTOMER_PTR '+
                            'FROM dbo.DATA0100 '+
                            'WHERE CSI_PTR = '+ rkey73+')');
    Prepared;
    open;
   end;
 { if form3.ADO52.IsEmpty then
   begin
    messagedlg('对不起,没有找到符合条件的数据!',mtinformation,[mbok],0);
    screen.Cursor:=crdefault;
    exit;
   end;  }
  form3.ado52.DisableControls;
  while not form3.ado52.Eof do
   begin
    quantity:=quantity+form3.ADO52QUAN_shp.Value;
    total_lucre:=total_lucre+form3.ado52amount.Value;
    total_taxlucre:=total_taxlucre+form3.ado52taxamount.Value;
    if RadioGroup8.ItemIndex=0 then
     mianji:=mianji+form3.ado52so_mianji.Value
    else
     mianji:=mianji+form3.ado52total_sq.Value;
    weight:=weight+form3.ado52out_weight.Value;
    form3.ado52.Next;
   end;
   form3.ado52.First;
   form3.ado52.EnableControls;
   form3.Edit1.Text:=formatfloat('0.00',quantity);
   form3.Edit2.Text:=formatfloat('0.0000',total_lucre);
   form3.Edit3.Text:=formatfloat('0.0000',mianji);
   form3.Edit4.Text:=formatfloat('0.0000',weight);
   form3.Edit5.Text:=formatfloat('0.0000',total_taxlucre);
    if RadioGroup8.ItemIndex=0 then
     Form3.DBGrid1.Columns[11].FieldName:='so_mianji'
    else
     Form3.DBGrid1.Columns[11].FieldName:='total_sq';
   if strtoint(vprev)<=2 then       //权限
   begin
    form3.Edit2.Visible:=false;
    form3.Label2.Visible:=false;
    form3.Edit5.Visible:=false;
    form3.Label6.Visible:=false;

    form3.DBGrid1.Columns[21].Visible:=false;
    form3.DBGrid1.Columns[22].Visible:=false;
    form3.DBGrid1.Columns[23].Visible:=false;
    form3.DBGrid1.Columns[24].Visible:=false;
    form3.DBGrid1.Columns[25].Visible:=false;
    form3.DBGrid1.Columns[26].Visible:=false; //成本    
   end;
   form1.Hide;
   form3.ShowModal;
   form3.free;
  end;
 end
 else   // 出仓汇总
  begin
   form7 := tform7.Create(application);

   if strtoint(vprev)<=2 then       //权限
   begin
     form7.Edit3.Visible  :=false;
     form7.Label4.Visible :=false;
     form7.Edit4.Visible  :=false;
     form7.Label5.Visible :=false;
     form7.Edit5.Visible  :=false;
     form7.Label6.Visible :=false;
     form7.DBGrid1.Columns[10].Visible :=false;
     form7.DBGrid1.Columns[11].Visible :=false;
     form7.DBGrid1.Columns[12].Visible :=false;
   end;

   with form7.adoquery1 do
   begin
    close;
    for i := 1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-3,sgrid1.Cells[2,i]);
    case rgp3.ItemIndex of
     0:sql.Insert(sql.Count-3,'and data0064.PACKING_SLIP_FLAG=''1''');
     1:sql.Insert(sql.Count-3,'and data0064.PACKING_SLIP_FLAG=''0''');
    end;
    if radiogroup3.ItemIndex<>2 then
     sql.Insert(sql.Count-3,'and data0025.ttype='+inttostr(radiogroup3.ItemIndex));
    if radiogroup4.ItemIndex<>2 then
     sql.Insert(sql.Count-3,'and data0064.assign_type='+inttostr(radiogroup4.ItemIndex));
    if combobox4.ItemIndex<>combobox4.Items.Count-1 then
     sql.Insert(sql.Count-3,'and data0053.rma_ptr='+inttostr(combobox4.ItemIndex));
//    form7.ADOQuery1.Parameters[0].Value:=self.ADO278RKEY.Value;
    if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
     sql.Insert(sql.Count-3,'and data0010.rkey in (SELECT CUSTOMER_PTR '+
                            'FROM dbo.DATA0100 '+
                            'WHERE CSI_PTR = '+ rkey73+')');
    Prepared;  
    open;
   end;
 // if not form7.ADOQuery1.IsEmpty then
 //  begin
    while not form7.adoquery1.Eof do
    begin
     quantity:=quantity+form7.ADOQuery1putout_total.Value;
     total_lucre:=total_lucre+form7.ADOQuery1so_mianqi.Value;
     mianji:=mianji+form7.ADOQuery1amount.Value;
     weight:=weight+form7.ADOQuery1weight.Value;
     total_tax_amount:=total_tax_amount+form7.ADOQuery1tax_amount.Value;
     form7.adoquery1.Next;
    end;
    form7.adoquery1.First;
    form7.Edit1.Text:=formatfloat('0',quantity);
    form7.Edit2.Text:=formatfloat('0.0000',total_lucre);
    form7.Edit3.Text:=formatfloat('0.0000',mianji);
    form7.Edit4.Text:=formatfloat('0.0000',weight);
    form7.Edit5.Text:=formatfloat('0.0000',total_tax_amount);
    form1.Hide;
    form7.ShowModal;
    form7.Free;
  { end
  else
   begin
    messagedlg('对不起,没有找到符合条件的数据!',mtinformation,[mbok],0);
    screen.Cursor:=crdefault;
   end; }
  end;
 end;
2:
if rgp4.ItemIndex=0 then   //库存明细
 begin
  form9:=tform9.Create(application);
  with form9.ado53 do
  begin
   close;
   for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
   if radiogroup3.ItemIndex<>2 then
    sql.Insert(sql.Count-1,'and data0025.ttype='+inttostr(radiogroup3.ItemIndex));
   if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
    sql.Insert(sql.Count-1,'and data0010.rkey in (SELECT CUSTOMER_PTR '+
                            'FROM dbo.DATA0100 '+
                            'WHERE CSI_PTR = '+ rkey73+')');
   Prepared; 
   open;
  end;
   Form9.ADO53.DisableControls;
   while not Form9.ADO53.Eof do
    begin
      totalInventory:=totalInventory+Form9.ADO53QTY_ON_HAND.Value;
      if RadioGroup8.ItemIndex=0 then
       totalProportion:=totalProportion+Form9.ADO53so_mianji.Value
      else
       totalProportion:=totalProportion+Form9.ADO53total_sq.Value;
      Form9.ADO53.Next;
    end;
    Form9.ADO53.First;
    Form9.ADO53.EnableControls;
    Form9.Edit2.Text:=formatfloat('0.00',totalInventory);
    Form9.Edit3.Text:=formatfloat('0.00',totalProportion);
      if RadioGroup8.ItemIndex=0 then
       Form9.DBGrid1.Columns[9].FieldName:='so_mianji'
      else
       Form9.DBGrid1.Columns[9].FieldName:='total_sq';

   if strtoint(vprev)<=2 then       //权限
   begin
    form9.DBGrid1.Columns[15].Visible:=false;
    form9.DBGrid1.Columns[16].Visible:=false;
    form9.DBGrid1.Columns[17].Visible:=false;
   end;
   
   form1.Hide;
   form9.ShowModal;
   form9.Free;

 end
else                     //库存汇总
 begin
  form4:=tform4.Create(application);
  with form4.aq53 do
  begin
   close;
   for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-3,sgrid1.Cells[2,i]);
   if radiogroup3.ItemIndex<>2 then
    sql.Insert(sql.Count-3,'and data0025.ttype='+inttostr(radiogroup3.ItemIndex));
    if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
     sql.Insert(sql.Count-3,'and data0010.rkey in (SELECT CUSTOMER_PTR '+
                            'FROM dbo.DATA0100 '+
                            'WHERE CSI_PTR = '+ rkey73+')');
   Prepared;
   open;
  end;
 { if form4.Aq53.IsEmpty then
   begin
    messagedlg('对不起,没有找到符合条件的数据!',mtinformation,[mbok],0);
    screen.Cursor:=crdefault;
   end
  else
   begin }
    if strtoint(vprev)<=2 then  //权限
    begin
     form4.DBGrid1.Columns[7].Visible:=false;
    end;
    form1.Hide;
    form4.ShowModal;
    form4.free;
  // end;
 end;
3:    //产成品转移查询
 begin
  if sgrid1.RowCount<=2 then
  begin
    showmessage('请先定义查询条件');
    screen.Cursor:=crdefault;
    abort;
  end;
  form5:=tform5.Create(application);
  with form5.ado113 do
  begin
   close;
   for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
   if radiogroup3.ItemIndex<>2 then
    sql.Insert(sql.Count-1,'and  Data0025_1.ttype='+inttostr(radiogroup3.ItemIndex));
   Prepared; 
   open;
  end;
   while not Form5.ADO113.Eof do
   begin
     totalQuantity:=totalQuantity+Form5.ADO113QUANTITY.Value;
     totalmianji:=totalmianji+form5.ADO113mian_ji.Value;
     Form5.ADO113.Next;
    end;
    Form5.ADO113.First;
    Form5.ADO113.EnableControls;
    Form5.Edit1.Text:=formatfloat('0.00',totalQuantity);
    Form5.Edit2.Text:=FormatFloat('0.0000',totalmianji);
 { if form5.ado113.IsEmpty then
   begin
    messagedlg('对不起,没有找到符合条件的数据!',mtinformation,[mbok],0);
    screen.Cursor:=crdefault;
   end
  else
  begin }
   form1.Hide;
   form5.ShowModal;
   form5.free;
 // end;
 end;
end;
 screen.Cursor:=crdefault;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 i,j:byte;
begin
 if sgrid1.RowCount<=2 then
  begin
   j:=sgrid1.RowCount-1;
   sgrid1.RowCount:=sgrid1.RowCount+1;
  end
 else
 for i:=1 to sgrid1.RowCount-2 do
 if sgrid1.Cells[0,i]=listbox1.Items[listbox1.itemindex]  then
  begin
    j:=i;          //记下已添加的查询项目的位置
    Break;
  end
 else
  if i=sgrid1.RowCount-2 then
  begin
   j:=sgrid1.RowCount-1;
   sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
 {
 if hasadded=false then //查询项目未添加则增加
  begin
   sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox1.Items[listbox1.itemindex];
   sgrid1.Cells[1,sgrid1.RowCount-1]:=edit1.Text;

   case listbox1.ItemIndex of
   0:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0006.WORK_ORDER_NUMBER LIKE ''%'+trim(edit1.Text)+'%''';
   1:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.MANU_PART_NUMBER LIKE ''%'+trim(edit1.Text)+'%''';
   2:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0015.warehouse_code LIKE ''%'+trim(edit1.Text)+'%''';
   3:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0016.code LIKE ''%'+trim(edit1.Text)+'%''';
   4:
    begin
     sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0010_2.cust_code LIKE ''%'+trim(edit1.Text)+'%''';
    end;
   5:
    begin
     sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+
      formatdatetime('yyyy-mm-dd ',self.DateTimePicker1.DateTime)+
      formatdatetime('hh:nn:ss',self.DateTimePicker2.DateTime)+'到'+
      formatdatetime('yyyy-mm-dd ',self.DateTimePicker3.DateTime)+
      formatdatetime('hh:nn:ss',self.DateTimePicker4.Time);
     sgrid1.Cells[2,sgrid1.RowCount-1]:=
      'and  Data0053.mfg_date>='''+
      formatdatetime('yyyy-mm-dd ',self.DateTimePicker1.DateTime)+
      formatdatetime('hh:nn:ss',self.DateTimePicker2.DateTime)+
      ''' and Data0053.mfg_date<='''+
      formatdatetime('yyyy-mm-dd ',self.DateTimePicker3.DateTime)
      +formatdatetime('hh:nn:ss',self.DateTimePicker4.DateTime)+'''';
    end;
   6:
    case rgp2.ItemIndex of
     0:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0053.QUANTITY >'+trim(edit1.Text)+'';
     1:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0053.QUANTITY ='+trim(edit1.Text)+'';
     2:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0053.QUANTITY <'+trim(edit1.Text)+'';
    end;
   7:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0008.PROD_CODE LIKE ''%'+trim(edit1.Text)+'%''';
   8:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.MANU_PART_DESC LIKE ''%'+trim(edit1.Text)+'%''';
   9:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060_2.sales_order LIKE ''%'+trim(edit1.Text)+'%''';
   10:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0416.number LIKE ''%'+trim(edit1.Text)+'%''';
   11:
   begin
        sgrid1.Cells[1,sgrid1.RowCount-1]:=RGp2.Items[RGp2.itemindex]+edit1.Text;
    case rgp2.ItemIndex of
     0:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.LAYERS >'+trim(edit1.Text)+'';
     1:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.LAYERS ='+trim(edit1.Text)+'';
     2:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.LAYERS <'+trim(edit1.Text)+'';
    end;
   end;
   12:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.SAMPLE_NR LIKE ''%'+trim(edit1.Text)+'%''';
   end;
   sgrid1.RowCount:=sgrid1.RowCount+1;
  end
 else //查询项目已增加则修改  }
  begin
   sgrid1.Cells[0,j] := listbox1.Items[listbox1.itemindex];
   sgrid1.Cells[1,j] := edit1.Text;
   if ListBox1.ItemIndex = 14 then
    sgrid1.Cells[1,j] := rgIsChaBan.Items[rgIsChaBan.itemindex];
   case listbox1.ItemIndex of
   0:
    sgrid1.Cells[2,j]:='and Data0006.WORK_ORDER_NUMBER LIKE ''%'+trim(edit1.Text)+'%''';
   1:
    sgrid1.Cells[2,j]:='and Data0025.MANU_PART_NUMBER LIKE ''%'+trim(edit1.Text)+'%''';
   2:
    sgrid1.Cells[2,j]:='and Data0007.PR_GRP_CODE LIKE ''%'+trim(edit1.Text)+'%''';
   3:
    sgrid1.Cells[2,j]:='and Data0016.code LIKE ''%'+trim(edit1.Text)+'%''';
   4:
    begin
     sgrid1.Cells[2,j]:='and data0010_2.cust_code LIKE ''%'+trim(edit1.Text)+'%''';
    end;
   5:
    begin
     sgrid1.Cells[1,j]:='从'+formatdatetime('yyyy-mm-dd ',
     self.DateTimePicker1.DateTime)+
     formatdatetime('hh:nn:ss',self.DateTimePicker2.DateTime)+'到'+
     formatdatetime('yyyy-mm-dd ',self.DateTimePicker3.DateTime)+
     formatdatetime('hh:nn:ss',self.DateTimePicker4.DateTime);
     sgrid1.Cells[2,j]:='and  Data0053.mfg_date>='''+formatdatetime('yyyy-mm-dd ',
      self.DateTimePicker1.DateTime)+
      formatdatetime('hh:nn:ss',self.DateTimePicker2.DateTime)+
      ''' and Data0053.mfg_date<='''+formatdatetime('yyyy-mm-dd ',
      self.DateTimePicker3.DateTime)+formatdatetime('hh:nn:ss',
      self.DateTimePicker4.DateTime)+'''';
    end;
   6:
    case rgp2.ItemIndex of
    0:sgrid1.Cells[2,j]:='and Data0053.QUANTITY >'+trim(edit1.Text)+'';
    1:sgrid1.Cells[2,j]:='and Data0053.QUANTITY ='+trim(edit1.Text)+'';
    2:sgrid1.Cells[2,j]:='and Data0053.QUANTITY <'+trim(edit1.Text)+'';
    end;
   7:
    sgrid1.Cells[2,j]:='and Data0008.PROD_CODE LIKE ''%'+trim(edit1.Text)+'%''';
   8:
    sgrid1.Cells[2,j]:='and Data0025.MANU_PART_DESC LIKE ''%'+trim(edit1.Text)+'%''';
   9:
    sgrid1.Cells[2,j]:='and Data0060_2.sales_order LIKE ''%'+trim(edit1.Text)+'%''';
   10:
    sgrid1.Cells[2,j]:='and Data0416.number LIKE ''%'+trim(edit1.Text)+'%''';
   11:
    begin
      sgrid1.Cells[1,j]:=RGp2.Items[RGp2.itemindex]+edit1.Text;
    case rgp2.ItemIndex of
     0:sgrid1.Cells[2,j]:='and Data0025.LAYERS >'+trim(edit1.Text)+'';
     1:sgrid1.Cells[2,j]:='and Data0025.LAYERS ='+trim(edit1.Text)+'';
     2:sgrid1.Cells[2,j]:='and Data0025.LAYERS <'+trim(edit1.Text)+'';
    end;
    end;
   12:
     sgrid1.Cells[2,j]:='and Data0025.SAMPLE_NR LIKE ''%'+trim(edit1.Text)+'%''';
   13:
     sgrid1.Cells[2,j]:='and Data0025.ORIG_CUSTOMER LIKE ''%'+trim(edit1.Text)+'%''';
   14: sgrid1.Cells[2,j]:='and Data0053.ischaban= ' + IntToStr(rgIsChaBan.ItemIndex);
   15: sgrid1.Cells[2,j]:='and Data0053.zhouqi LIKE ''%'+trim(edit1.Text)+'%''';
   16:
     begin
       sgrid1.Cells[1,j]:=combobox7.Text;
       if (Trim(combobox7.Text)='') then
       begin
         sgrid1.Cells[2,j]:=' and 1=1';
       end else
       begin
         sgrid1.Cells[2,j]:=' and data0025.CPJS like ''%'+combobox7.Text+'%''';
       end;
     end;
   17:
      sgrid1.Cells[2,j]:='and Data0015.warehouse_code LIKE ''%'+trim(edit1.Text)+'%''';
   18:
      sgrid1.Cells[2,j]:='and Data0001.CURR_CODE LIKE ''%'+trim(edit1.Text)+'%''';
   end;

  end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
bitbtn2click(sender);

if groupbox5.Visible=true then
 groupbox5.Visible := false;

if groupbox6.Visible=true then
 groupbox6.Visible := false;

if groupbox7.Visible=true then
 groupbox7.Visible := false;

rgp4.ItemIndex := 0;
rgp4.Visible := false;
rgp3.Visible := false;
combobox4.Visible :=false;
radiogroup4.Visible:=false;
radiogroup8.Visible := (radiogroup1.ItemIndex<>3);

case radiogroup1.ItemIndex of
0:
 begin
  groupbox1.Visible := true;
  groupbox2.Visible := false;
  groupbox3.Visible := false;
  groupbox4.Visible := false;
  combobox4.Visible := true;
  combobox4.ItemIndex:= 0;
  rgp4.Visible:=true;
  listbox1.Selected[0] := true;
  listbox1click(sender);
 end;
1:
 begin
  groupbox1.Visible := false;
  groupbox2.Visible := true;
  groupbox3.Visible := false;
  groupbox4.Visible := false;
  combobox4.Visible := true;
  radiogroup4.Visible:=true;
  rgp4.Visible := true;
  listbox2.Selected[0] := true;
  listbox2click(sender);
  rgp3.Visible := true;
  combobox4.ItemIndex:=combobox4.Items.Count-1;
 end;
2:
 begin
  groupbox1.Visible := false;
  groupbox2.Visible := false;
  groupbox4.Visible := false;
  groupbox7.Visible := true;
  listbox7.Selected[0] := true;
  listbox7click(sender);
  rgp4.Visible:=true;
 end;
3:
 begin
  groupbox1.Visible :=false;
  groupbox2.Visible :=false;
  groupbox3.Visible :=false;
  groupbox7.Visible :=false;
  groupbox4.Visible :=true;
  listbox4.Selected[0]:=true;
 end;
end;
end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
 label6.Caption:=listbox2.Items[listbox2.itemindex];
 label1.Visible:=false;
 label5.Visible:=false;
 dtpk3.Visible:=false;
 dtpk4.Visible:=false;
 dttm3.Visible:=false;
 dttm4.Visible:=false;
 bitbtn5.Visible:=false;
 edit2.Visible:=true;
 edit2.Text:='';
 button2.Enabled:=false;
 combobox2.Visible:=false;
 combobox5.Visible:=false;
 radiogroup5.Visible:= listbox2.ItemIndex=13;
case listbox2.ItemIndex of
 0:;
 1:;
 2:bitbtn5.Visible:=true;
 3:bitbtn5.Visible:=true;
 4:bitbtn5.Visible:=true;
 5:bitbtn5.Visible:=true;
 6:
 begin
  edit2.Visible:=false;
  button2.Enabled:=true;
  label1.Visible:=true;
  label5.Visible:=true;
  dtpk3.Visible:=true;
  dtpk4.Visible:=true;
  dttm3.Visible:=true;
  dttm4.Visible:=true;
 end;
 7,16:bitbtn5.Visible:=true;
 8:;
 9:;
 10:
 begin
  combobox2.Visible:=true;
  edit2.Visible:=false;
  button2.Enabled:=true;
 end;
 11:
 begin
  edit2.Visible:=false;
  button2.Enabled:=true;
  label1.Visible:=true;
  label5.Visible:=true;
  dtpk3.Visible:=true;
  dtpk4.Visible:=true;
 end;
 12:bitbtn5.Visible:=true;
 13:;
 14:bitbtn5.Visible:=true;
 15:
 begin
   combobox5.Visible:=True;
   ComboBox5.Items.Clear;
   ComboBox5.Style:=csDropDown;
   ADOQuery1.Close;
   ADOQuery1.SQL.Text:='select data0338.tvalue from data0278 inner join data0338 on data0278.Rkey=data0338.parameter_ptr where  data0278.SPEC_RKEY=''js''';
   ADOQuery1.Open;
   while not ADOQuery1.Eof do
   begin
     ComboBox5.Items.Add(ADOQuery1.FieldBYName('tvalue').AsString);
     ADOQuery1.Next;
   end;
    ComboBox5.ItemIndex:=-1;
    edit2.Visible:=false;
    button2.Enabled:=true;
 end;
end;

end;

procedure TForm1.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit2.Text)<>'' then
 button2.Enabled:=true
else
 button2.Enabled:=false;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case listbox2.ItemIndex of
    2:
    begin
      InputVar.Fields := 'manu_part_number/本厂编号/100,manu_part_desc/客户型号/150,bath_former/性质/100';
      InputVar.Sqlstr :='select  rkey,manu_part_number,manu_part_desc, customer_ptr,'+
                        'case data0025.ttype when 0 then ''批量'' when 1 then ''样板'' end bath_former '+
                        'from  data0025 '+
                        'where data0025.PARENT_PTR is null '+
                        'order by manu_part_number';
      inputvar.KeyField:='manu_part_number';
    end;
    3:
    begin
       InputVar.Fields :='PR_GRP_CODE/组别代码/100,PRODUCT_GROUP_NAME/组别名称/250';
      InputVar.Sqlstr :='select rkey,PR_GRP_CODE,PRODUCT_GROUP_NAME from data0007 order by PR_GRP_CODE';
      InputVar.KeyField:='PR_GRP_CODE';
    end;
    4:
    begin
      InputVar.Fields := 'CODE/仓库代码/200,LOCATION/仓库名称/250';
      InputVar.Sqlstr :='SELECT RKEY,CODE,LOCATION FROM Data0016 where location_type=1 ORDER BY CODE';
      inputvar.KeyField:='CODE';
    end;
    5:
    begin
      InputVar.Fields := 'cust_code/客户代码/200,customer_name/客户名称/250';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
    end;
    7:
    begin
      InputVar.Fields := 'prod_code/产品类别/200,product_name/类别名称/250';
      InputVar.Sqlstr :='select rkey,prod_code,product_name from data0008 order by prod_code';
      inputvar.KeyField:='prod_code';
    end;
   12:
    begin
      InputVar.Fields := 'CURR_CODE/货币代码/200,CURR_NAME/货币名称/250';
      InputVar.Sqlstr :='select rkey,CURR_CODE,CURR_NAME from data0001 order by CURR_CODE';
      inputvar.KeyField:='CURR_CODE';
    end;
   14:
    begin
      InputVar.Fields := 'cust_code/客户代码/100,customer_name/客户名称/250,ABBR_NAME/客户简称/150';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name,ABBR_NAME '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='ABBR_NAME';
    end;
   16:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,ABBR_NAME/工厂简称/150,WAREHOUSE_NAME/工厂全称/250';
      InputVar.Sqlstr :='SELECT  RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME,ABBR_NAME '+
                        'FROM  Data0015 ORDER BY  WAREHOUSE_CODE';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;  

  end;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case listbox2.ItemIndex of
     2:begin
         edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_number']);
         button2.Enabled:=true;
         button2.SetFocus;
       end;
     3:begin
         edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PR_GRP_CODE']);
         button2.Enabled:=true;
         button2.SetFocus;
       end;
     4:begin
         edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
         //label_rkey16.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
         button2.Enabled:=true;
         button2.SetFocus;
       end;
     5:begin
         edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
         button2.Enabled:=true;
         button2.SetFocus;
       end;
     7:begin
         edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['prod_code']);
         button2.Enabled:=true;
         button2.SetFocus;
       end;
     12:begin
         edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CURR_CODE']);
         button2.Enabled:=true;
         button2.SetFocus;
       end;
     14:begin
         edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME']);
         button2.Enabled:=true;
         button2.SetFocus;
       end;
     16:begin
         edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
        // label_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
         button2.Enabled:=true;
         button2.SetFocus;
        end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;


end;

procedure TForm1.Button2Click(Sender: TObject);
var
 i,j:byte;
 hasadded:boolean;  //用于判断查询项目是否已添加
begin
 hasadded:=false;
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox2.Items[listbox2.itemindex]  then
   begin
    hasadded:=true;   //查询项目已添加
    j:=i;             //记下已添加的查询项目的位置
   end;
 if hasadded=false then  //查询项目未添加则增加
  begin
   sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox2.Items[listbox2.itemindex];
   sgrid1.Cells[1,sgrid1.RowCount-1]:=edit2.Text;

   case listbox2.ItemIndex of
   0:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060.sales_order LIKE ''%'+trim(edit2.Text)+'%''';
   1:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0439.delivery_no LIKE '''+trim(edit2.Text)+'%''';
   2:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.manu_part_number LIKE ''%'+trim(edit2.Text)+'%''';
   3:
     sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0007.PR_GRP_CODE LIKE '''+trim(edit2.Text)+'%''';
   4:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0016.code LIKE '''+trim(edit2.Text)+'%''';
   5:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0010.cust_code LIKE '''+trim(edit2.Text)+'%''';
   6:
    begin
     sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk3.date)+'到'+datetostr(dtpk4.date);
     sgrid1.Cells[2,sgrid1.RowCount-1]:=
     'and Data0064.DATE_assign>='''+datetostr(dtpk3.date)+
     formatdatetime(' hh:nn:ss',dttm3.Time)+
     ''' and Data0064.DATE_assign<='''+datetostr(dtpk4.date)+
     formatdatetime(' hh:nn:ss',dttm4.Time)+'''';
    end;
   7:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0008.prod_code LIKE '''+trim(edit2.Text)+'%''';
   8:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0097.PO_NUMBER LIKE ''%'+trim(edit2.Text)+'%''';
   9:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.manu_part_desc LIKE ''%'+trim(edit2.Text)+'%''';
   10:
    begin
     sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060.so_tp = '+inttostr(combobox2.ItemIndex);
     sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox2.Text;
    end;
   11:
    begin
     sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk3.date)+'到'+datetostr(dtpk4.date);
     sgrid1.Cells[2,sgrid1.RowCount-1]:=
     'and data0439.date_sailing>='''+datetostr(dtpk3.date)+''' and data0439.date_sailing<='''+datetostr(dtpk4.date)+'''';
    end;
   12:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0001.CURR_CODE = '''+trim(edit2.Text)+'''';
   13:
   begin
     if RadioGroup5.ItemIndex=0 then
       sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.LAYERS='+edit2.Text
     else if RadioGroup5.ItemIndex=1 then
       sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.LAYERS<>'+edit2.Text
     else
       sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.LAYERS>'+edit2.Text;
     sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioGroup5.Items[RadioGroup5.ItemIndex]+edit2.Text;
   end;
   14:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.ORIG_CUSTOMER LIKE '''+trim(edit2.Text)+'%''';
    15:
    begin
     if (Trim(combobox5.Text)='') then
     begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=' and 1=1';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox5.Text;
     end else
     begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=' and data0025.CPJS like ''%'+combobox5.Text+'%''';
       sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox5.Text;
     end;
    end;
    16:
      sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0015.warehouse_code LIKE '''+trim(edit2.Text)+'%''';
    17:
      sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0064.cust_decl LIKE '''+trim(edit2.Text)+'%''';
   end;
   sgrid1.RowCount:=sgrid1.RowCount+1;
  end
 else //查询项目已添加则修改
  begin
   sgrid1.Cells[1,j]:=edit2.Text;
   case listbox2.ItemIndex of
   0:
    sgrid1.Cells[2,j]:='and Data0060.sales_order LIKE ''%'+trim(edit2.Text)+'%''';
   1:
    sgrid1.Cells[2,j]:='and data0439.delivery_no LIKE '''+trim(edit2.Text)+'%''';
   2:
    sgrid1.Cells[2,j]:='and Data0025.manu_part_number LIKE ''%'+trim(edit2.Text)+'%''';
   3:
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0007.PR_GRP_CODE LIKE '''+trim(edit2.Text)+'%''';
   4:
    sgrid1.Cells[2,j]:='and data0016.code LIKE '''+trim(edit2.Text)+'%''';
   5:
    sgrid1.Cells[2,j]:='and data0010.cust_code LIKE '''+trim(edit2.Text)+'%''';
   6:
    begin
     sgrid1.Cells[1,j]:='从'+datetostr(dtpk3.date)+'到'+datetostr(dtpk4.date);
     sgrid1.Cells[2,j]:=
     'and Data0064.DATE_assign>='''+datetostr(dtpk3.date)+
     formatdatetime(' hh:nn:ss',dttm3.Time)+
     ''' and Data0064.DATE_assign<='''+datetostr(dtpk4.date)+
     formatdatetime(' hh:nn:ss',dttm4.Time)+'''';
    end;
   7:
    sgrid1.Cells[2,j]:='and data0008.prod_code LIKE '''+trim(edit2.Text)+'%''';
   8:
    sgrid1.Cells[2,j]:='and data0097.PO_NUMBER LIKE ''%'+trim(edit2.Text)+'%''';
   9:
    sgrid1.Cells[2,j]:='and Data0025.manu_part_desc LIKE ''%'+trim(edit2.Text)+'%''';
   10:
    begin
     sgrid1.Cells[2,j]:='and Data0060.so_tp = '+inttostr(combobox2.ItemIndex);
     sgrid1.Cells[1,j]:=combobox2.Text;
    end;
   11:
    begin
     sgrid1.Cells[1,j]:='从'+datetostr(dtpk3.date)+'到'+datetostr(dtpk4.date);
     sgrid1.Cells[2,j]:=
     'and data0439.date_sailing>='''+datetostr(dtpk3.date)+
     ''' and data0439.date_sailing<='''+datetostr(dtpk4.date)+'''';
    end;
   12:
    sgrid1.Cells[2,j]:='and data0001.CURR_CODE = '''+trim(edit2.Text)+'''';    
   13:
   begin
     if RadioGroup5.ItemIndex=0 then
       sgrid1.Cells[2,j]:='and data0025.LAYERS='+edit2.Text
     else if RadioGroup5.ItemIndex=1 then
       sgrid1.Cells[2,j]:='and data0025.LAYERS<>'+edit2.Text
     else
       sgrid1.Cells[2,j]:='and data0025.LAYERS>'+edit2.Text;
     sgrid1.Cells[1,j]:=RadioGroup5.Items[RadioGroup5.ItemIndex]+edit2.Text;
   end;
   14:
    sgrid1.Cells[2,j]:='and data0025.ORIG_CUSTOMER LIKE '''+trim(edit2.Text)+'%''';
   15:
    begin
     if (Trim(combobox5.Text)='') then
     begin
       sgrid1.Cells[2,j]:=' and 1=1';
       sgrid1.Cells[1,j]:=combobox5.Text;
     end else
     begin
       sgrid1.Cells[2,j]:=' and data0025.CPJS like ''%'+combobox5.Text+'%''';
       sgrid1.Cells[1,j]:=combobox5.Text;
     end;
    end;
    16:
     sgrid1.Cells[2,j]:='and Data0015.warehouse_code LIKE '''+trim(edit2.Text)+'%''';
     17:
      sgrid1.Cells[2,j]:='and Data0064.cust_decl LIKE '''+trim(edit2.Text)+'%''';
   end;
  end;
end;


procedure TForm1.ListBox3Click(Sender: TObject);
begin
 label9.Caption:=listbox3.Items[listbox3.itemindex];
 label7.Visible:=false;
 label8.Visible:=false;
 dtpk5.Visible:=false;
 dtpk6.Visible:=false;
 bitbtn6.Visible:=true;
 edit3.Visible:=true;
 edit3.Text:='';
 label23.Caption:='(,';
 button3.Enabled:=false;
 rg1.Visible := False;
case listbox3.ItemIndex of
0:
Edit3.ReadOnly:=false;
1:
Edit3.ReadOnly:=false;
2:
Edit3.ReadOnly:=true;
3:
Edit3.ReadOnly:=false;
4:
begin
 bitbtn6.Visible:=false;
 edit3.Visible:=false;
 button3.Enabled:=true;
 label7.Visible:=true;
 label8.Visible:=true;
 dtpk5.Visible:=true;
 dtpk6.Visible:=true;
end;
5:
Edit3.ReadOnly:=false;
6:
 begin
 bitbtn6.Visible:=false;
 Edit3.ReadOnly:=false;
 end;
 7:
 begin
 bitbtn6.Visible:=false;
 Edit3.Visible:=false;
 rg1.Visible := True;
 end;
 8:
 begin
  bitbtn6.Visible:=false;
 end;
 9:
 begin
  Edit3.ReadOnly:=false;
 end;
end;
end;

procedure TForm1.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit3.Text)<>'' then
 button3.Enabled:=true
else
 button3.Enabled:=false;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
  if ListBox3.ItemIndex=2 then
  begin
   with TForm_Wh.Create(Application)do
   try
    if Edit3.Text<>'' then
    adsPickWorkShop.CommandText:=
    adsPickWorkShop.CommandText+'and rkey not in '+label23.Caption;

    adsPickWorkShop.CommandText:=
    adsPickWorkShop.CommandText+' order by Code';
    Enter(0);
    if ShowModal = mrok then
    begin
      cdsPickWorkShop.First;
      Label23.Caption:=Copy(label23.Caption,1,Length(label23.Caption)-1);
      if Length(Label23.Caption)>1 then
       label23.Caption:=label23.Caption+',';
      while not cdsPickWorkShop.Eof do
      begin
       if cdsPickWorkShop.FieldByName('IsSelected').AsBoolean then
        begin
         Edit3.Text:=Edit3.Text+cdsPickWorkShop.fieldbyName('Code').AsString+';';
         if cdsPickWorkShop.RecNo<>cdsPickWorkShop.RecordCount then
          label23.Caption:=label23.Caption+cdsPickWorkShop.fieldbyName('rkey').AsString+','
         else
          label23.Caption:=label23.Caption+cdsPickWorkShop.fieldbyName('rkey').AsString+')';
        end;
        cdsPickWorkShop.next;
      end;
    end;
   finally
    release;
   end;
  end
  else
  begin
   frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
   try
   case listbox3.ItemIndex of
    0:
    begin
      InputVar.Fields := 'manu_part_number/本厂编号/100,manu_part_desc/客户型号/150,bath_former/性质/100';
      InputVar.Sqlstr :='select  rkey,manu_part_number,manu_part_desc, customer_ptr,'+
                        'case data0025.ttype when 0 then ''批量'' when 1 then ''样板'' end bath_former '+
                        'from  data0025 '+
                        'where data0025.PARENT_PTR is null '+
                        'order by manu_part_number';
      inputvar.KeyField:='manu_part_number';
    end;
    1:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,ABBR_NAME/工厂简称/150,WAREHOUSE_NAME/工厂全称/250';
      InputVar.Sqlstr :='SELECT  RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME,ABBR_NAME '+
                        'FROM  Data0015 ORDER BY  WAREHOUSE_CODE';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;
//    2:
//    begin
//      InputVar.Fields := 'CODE/仓库代码/200,LOCATION/仓库名称/250';
//      InputVar.Sqlstr :='SELECT RKEY,CODE,LOCATION FROM Data0016 where location_type=1 ORDER BY CODE';
//      inputvar.KeyField:='CODE';
//    end;

    3:
    begin
      InputVar.Fields := 'cust_code/客户代码/200,customer_name/客户名称/250';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
    end;
    5:
    begin
      InputVar.Fields := 'prod_code/产品类别/200,product_name/类别名称/250';
      InputVar.Sqlstr :='select rkey,prod_code,product_name from data0008 order by prod_code';
      inputvar.KeyField:='prod_code';
    end;
    9:
    begin
      InputVar.Fields := 'cust_code/客户代码/100,customer_name/客户名称/250,ABBR_NAME/客户简称/150';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name,ABBR_NAME '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='ABBR_NAME';
    end;
   end;
   InputVar.AdoConn := ADOConnection1 ;
   frmPick_Item_Single.InitForm_New(InputVar);
   if frmPick_Item_Single.ShowModal=mrok then
   begin
     case listbox3.ItemIndex of
     0:begin
         edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_number']);
         button3.Enabled:=true;
         button3.SetFocus;
       end;
     1:begin
         edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         button3.Enabled:=true;
         button3.SetFocus;
       end;
//     2:begin
//         edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
//         button3.Enabled:=true;
//         button3.SetFocus;
//       end;
     3:begin
         edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
         button3.Enabled:=true;
         button3.SetFocus;
       end;
     5:begin
         edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['prod_code']);
         button3.Enabled:=true;
         button3.SetFocus;
       end;
     9:begin
         edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME']);
         button3.Enabled:=true;
         button3.SetFocus;
       end;  
     end;
   end ;
   finally
   frmPick_Item_Single.Free ;
  end;
 end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
 i,j:byte;
 hasadded:boolean;  //用于判断查询项目是否已添加
begin
 hasadded:=false;
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i] = listbox3.Items[listbox3.itemindex] then
   begin
    hasadded:=true;//查询项目已添加
    j:=i;          //记下已添加的查询项目的位置
   end;
 if hasadded=false then //查询项目未添加则增加
  begin
   sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
   sgrid1.Cells[1,sgrid1.RowCount-1]:=edit3.Text;
   if ListBox3.ItemIndex = 7 then
    sgrid1.Cells[1,sgrid1.RowCount-1] := rg1.Items[rg1.itemindex];

   case listbox3.ItemIndex of
   0:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.manu_part_number LIKE ''%'+trim(edit3.Text)+'%''';
   1:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0015.warehouse_code LIKE ''%'+trim(edit3.Text)+'%''';
   2:
    //sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0016.code LIKE ''%'+trim(edit3.Text)+'%''';
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0016.rkey in '+label23.caption;
   3:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0010.cust_code LIKE ''%'+trim(Edit3.Text)+'%''';
   4:
    begin
     sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk5.date)+'到'+datetostr(dtpk6.date);
     sgrid1.Cells[2,sgrid1.RowCount-1]:=
     'and  Data0053.mfg_date>='''+datetostr(dtpk5.date)+''' and Data0053.mfg_date<='''+datetostr(dtpk6.date+1)+'''';
    end;                                                        //制造日期为长格式
   5:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0008.prod_code LIKE ''%'+trim(edit3.Text)+'%''';
   6:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.SAMPLE_NR LIKE ''%'+trim(edit3.Text)+'%''';
   7: sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0053.ischaban= ' + IntToStr(rg1.ItemIndex);
   8: sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0053.zhouqi LIKE ''%'+trim(edit3.Text)+'%''';
   9:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.ORIG_CUSTOMER LIKE '''+trim(edit3.Text)+'%''';
   end;
   sgrid1.RowCount:=sgrid1.RowCount+1;
  end
 else  //查询项目已添加则修改
  begin
   sgrid1.Cells[1,j]:=edit3.Text;
   if ListBox3.ItemIndex = 7 then
    sgrid1.Cells[1,j] := rg1.Items[rg1.itemindex];   
   case listbox3.ItemIndex of
   0:
    sgrid1.Cells[2,j]:='and Data0025.manu_part_number LIKE ''%'+trim(edit3.Text)+'%''';
   1:
    sgrid1.Cells[2,j]:='and Data0015.warehouse_code LIKE ''%'+trim(edit3.Text)+'%''';
   2:
    //sgrid1.Cells[2,j]:='and data0016.code LIKE ''%'+trim(edit3.Text)+'%''';
    sgrid1.Cells[2,j]:='and Data0016.rkey in '+label23.caption;
   3:
    sgrid1.Cells[2,j]:='and data0010.cust_code LIKE ''%'+trim(edit3.Text)+'%''';
   4:
    begin
     sgrid1.Cells[1,j]:='从'+datetostr(dtpk5.date)+'到'+datetostr(dtpk6.date);
     sgrid1.Cells[2,j]:=
     'and  Data0053.mfg_date>='''+datetostr(dtpk5.date)+''' and Data0053.mfg_date<='''+datetostr(dtpk6.date+1)+'''';
    end;                                                        //制造日期为长格式
   5:
    sgrid1.Cells[2,j]:='and data0008.prod_code LIKE ''%'+trim(edit3.Text)+'%''';
   6:
   sgrid1.Cells[2,j]:='and data0025.SAMPLE_NR LIKE ''%'+trim(edit3.Text)+'%''';
   7: sgrid1.Cells[2,j]:='and Data0053.ischaban= ' + IntToStr(rg1.ItemIndex);
   8: sgrid1.Cells[2,j]:='and Data0053.zhouqi LIKE ''%'+trim(edit3.Text)+'%''';
   9:
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.ORIG_CUSTOMER LIKE '''+trim(edit3.Text)+'%''';
   end;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 if  IsFirstShow  then
 begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text:='select convert(datetime,getdate(),120) as sys_datetime';
  Adoquery1.Open;
  self.datetimepicker1.DateTime:=self.ADOQuery1.FieldValues['sys_datetime']-60;
  self.DateTimePicker3.DateTime:=self.ADOQuery1.FieldValues['sys_datetime'];
  self.DateTimePicker5.DateTime:=self.ADOQuery1.FieldValues['sys_datetime']-30;
  self.DateTimePicker7.DateTime:=self.ADOQuery1.FieldValues['sys_datetime'];

  dtpk4.Date:={date()}self.DateTimePicker3.Date;
  dtpk3.date:={date()-60}self.DateTimePicker1.Date;
  dtpk6.Date:={date()}self.DateTimePicker3.Date;
  dtpk5.Date:={date()-60}self.DateTimePicker1.Date;
  dtpk8.Date:={date()}self.DateTimePicker3.Date;
  dtpk7.Date:={date()-60}self.DateTimePicker1.Date;

  dtpk12.Date:={date()}self.DateTimePicker7.Date;
  dtpk11.Date:={date()-30}self.DateTimePicker5.Date;
  dtpk14.Date:={date()}self.DateTimePicker7.Date;
  dtpk13.Date:={date()-30}self.DateTimePicker5.Date;

  adoquery1.Close;
  IsFirstShow:=false;

 end;
end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if listbox4.ItemIndex=2 then
if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
 abort
else
 if key = chr(46) then      //判断是否重复输入小数点'.'
  if pos('.',edit4.Text)>0
   then abort;

end;

procedure TForm1.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit4.Text)<>'' then
 button4.Enabled:=true
else
 button4.Enabled:=false;
end;

procedure TForm1.ListBox4Click(Sender: TObject);
begin
 label10.Visible:=false;
 label11.Visible:=false;
 dtpk7.Visible:=false;
 dtpk8.Visible:=false;
 radiogroup2.Visible:=false;
 bitbtn7.Visible:=true;
 edit4.Visible:=true;
 edit4.Text:='';
 button4.Enabled:=false;
 label12.Caption:=listbox4.Items[listbox4.itemindex];

 case listbox4.ItemIndex of
 0:;
 1:
  begin
   label10.Visible:=true;
   label11.Visible:=true;
   dtpk7.Visible:=true;
   dtpk8.Visible:=true;
   bitbtn7.Visible:=false;
   edit4.Visible:=false;
   button4.Enabled:=true;
  end;
 2:
  begin
   radiogroup2.Visible:=true;
   bitbtn7.Visible:=false;
  end;
 3,4:
  begin

  end;
 end;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case listbox4.ItemIndex of
    0:
    begin
      InputVar.Fields := 'empl_code/员工编号/100,employee_name/员工姓名/250';
      InputVar.Sqlstr :='select rkey,empl_code,employee_name from  data0005 order by empl_code';
      inputvar.KeyField:='empl_code';
    end;
   { 1:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,ABBR_NAME/工厂简称/150,WAREHOUSE_NAME/工厂全称/250';
      InputVar.Sqlstr :='SELECT  RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME,ABBR_NAME '+
                        'FROM  Data0015 ORDER BY  WAREHOUSE_CODE';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end; }
    3,4:
    begin
      InputVar.Fields := 'CODE/仓库代码/200,LOCATION/仓库名称/250';
      InputVar.Sqlstr :='SELECT RKEY,CODE,LOCATION FROM Data0016 where location_type=1 ORDER BY CODE';
      inputvar.KeyField:='CODE';
    end;

    5,6:
    begin
      InputVar.Fields := 'manu_part_number/本厂编号/100,manu_part_desc/客户型号/150,bath_former/性质/100';
      InputVar.Sqlstr :='select  rkey,manu_part_number,manu_part_desc, customer_ptr,'+
                        'case data0025.ttype when 0 then ''批量'' when 1 then ''样板'' end bath_former '+
                        'from  data0025 '+
                        'where data0025.PARENT_PTR is null '+
                        'order by manu_part_number';
      inputvar.KeyField:='manu_part_number';
    end;

  end;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case listbox4.ItemIndex of
     0:begin
         edit4.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['empl_code']);
         button4.Enabled:=true;
         button4.SetFocus;
       end;
     3,4:begin
         edit4.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
         button4.Enabled:=true;
         button4.SetFocus;
       end;
     5,6:begin
         edit4.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_number']);
         button4.Enabled:=true;
         button4.SetFocus;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;


end;

procedure TForm1.Button4Click(Sender: TObject);
var
 i,j:byte;
 hasadded:boolean;//用于判断查询项目是否已添加
begin
 hasadded:=false;
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i] = listbox4.Items[listbox4.itemindex] then
   begin
    hasadded:=true; //查询项目已添加
    j:=i;          //记下已添加的查询项目的位置
   end;
 if hasadded=false then //查询项目未添加则增加
  begin
   sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox4.Items[listbox4.itemindex];
   sgrid1.Cells[1,sgrid1.RowCount-1]:=edit4.Text;
   case listbox4.ItemIndex of
   0:
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0005.EMPL_CODE LIKE ''%'+trim(edit4.Text)+'%''';
   1:
    begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk7.date)+'到'+datetostr(dtpk8.date);
    sgrid1.Cells[2,sgrid1.RowCount-1]:=
     'and  Data0113.TDATE>='''+datetostr(dtpk7.date)+''' and Data0113.TDATE<='''+datetostr(dtpk8.date+1)+'''';
    end;
   2:
    case radiogroup2.ItemIndex of
     0:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0113.quantity >'+trim(edit4.Text)+'';
     1:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0113.quantity ='+trim(edit4.Text)+'';
     2:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0113.quantity <'+trim(edit4.Text)+'';
    end;
   3:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025_1.manu_part_number LIKE ''%'+trim(edit4.Text)+'%''';
   4:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025_2.manu_part_number LIKE ''%'+trim(edit4.Text)+'%''';
   end;
   sgrid1.RowCount:=sgrid1.RowCount+1;
  end
 else    //查询项目已添加则修改
  begin
   sgrid1.Cells[1,j]:=edit4.Text;
   case listbox4.ItemIndex of
   0:
    sgrid1.Cells[2,j]:='and Data0005.EMPL_CODE LIKE ''%'+trim(edit4.Text)+'%''';
   1:
    begin
    sgrid1.Cells[1,j]:='从'+datetostr(dtpk7.date)+'到'+datetostr(dtpk8.date);
    sgrid1.Cells[2,j]:=
     'and  Data0113.TDATE>='''+datetostr(dtpk7.date)+''' and Data0113.TDATE<='''+datetostr(dtpk8.date+1)+'''';
    end;
   2:
    case radiogroup2.ItemIndex of
     0:sgrid1.Cells[2,j]:='and Data0113.quantity >'+trim(edit4.Text)+'';
     1:sgrid1.Cells[2,j]:='and Data0113.quantity ='+trim(edit4.Text)+'';
     2:sgrid1.Cells[2,j]:='and Data0113.quantity <'+trim(edit4.Text)+'';
    end;
//   3:sgrid1.Cells[2,j]:='and Data0016_1.code LIKE ''%'+trim(edit4.Text)+'%''';
//   4:sgrid1.Cells[2,j]:='and data0016_2.code LIKE ''%'+trim(edit4.Text)+'%''';
   3:sgrid1.Cells[2,j]:='and Data0025_1.manu_part_number LIKE ''%'+trim(edit4.Text)+'%''';
   4:sgrid1.Cells[2,j]:='and Data0025_2.manu_part_number LIKE ''%'+trim(edit4.Text)+'%''';
   end;
  end;
end;

procedure TForm1.RGp4Click(Sender: TObject);
begin
bitbtn2click(sender);
if radiogroup1.ItemIndex=0 then//接收
 if rgp4.ItemIndex=0 then     //入仓明细
  begin
   groupbox1.Visible:=true;
   groupbox5.Visible:=false;
   RadioGroup8.Visible:=True;
  end
 else                        //入仓汇总
  begin
   groupbox1.Visible:=false;
   groupbox5.Visible:=true;
   listbox5.Selected[0]:=true;
   listbox5click(sender);
   RadioGroup8.Visible:=false;
  end
else// 出仓
 if radiogroup1.ItemIndex=1 then
  if rgp4.ItemIndex=0 then//出仓明细
   begin
    groupbox2.Visible:=true;
    groupbox6.Visible:=false;
    RadioGroup8.Visible:=True;
   end
  else                 //出仓汇总
   begin
    groupbox2.Visible:=false;
    groupbox6.Visible:=true;
    listbox6.Selected[0]:=true;
    listbox6click(sender);
    RadioGroup8.Visible:=false;
   end
 else //库存
  if rgp4.ItemIndex=0 then
   begin
    groupbox7.Visible:=true;
    groupbox3.Visible:=false;
    RadioGroup8.Visible:=True;
   end
  else
   begin
    groupbox7.Visible:=false;
    groupbox3.Visible:=true;
    listbox3.Selected[0]:=true;
    listbox3click(sender);
    RadioGroup8.Visible:=false;
   end;
end;

procedure TForm1.ListBox5Click(Sender: TObject);
begin
label15.Caption:=listbox5.Items[listbox5.itemindex];
edit5.Text:='';
edit5.Visible:=true;
button5.Enabled:=false;
bitbtn8.Visible:=true;
label13.Visible:=false;
label14.Visible:=false;
self.DateTimePicker5.Visible:=false;
self.DateTimePicker6.Visible:=false;
self.DateTimePicker7.Visible:=false;
self.DateTimePicker8.Visible:=false;
RadioGroup7.Visible:=False;
case listbox5.ItemIndex of
0:;
1:;
2:
 begin
  edit5.Visible:=false;
  button5.Enabled:=true;
  bitbtn8.Visible:=false;
  label13.Visible:=true;
  label14.Visible:=true;
  self.DateTimePicker5.Visible:=true;
  self.DateTimePicker6.Visible:=true;
  self.DateTimePicker7.Visible:=true;
  self.DateTimePicker8.Visible:=true;
 end;
3:;
4:;
5:;
6:bitbtn8.Visible:=false;
7: begin
     RadioGroup7.Visible:=true;
     bitbtn8.Visible:=false;
   end;

8:bitbtn8.Visible:=false;
end;

end;

procedure TForm1.Edit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit5.Text)<>'' then
 button5.Enabled:=true
else
 button5.Enabled:=false;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case listbox5.ItemIndex of
    0:
    begin
      InputVar.Fields := 'manu_part_number/本厂编号/100,manu_part_desc/客户型号/150,bath_former/性质/100';
      InputVar.Sqlstr :='select  rkey,manu_part_number,manu_part_desc, customer_ptr,'+
                        'case data0025.ttype when 0 then ''批量'' when 1 then ''样板'' end bath_former '+
                        'from  data0025 '+
                        'where data0025.PARENT_PTR is null '+
                        'order by manu_part_number';
      inputvar.KeyField:='manu_part_number';
    end;
    1:
    begin
      InputVar.Fields := 'prod_code/产品类别/200,product_name/类别名称/250';
      InputVar.Sqlstr :='select rkey,prod_code,product_name from data0008 order by prod_code';
      inputvar.KeyField:='prod_code';
    end;
    3:
    begin
      InputVar.Fields := 'cust_code/客户代码/200,customer_name/客户名称/250';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
    end;
    4:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,ABBR_NAME/工厂简称/150,WAREHOUSE_NAME/工厂全称/250';
      InputVar.Sqlstr :='SELECT  RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME,ABBR_NAME '+
                        'FROM  Data0015 ORDER BY  WAREHOUSE_CODE';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;
    5:
    begin
      InputVar.Fields := 'CODE/仓库代码/200,LOCATION/仓库名称/250';
      InputVar.Sqlstr :='SELECT RKEY,CODE,LOCATION FROM Data0016 where location_type=1 ORDER BY CODE';
      inputvar.KeyField:='CODE';
    end;
  end;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case listbox5.ItemIndex of
     0:begin
         edit5.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_number']);
         button5.Enabled:=true;
         button5.SetFocus;
       end;
     1:begin
         edit5.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['prod_code']);
         button5.Enabled:=true;
         button5.SetFocus;
       end;
     3:begin
         edit5.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
         button5.Enabled:=true;
         button5.SetFocus;
       end;
     4:begin
         edit5.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         label_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
         button5.Enabled:=true;
         button5.SetFocus;
       end;
     5:begin
         edit5.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
         label_rkey16.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
         button5.Enabled:=true;
         button5.SetFocus;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;


end;

procedure TForm1.Button5Click(Sender: TObject);
var
 i,j:byte;
 hasadded:boolean; //用于判断查询项目是否已添加
begin
 hasadded:=false;
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox5.Items[listbox5.itemindex]  then
   begin
    hasadded:=true; //查询项目已添加
    j:=i;           //记下已添加的查询项目的位置
   end;
 if hasadded=false then  //查询项目未添加则增加
  begin
   sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox5.Items[listbox5.itemindex];
   sgrid1.Cells[1,sgrid1.RowCount-1]:=edit5.Text;
   case listbox5.ItemIndex of
   0:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0025.MANU_PART_NUMBER LIKE ''%'+trim(edit5.Text)+'%''';
   1:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0008.PROD_CODE LIKE ''%'+edit5.Text+'%''';
   2:
    begin
     sgrid1.Cells[1,sgrid1.RowCount-1] := '从'+
     formatdatetime('yyyy-mm-dd ',self.DateTimePicker5.DateTime)+
     formatdatetime('hh:nn:ss',self.DateTimePicker6.DateTime)+'到'+
     formatdatetime('yyyy-mm-dd ',self.DateTimePicker7.DateTime)+
     formatdatetime('hh:nn:ss',self.DateTimePicker8.DateTime);
     sgrid1.Cells[2,sgrid1.RowCount-1] :=             //成品入仓日期为长格式
     'and  Data0053.mfg_date >= '''+formatdatetime('yyyy-mm-dd ',DateTimePicker5.DateTime)+
     formatdatetime('hh:nn:ss',DateTimePicker6.DateTime)+
     ''' and Data0053.mfg_date <= '''+formatdatetime('yyyy-mm-dd ',self.DateTimePicker7.DateTime)+
     formatdatetime('hh:nn:ss',self.DateTimePicker8.DateTime)+'''';
    end;
   3:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0010.cust_code LIKE ''%'+trim(edit5.Text)+'%''';
   4:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0053.whse_ptr = '+label_rkey15.Caption;
   5:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0053.LOC_PTR = '+label_rkey16.Caption;
   6:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0025.MANU_PART_DESC LIKE ''%'+trim(edit5.Text)+'%''';
   7:
   begin
     sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioGroup7.Items[RadioGroup7.itemindex]+edit5.Text;
    case RadioGroup7.ItemIndex of
     0:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.LAYERS ='+trim(edit5.Text)+'';
     1:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.LAYERS <>'+trim(edit5.Text)+'';
     2:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.LAYERS >'+trim(edit5.Text)+'';
    end;
   end;
   8:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0025.SAMPLE_NR LIKE ''%'+trim(edit5.Text)+'%''';
   end;
   sgrid1.RowCount:=sgrid1.RowCount+1;
  end
 else   //查询项目已添加则修改
  begin
   sgrid1.Cells[1,j]:=edit5.Text;
   case listbox5.ItemIndex of
   0:
    sgrid1.Cells[2,j] := 'and Data0025.MANU_PART_NUMBER LIKE '''+trim(edit5.Text)+'%''';
   1:
    sgrid1.Cells[2,j] := 'and Data0008.PROD_CODE LIKE '''+edit5.Text+'%''';
   2:
    begin
     sgrid1.Cells[1,j] := '从'+
     formatdatetime('yyyy-mm-dd ',self.DateTimePicker5.DateTime)+
     formatdatetime('hh:nn:ss',self.DateTimePicker6.DateTime)+'到'+
     formatdatetime('yyyy-mm-dd ',self.DateTimePicker7.DateTime)+
     formatdatetime('hh:nn:ss',self.DateTimePicker8.DateTime);
     sgrid1.Cells[2,j] :=                  //成品入仓日期为长格式
     'and  Data0053.mfg_date >= '''+
     formatdatetime('yyyy-mm-dd ',self.DateTimePicker5.DateTime)+
     formatdatetime('hh:nn:ss',self.DateTimePicker6.DateTime)+
     ''' and Data0053.mfg_date <= '''+
     formatdatetime('yyyy-mm-dd ',self.DateTimePicker7.DateTime)+
     formatdatetime('hh:nn:ss',self.DateTimePicker8.DateTime)+'''';
    end;
   3:
    sgrid1.Cells[2,j] := 'and data0010.cust_code LIKE '''+trim(edit5.Text)+'%''';
   4:
    sgrid1.Cells[2,j] := 'and data0053.whse_ptr = '+label_rkey15.Caption;
   5:
    sgrid1.Cells[2,j] := 'and data0053.LOC_PTR = '+label_rkey16.Caption;
   6:
    sgrid1.Cells[2,j] := 'and Data0025.MANU_PART_DESC LIKE ''%'+trim(edit5.Text)+'%''';
   7:
   begin
     sgrid1.Cells[1,j]:=RadioGroup7.Items[RadioGroup7.itemindex]+edit5.Text;
    case RadioGroup7.ItemIndex of
     0:sgrid1.Cells[2,j]:='and Data0025.LAYERS ='+trim(edit5.Text)+'';
     1:sgrid1.Cells[2,j]:='and Data0025.LAYERS <>'+trim(edit5.Text)+'';
     2:sgrid1.Cells[2,j]:='and Data0025.LAYERS >'+trim(edit5.Text)+'';
    end;
   end;
   8:
    sgrid1.Cells[2,j] := 'and Data0025.SAMPLE_NR LIKE ''%'+trim(edit5.Text)+'%''';
   end;
  end;
end;

procedure TForm1.ListBox6Click(Sender: TObject);
begin
label18.Caption:=listbox6.Items[listbox6.itemindex];
edit6.Text:='';
edit6.Visible:=true;
button6.Enabled:=false;
bitbtn9.Visible:=true;
label16.Visible:=false;
label17.Visible:=false;
dtpk11.Visible:=false;
dtpk12.Visible:=false;
dttm11.Visible:=false;
dttm12.Visible:=false;
combobox3.Visible:=false;
radiogroup6.Visible:= listbox6.ItemIndex=9;
case listbox6.ItemIndex of
2:
 begin
  edit6.Visible:=false;
  button6.Enabled:=true;
  bitbtn9.Visible:=false;
  label16.Visible:=true;
  label17.Visible:=true;
  dtpk11.Visible:=true;
  dtpk12.Visible:=true;
  dttm11.Visible:=true;
  dttm12.Visible:=true;
 end;
6:bitbtn9.Visible:=false;
7:
begin
 combobox3.Visible:=true;
  edit6.Visible:=false;
  button6.Enabled:=true;
  bitbtn9.Visible:=false;
end;
8:
begin
  edit6.Visible:=false;
  button6.Enabled:=true;
  bitbtn9.Visible:=false;
  label16.Visible:=true;
  label17.Visible:=true;
  dtpk11.Visible:=true;
  dtpk12.Visible:=true;
end;
9:bitbtn9.Visible:=false;
end;

end;

procedure TForm1.Edit6KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit6.Text)<>'' then
 button6.Enabled:=true
else
 button6.Enabled:=false;
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case listbox6.ItemIndex of
    0:
    begin
      InputVar.Fields := 'manu_part_number/本厂编号/100,manu_part_desc/客户型号/150,bath_former/性质/100';
      InputVar.Sqlstr :='select  rkey,manu_part_number,manu_part_desc, customer_ptr,'+
                        'case data0025.ttype when 0 then ''批量'' when 1 then ''样板'' end bath_former '+
                        'from  data0025 '+
                        'where data0025.PARENT_PTR is null '+
                        'order by manu_part_number';
      inputvar.KeyField:='manu_part_number';
    end;
    1:
    begin
      InputVar.Fields := 'prod_code/产品类别/200,product_name/类别名称/250';
      InputVar.Sqlstr :='select rkey,prod_code,product_name from data0008 order by prod_code';
      inputvar.KeyField:='prod_code';
    end;
    3:
    begin
      InputVar.Fields := 'cust_code/客户代码/200,customer_name/客户名称/250';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
    end;
    4:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,ABBR_NAME/工厂简称/150,WAREHOUSE_NAME/工厂全称/250';
      InputVar.Sqlstr :='SELECT  RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME,ABBR_NAME '+
                        'FROM  Data0015 ORDER BY  WAREHOUSE_CODE';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;
    5:
    begin
      InputVar.Fields := 'CODE/仓库代码/200,LOCATION/仓库名称/250';
      InputVar.Sqlstr :='SELECT RKEY,CODE,LOCATION FROM Data0016 where location_type=1 ORDER BY CODE';
      inputvar.KeyField:='CODE';
    end;
  end;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case listbox6.ItemIndex of
     0:begin
         edit6.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_number']);
         button6.Enabled:=true;
         button6.SetFocus;
       end;
     1:begin
         edit6.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['prod_code']);
         button6.Enabled:=true;
         button6.SetFocus;
       end;
     3:begin
         edit6.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
         button6.Enabled:=true;
         button6.SetFocus;
       end;
     4:begin
         edit6.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         label_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
         button6.Enabled:=true;
         button6.SetFocus;
       end;
     5:begin
         edit6.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
         label_rkey16.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
         button6.Enabled:=true;
         button6.SetFocus;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;


{case listbox6.ItemIndex of

 0:
  try
   form_custpart:=tform_custpart.Create(application);
   if form_custpart.ShowModal=mrok then
    begin
     edit6.Text:=form_custpart.ADOQuery1manu_part_number.Value;
     button6.Enabled:=true;
     button6.SetFocus;
    end
   else
    edit6.SetFocus;
  finally
   form_custpart.free;
  end;
 1:
 try
  form_prodcode:=tform_prodcode.Create(application);
  if form_prodcode.ShowModal=mrok then
   begin
    edit6.Text:=form_prodcode.ADOQuery1prod_code.Value;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
 finally
  form_prodcode.free;
 end;

 2:;
 3:
 try
  form_customer:=tform_customer.Create(application);
  if form_customer.ShowModal=mrok then
   begin
    edit6.Text:=form_customer.ADOQuery1cust_code.Value;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
 finally
  form_customer.free;
 end;
 4:
 try
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit6.Text:=form_wh.ADOQuery1WAREHOUSE_CODE.Value;
    label_rkey15.Caption := form_wh.ADOQuery1RKEY.AsString;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
 finally
  form_wh.free;
 end;
5:
 try
  form_lo:=tform_lo.Create(application);
  if form_lo.ShowModal=mrok then
   begin
    edit6.Text:=form_lo.ADOQuery1CODE.Value;
    label_rkey16.Caption := form_lo.ADOQuery1RKEY.AsString;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
 finally
  form_lo.free;
 end;

end;}

end;

procedure TForm1.Button6Click(Sender: TObject);
var
 i,j:byte;
 hasadded:boolean; //用于判断查询项目是否已添加
begin
 hasadded:=false;
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox6.Items[listbox6.itemindex]  then
   begin
    hasadded:=true;  //查询项目已添加
    j:=i;            //记下已添加的查询项目的位置
    break;
   end;
 if hasadded=false then   //查询项目未添加则增加
  begin
   sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox6.Items[listbox6.itemindex];
   sgrid1.Cells[1,sgrid1.RowCount-1]:=edit6.Text;
   case listbox6.ItemIndex of
   0:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0025.MANU_PART_NUMBER LIKE ''%'+trim(edit6.Text)+'%''';
   1:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0008.PROD_CODE LIKE ''%'+trim(edit6.Text)+'%''';
   2:
    begin
     sgrid1.Cells[1,sgrid1.RowCount-1] :=
       '从'+datetostr(dtpk11.date)+'到'+datetostr(dtpk12.date);
     sgrid1.Cells[2,sgrid1.RowCount-1] := //成品指派日期为长格式
                   'and  Data0064.date_assign >= '''+datetostr(dtpk11.date)+
                    formatdatetime(' hh:nn:ss',dttm11.Time)+
                   '''and Data0064.date_assign <= '''+datetostr(dtpk12.date)+
                    formatdatetime(' hh:nn:ss',dttm12.Time)+'''';
    end;
   3:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0010.cust_code LIKE ''%'+trim(edit6.Text)+'%''';
   4:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0053.whse_ptr = '+label_rkey15.Caption;
   5:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0053.LOC_PTR = '+label_rkey16.Caption;
   6:
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0025.MANU_PART_DESC LIKE ''%'+trim(edit6.Text)+'%''';
   7:
    begin
     sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox3.Text;
     sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060.so_tp = '+inttostr(combobox3.ItemIndex);
    end;
   8:
    begin
     sgrid1.Cells[1,sgrid1.RowCount-1] := '从'+datetostr(dtpk11.date)+'到'+datetostr(dtpk12.date);
     sgrid1.Cells[2,sgrid1.RowCount-1] :=                  //装运日期为短格式
     'and  data0439.date_sailing >= '''+datetostr(dtpk11.date)+
     '''and data0439.date_sailing <= '''+datetostr(dtpk12.date)+'''';
    end;

   9:
   begin
     if RadioGroup6.ItemIndex=0 then
       sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.LAYERS='+edit6.Text
     else if RadioGroup6.ItemIndex=1 then
       sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.LAYERS<>'+edit6.Text
     else
       sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.LAYERS>'+edit6.Text;
     sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioGroup6.Items[RadioGroup6.ItemIndex]+edit6.Text;
   end;

   end;
   sgrid1.RowCount:=sgrid1.RowCount+1;
  end
 else    //查询项目已添加则修改
  begin
   sgrid1.Cells[1,j]:=edit6.Text;
   case listbox6.ItemIndex of
   0:
    sgrid1.Cells[2,j] := 'and Data0052.MANU_PART_NUMBER LIKE ''%'+trim(edit6.Text)+'%''';
   1:
    sgrid1.Cells[2,j] := 'and Data0008.PROD_CODE LIKE ''%'+trim(edit6.Text)+'%''';
   2:
    begin
     sgrid1.Cells[1,j] := '从'+datetostr(dtpk11.date)+'到'+datetostr(dtpk12.date);
     sgrid1.Cells[2,j] :=                  //成品指派日期为长格式
     'and  Data0064.date_assign >= '''+datetostr(dtpk11.date)+
     formatdatetime(' hh:nn:ss',dttm11.Time)+
     '''and Data0064.date_assign <= '''+datetostr(dtpk12.date)+
     formatdatetime(' hh:nn:ss',dttm12.Time)+'''';
    end;
   3:
    sgrid1.Cells[2,j] := 'and data0010.cust_code LIKE ''%'+trim(edit6.Text)+'%''';
   4:
    sgrid1.Cells[2,j] := 'and data0053.whse_ptr = '+label_rkey15.Caption;
   5:
    sgrid1.Cells[2,j] := 'and data0053.LOC_PTR = '+label_rkey16.Caption;
   6:
    sgrid1.Cells[2,j] := 'and Data0025.MANU_PART_DESC LIKE ''%'+trim(edit6.Text)+'%''';
   7:
    begin
     sgrid1.Cells[1,j]:=combobox3.Text;
     sgrid1.Cells[2,j]:='and Data0060.so_tp = '+inttostr(combobox3.ItemIndex);
    end;
   8:
    begin
     sgrid1.Cells[1,j] := '从'+datetostr(dtpk11.date)+'到'+datetostr(dtpk12.date);
     sgrid1.Cells[2,j] :=                  //装运日期为短格式
     'and  data0439.date_sailing >= '''+datetostr(dtpk11.date)+
     '''and data0439.date_sailing <= '''+datetostr(dtpk12.date)+'''';
    end;
   9:
   begin
     if RadioGroup6.ItemIndex=0 then
       sgrid1.Cells[2,j]:='and data0025.LAYERS='+edit6.Text
     else if RadioGroup6.ItemIndex=1 then
       sgrid1.Cells[2,j]:='and data0025.LAYERS<>'+edit6.Text
     else
       sgrid1.Cells[2,j]:='and data0025.LAYERS>'+edit6.Text;
     sgrid1.Cells[1,j]:=RadioGroup6.Items[RadioGroup6.ItemIndex]+edit6.Text;
   end;
   end;
  end;
end;

procedure TForm1.BitBtn10Click(Sender: TObject);
begin
 form1.Hide;
 form_date:=tform_date.Create(application);
 form_date.ShowModal;
 form_date.Free;
end;

procedure TForm1.ListBox7Click(Sender: TObject);
begin
 label21.Caption:=listbox7.Items[listbox7.itemindex];
 ComboBox1.Visible :=false;
 label19.Visible:=false;
 label20.Visible:=false;
 dtpk13.Visible:=false;
 dtpk14.Visible:=false;
 bitbtn11.Visible:=false;
 button7.Enabled:=false;
 edit7.Visible:=true;
 edit7.Text:='';
 label22.Caption:='(,';
 rg2.Visible := False;
 ComboBox6.Visible:=False;
case listbox7.ItemIndex of
 0:
 begin
  bitbtn11.Visible:=true;
  edit7.ReadOnly:=False;
 end;
 1:
 begin
  bitbtn11.Visible:=true;
  edit7.ReadOnly:=True;
 end;
 2:
 begin
  bitbtn11.Visible:=true;
  edit7.ReadOnly:=False;
 end;
 3:
 begin
  edit7.Visible:=false;
  button7.Enabled:=true;
  label19.Visible:=true;
  label20.Visible:=true;
  dtpk13.Visible:=true;
  dtpk14.Visible:=true;
 end;
 4:
 begin
  bitbtn11.Visible:=true;
  edit7.ReadOnly:=false;
 end;
 5:
 begin
  bitbtn11.Visible:=true;
  edit7.ReadOnly:=false;
 end;
 6:
 begin
      edit7.Visible:=false;
      ComboBox1.Visible :=true;
      Button7.Enabled :=true;
 end;
 8:
 begin
  bitbtn11.Visible:=true;
  edit7.ReadOnly:=False;
 end;
 9:
 begin
  bitbtn11.Visible:=False;
  edit7.Visible:=False;
  rg2.Visible := True;
  Button7.Enabled := True;
 end;
 10:bitbtn11.Visible:=False;
  11:
  begin
    ComboBox6.Visible:=True;
    ComboBox6.Items.Clear;
    ComboBox6.Style:=csDropDown;
    ADOQuery1.Close;
    ADOQuery1.SQL.Text:='select data0338.tvalue from data0278 inner join data0338 on data0278.Rkey=data0338.parameter_ptr where  data0278.SPEC_RKEY=''js''';
    ADOQuery1.Open;
    while not ADOQuery1.Eof do
    begin
     ComboBox6.Items.Add(ADOQuery1.FieldBYName('tvalue').AsString);
     ADOQuery1.Next;
    end;
    ComboBox6.ItemIndex:=-1;
    edit7.Visible:=false;
    Button7.Enabled:=True;
  end;
end;
 
end;

procedure TForm1.Edit7Change(Sender: TObject);
begin
if trim(edit7.Text)<>'' then
 button7.Enabled:=true
else
 button7.Enabled:=false;
end;

procedure TForm1.BitBtn11Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 if Self.ListBox7.ItemIndex=1 then
 begin
  with TForm_Wh.Create(Application)do
  try
    if Edit7.Text<>'' then
    adsPickWorkShop.CommandText:=
    adsPickWorkShop.CommandText+'and rkey not in '+label22.Caption;

    adsPickWorkShop.CommandText:=
    adsPickWorkShop.CommandText+' order by Code';
    Enter(0);
    if ShowModal = mrok then
    begin
      cdsPickWorkShop.First;
      Label22.Caption:=Copy(label22.Caption,1,Length(label22.Caption)-1);
      if Length(Label22.Caption)>1 then
       label22.Caption:=label22.Caption+',';
      while not cdsPickWorkShop.Eof do
      begin
       if cdsPickWorkShop.FieldByName('IsSelected').AsBoolean then
        begin
         Edit7.Text:=Edit7.Text+cdsPickWorkShop.fieldbyName('Code').AsString+';';
         if cdsPickWorkShop.RecNo<>cdsPickWorkShop.RecordCount then
          label22.Caption:=label22.Caption+cdsPickWorkShop.fieldbyName('rkey').AsString+','
         else
          label22.Caption:=label22.Caption+cdsPickWorkShop.fieldbyName('rkey').AsString+')';
        end;
        cdsPickWorkShop.next;
      end;
    end;
  finally
    release;
  end;
 end
 else
 begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
   case listbox7.ItemIndex of
    0:
    begin
      InputVar.Fields := 'manu_part_number/本厂编号/100,manu_part_desc/客户型号/150,bath_former/性质/100';
      InputVar.Sqlstr :='select  rkey,manu_part_number,manu_part_desc, customer_ptr,'+
                        'case data0025.ttype when 0 then ''批量'' when 1 then ''样板'' end bath_former '+
                        'from  data0025 '+
                        'where data0025.PARENT_PTR is null '+
                        'order by manu_part_number';
      inputvar.KeyField:='manu_part_number';
    end;
//    1:
//    begin
//      InputVar.Fields := 'CODE/仓库代码/200,LOCATION/仓库名称/250';
//      InputVar.Sqlstr :='SELECT RKEY,CODE,LOCATION FROM Data0016 where location_type=1 ORDER BY CODE';
//      Inputvar.KeyField:='CODE';
//    end;
    2:
    begin
      InputVar.Fields := 'cust_code/客户代码/200,customer_name/客户名称/250';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
    end;
    4:
    begin
      InputVar.Fields := 'prod_code/产品类别/200,product_name/类别名称/250';
      InputVar.Sqlstr :='select rkey,prod_code,product_name from data0008 order by prod_code';
      inputvar.KeyField:='prod_code';
    end;
    5:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,ABBR_NAME/工厂简称/150,WAREHOUSE_NAME/工厂全称/250';
      InputVar.Sqlstr :='SELECT  RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME,ABBR_NAME '+
                        'FROM  Data0015 ORDER BY  WAREHOUSE_CODE';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;
    8:
    begin
      InputVar.Fields := 'cust_code/客户代码/200,customer_name/客户名称/250,ABBR_NAME/名称缩写/200';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name,ABBR_NAME '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='ABBR_NAME';
    end;
   end;
   InputVar.AdoConn := ADOConnection1 ;
   frmPick_Item_Single.InitForm_New(InputVar);
   if frmPick_Item_Single.ShowModal=mrok then
   begin
    case listbox7.ItemIndex of
     0:begin
         edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_number']);
         button7.Enabled:=true;
         button7.SetFocus;
       end;
//     1:begin
//         edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
//         button7.Enabled:=true;
//         button7.SetFocus;
//       end;
     2:begin
         edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
         button7.Enabled:=true;
         button7.SetFocus;
       end;
     4:begin
         edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['prod_code']);
         button7.Enabled:=true;
         button7.SetFocus;
       end;
     5:begin
         edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         button7.Enabled:=true;
         button7.SetFocus;
       end;
     8:begin
         edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME']);
         button7.Enabled:=true;
         button7.SetFocus;
       end;
    end;
   end ;
  finally
  frmPick_Item_Single.Free ;
  end;
 end;


{case listbox7.ItemIndex of
 0:
  try
   form_custpart:=tform_custpart.Create(application);
   if form_custpart.ShowModal=mrok then
    begin
     edit7.Text:=form_custpart.ADOQuery1manu_part_number.Value;
     button7.Enabled:=true;
     button7.SetFocus;
    end
   else
    edit7.SetFocus;
  finally
   form_custpart.free;
  end;
 1:
 try
  form_lo:=tform_lo.Create(application);
  if form_lo.ShowModal=mrok then
   begin
    edit7.Text:=form_lo.ADOQuery1CODE.Value;
    button7.Enabled:=true;
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
 finally
  form_lo.free;
 end;
 2:
 try
  form_customer:=tform_customer.Create(application);
  if form_customer.ShowModal=mrok then
   begin
    edit7.Text:=form_customer.ADOQuery1cust_code.Value;
    button7.Enabled:=true;
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
 finally
  form_customer.free;
 end;
 3:;
 4:
 try
  form_prodcode:=tform_prodcode.Create(application);
  if form_prodcode.ShowModal=mrok then
   begin
    edit7.Text:=form_prodcode.ADOQuery1prod_code.Value;
    button7.Enabled:=true;
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
 finally
  form_prodcode.free;
 end;
5:
 try
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit7.Text:=form_wh.ADOQuery1WAREHOUSE_CODE.Value;
    button7.Enabled:=true;
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
 finally
  form_wh.free;
 end;
end;
 }
end;

procedure TForm1.Button7Click(Sender: TObject);
var
 i,j:byte;
 hasadded:boolean;  //用于判断查询项目是否已添加
begin
 hasadded:=false;
 for i:=1 to sgrid1.RowCount-2 do
 if sgrid1.Cells[0,i]=listbox7.Items[listbox7.itemindex]  then
  begin
   hasadded:=true;  //查询项目已添加
   j:=i;            //记下已添加的查询项目的位置
  end;
 if hasadded=false then //查询项目未添加则增加
  begin
   sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox7.Items[listbox7.itemindex];
   sgrid1.Cells[1,sgrid1.RowCount-1]:=edit7.Text;
   if listbox7.ItemIndex = 9 then
    sgrid1.Cells[1,sgrid1.RowCount-1] := rg2.Items[rg2.itemindex];
   case listbox7.ItemIndex of
           0:
                  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.MANU_PART_NUMBER LIKE ''%'+trim(edit7.Text)+'%''';
           1:
                  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0016.rkey in '+label22.caption;
           2:
                  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0010.cust_code LIKE ''%'+trim(edit7.Text)+'%''';
           3:
                  begin
                   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk13.date)+'到'+datetostr(dtpk14.date);
                   sgrid1.Cells[2,sgrid1.RowCount-1]:=
                   'and  Data0053.mfg_date>='''+datetostr(dtpk13.date)+''' and Data0053.mfg_date<='''+datetostr(dtpk14.date+1)+'''';
                  end;
           4:
                  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0008.PROD_CODE LIKE ''%'+trim(edit7.Text)+'%''';
           5:
                  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0015.WAREHOUSE_CODE = '''+trim(edit7.Text)+'''';
           6:
             begin
                  sgrid1.Cells[1,sgrid1.RowCount-1]:= trim(ComboBox1.Text);
                  if  trim(ComboBox1.Text) = '内销' then
                      sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060.COMMISION_ON_TOOLING = '+#39+'N'+#39+''
                  else
                      sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060.COMMISION_ON_TOOLING = '+#39+'Y'+#39+'';
             end;
           7:  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.SAMPLE_NR LIKE ''%'+trim(edit7.Text)+'%''';
           8:
               sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.ORIG_CUSTOMER LIKE ''%'+trim(edit7.Text)+'%''';
   9: sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0053.ischaban= ' + IntToStr(rg2.ItemIndex);
   10: sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0053.zhouqi LIKE ''%'+trim(edit7.Text)+'%''';
     11:
     begin
       if (Trim(combobox6.Text)='') then
       begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=' and 1=1';
         sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox6.Text;
       end else
       begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=' and data0025.CPJS like ''%'+combobox6.Text+'%''';
         sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox6.Text;
       end;
     end;
   end;
   sgrid1.RowCount:=sgrid1.RowCount+1;
  end
 else   //查询项目已添加则修改
  begin
   sgrid1.Cells[1,j]:=edit7.Text;
   if listbox7.ItemIndex = 9 then
    sgrid1.Cells[1,j] := rg2.Items[rg2.itemindex];
   case listbox7.ItemIndex of
           0:
                    sgrid1.Cells[2,j]:='and Data0025.MANU_PART_NUMBER LIKE ''%'+trim(edit7.Text)+'%''';
           1:
                    //sgrid1.Cells[2,j]:='and Data0016.code LIKE ''%'+trim(edit7.Text)+'%''';
                    sgrid1.Cells[2,j]:='and Data0016.rkey in '+label22.caption;
           2:
                    sgrid1.Cells[2,j]:='and data0010.cust_code LIKE ''%'+trim(edit7.Text)+'%''';
           3:
                    begin
                     sgrid1.Cells[1,j]:='从'+datetostr(dtpk13.date)+'到'+datetostr(dtpk14.date);
                     sgrid1.Cells[2,sgrid1.RowCount-1]:=
                     'and  Data0053.mfg_date>='''+datetostr(dtpk13.date)+''' and Data0053.mfg_date<='''+datetostr(dtpk14.date+1)+'''';
                    end;
           4:
                    sgrid1.Cells[2,j]:='and Data0008.PROD_CODE LIKE ''%'+trim(edit7.Text)+'%''';
           5:
                    sgrid1.Cells[2,j]:='and Data0015.WAREHOUSE_CODE = '''+trim(edit7.Text)+'''';
            6:
                     begin
                          sgrid1.Cells[1,sgrid1.RowCount-1]:= trim(ComboBox1.Text);
                          if  trim(ComboBox1.Text) = '内销' then
                              sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060.COMMISION_ON_TOOLING = '''+#39+'N'+#39+''''
                          else
                              sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060.COMMISION_ON_TOOLING = '''+#39+'Y'+#39+'''';
                     end;
            7:
                    sgrid1.Cells[2,j]:='and Data0025.SAMPLE_NR LIKE ''%'+trim(edit7.Text)+'%''';
            8:
                    sgrid1.Cells[2,j]:='and data0025.ORIG_CUSTOMER LIKE ''%'+trim(edit7.Text)+'%''';
   9: sgrid1.Cells[2,j]:='and Data0053.ischaban= ' + IntToStr(rg2.ItemIndex);
   10: sgrid1.Cells[2,j]:='and Data0053.zhouqi LIKE ''%'+trim(edit7.Text)+'%''';
     11:
     begin
       if (Trim(combobox6.Text)='') then
       begin
         sgrid1.Cells[2,j]:=' and 1=1';
         sgrid1.Cells[1,j]:=combobox6.Text;
       end else
       begin
         sgrid1.Cells[2,j]:=' and data0025.CPJS like ''%'+combobox6.Text+'%''';
         sgrid1.Cells[1,j]:=combobox6.Text;
       end;
     end;
   end;
  end;
end;

procedure TForm1.Edit7DblClick(Sender: TObject);
begin
 if ListBox7.ItemIndex=1 then
 begin
   Edit7.Text:='';
   label22.Caption:='(,';
 end;
end;

procedure TForm1.Edit3DblClick(Sender: TObject);
begin
 if ListBox3.ItemIndex=2 then
 begin
   Edit3.Text:='';
   label23.Caption:='(,';
 end;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
 if trim(edit3.Text)<>'' then
  button3.Enabled:=true
 else
  button3.Enabled:=false;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=SGrid1.RowCount-1 then
  N1.Enabled:=False
 else
  N1.Enabled:=True;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i]:=sgrid1.Rows[i+1];
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm1.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   sgrid1.MouseToCell(x,y,column,row);
   if (row>0)  then
    begin
     sgrid1.Row:=row;
    end;
 end;
end;

end.
