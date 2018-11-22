unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, Buttons, ComCtrls, DB, ADODB;

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
    RGp4: TRadioGroup;
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
    ADOQuery1: TADOQuery;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    dttm3: TDateTimePicker;
    dttm4: TDateTimePicker;
    GroupBox8: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    RGp2: TRadioGroup;
    GroupBox9: TGroupBox;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    GroupBox10: TGroupBox;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    GroupBox11: TGroupBox;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
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
    procedure RGp4Click(Sender: TObject);
    procedure ListBox7Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    procedure update_sgrid(sgrid_row: byte);
    procedure update_sgrid_2(sgrid_row: byte);
    procedure update_sgrid_7(sgrid_row: byte);
    procedure update_sgrid_3(sgrid_row: byte);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses part_in,common,part_out, part_quantity,
  warehouse_mixi,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
  if self.ADOConnection1.Connected then
    begin
      showmessage('程序在开发模式下运行，请在发布前关闭连接后进行编译发布！');
    end
  else
    if not app_init_2(ADOConnection1) then
     begin
      showmsg('程序起动失败请联系管理员!',1);
      application.Terminate;
     end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  listbox1.Selected[0]:=true;

  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
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

 edit1.Visible:=true;
 edit1.Text:='';

 rgp2.Visible:=false;
 groupbox8.Visible:=false;
  case listbox1.ItemIndex of
   0..6,9:
     begin
      bitbtn4.Visible:=true;
      groupbox8.Visible:=true;
     end;
   7:rgp2.Visible:=true;
   8:
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
  end;

end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox1.ItemIndex of
    0:
    begin
      InputVar.Fields := 'SALES_ORDER/订单编号/110,PO_NUMBER/采购订单号/285,MANU_PART_NUMBER/本厂编号/89,'+
                         'MANU_PART_DESC/客户型号/149';
      InputVar.Sqlstr :='SELECT dbo.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMBER,'+
                              ' dbo.Data0025.MANU_PART_DESC,  dbo.DATA0153.PO_NUMBER'+#13+
                        'FROM  dbo.Data0060 INNER JOIN '+#13+
                        '      dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Data0064.SO_PTR INNER JOIN '+#13+
                        '      dbo.DATA0153 ON dbo.Data0064.RKEY = dbo.DATA0153.SHIP_PTR INNER JOIN '+#13+
                        '      dbo.Data0025 ON dbo.DATA0153.CUSTPART_PTR = dbo.Data0025.RKEY ';
      inputvar.KeyField:='SALES_ORDER';
    end;
    1:
    begin
      InputVar.Fields := 'PO_NUMBER/采购订单号/285,SALES_ORDER/订单编号/110,MANU_PART_NUMBER/本厂编号/89,'+
                         'MANU_PART_DESC/客户型号/149';
      InputVar.Sqlstr :='SELECT dbo.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMBER,'+
                              ' dbo.Data0025.MANU_PART_DESC,  dbo.DATA0153.PO_NUMBER'+#13+
                        'FROM  dbo.Data0060 INNER JOIN '+#13+
                        '      dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Data0064.SO_PTR INNER JOIN '+#13+
                        '      dbo.DATA0153 ON dbo.Data0064.RKEY = dbo.DATA0153.SHIP_PTR INNER JOIN '+#13+
                        '      dbo.Data0025 ON dbo.DATA0153.CUSTPART_PTR = dbo.Data0025.RKEY ';
      inputvar.KeyField:='PO_NUMBER';
    end;
    2:
    begin
      InputVar.Fields := 'PROD_CODE/产品类型/110,PRODUCT_NAME/类型名称/285';
      InputVar.Sqlstr :='SELECT RKEY, PROD_CODE, PRODUCT_NAME'+#13+
                        'FROM dbo.Data0008 order by PROD_CODE ';
      inputvar.KeyField:='PROD_CODE';
    end;
    3:
    begin
      InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
      InputVar.Sqlstr:='SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+
                       'data0010.abbr_name FROM dbo.Data0010 order  by cust_code';
      inputvar.KeyField:='CUST_CODE';
    end;
    4:
    begin
      InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
                         'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
      InputVar.Sqlstr :='SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
                        'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
                        'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
                        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
                        'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
                        'dbo.Data0025.set_qty'+#13+
                        'FROM dbo.Data0025 INNER JOIN dbo.Data0008 '+
                        'ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN dbo.Data0010 '+
                        'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
                        'order by dbo.Data0025.MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_NUMBER';
    end;
    5:
    begin
      InputVar.Fields := 'MANU_PART_DESC/客户型号/149,'+
                         'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
      InputVar.Sqlstr :='SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
                        'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
                        'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
                        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
                        'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
                        'dbo.Data0025.set_qty'+#13+
                        'FROM dbo.Data0025 INNER JOIN dbo.Data0008 '+
                        'ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN dbo.Data0010 '+
                        'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
                        'order by dbo.Data0025.MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_DESC';
    end;
    6:
    begin
      InputVar.Fields := 'EMPLOYEE_NAME/姓名/149,EMPL_CODE/工号/116';
      InputVar.Sqlstr :='SELECT DISTINCT dbo.Data0005.EMPLOYEE_NAME, dbo.Data0005.EMPL_CODE'+#13+
                        'FROM dbo.DATA0153 INNER JOIN'+#13+
                        '     dbo.Data0005 ON dbo.DATA0153.EMPL_PTR = dbo.Data0005.RKEY'+#13+
                        'ORDER BY dbo.Data0005.EMPLOYEE_NAME';
      inputvar.KeyField:='EMPLOYEE_NAME';
    end;
    9:
    begin
      InputVar.Fields := 'ANALYSIS_CODE_2/客户物料号/250,CUST_CODE/客户代码/149,ABBR_NAME/客户简称/116,MANU_PART_NUMBER/本厂编号/149,MANU_PART_DESC/客户型号/149';
      InputVar.Sqlstr := 'SELECT Data0010.CUST_CODE, Data0010.ABBR_NAME, Data0025.ANALYSIS_CODE_2, Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC '+#13+
                         'FROM   Data0025 INNER JOIN '+#13+
                         '       Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY '+#13+
                         'WHERE  (Data0025.ANALYSIS_CODE_2 IS NOT NULL AND Data0025.ANALYSIS_CODE_2 <> '''') '+#13+
                         'ORDER BY Data0010.CUST_CODE, Data0025.ANALYSIS_CODE_2 ';
      inputvar.KeyField:='ANALYSIS_CODE_2';
    end;  
 end;

  inputvar.InPut_value:=edit1.Text;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox1.ItemIndex of
     0:edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['SALES_ORDER']);
     1:edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PO_NUMBER']);
     2:edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PROD_CODE']);
     3:edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
     4:edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
     5:edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_DESC']);
     6:edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']);
     9:edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['ANALYSIS_CODE_2'])
    end;
    button1.Enabled:=true;
    button1.SetFocus;
  end else edit1.SetFocus;
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
if listbox1.ItemIndex=7 then
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
begin
screen.Cursor:=crsqlwait;
case radiogroup1.ItemIndex of
0:
begin   //寄售入库明细
  if sgrid1.RowCount=2 then
   begin
    messagedlg('请首先定义查询条件!',mtinformation,[mbok],0);
    screen.Cursor:=crdefault;
   end
  else
   begin
    try
     form2:=tform2.Create(application);
     with form2.ado53 do
     begin
      close;
      for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
      if radiogroup3.ItemIndex<>2 then
       sql.Insert(sql.Count-1,'and data0025.ttype='+inttostr(radiogroup3.ItemIndex));
      open;
     end;
     if form2.ADO53.IsEmpty then
       begin
        messagedlg('对不起,没有找到符合条件的数据!',mtinformation,[mbok],0);
        screen.Cursor:=crdefault;
        exit;
       end;
     form1.Hide;
     form2.ShowModal;
    finally
     form2.free;
    end;
   end;
end;
1:
 begin   //出仓明细
   if sgrid1.RowCount=2 then
    begin
     messagedlg('请首先定义查询条件!',mtinformation,[mbok],0);
     screen.Cursor:=crdefault;
    end
   else
    begin
     try
      form3:=tform3.Create(application);
      with form3.ado52 do
       begin
        close;
        for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
        if radiogroup3.ItemIndex<>2 then
         sql.Insert(sql.Count-1,'and data0025.ttype='+inttostr(radiogroup3.ItemIndex));
        open;
       end;
       form3.SetColumn(nil);
      if form3.ADO52.IsEmpty then
       begin
        messagedlg('对不起,没有找到符合条件的数据!',mtinformation,[mbok],0);
        screen.Cursor:=crdefault;
        exit;
       end;
      form1.Hide;
      form3.ShowModal;
     finally
      form3.free;
     end;
   end;
 end;
2:
if rgp4.ItemIndex=0 then   //库存明细
 begin
  try
    form9:=tform9.Create(application);
    with form9.ado53 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);

       if radiogroup3.ItemIndex<>2 then
        sql.Insert(sql.Count-1,'and data0025.ttype='+inttostr(radiogroup3.ItemIndex));
       open;
      end;
    if form9.ADO53.IsEmpty then
      begin
       messagedlg('对不起,没有找到符合条件的数据!',mtinformation,[mbok],0);
       screen.Cursor:=crdefault;
      end
    else
      begin
       form1.Hide;
       form9.ShowModal;
      end;
  finally
    form9.Free;
  end;
 end
else                     //库存汇总
 begin
  try
    form4:=tform4.Create(application);
      with form4.aq53 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-3,sgrid1.Cells[2,i]);
       if radiogroup3.ItemIndex<>2 then
        sql.Insert(sql.Count-3,'and data0025.ttype='+inttostr(radiogroup3.ItemIndex));
       open;
      end;
    if form4.Aq53.IsEmpty then
      begin
        messagedlg('对不起,没有找到符合条件的数据!',mtinformation,[mbok],0);
        screen.Cursor:=crdefault;
      end
    else
      begin
        form1.Hide;
        form4.ShowModal;
      end;
  finally
    form4.free;
  end;
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
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox1.Items[listbox1.itemindex]  then
  begin
    self.update_sgrid(i);
    exit;
  end;
 self.update_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
bitbtn2click(sender);

groupbox1.Visible := false;
groupbox2.Visible := false;
groupbox3.Visible := false;
groupbox7.Visible := false;

rgp4.ItemIndex := 0;
rgp4.Visible := false;

case radiogroup1.ItemIndex of
0:
 begin
  groupbox1.Visible := true;
  listbox1.Selected[0] := true;
  listbox1click(sender);
 end;
1:
 begin
  groupbox2.Visible := true;
  listbox2.Selected[0] := true;
  listbox2click(sender);
 end;
2:
 begin
  groupbox7.Visible := true;
  listbox7.Selected[0] := true;
  listbox7click(sender);
  rgp4.Visible:=true;
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
 groupbox9.Visible:=true;
case listbox2.ItemIndex of
 0..4,9:bitbtn5.Visible:=true;
 5..6:;
 7..8:
   begin
    edit2.Visible:=false;
    button2.Enabled:=true;
    label1.Visible:=true;
    label5.Visible:=true;
    dtpk3.Visible:=true;
    dtpk4.Visible:=true;
    dttm3.Visible:=true;
    dttm4.Visible:=true;
    groupbox9.Visible:=false;
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
  case self.ListBox2.ItemIndex of
    0:
    begin
      InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
                         'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
      InputVar.Sqlstr :='SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
                        'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
                        'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
                        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
                        'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
                        'dbo.Data0025.set_qty'+#13+
                        'FROM dbo.Data0025 INNER JOIN dbo.Data0008 '+
                        'ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN dbo.Data0010 '+
                        'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
                        'order by dbo.Data0025.MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_NUMBER';
    end;
    1:
    begin
      InputVar.Fields := 'MANU_PART_DESC/客户型号/149,'+
                         'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
      InputVar.Sqlstr :='SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
                        'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
                        'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
                        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
                        'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
                        'dbo.Data0025.set_qty'+#13+
                        'FROM dbo.Data0025 INNER JOIN dbo.Data0008 '+
                        'ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN dbo.Data0010 '+
                        'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
                        'order by dbo.Data0025.MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_DESC';
    end;
    2:
    begin
      InputVar.Fields := 'SALES_ORDER/订单编号/110,PO_NUMBER/采购订单号/285,MANU_PART_NUMBER/本厂编号/89,'+
                         'MANU_PART_DESC/客户型号/149';
      InputVar.Sqlstr :='SELECT dbo.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMBER,'+
                              ' dbo.Data0025.MANU_PART_DESC,  dbo.DATA0153.PO_NUMBER'+#13+
                        'FROM  dbo.Data0060 INNER JOIN '+#13+
                        '      dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Data0064.SO_PTR INNER JOIN '+#13+
                        '      dbo.DATA0153 ON dbo.Data0064.RKEY = dbo.DATA0153.SHIP_PTR INNER JOIN '+#13+
                        '      dbo.Data0025 ON dbo.DATA0153.CUSTPART_PTR = dbo.Data0025.RKEY ';
      inputvar.KeyField:='SALES_ORDER';
    end;
    3:
    begin
      InputVar.Fields := 'PO_NUMBER/采购订单号/285,SALES_ORDER/订单编号/110,MANU_PART_NUMBER/本厂编号/89,'+
                         'MANU_PART_DESC/客户型号/149';
      InputVar.Sqlstr :='SELECT dbo.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMBER,'+
                              ' dbo.Data0025.MANU_PART_DESC,  dbo.DATA0153.PO_NUMBER'+#13+
                        'FROM  dbo.Data0060 INNER JOIN '+#13+
                        '      dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Data0064.SO_PTR INNER JOIN '+#13+
                        '      dbo.DATA0153 ON dbo.Data0064.RKEY = dbo.DATA0153.SHIP_PTR INNER JOIN '+#13+
                        '      dbo.Data0025 ON dbo.DATA0153.CUSTPART_PTR = dbo.Data0025.RKEY ';
      inputvar.KeyField:='PO_NUMBER';
    end;
    4:
    begin
      InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
      InputVar.Sqlstr:='SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+
                       'data0010.abbr_name FROM dbo.Data0010 order  by cust_code';
      inputvar.KeyField:='CUST_CODE';
    end;
    9:
    begin
      InputVar.Fields := 'ANALYSIS_CODE_2/客户物料号/250,CUST_CODE/客户代码/149,ABBR_NAME/客户简称/116,MANU_PART_NUMBER/本厂编号/149,MANU_PART_DESC/客户型号/149';
      InputVar.Sqlstr := 'SELECT Data0010.CUST_CODE, Data0010.ABBR_NAME, Data0025.ANALYSIS_CODE_2, Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC '+#13+
                         'FROM   Data0025 INNER JOIN '+#13+
                         '       Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY '+#13+
                         'WHERE  (Data0025.ANALYSIS_CODE_2 IS NOT NULL AND Data0025.ANALYSIS_CODE_2 <> '''') '+#13+
                         'ORDER BY Data0010.CUST_CODE, Data0025.ANALYSIS_CODE_2 ';
      inputvar.KeyField:='ANALYSIS_CODE_2';
    end;  
  end;
  inputvar.InPut_value:= edit2.Text;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox2.ItemIndex of
     0:edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
     1:edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_DESC']);
     2:edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['SALES_ORDER']);
     3:edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PO_NUMBER']);
     4:edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
     9:edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['ANALYSIS_CODE_2']);
     end;
    button2.Enabled:=true;
    button2.SetFocus;
  end else edit2.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox2.Items[listbox2.itemindex]  then
  begin
    self.update_sgrid_2(i);
    exit;
  end;
 self.update_sgrid_2(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;
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
 button3.Enabled:=false;
 groupbox11.Visible:=true;
  case listbox3.ItemIndex of
  0..3,5:;
  4:
    begin
     groupbox11.Visible:=false;
     bitbtn6.Visible:=false;
     edit3.Visible:=false;
     button3.Enabled:=true;
     label7.Visible:=true;
     label8.Visible:=true;
     dtpk5.Visible:=true;
     dtpk6.Visible:=true;
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
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox3.ItemIndex of
    0:
    begin
      InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
                         'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
      InputVar.Sqlstr :='SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
                        'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
                        'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
                        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
                        'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
                        'dbo.Data0025.set_qty'+#13+
                        'FROM dbo.Data0025 INNER JOIN dbo.Data0008 '+
                        'ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN dbo.Data0010 '+
                        'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
                        'order by dbo.Data0025.MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_NUMBER';
    end;
    1:
    begin
      InputVar.Fields := 'MANU_PART_DESC/客户型号/149,'+
                         'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
      InputVar.Sqlstr :='SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
                        'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
                        'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
                        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
                        'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
                        'dbo.Data0025.set_qty'+#13+
                        'FROM dbo.Data0025 INNER JOIN dbo.Data0008 '+
                        'ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN dbo.Data0010 '+
                        'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
                        'order by dbo.Data0025.MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_DESC';
    end;
    2:
    begin
      InputVar.Fields := 'PROD_CODE/产品类型/110,PRODUCT_NAME/类型名称/285';
      InputVar.Sqlstr :='SELECT RKEY, PROD_CODE, PRODUCT_NAME'+#13+
                        'FROM dbo.Data0008 order by PROD_CODE ';
      inputvar.KeyField:='PROD_CODE';
    end;
    3:
    begin
      InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
      InputVar.Sqlstr:='SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+
                       'data0010.abbr_name FROM dbo.Data0010 order  by cust_code';
      inputvar.KeyField:='CUST_CODE';
    end;
    5:
    begin
      InputVar.Fields := 'ANALYSIS_CODE_2/客户物料号/250,CUST_CODE/客户代码/149,ABBR_NAME/客户简称/116,MANU_PART_NUMBER/本厂编号/149,MANU_PART_DESC/客户型号/149';
      InputVar.Sqlstr := 'SELECT Data0010.CUST_CODE, Data0010.ABBR_NAME, Data0025.ANALYSIS_CODE_2, Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC '+#13+
                         'FROM   Data0025 INNER JOIN '+#13+
                         '       Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY '+#13+
                         'WHERE  (Data0025.ANALYSIS_CODE_2 IS NOT NULL AND Data0025.ANALYSIS_CODE_2 <> '''') '+#13+
                         'ORDER BY Data0010.CUST_CODE, Data0025.ANALYSIS_CODE_2 ';
      inputvar.KeyField:='ANALYSIS_CODE_2';
    end;  
 end;

  inputvar.InPut_value:=edit3.Text;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     0:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
     1:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_DESC']);
     2:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PROD_CODE']);
     3:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
    end;
    button3.Enabled:=true;
    button3.SetFocus;
  end else edit3.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
  begin
    self.update_sgrid_3(i);
    exit;
  end;
 self.update_sgrid_3(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if  ADOConnection1.Connected then
 begin

  Adoquery1.Open;
  datetimepicker1.DateTime:=ADOQuery1.FieldValues['sys_datetime']-60;
  DateTimePicker3.DateTime:=ADOQuery1.FieldValues['sys_datetime'];

  dtpk4.Date:={date()}self.DateTimePicker3.Date;
  dtpk3.date:={date()-60}self.DateTimePicker1.Date;

  dtpk6.Date:={date()}self.DateTimePicker3.Date;
  dtpk5.Date:={date()-60}self.DateTimePicker1.Date;

  dtpk14.Date:={date()}self.DateTimePicker3.Date;
  dtpk13.Date:={date()-60}self.DateTimePicker1.Date;

  adoquery1.Close;
  RadioGroup1Click(Sender);
 end;
end;

procedure TForm1.RGp4Click(Sender: TObject);
begin
  bitbtn2click(sender);
  groupbox1.Visible:=false;
  groupbox2.Visible:=false;
  groupbox3.Visible:=false;
  groupbox7.Visible:=false;
  case radiogroup1.ItemIndex of
    0: groupbox1.Visible:=true;  //入仓明细
    1: groupbox2.Visible:=true;  //出仓明细
    2://库存
      begin
        if rgp4.ItemIndex=0 then //库存明细
         begin
          groupbox7.Visible:=true;
         end
        else                     //库存汇总
         begin
          groupbox3.Visible:=true;
          listbox3.Selected[0]:=true;
          listbox3click(sender);
         end;
      end;
  end;
end;

procedure TForm1.ListBox7Click(Sender: TObject);
begin
label21.Caption:=listbox7.Items[listbox7.itemindex];
 label19.Visible:=false;
 label20.Visible:=false;
 dtpk13.Visible:=false;
 dtpk14.Visible:=false;
 bitbtn11.Visible:=false;
 button7.Enabled:=false;
 edit7.Visible:=true;
 edit7.Text:='';
 groupbox10.Visible:=true;
case listbox7.ItemIndex of
 0..6,8:bitbtn11.Visible:=true;
 7:
 begin
  radiobutton9.Checked:=true;
  groupbox10.Visible:=false;
  edit7.Visible:=false;
  button7.Enabled:=true;
  label19.Visible:=true;
  label20.Visible:=true;
  dtpk13.Visible:=true;
  dtpk14.Visible:=true;
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
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case ListBox7.ItemIndex of
    0:
    begin
      InputVar.Fields := 'SALES_ORDER/订单编号/110,PO_NUMBER/采购订单号/285,MANU_PART_NUMBER/本厂编号/89,'+
                         'MANU_PART_DESC/客户型号/149';
      InputVar.Sqlstr :='SELECT dbo.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMBER,'+
                              ' dbo.Data0025.MANU_PART_DESC,  dbo.DATA0153.PO_NUMBER'+#13+
                        'FROM  dbo.Data0060 INNER JOIN '+#13+
                        '      dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Data0064.SO_PTR INNER JOIN '+#13+
                        '      dbo.DATA0153 ON dbo.Data0064.RKEY = dbo.DATA0153.SHIP_PTR INNER JOIN '+#13+
                        '      dbo.Data0025 ON dbo.DATA0153.CUSTPART_PTR = dbo.Data0025.RKEY ';
      inputvar.KeyField:='SALES_ORDER';
    end;
    1:
    begin
      InputVar.Fields := 'PO_NUMBER/采购订单号/285,SALES_ORDER/订单编号/110,MANU_PART_NUMBER/本厂编号/89,'+
                         'MANU_PART_DESC/客户型号/149';
      InputVar.Sqlstr :='SELECT dbo.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMBER,'+
                              ' dbo.Data0025.MANU_PART_DESC,  dbo.DATA0153.PO_NUMBER'+#13+
                        'FROM  dbo.Data0060 INNER JOIN '+#13+
                        '      dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Data0064.SO_PTR INNER JOIN '+#13+
                        '      dbo.DATA0153 ON dbo.Data0064.RKEY = dbo.DATA0153.SHIP_PTR INNER JOIN '+#13+
                        '      dbo.Data0025 ON dbo.DATA0153.CUSTPART_PTR = dbo.Data0025.RKEY ';
      inputvar.KeyField:='PO_NUMBER';
    end;
    2:
    begin
      InputVar.Fields := 'PROD_CODE/产品类型/110,PRODUCT_NAME/类型名称/285';
      InputVar.Sqlstr :='SELECT RKEY, PROD_CODE, PRODUCT_NAME'+#13+
                        'FROM dbo.Data0008 order by PROD_CODE ';
      inputvar.KeyField:='PROD_CODE';
    end;
    3:
    begin
      InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
      InputVar.Sqlstr:='SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+
                       'data0010.abbr_name FROM dbo.Data0010 order  by cust_code';
      inputvar.KeyField:='CUST_CODE';
    end;
    4:
    begin
      InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
                         'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
      InputVar.Sqlstr :='SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
                        'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
                        'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
                        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
                        'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
                        'dbo.Data0025.set_qty'+#13+
                        'FROM dbo.Data0025 INNER JOIN dbo.Data0008 '+
                        'ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN dbo.Data0010 '+
                        'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
                        'order by dbo.Data0025.MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_NUMBER';
    end;
    5:
    begin
      InputVar.Fields := 'MANU_PART_DESC/客户型号/149,'+
                         'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
      InputVar.Sqlstr :='SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
                        'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
                        'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
                        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
                        'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
                        'dbo.Data0025.set_qty'+#13+
                        'FROM dbo.Data0025 INNER JOIN dbo.Data0008 '+
                        'ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN dbo.Data0010 '+
                        'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
                        'order by dbo.Data0025.MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_DESC';
    end;
    6:
    begin
      InputVar.Fields := 'EMPLOYEE_NAME/姓名/149,EMPL_CODE/工号/116';
      InputVar.Sqlstr :='SELECT DISTINCT dbo.Data0005.EMPLOYEE_NAME, dbo.Data0005.EMPL_CODE'+#13+
                        'FROM dbo.DATA0153 INNER JOIN'+#13+
                        '     dbo.Data0005 ON dbo.DATA0153.EMPL_PTR = dbo.Data0005.RKEY'+#13+
                        'ORDER BY dbo.Data0005.EMPLOYEE_NAME';
      inputvar.KeyField:='EMPLOYEE_NAME';
    end;
    8:
    begin
      InputVar.Fields := 'ANALYSIS_CODE_2/客户物料号/250,CUST_CODE/客户代码/149,ABBR_NAME/客户简称/116,MANU_PART_NUMBER/本厂编号/149,MANU_PART_DESC/客户型号/149';
      InputVar.Sqlstr := 'SELECT Data0010.CUST_CODE, Data0010.ABBR_NAME, Data0025.ANALYSIS_CODE_2, Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC '+#13+
                         'FROM   Data0025 INNER JOIN '+#13+
                         '       Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY '+#13+
                         'WHERE  (Data0025.ANALYSIS_CODE_2 IS NOT NULL AND Data0025.ANALYSIS_CODE_2 <> '''') '+#13+
                         'ORDER BY Data0010.CUST_CODE, Data0025.ANALYSIS_CODE_2 ';
      inputvar.KeyField:='ANALYSIS_CODE_2';
    end;  
 end;

  inputvar.InPut_value:=edit7.Text;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox7.ItemIndex of
     0:edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['SALES_ORDER']);
     1:edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PO_NUMBER']);
     2:edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PROD_CODE']);
     3:edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
     4:edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
     5:edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_DESC']);
     6:edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']);
     8:edit7.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['ANALYSIS_CODE_2']);
    end;
    button7.Enabled:=true;
    button7.SetFocus;
  end else edit7.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox7.Items[listbox7.itemindex]  then
  begin
    self.update_sgrid_7(i);
    exit;
  end;
 self.update_sgrid_7(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.update_sgrid(sgrid_row: byte);
  procedure Con(s:string);
  begin
    if RadioButton1.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton1.Caption+edit1.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' = '''+edit1.Text+''' ';
    end else if RadioButton2.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton2.Caption+edit1.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' <> '''+edit1.Text+''' ';
    end else if RadioButton3.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton3.Caption+edit1.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' > '''+edit1.Text+''' ';
    end else if RadioButton4.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton4.Caption+edit1.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' like ''%'+edit1.Text+'%'' ';
    end ;
  end;

begin
  sgrid1.Cells[0,sgrid_row]:=listbox1.Items[listbox1.itemindex];
  if listbox1.ItemIndex <> 8 then
      sgrid1.Cells[1,sgrid_row]:=edit1.Text;

  case listbox1.ItemIndex of
   0:Con('and Data0060.SALES_ORDER');
   1:Con('and DATA0153.PO_NUMBER');
   2:Con('and Data0008.PROD_CODE');
   3:Con('and Data0010.CUST_CODE');
   4:Con('and Data0025.MANU_PART_NUMBER');
   5:Con('and Data0025.MANU_PART_DESC');
   6:Con('and Data0005.EMPLOYEE_NAME');
   7:case rgp2.ItemIndex of
       0:sgrid1.Cells[2,sgrid_row]:='and Data0153.QUANTITY > '+trim(edit1.Text)+'';
       1:sgrid1.Cells[2,sgrid_row]:='and Data0153.QUANTITY = '+trim(edit1.Text)+'';
       2:sgrid1.Cells[2,sgrid_row]:='and Data0153.QUANTITY < '+trim(edit1.Text)+'';
     end;
   8:
     begin
        sgrid1.Cells[1,sgrid_row]:='从'+
        formatdatetime('yyyy-mm-dd ',self.DateTimePicker1.DateTime)+
        formatdatetime('hh:nn:ss',self.DateTimePicker2.DateTime)+'到'+
        formatdatetime('yyyy-mm-dd ',self.DateTimePicker3.DateTime)+
        formatdatetime('hh:nn:ss',self.DateTimePicker4.Time);

        sgrid1.Cells[2,sgrid_row]:=
        'and  Data0153.MFG_DATE >='''+
        formatdatetime('yyyy-mm-dd ',self.DateTimePicker1.DateTime)+
        formatdatetime('hh:nn:ss',self.DateTimePicker2.DateTime)+
        ''' and Data0153.MFG_DATE <='''+
        formatdatetime('yyyy-mm-dd ',self.DateTimePicker3.DateTime)
        +formatdatetime('hh:nn:ss',self.DateTimePicker4.DateTime)+'''';
     end;
   9:Con('and Data0025.ANALYSIS_CODE_2');
  end;
end;

procedure TForm1.update_sgrid_2(sgrid_row: byte);
  procedure Con(s:string);
  begin
    if RadioButton5.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton5.Caption+edit2.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' = '''+edit2.Text+''' ';
    end else if RadioButton7.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton7.Caption+edit2.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' <> '''+edit2.Text+''' ';
    end else if RadioButton6.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton6.Caption+edit2.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' > '''+edit2.Text+''' ';
    end else if RadioButton8.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton8.Caption+edit2.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' like ''%'+edit2.Text+'%'' ';
    end ;
  end;

begin
  sgrid1.Cells[0,sgrid_row]:=listbox2.Items[listbox2.itemindex];
  if listbox2.ItemIndex < 7 then
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;

  case listbox2.ItemIndex of
   0:Con('and Data0025.MANU_PART_NUMBER');
   1:Con('and Data0025.MANU_PART_DESC');
   2:Con('and Data0060.SALES_ORDER');
   3:Con('and DATA0153.PO_NUMBER');
   4:Con('and Data0010.CUST_CODE');
   5:Con('and DATA0157.PRINT_NUMBER');
   6:Con('and DATA0158.RECE_NUMBER');
   7:
     begin
      sgrid1.Cells[1,sgrid_row]:='从'+
        formatdatetime('yyyy-mm-dd ',self.DTPk3.DateTime)+
        formatdatetime('hh:nn:ss',self.dttm3.DateTime)+'到'+
        formatdatetime('yyyy-mm-dd ',self.DTPk4.DateTime)+
        formatdatetime('hh:nn:ss',self.DateTimePicker4.Time);

      sgrid1.Cells[2,sgrid_row]:=
        'and  DATA0157.ENT_DATE >='''+
        formatdatetime('yyyy-mm-dd ',self.DTPk3.DateTime)+
        formatdatetime('hh:nn:ss',self.DateTimePicker2.DateTime)+
        ''' and DATA0157.ENT_DATE <='''+
        formatdatetime('yyyy-mm-dd ',self.DTPk4.DateTime)
        +formatdatetime('hh:nn:ss',self.dttm4.DateTime)+'''';
     end;
     8:
     begin
      sgrid1.Cells[1,sgrid_row]:='从'+
        formatdatetime('yyyy-mm-dd ',self.DTPk3.DateTime)+
        formatdatetime('hh:nn:ss',self.dttm3.DateTime)+'到'+
        formatdatetime('yyyy-mm-dd ',self.DTPk4.DateTime)+
        formatdatetime('hh:nn:ss',self.dttm4.Time);

      sgrid1.Cells[2,sgrid_row]:=
        'and  DATA0157.BRING_DATE >='''+
        formatdatetime('yyyy-mm-dd ',self.DTPk3.DateTime)+
        formatdatetime('hh:nn:ss',self.dttm3.DateTime)+
        ''' and DATA0157.BRING_DATE <='''+
        formatdatetime('yyyy-mm-dd ',self.DTPk4.DateTime)
        +formatdatetime('hh:nn:ss',self.dttm4.DateTime)+'''';
     end;
     9:Con('and DATA0025.ANALYSIS_CODE_2');
  end;
end;

procedure TForm1.update_sgrid_7(sgrid_row: byte);
  procedure Con(s:string);
  begin
    if RadioButton9.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton9.Caption+edit7.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' = '''+edit7.Text+''' ';
    end else if RadioButton11.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton11.Caption+edit7.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' <> '''+edit7.Text+''' ';
    end else if RadioButton10.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton10.Caption+edit7.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' > '''+edit7.Text+''' ';
    end else if RadioButton12.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton12.Caption+edit7.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' like ''%'+edit7.Text+'%'' ';
    end ;
  end;

begin
  sgrid1.Cells[0,sgrid_row]:=listbox7.Items[listbox7.itemindex];
  sgrid1.Cells[1,sgrid_row]:=edit7.Text;

  case listbox7.ItemIndex of
   0:Con('and Data0060.SALES_ORDER');
   1:Con('and DATA0153.PO_NUMBER');
   2:Con('and Data0008.PROD_CODE');
   3:Con('and Data0010.CUST_CODE');
   4:Con('and Data0025.MANU_PART_NUMBER');
   5:Con('and Data0025.MANU_PART_DESC');
   6:Con('and Data0005.EMPLOYEE_NAME');
   7:
     begin
      sgrid1.Cells[1,sgrid_row]:='从'+
        formatdatetime('yyyy-mm-dd ',self.DTPk13.DateTime)+'到'+
        formatdatetime('yyyy-mm-dd ',self.DTPk14.DateTime);

      sgrid1.Cells[2,sgrid_row]:=
        'and  Data0153.MFG_DATE >='''+
        formatdatetime('yyyy-mm-dd ',self.DTPk13.DateTime)+
        ''' and Data0153.MFG_DATE <='''+
        formatdatetime('yyyy-mm-dd ',self.DTPk14.DateTime)+'''';
     end;
   8:Con('and Data0025.ANALYSIS_CODE_2');
  end;
end;

procedure TForm1.update_sgrid_3(sgrid_row: byte);
  procedure Con(s:string);
  begin
    if RadioButton13.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton13.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' = '''+edit3.Text+''' ';
    end else if RadioButton15.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton15.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' <> '''+edit3.Text+''' ';
    end else if RadioButton14.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton14.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' > '''+edit3.Text+''' ';
    end else if RadioButton16.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton16.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' like ''%'+edit3.Text+'%'' ';
    end ;
  end;

begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,sgrid_row]:=edit3.Text;

  case listbox3.ItemIndex of
   0:Con('and Data0025.MANU_PART_NUMBER');
   1:Con('and Data0025.MANU_PART_DESC');
   2:Con('and Data0008.PROD_CODE');
   3:Con('and Data0010.CUST_CODE');
   4:
     begin
      sgrid1.Cells[1,sgrid_row]:='从'+
        formatdatetime('yyyy-mm-dd ',self.DTPk5.DateTime)+'到'+
        formatdatetime('yyyy-mm-dd ',self.DTPk6.DateTime);

      sgrid1.Cells[2,sgrid_row]:=
        'and  Data0153.MFG_DATE >='''+
        formatdatetime('yyyy-mm-dd ',self.DTPk5.DateTime)+
        ''' and Data0153.MFG_DATE <='''+
        formatdatetime('yyyy-mm-dd ',self.DTPk6.DateTime)+'''';
     end;
   5:Con('and Data0025.ANALYSIS_CODE_2');
  end;
end;
end.
