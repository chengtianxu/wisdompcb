unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Menus, ComCtrls, Grids, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    dtpk1: TDateTimePicker;
    dtt1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    dtt2: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RadioGroup2: TRadioGroup;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn4: TBitBtn;
    ListBox1: TListBox;
    StaticText1: TStaticText;
    tmp: TADOQuery;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    rgType: TRadioGroup;
    RadioGroup1: TRadioGroup;
    ComboBox3: TComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   whouse_ptr1,whouse_ptr2:string;
   procedure update_sgrid(sgrid_row: byte);
   procedure update_sgridlist(sgrid_row: byte);
  public
    sSQL:string;
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation
uses common, product, deptcode_search, deptgroup, deptcode, customer_search,
     deptcode_list, employee_search, prodcode_search,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TForm1.update_sgrid(sgrid_row: byte);
begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,sgrid_row]:=edit3.Text;

  case listbox3.ItemIndex of
    0:
    sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_NUMBER LIKE ''%'+edit3.Text+'%''';
    1:
    sgrid1.Cells[2,sgrid_row]:='and data0025.MANU_PART_DESC LIKE ''%'+edit3.Text+'%''';
    2:
    sgrid1.Cells[2,sgrid_row]:='and Data0034.dept_code = '''+edit3.Text+'''';
    3:
    sgrid1.Cells[2,sgrid_row]:='and Data0034_1.dept_code = '''+edit3.Text+'''';
    4:
    begin
      if combobox1.ItemIndex=0 then
        sgrid1.Cells[2,sgrid_row]:='and data0048.WTYPE = '+inttostr(combobox1.ItemIndex)
      else
      sgrid1.Cells[2,sgrid_row]:='and data0048.WTYPE = '+inttostr(combobox1.ItemIndex+1);
      sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
    end;
    5:
    begin
      if combobox1.ItemIndex=0 then
        sgrid1.Cells[2,sgrid_row]:='and data0025.PARENT_PTR is not null '
      else
      sgrid1.Cells[2,sgrid_row]:='and data0025.PARENT_PTR is null ';
      sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
    end;
    6:
    begin
      sgrid1.Cells[2,sgrid_row]:='and data0048.put_type = '+inttostr(combobox1.ItemIndex);
      sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
    end;
    7:
    begin
      if combobox1.ItemIndex=0 then
       sgrid1.Cells[2,sgrid_row]:='and Data0034.BARCODE_ENTRY_FLAG = ''Y'''
      else
      sgrid1.Cells[2,sgrid_row]:='and Data0034.BARCODE_ENTRY_FLAG <> ''Y''';
      sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
    end;
    8:
    sgrid1.Cells[2,sgrid_row]:='and data0048.WAREHOUSE_PTR = '+whouse_ptr1;
    9:
    sgrid1.Cells[2,sgrid_row]:='and data0492.WHOUSE_PTR ='+whouse_ptr2;

    10:
    sgrid1.Cells[2,sgrid_row]:='and Data0060.ORIG_CUSTOMER = '''+edit3.Text+'''';
    11:
    sgrid1.Cells[2,sgrid_row]:='and data0025.SAMPLE_NR LIKE ''%'+edit3.Text+'%''';
    12:
    begin
     sgrid1.Cells[2,sgrid_row]:='and data0060.so_tp = '+inttostr(combobox1.ItemIndex);
     sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
    end;
    13:
    sgrid1.Cells[2,sgrid_row]:='and Data0008.PROD_CODE = '''+Edit3.Text+'''';
    14:
    sgrid1.Cells[2,sgrid_row]:='and Data0007.PR_GRP_CODE = '''+Edit3.Text+'''';
    15:
    begin
     sgrid1.Cells[2,sgrid_row]:='and data0008.difficulty_grade_value = '+inttostr(combobox1.ItemIndex);
     sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
    end;

//    begin
//      if (RadioGroup1.ItemIndex = 0) then
//      begin
//        sgrid1.Cells[1,sgrid_row]:=' like '+ combobox1.Text;
//        sgrid1.Cells[2,sgrid_row]:=' and data0008.difficulty_grade_value ''%'+ combobox1.Text+'%'''
//      end else begin
//        sgrid1.Cells[1,sgrid_row]:=' = '+ combobox1.Text;
//        sgrid1.Cells[2,sgrid_row]:=' and data0008.difficulty_grade_value = '''+combobox1.Text+'''' ;
//      end;
//    end;

    16:
    SGrid1.Cells[2,sgrid_row]:='and data0008.category ='''+Edit3.Text+'''';
  end;

end;

procedure TForm1.update_sgridlist(sgrid_row: byte);
var s:string;
    i:Integer;
begin
  sgrid1.Cells[0,sgrid_row]:=listbox1.Items[listbox1.itemindex];
  sgrid1.Cells[1,sgrid_row]:=edit1.Text;

  case listbox1.ItemIndex of
    0:
    sgrid1.Cells[2,sgrid_row]:='and Data0006.WORK_ORDER_NUMBER LIKE ''%'+edit1.Text+'%''';
    1:
    sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_NUMBER LIKE ''%'+edit1.Text+'%''';
    2:
    sgrid1.Cells[2,sgrid_row]:='and data0025.MANU_PART_DESC LIKE ''%'+edit1.Text+'%''';
    3:
    sgrid1.Cells[2,sgrid_row]:='and Data0034.dept_code = '''+edit1.Text+'''';
    4:
    sgrid1.Cells[2,sgrid_row]:='and Data0034_1.dept_code = '''+edit1.Text+'''';
    5:
    begin
     if combobox2.ItemIndex=0 then
      sgrid1.Cells[2,sgrid_row]:='and data0048.WTYPE = '+inttostr(combobox2.ItemIndex)
     else
      sgrid1.Cells[2,sgrid_row]:='and data0048.WTYPE = '+inttostr(combobox2.ItemIndex+1);
     sgrid1.Cells[1,sgrid_row]:=combobox2.Text;
    end;
    6:
    begin
     if combobox2.ItemIndex=0 then
      sgrid1.Cells[2,sgrid_row]:='and data0025.PARENT_PTR is not null '
     else
      sgrid1.Cells[2,sgrid_row]:='and data0025.PARENT_PTR is null ';
     sgrid1.Cells[1,sgrid_row]:=combobox2.Text;
    end;
    7:
    begin
     sgrid1.Cells[2,sgrid_row]:='and data0048.put_type = '+inttostr(combobox2.ItemIndex);
     sgrid1.Cells[1,sgrid_row]:=combobox2.Text;
    end;
    8:
    begin
      if combobox2.ItemIndex=0 then
        sgrid1.Cells[2,sgrid_row]:='and Data0034.BARCODE_ENTRY_FLAG = ''Y'''
      else
        sgrid1.Cells[2,sgrid_row]:='and Data0034.BARCODE_ENTRY_FLAG <> ''Y''';
      sgrid1.Cells[1,sgrid_row]:=combobox2.Text;
    end;
    9:
    sgrid1.Cells[2,sgrid_row]:='and Data0010.CUST_CODE = '''+edit1.Text+'''';
    10:
    sgrid1.Cells[2,sgrid_row]:='and Data0008.PROD_CODE = '''+edit1.Text+'''';
    11:
    sgrid1.Cells[2,sgrid_row]:='and Data0005.EMPL_CODE = '''+edit1.Text+'''';
    12:
    sgrid1.Cells[2,sgrid_row]:='and data0492.CUT_NO LIKE ''%'+edit1.Text+'%''';
    13:
    sgrid1.Cells[2,sgrid_row]:='and data0048.WAREHOUSE_PTR = '+whouse_ptr1;
    14:
    sgrid1.Cells[2,sgrid_row]:='and Data0034_2.dept_code = '''+edit1.Text+'''';
    15:
    sgrid1.Cells[2,sgrid_row]:='and data0492.WHOUSE_PTR = '+whouse_ptr2;
    16:
    sgrid1.Cells[2,sgrid_row]:='and Data0060.ORIG_CUSTOMER = '''+edit1.Text+'''';
    17:
    sgrid1.Cells[2,sgrid_row]:='and data0025.SAMPLE_NR LIKE ''%'+edit1.Text+'%''';
    18:
    begin
     sgrid1.Cells[2,sgrid_row]:='and data0060.so_tp = '+inttostr(combobox2.ItemIndex);
     sgrid1.Cells[1,sgrid_row]:=combobox2.Text;
    end;
    19:
    sgrid1.Cells[2,sgrid_row]:='and Data0007.PR_GRP_CODE = '''+Edit1.Text+'''';
    20:
    begin
     sgrid1.Cells[2,sgrid_row]:='and data0008.difficulty_grade_value = '+inttostr(combobox3.ItemIndex);
     sgrid1.Cells[1,sgrid_row]:=combobox3.Text;
    end;
//    begin
//      if (rgType.ItemIndex = 0) then
//      begin
//        sgrid1.Cells[1,sgrid_row]:=' like '+ combobox2.Text;
//        sgrid1.Cells[2,sgrid_row]:=' and data0025.CPJS LIKE ''%'+ combobox2.Text+'%'''
//      end else begin
//        sgrid1.Cells[1,sgrid_row]:=' = '+ combobox2.Text;
//        sgrid1.Cells[2,sgrid_row]:=' and data0025.CPJS = '''+combobox2.Text+'''' ;
//      end;
//    end;
    21:
    begin
      s:='-1';
      for i:=0 to GroupBox2.ControlCount-1 do
       if TCheckBox(GroupBox2.Controls[i]).Checked then s:=s+','+inttostr(TCheckBox(GroupBox2.Controls[i]).Tag);
      sgrid1.Cells[2,sgrid_row]:=' and data0006.PROD_STATUS in ('+s+')';
      sgrid1.Cells[1,sgrid_row]:=s;    end;
    22:
    SGrid1.Cells[2,sgrid_row]:='and data0008.category ='''+Edit1.Text+'''';
  end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Clear;
sgrid1.RowCount:=2;
end;

procedure TForm1.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if row<>0 then SGrid1.Row:=row;
 end;

end;



procedure TForm1.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  n1.Enabled:=false
 else
  n1.Enabled:=true; 
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  self.ListBox3.OnClick(sender);
  dtpk2.Date:=getsystem_date(adoquery1,1);
  dtpk1.Date:=dtpk2.Date-1;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 i:byte;
begin
if (RadioGroup5.ItemIndex=0) and  (listbox3.itemindex=2) then
 begin
   ShowMsg('以班组汇总统计,不能加工序代码条件!',1);
   Exit;
 end;
if (RadioGroup5.ItemIndex=1) and  (listbox3.itemindex=3) then
 begin
   ShowMsg('以工序汇总统计,不能加班组代码条件!',1);
   Exit;
 end;
// if (Trim(Edit3.Text)='') then exit;
 if (Trim(ComboBox1.Text)='') and (ComboBox1.Visible=True) then exit;
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
   begin
    self.update_sgrid(i);
    exit;
   end;

 self.update_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;

end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 button3.Enabled:=true
else
 button3.Enabled:=false;
end;

procedure TForm1.ListBox3Click(Sender: TObject);
begin
  label8.Caption:=listbox3.Items[listbox3.itemindex];
  edit3.Text:='';
  edit3.Visible:=true;
  edit3.ReadOnly:=false;
  button3.Enabled:=false;
  bitbtn6.Visible:=false;
  combobox1.Visible:=false;
  RadioGroup1.Visible:=False;

  case listbox3.ItemIndex of
    0:bitbtn6.Visible:=true;
    1:;
    2:bitbtn6.Visible:=true;
    3:bitbtn6.Visible:=true;
    4:
    begin
      edit3.Visible:=false;
      combobox1.Visible := true;
      ComboBox1.Style:=csDropDownList;
      button3.Enabled := true;
      combobox1.Items.Clear;
      combobox1.Items.Add('正常过数');
      combobox1.Items.Add('返工过数');
      combobox1.Items.Add('外发生产');
      combobox1.ItemIndex:=0;
    end;
    5:
    begin
      edit3.Visible:=false;
      combobox1.Visible:=true;
      ComboBox1.Style:=csDropDownList;
      button3.Enabled:=true;
      combobox1.Items.Clear;
      combobox1.Items.Add('内层');
      combobox1.Items.Add('外层');
      combobox1.ItemIndex:=0;
    end;
    6:
    begin
      edit3.Visible:=false;
      combobox1.Visible:=true;
      ComboBox1.Style:=csDropDownList;
      button3.Enabled:=true;
      combobox1.Items.Clear;
      combobox1.Items.Add('班组内部');
      combobox1.Items.Add('班组之间');
      combobox1.ItemIndex:=0;
    end;
    7:
    begin
      edit3.Visible:=false;
      combobox1.Visible:=true;
      ComboBox1.Style:=csDropDownList;
      button3.Enabled:=true;
      combobox1.Items.Clear;
      combobox1.Items.Add('过数工序');
      combobox1.Items.Add('非过数工序');
      combobox1.ItemIndex:=0;
    end;
    8:
    begin
      edit3.ReadOnly:=true;
      bitbtn6.Visible:=true;
    end;
    9:
    begin
      Edit3.ReadOnly:=true;
      BitBtn6.Visible:=true;
    end;
    10:
    begin
      Edit3.ReadOnly:=true;
      BitBtn6.Visible:=true;
    end;
    11:;
    12:
    begin
      edit3.Visible:=false;
      combobox1.Visible:=true;
      ComboBox1.Style:=csDropDownList;
      button3.Enabled:=true;
      combobox1.Items.Clear;
      combobox1.Items.Add('自制');
      combobox1.Items.Add('外发');
      combobox1.Items.Add('半制程');
      combobox1.ItemIndex:=0;
    end;
    13,14,16:
    begin
      edit3.ReadOnly:=true;
      bitbtn6.Visible:=true;
    end;
    15:
    begin
      edit3.Visible:=false;
      combobox1.Visible:=true;
      ComboBox1.Style:=csDropDown;
      button3.Enabled:=true;
      RadioGroup1.Visible:=False;
      combobox1.ItemIndex:=0;
//      combobox1.Items.Clear;

//      while not tmp.Eof do
//      begin
//        ComboBox1.Items.Add(tmp.FieldBYName('difficulty_grade_value').AsString);
//        tmp.Next;
//      end;
//      ComboBox1.ItemIndex:=-1;
    end;
  end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  case self.ListBox3.ItemIndex of
    0:
    begin
      form_product:=tform_product.Create(application);
      if form_product.ShowModal=mrok then
      begin
        edit3.Text:=form_product.ads50MANU_PART_NUMBER.Value;
      end;
      form_product.Free;
    end;
    2:
    begin
      form_deptcode:=tform_deptcode.Create(application);
      form_deptcode.adoquery1.Close;
      form_deptcode.adoquery1.Parameters[0].Value:='1';
      form_deptcode.adoquery1.Open;

      if form_deptcode.ShowModal=mrok then
      begin
        edit3.Text:=form_deptcode.ADOQuery1DEPT_CODE.Value;
      end;
      form_deptcode.Free;
    end;
    3:
    begin
      form_deptcode:=tform_deptcode.Create(application);
      form_deptcode.adoquery1.Close;
      form_deptcode.adoquery1.Parameters[0].Value:='5';
      form_deptcode.adoquery1.Open;

      if form_deptcode.ShowModal=mrok then
      begin
        edit3.Text:=form_deptcode.ADOQuery1DEPT_CODE.Value;
      end;
      form_deptcode.Free;
    end;
    8:
    try
     frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
     InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/60,WAREHOUSE_NAME/工厂名称/250,abbr_name/工厂简称/100';
     InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,abbr_name from data0015 '+
                                  'order by WAREHOUSE_CODE';
     inputvar.KeyField:='WAREHOUSE_CODE';
     inputvar.InPut_value:=edit3.Text;
     InputVar.AdoConn := ADOConnection1 ;
     frmPick_Item_Single.InitForm_New(InputVar)  ;
     if frmPick_Item_Single.ShowModal=mrok then
      begin
       edit3.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
       whouse_ptr1:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
       button3.Enabled := true ;
       button3.SetFocus;
      end
     else edit3.SetFocus;
    finally
     frmPick_Item_Single.adsPick.Close;
     frmPick_Item_Single.Free ;
    end;

    9:
    try
     frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
     InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/60,WAREHOUSE_NAME/工厂名称/250,abbr_name/工厂简称/100';
     InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,abbr_name from data0015 '+
                                  'order by WAREHOUSE_CODE';
     inputvar.KeyField:='WAREHOUSE_CODE';
     inputvar.InPut_value:=edit3.Text;
     InputVar.AdoConn := ADOConnection1 ;
     frmPick_Item_Single.InitForm_New(InputVar)  ;
     if frmPick_Item_Single.ShowModal=mrok then
      begin
       edit3.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
       whouse_ptr2:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
       button3.Enabled := true ;
       button3.SetFocus;
      end
     else edit3.SetFocus;
    finally
     frmPick_Item_Single.adsPick.Close;
     frmPick_Item_Single.Free ;
    end;
    10:
    begin
     form_customer:=tform_customer.Create(application);
     if form_customer.ShowModal=mrok then
     begin
      edit3.Text:=form_customer.ads10abbr_name.Value;
      button3.SetFocus
     end;
     form_customer.Free;
    end;
    13:
    begin
      try
        form_prodcode:=tform_prodcode.Create(application);
        if form_prodcode.ShowModal=mrok then
        begin
          edit3.Text:=form_prodcode.adoquery1PROD_CODE.Value;
          button3.SetFocus;
        end;
      finally
        form_prodcode.Free;
      end;
    end;
    14:
    begin
      try
        frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
        InputVar.Fields := 'PR_GRP_CODE/组别代码/120,PRODUCT_GROUP_NAME/组别名称/250';
        InputVar.Sqlstr := 'select RKEY,PR_GRP_CODE,PRODUCT_GROUP_NAME from data0007 '+
                                    'order by PR_GRP_CODE';
        inputvar.KeyField:='RKEY';
        inputvar.InPut_value:=edit3.Text;
        InputVar.AdoConn := ADOConnection1 ;
        frmPick_Item_Single.InitForm_New(InputVar)  ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
         edit3.Text := frmPick_Item_Single.adsPick.FieldValues['PR_GRP_CODE'];
  //       whouse_ptr2:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
         button3.Enabled := true ;
         button3.SetFocus;
        end
        else edit3.SetFocus;
      finally
        frmPick_Item_Single.adsPick.Close;
        frmPick_Item_Single.Free ;
      end;
    end;
     16:
    begin
      try
        frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
        InputVar.Fields := 'category/产品类别代码/120,category_name/产品类别名称/250';
        InputVar.Sqlstr := 'select category,category_name from data0619 '+
                                    'order by category';
        inputvar.KeyField:='category';
        inputvar.InPut_value:=edit3.Text;
        InputVar.AdoConn := ADOConnection1 ;
        frmPick_Item_Single.InitForm_New(InputVar)  ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
         edit3.Text := frmPick_Item_Single.adsPick.FieldValues['category'];
         button3.Enabled := true ;
         button3.SetFocus;
        end
        else edit3.SetFocus;
      finally
        frmPick_Item_Single.adsPick.Close;
        frmPick_Item_Single.Free ;
      end;
    end;
  end;
end;

procedure TForm1.SGrid1DblClick(Sender: TObject);
begin
if button3.Enabled then button3.OnClick(sender);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i:byte;
    iSumNumber1,iSumNumber3:integer;
    iSumNumber2:Double;
begin
  case radiogroup5.ItemIndex of
    0:
    begin
     try
      form2:=tform2.Create(application);
      screen.Cursor:=crAppstart;
      with form2.ADOQuery1 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-5,sgrid1.Cells[2,i]);

       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-5,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));

       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',dtpk1.Date)+
          formatdatetime('hh:nn:ss',dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',dtpk2.Date)+
          formatdatetime('hh:nn:ss',dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        form2.DBGridEh1.Columns[7].FieldName:='total_sq'
       else
        form2.DBGridEh1.Columns[7].FieldName:='total_sqft';

        Prepared;
       open;
      end;

      form2.ShowModal;
     finally
      form2.Free;
      screen.Cursor:=crDefault;
     end;
    end;

    1:
    begin
     try
      form3:=tform3.Create(application);
      screen.Cursor:=crAppstart;
      with form3.ADOQuery1 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-5,sgrid1.Cells[2,i]);

       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-5,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));

       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',dtpk1.Date)+
          formatdatetime('hh:nn:ss',dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',dtpk2.Date)+
          formatdatetime('hh:nn:ss',dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        form3.DBGridEh1.Columns[7].FieldName:='total_sq'
       else
        form3.DBGridEh1.Columns[7].FieldName:='total_sqft';
       Prepared;
       open;
      end;

      form3.ShowModal;
     finally
      form3.Free;
      screen.Cursor:=crDefault;
     end;
    end;

    2:
    begin
      try
        form4:=tform4.Create(application);
        screen.Cursor:=crAppstart;
        try
          iSumNumber1:=0;
          iSumNumber2:=0;
          iSumNumber3:=0;
          sSQL:='';
          form4.ADOQuery1.DisableControls;
          with form4.ADOQuery1 do
          begin
            close;
            for i:=1 to sgrid1.RowCount-2 do
            begin
              sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
              sSQL:=sSQL+sgrid1.Cells[2,i];
            end;

            if radiogroup4.ItemIndex<>2 then
            begin
             sql.Insert(sql.Count-1,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
             sSQL:=sSQL+'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex);
            end;

            Parameters.ParamValues['dtpk1']:=strtodatetime(
              formatdatetime('yyyy-mm-dd ',dtpk1.Date)+
              formatdatetime('hh:nn:ss',dtt1.DateTime));
            Parameters.ParamValues['dtpk2']:=strtodatetime(
              formatdatetime('yyyy-mm-dd ',dtpk2.Date)+
              formatdatetime('hh:nn:ss',dtt2.DateTime));
            if radiogroup2.ItemIndex=0 then
              form4.DBGridEh1.Columns[9].FieldName:='total_sq'
            else
              form4.DBGridEh1.Columns[9].FieldName:='total_sqft';
            Prepared;
            open;
          end;
          if (form4.ADOQuery1.RecordCount>0) then
          begin
//            form4.DBGridEh1.DataSource.DataSet.First;
//            while not Form4.DBGridEh1.DataSource.DataSet.Eof do
//            begin
//              if (form4.ADOQuery1IF_PAIGONG.Value='是') then  //是否派工
//              begin
//                if (form4.ADOQuery1Punctual.Value<=0) then  // 是否准期
//                  iSumNumber1:=iSumNumber1+1 //准期个数
//                else
//                  iSumNumber2:=iSumNumber2+form4.ADOQuery1Overlay.Value; //SUM(超期叠加个数)
//                iSumNumber3:=iSumNumber3+1; //派工总数
//              end;
//              form4.DBGridEh1.DataSource.DataSet.Next;
//            end;
          end;
          if (iSumNumber3<>0) then
          begin
            form4.Label3.Caption:=FormatFloat('0.0000',iSumNumber1/iSumNumber3);
            form4.Label4.Caption:=FormatFloat('0.0000',(iSumNumber3-iSumNumber2)/iSumNumber3);
          end;
        finally
          form4.ADOQuery1.EnableControls;
        end;
        form4.ShowModal;
      finally
        form4.Free;
        screen.Cursor:=crDefault;
      end;
    end;

  end;

end;

procedure TForm1.RadioGroup5Click(Sender: TObject);
begin
  BitBtn2Click(sender);
 if radiogroup5.ItemIndex=2 then
  begin
   groupbox1.Visible:=true;
   groupbox6.Visible:=false;
   listbox1.Selected[0] := true;
   ListBox1Click(sender);   
  end
 else
  begin
   groupbox1.Visible:=false;
   groupbox6.Visible:=true;
   listbox3.Selected[0] := true;
   ListBox3Click(sender);
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 button1.Enabled:=true
else
 button1.Enabled:=false;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  label3.Caption:=listbox1.Items[listbox1.itemindex];
  edit1.Text:='';
  edit1.Visible:=true;
  edit1.ReadOnly:=false;
  button1.Enabled:=false;
  bitbtn4.Visible:=false;
  combobox2.Visible:=false;
  combobox3.Visible:=false;
  GroupBox2.Visible:=false;
  rgType.Visible:=False;

  case listbox1.ItemIndex of
   0:;
   1:bitbtn4.Visible:=true;
   2:;
   3:bitbtn4.Visible:=true;
   4:bitbtn4.Visible:=true;

   5:
   begin
    edit1.Visible:=false;
    combobox2.Visible := true;
    ComboBox2.Style:=csDropDownList;
    button1.Enabled := true;
    combobox2.Items.Clear;
    combobox2.Items.Add('正常过数');
    combobox2.Items.Add('返工过数');
    combobox2.Items.Add('外发生产');
    combobox2.ItemIndex:=0;
   end;
   6:
   begin
    edit1.Visible:=false;
    combobox2.Visible:=true;
    ComboBox2.Style:=csDropDownList;
    button1.Enabled:=true;
    combobox2.Items.Clear;
    combobox2.Items.Add('内层');
    combobox2.Items.Add('外层');
    combobox2.ItemIndex:=0;
   end;
   7:
   begin
    edit1.Visible:=false;
    combobox2.Visible:=true;
    ComboBox2.Style:=csDropDownList;
    button1.Enabled:=true;
    combobox2.Items.Clear;
    combobox2.Items.Add('班组内部');
    combobox2.Items.Add('班组之间');
    combobox2.ItemIndex:=0;
   end;
   8:
   begin
    edit1.Visible:=false;
    combobox2.Visible:=true;
    ComboBox2.Style:=csDropDownList;
    button1.Enabled:=true;
    combobox2.Items.Clear;
    combobox2.Items.Add('过数工序');
    combobox2.Items.Add('非过数工序');
    combobox2.ItemIndex:=0;
   end;
   9:bitbtn4.Visible:=true;
   10:bitbtn4.Visible:=true;
   11:bitbtn4.Visible:=true;
   12:;
   13:
    begin
     edit1.ReadOnly:=true;
     bitbtn4.Visible:=true;
      GroupBox2.Visible:=false;
    end;
   14:bitbtn4.Visible:=true;
   15,16:              //关联原客户
    begin
     edit1.ReadOnly:=true;
     bitbtn4.Visible:=true;
      GroupBox2.Visible:=false;
    end;

   17:;           //备注
   18:
    begin
      edit1.Visible:=false;
      combobox2.Visible:=true;
      ComboBox2.Style:=csDropDownList;
      button1.Enabled:=true;
      combobox2.Items.Clear;
      combobox2.Items.Add('自制');
      combobox2.Items.Add('外发');
      combobox2.Items.Add('半制程');
      combobox2.ItemIndex:=0;
    end;
    19,22:
    begin
     edit1.ReadOnly:=true;
     bitbtn4.Visible:=true;
    end;
    20:
    begin
      edit1.Visible:=false;
      combobox3.Visible:=true;
      ComboBox3.Style:=csDropDown;
      button1.Enabled:=true;
      rgType.Visible:=False;
//      combobox2.Items.Clear;
//      tmp.Close;
//      tmp.SQL.Text:='select data0338.tvalue from data0278 inner join data0338 on data0278.Rkey=data0338.parameter_ptr where  data0278.SPEC_RKEY=''js''';
//      tmp.Open;
//      while not tmp.Eof do
//      begin
//        ComboBox2.Items.Add(tmp.FieldBYName('tvalue').AsString);
//        tmp.Next;
//      end;
      ComboBox3.ItemIndex:=0;
    end;
    21:
    begin
      bitbtn4.Visible:=False;
      edit1.Visible:=false;
      combobox2.Visible:=false;
      button1.Enabled:=True;
      GroupBox2.Visible:=True;
    end;
  end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
case self.ListBox1.ItemIndex of
1:

begin
 form_product:=tform_product.Create(application);
 if form_product.ShowModal=mrok then
 begin
  edit1.Text:=form_product.ads50MANU_PART_NUMBER.Value;
  button1.SetFocus
 end;
 form_product.Free;
end;
3,14:
 begin
 form_deptcode:=tform_deptcode.Create(application);
  form_deptcode.adoquery1.Close;
  form_deptcode.adoquery1.Parameters[0].Value:='1';
  form_deptcode.adoquery1.Open;

 if form_deptcode.ShowModal=mrok then
 begin
  edit1.Text:=form_deptcode.ADOQuery1DEPT_CODE.Value;
  button1.SetFocus
 end;
 form_deptcode.Free;
 end;
4:
 begin
 form_deptcode:=tform_deptcode.Create(application);
 form_deptcode.adoquery1.Close;
 form_deptcode.adoquery1.Parameters[0].Value:='5';
 form_deptcode.adoquery1.Open;

 if form_deptcode.ShowModal=mrok then
 begin
  edit1.Text:=form_deptcode.ADOQuery1DEPT_CODE.Value;
  button1.SetFocus
 end;
 form_deptcode.Free;
 end;
9:

begin
 form_customer:=tform_customer.Create(application);
 if form_customer.ShowModal=mrok then
 begin
  edit1.Text:=form_customer.ads10CUST_CODE.Value;
  button1.SetFocus
 end;
 form_customer.Free;
end;
10:
 begin
 form_prodcode:=tform_prodcode.Create(application);

 if form_prodcode.ShowModal=mrok then
 begin
  edit1.Text:=form_prodcode.adoquery1PROD_CODE.Value;
  button1.SetFocus
 end;
 form_prodcode.Free;
 end;
11:
 begin
 form_employee:=tform_employee.Create(application);
 if form_employee.ShowModal=mrok then
 begin
  edit1.Text:=form_employee.ADOQuery1EMPL_CODE.Value;
  button1.SetFocus
 end;
 form_employee.Free;
 end;
13:
 try
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/60,WAREHOUSE_NAME/工厂名称/250,abbr_name/工厂简称/100';
  InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,abbr_name from data0015 '+
                                'order by WAREHOUSE_CODE';
  inputvar.KeyField:='WAREHOUSE_CODE';
  inputvar.InPut_value:=edit1.Text;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar)  ;
  if frmPick_Item_Single.ShowModal=mrok then
   begin
    edit1.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
    whouse_ptr1:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
    button1.Enabled := true ;
    button1.SetFocus;
   end
  else edit1.SetFocus;
 finally
  frmPick_Item_Single.adsPick.Close;
  frmPick_Item_Single.Free ;
 end;
15:
try
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/60,WAREHOUSE_NAME/工厂名称/250,abbr_name/工厂简称/100';
  InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,abbr_name from data0015 '+
                                'order by WAREHOUSE_CODE';
  inputvar.KeyField:='WAREHOUSE_CODE';
  inputvar.InPut_value:=edit1.Text;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar)  ;
  if frmPick_Item_Single.ShowModal=mrok then
   begin
    edit1.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
    whouse_ptr2:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
    button1.Enabled := true ;
    button1.SetFocus;
   end
  else edit1.SetFocus;
 finally
  frmPick_Item_Single.adsPick.Close;
  frmPick_Item_Single.Free ;
 end;

  16:
  begin
   form_customer:=tform_customer.Create(application);
   if form_customer.ShowModal=mrok then
   begin
    edit1.Text:=form_customer.ads10abbr_name.Value;
    button1.SetFocus
   end;
   form_customer.Free;
  end;
  19:
  begin
    try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
      InputVar.Fields := 'PR_GRP_CODE/组别代码/120,PRODUCT_GROUP_NAME/组别名称/250';
      InputVar.Sqlstr := 'select RKEY,PR_GRP_CODE,PRODUCT_GROUP_NAME from data0007 '+
                                  'order by PR_GRP_CODE';
      inputvar.KeyField:='RKEY';
      inputvar.InPut_value:=edit1.Text;
      InputVar.AdoConn := ADOConnection1 ;
      frmPick_Item_Single.InitForm_New(InputVar)  ;
      if frmPick_Item_Single.ShowModal=mrok then
      begin
       edit1.Text := frmPick_Item_Single.adsPick.FieldValues['PR_GRP_CODE'];
//       whouse_ptr2:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
//       button1.Enabled := true ;
       button1.SetFocus;
      end
      else edit1.SetFocus;
    finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
    end;
  end;
   22:
    begin
      try
        frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
        InputVar.Fields := 'category/产品类别代码/120,category_name/产品类别名称/250';
        InputVar.Sqlstr := 'select category,category_name from data0619 '+
                                    'order by category';
        inputvar.KeyField:='category';
        inputvar.InPut_value:=edit1.Text;
        InputVar.AdoConn := ADOConnection1 ;
        frmPick_Item_Single.InitForm_New(InputVar)  ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
         edit1.Text := frmPick_Item_Single.adsPick.FieldValues['category'];
         button1.Enabled := true ;
         button1.SetFocus;
        end
        else edit1.SetFocus;
      finally
        frmPick_Item_Single.adsPick.Close;
        frmPick_Item_Single.Free ;
      end;
    end;
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 i:byte;
begin
 if (Trim(ComboBox2.Text)='') and (ComboBox2.Visible=True) then exit;
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox1.Items[listbox1.itemindex]  then
   begin
    self.update_sgridlist(i);
    exit;
   end;

 self.update_sgridlist(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if self.ADOConnection1.Connected then
    begin
      ShowMessage('程序在开发模式下运行，请在发布前断开连接后编译！');
      user_ptr:='1';
      vprev:='4';
    end
  else
    if not App_Init(ADOConnection1) then
    begin
      ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
      application.Terminate;
    end;
  Caption := application.Title;


// rkey73:='2525';
// user_ptr := '100';
// vprev := '4';

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  tmp.Close;
  tmp.SQL.Text:=' select difficulty_grade_value,* from Data0008  ';
  tmp.Open;
  ComboBox1.Items.AddObject('零阶',Pointer(0));
  ComboBox1.Items.AddObject('一阶',Pointer(1));
  ComboBox1.Items.AddObject('二阶',Pointer(2));
  ComboBox1.Items.AddObject('三阶',Pointer(3));
  ComboBox1.Items.AddObject('四阶',Pointer(4));
  ComboBox1.Items.AddObject('五阶',Pointer(5));
  ComboBox1.Items.AddObject('六阶',Pointer(6));
  ComboBox1.ItemIndex := 0;
  if tmp.FieldByName('difficulty_grade_value').AsFloat > 0 then
  begin
    ComboBox1.ItemIndex := tmp.FieldByName('difficulty_grade_value').AsInteger;
  end;
  tmp.Close;
  tmp.SQL.Text:=' select difficulty_grade_value,* from Data0008  ';
  tmp.Open;
  ComboBox3.Items.AddObject('零阶',Pointer(0));
  ComboBox3.Items.AddObject('一阶',Pointer(1));
  ComboBox3.Items.AddObject('二阶',Pointer(2));
  ComboBox3.Items.AddObject('三阶',Pointer(3));
  ComboBox3.Items.AddObject('四阶',Pointer(4));
  ComboBox3.Items.AddObject('五阶',Pointer(5));
  ComboBox3.Items.AddObject('六阶',Pointer(6));
  ComboBox3.ItemIndex := 0;
  if tmp.FieldByName('difficulty_grade_value').AsFloat > 0 then
  begin
    ComboBox3.ItemIndex := tmp.FieldByName('difficulty_grade_value').AsInteger;
  end;
end;

end.
