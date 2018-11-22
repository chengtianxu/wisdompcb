unit term;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, Menus, ExtCtrls, DB, ADODB;

type
  TForm_condition = class(TForm)
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Edit3: TEdit;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ADOConnection1: TADOConnection;
    RadioGroup1: TRadioGroup;
    dtpk1: TDateTimePicker;
    dtt1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    dtt2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    ADOQuery1: TADOQuery;
    RadioGroup2: TRadioGroup;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    tmp: TADOQuery;
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure update_sgrid(sgrid_row:byte);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup5Click(Sender: TObject);
  private
    { Private declarations }
    whouse_ptr:string;
  public
    { Public declarations }
  end;

var
  Form_condition: TForm_condition;

implementation

uses deptcode_search, main, prodcode_search, product,
common, total_dayout, total_daytimeout, main_group, total_groupdayout,
  total_daytimeoutgroup,Pick_Item_Single ,ConstVar;

{$R *.dfm}
procedure TForm_condition.FormCreate(Sender: TObject);
begin
 if not app_init(self.ADOConnection1) then
 begin
  showmsg('程序启动失败,请联系管理员!',1);
  application.Terminate;
 end;
  self.caption:=application.Title;


 // ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm_condition.update_sgrid(sgrid_row: byte);
  procedure Con(s:string);
  begin
    if RadioButton1.Checked then
    begin           
     sgrid1.Cells[1,sgrid_row]:=RadioButton1.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' = '''+edit3.Text+''' ';
    end else if RadioButton2.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton2.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' <> '''+edit3.Text+''' ';
    end else if RadioButton3.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton3.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' > '''+edit3.Text+''' ';
    end else if RadioButton4.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton4.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' like ''%'+edit3.Text+'%'' ';
    end ;
  end;
  
begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=edit3.Text;

 case listbox3.ItemIndex of
 0:Con('and Data0008.prod_code');
 1:Con('and Data0025.MANU_PART_NUMBER');
 2:Con('and data0025.MANU_PART_DESC');
 3:if radiogroup5.ItemIndex=1 then Con('and Data0034.dept_code') else Con('and Data0034_1.dept_code');
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
 8:Con('and data0025.layers');
 9: sgrid1.Cells[2,sgrid_row]:='and data0048.warehouse_ptr = '+whouse_ptr;
 10: Con('and data0007.pr_grp_code');
 11: sgrid1.Cells[2,sgrid_row]:='and data0492.whouse_ptr = '+whouse_ptr;
 12: sgrid1.Cells[2,sgrid_row]:='and data0060.ORIG_CUSTOMER = '+quotedstr(edit3.Text);
 13: sgrid1.Cells[2,sgrid_row]:='and data0025.SAMPLE_NR LIKE ''%'+edit3.Text+'%''';
 14:
  begin
   sgrid1.Cells[2,sgrid_row]:='and data0060.so_tp = '+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  end;
  15:
  begin
    sgrid1.Cells[2,sgrid_row]:='and data0025.CPJS = '''+combobox1.Text+'''';
    sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  end;
 end;

end;

procedure TForm_condition.ListBox3Click(Sender: TObject);
begin
  label8.Caption:=listbox3.Items[listbox3.itemindex];
  edit3.Text:='';
  edit3.ReadOnly:=false;
  edit3.Visible:=not (listbox3.ItemIndex in [4..7,14]);
  button3.Enabled:=listbox3.ItemIndex in [4..7,14];
  combobox1.Visible:=listbox3.ItemIndex in [4..7,14];
  bitbtn6.Visible:=listbox3.ItemIndex in [0,1,3,9,10,11,12];

  RadioButton1.Checked:=true;
  RadioButton4.Visible:=listbox3.ItemIndex<>8 ;
  GroupBox1.Visible:=listbox3.ItemIndex in [0..3,8,10];
case listbox3.ItemIndex of
 4:
 begin
  combobox1.Items.Clear;
  combobox1.Items.Add('正常过数');
  combobox1.Items.Add('返工过数');
  combobox1.Items.Add('外发生产');
  combobox1.ItemIndex:=0;
 end;
 5:
 begin
  combobox1.Items.Clear;
  combobox1.Items.Add('内层');
  combobox1.Items.Add('外层');
  combobox1.ItemIndex:=0;
 end;
 6:
 begin
  combobox1.Items.Clear;
  combobox1.Items.Add('班组内部');
  combobox1.Items.Add('班组之间');
  combobox1.ItemIndex:=0;
 end;
 7:
 begin
  combobox1.Items.Clear;
  combobox1.Items.Add('过数工序');
  combobox1.Items.Add('非过数工序');
  combobox1.ItemIndex:=0;
 end;
 9,11,12:
 begin
  edit3.ReadOnly:=true;
 end;
 14:
 begin
  combobox1.Items.Clear;
  combobox1.Items.Add('自制');
  combobox1.Items.Add('外发');
  combobox1.Items.Add('半制程');
  combobox1.ItemIndex:=0;
 end;
  15:
  begin
    edit3.Visible:=false;
    combobox1.Visible:=true;
    button3.Enabled:=true;
    combobox1.Items.Clear;
    tmp.Close;
    tmp.SQL.Text:='select data0338.tvalue from data0278 inner join data0338 on data0278.Rkey=data0338.parameter_ptr where  data0278.SPEC_RKEY=''js''';
    tmp.Open;
    while not tmp.Eof do
    begin
      ComboBox1.Items.Add(tmp.FieldBYName('tvalue').AsString);
      tmp.Next;
    end;
    ComboBox1.ItemIndex:=-1;
  end;
 end;
end;

procedure TForm_condition.Button3Click(Sender: TObject);
var
 i:byte;
begin
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

procedure TForm_condition.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  n1.Enabled:=false
 else
  n1.Enabled:=true; 
end;

procedure TForm_condition.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
//var
// column,row:longint;//右键选择stringgrid控件的方法
begin
{if button=mbright then
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if row<>0 then SGrid1.Row:=row;
 end
else 
if button3.Enabled then button3.OnClick(sender); }
end;

procedure TForm_condition.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_condition.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  self.ListBox3.OnClick(sender);
  dtpk2.Date:=getsystem_date(adoquery1,1);
  dtpk1.Date:=dtpk2.Date-1;
end;

procedure TForm_condition.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  case self.ListBox3.ItemIndex of
  0:
  begin
   form_prodcode:=tform_prodcode.Create(application);
   if form_prodcode.ShowModal=mrok then
   begin
    edit3.Text:=form_prodcode.adoquery1PROD_CODE.Value;
   end;
   form_prodcode.Free;
  end;
  1:
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
   end;
  3:
   begin
   form_deptcode:=tform_deptcode.Create(application);
     if radiogroup5.ItemIndex=1 then
     begin
      form_deptcode.adoquery1.Close;
      form_deptcode.adoquery1.Parameters[0].Value:='1';
      form_deptcode.adoquery1.Open;
     end
     else if radiogroup5.ItemIndex=0 then
      begin
       form_deptcode.adoquery1.Close;
       form_deptcode.adoquery1.Parameters[0].Value:='5';
       form_deptcode.adoquery1.Open;
      end
     else if radiogroup5.ItemIndex=2 then
     begin
       form_deptcode.adoquery1.Close;
       form_deptcode.adoquery1.CommandText:= 'SELECT rkey,DEPT_CODE, DEPT_NAME, BARCODE_ENTRY_FLAG, DEF_ROUT_INST from Data0034 where IS_COST_DEPT=1 AND RKEY = COST_DEPT_PTR';
       form_deptcode.adoquery1.Open;
     end;
   if form_deptcode.ShowModal=mrok then
   begin
    edit3.Text:=form_deptcode.ADOQuery1DEPT_CODE.Value;
   end;
   form_deptcode.Free;
   end;
  9,10,11,12:
  try
   frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   if (ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=11) then
    begin
     InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/60,WAREHOUSE_NAME/工厂名称/250,abbr_name/工厂简称/100';
     InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,abbr_name from data0015 '+
                                    'order by WAREHOUSE_CODE';
     inputvar.KeyField:='WAREHOUSE_CODE';
    end
   else
    if ListBox3.ItemIndex=10 then
    begin
      InputVar.Fields:='pr_grp_code/组别代码/110,product_group_name/组别名称/251';
      InputVar.Sqlstr:='select pr_grp_code,product_group_name  from data0007 order by pr_grp_code';
      inputvar.KeyField:='pr_grp_code';
    end
    else
    begin
      InputVar.Fields:='CUST_CODE/客户代码/60,CUSTOMER_NAME/客户名称/251,ABBR_NAME/名称缩写/100';
      InputVar.Sqlstr:='select CUST_CODE,CUSTOMER_NAME,ABBR_NAME  from data0010 order by ABBR_NAME';
      inputvar.KeyField:='ABBR_NAME';
    end;
   inputvar.InPut_value:=edit3.Text;
   InputVar.AdoConn := ADOConnection1 ;
   frmPick_Item_Single.InitForm_New(InputVar)  ;
   if frmPick_Item_Single.ShowModal=mrok then
   begin
     if (ListBox3.ItemIndex=9) or (ListBox3.ItemIndex=11) then
      begin
       edit3.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
       whouse_ptr:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
      end
     else
     if  ListBox3.ItemIndex=10 then
     begin
       edit3.Text := frmPick_Item_Single.adsPick.FieldValues['pr_grp_code'];
      button3.Enabled := true ;
      button3.SetFocus;
     end
     else
     begin
       edit3.Text := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      button3.Enabled := true ;
      button3.SetFocus;
     end;  

   end
   else edit3.SetFocus;
  finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
  end;
  end; //end case
end;

procedure TForm_condition.Edit3Change(Sender: TObject);
begin
 button3.Enabled:=trim(edit3.Text)<>'';
end;

procedure TForm_condition.BitBtn3Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm_condition.BitBtn2Click(Sender: TObject);
var i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TForm_condition.BitBtn1Click(Sender: TObject);
var i:byte;
begin
  if radiogroup5.ItemIndex=1 then  //按工序汇总
    case radiogroup1.ItemIndex of
    0:
    begin
      try
      form1:=tform1.Create(application);
      screen.Cursor:=crAppstart;
      with form1.ADOQuery1 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);

       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-2,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));

       Parameters.ParamValues['dtpk1']:=strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk1.Date)
         +formatdatetime('hh:nn:ss',dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk2.Date)
         +formatdatetime('hh:nn:ss',dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        form1.DBGridEh1.Columns[4].FieldName:='total_sq'
       else form1.DBGridEh1.Columns[4].FieldName:='total_sqft';
       Prepared;
       open;
      end;
      with form1.aq48 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-3,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-3,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)
         +formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)
         +formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        form1.DBGridEh2.Columns[6].FieldName:='total_sq'
       else form1.DBGridEh2.Columns[6].FieldName:='total_sqft';
       Prepared;
       open;
      end;
      form1.ShowModal;
     finally
      form1.Free;
      screen.Cursor:=crDefault;
     end;
    end;
    1:
    begin
     try
      form2:=tform2.Create(application);
      screen.Cursor:=crAppstart;
      with form2.ADOQuery1 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-4,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-4,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)
         +formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)
         +formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        form2.DBGridEh1.Columns[5].FieldName:='total_sq'
       else form2.DBGridEh1.Columns[5].FieldName:='total_sqft';
       Prepared;
       open;
      end;
      with form2.aqdate48 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-2,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       Prepared;
       open;
      end;
      with form2.aqdept48 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-2,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));

       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       Prepared;   
       open;
      end;
      form2.ShowModal;
     finally
      form2.Free;
      screen.Cursor:=crDefault;
     end;
    end;
    2:
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
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        form3.DBGridEh1.Columns[5].FieldName:='total_sq'
       else
        form3.DBGridEh1.Columns[5].FieldName:='total_sqft';
       Prepared;
       open;
      end;

      with form3.aqdate48 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-4,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-4,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       Prepared;
       open;
      end;
      with form3.aqdept48 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-2,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       Prepared;   
       open;
      end;

      form3.ShowModal;
     finally
      form3.Free;
      screen.Cursor:=crDefault;
     end;
    end;
    end  //end case
  else  if radiogroup5.ItemIndex=0 then
  case radiogroup1.ItemIndex of  ////按班组汇总
    0:
     begin
     try
      Form_group:=tForm_group.Create(application);
      screen.Cursor:=crAppstart;
      with Form_group.ADOQuery1 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-3,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-3,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        Form_group.DBGridEh1.Columns[4].FieldName:='total_sq'
       else
        Form_group.DBGridEh1.Columns[4].FieldName:='total_sqft';
       Prepared;
//       ShowMessage(SQL.Text);
       open;
      end;
      with Form_group.aq48 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-4,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-4,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        Form_group.DBGridEh2.Columns[6].FieldName:='total_sq'
       else
        Form_group.DBGridEh2.Columns[6].FieldName:='total_sqft';
       Prepared;
//       ShowMessage(SQL.Text);
       open;
      end;
      Form_group.ShowModal;
     finally
      Form_group.Free;
      screen.Cursor:=crDefault;
     end;
     end;
    1:
     begin
     try
      Form_groupdayout:=tForm_groupdayout.Create(application);
      screen.Cursor:=crAppstart;
      with Form_groupdayout.ADOQuery1 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-5,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-5,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        Form_groupdayout.DBGridEh1.Columns[5].FieldName:='total_sq'
       else
        Form_groupdayout.DBGridEh1.Columns[5].FieldName:='total_sqft';
       Prepared;
       open;
      end;
      with Form_groupdayout.aqdate48 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-2,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       Prepared;
       open;
      end;
      with Form_groupdayout.aqdept48 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-3,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-3,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       Prepared;

       open;
      end;
      Form_groupdayout.ShowModal;
     finally
      Form_groupdayout.Free;
      screen.Cursor:=crDefault;
     end;
     end;
    2:
     begin
     try
      Form_daytimegroup:=tForm_daytimegroup.Create(application);
      screen.Cursor:=crAppstart;
      with Form_daytimegroup.ADOQuery1 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-6,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-6,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        Form_daytimegroup.DBGridEh1.Columns[5].FieldName:='total_sq'
       else
        Form_daytimegroup.DBGridEh1.Columns[5].FieldName:='total_sqft';
       Prepared;
//       ShowMessage(SQL.Text);
       open;
      end;

      with Form_daytimegroup.aqdate48 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-5,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-5,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       Prepared;
       open;
      end;
      with Form_daytimegroup.aqdept48 do
      begin
       close;
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-3,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-3,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));   
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       Prepared;   
       open;
      end;

      Form_daytimegroup.ShowModal;
     finally
      Form_daytimegroup.Free;
      screen.Cursor:=crDefault;
     end;
     end;
  end else if radiogroup5.ItemIndex=2 then
  case radiogroup1.ItemIndex of  ////按成本中心汇总
    0:
     begin
     try
      Form_group:=tForm_group.Create(application);
      Form_group.TabSheet1.Caption:= '成本中心汇总';
      Form_group.TabSheet2.Caption:= '成本中心产品类型汇总';
      Form_group.TabSheet3.Caption:= '成本中心汇总图表';
      screen.Cursor:=crAppstart;
      with Form_group.ADOQuery1 do
      begin
       close;
       SQL.Delete(sql.Count-9);
       SQL.Insert(sql.Count-8,'dbo.Data0034 AS Data0034_1 ON dbo.Data0034.COST_DEPT_PTR = Data0034_1.RKEY');
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-3,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-3,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        Form_group.DBGridEh1.Columns[4].FieldName:='total_sq'
       else
        Form_group.DBGridEh1.Columns[4].FieldName:='total_sqft';
       Prepared;
//       ShowMessage(SQL.Text);
       open;
      end;
      with Form_group.aq48 do
      begin
       close;
       SQL.Delete(sql.Count-10);
       SQL.Insert(sql.Count-9,'dbo.Data0034 AS Data0034_1 ON dbo.Data0034.COST_DEPT_PTR = Data0034_1.RKEY');
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-4,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-4,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        Form_group.DBGridEh2.Columns[6].FieldName:='total_sq'
       else
        Form_group.DBGridEh2.Columns[6].FieldName:='total_sqft';
       Prepared;

       open;
      end;
      Form_group.ShowModal;
     finally
      Form_group.Free;
      screen.Cursor:=crDefault;
     end;
     end;
    1:
     begin
     try
      Form_groupdayout:=tForm_groupdayout.Create(application);
      screen.Cursor:=crAppstart;
      with Form_groupdayout.ADOQuery1 do
      begin
       close;
       SQL.Delete(sql.Count-11);
       SQL.Insert(sql.Count-10,'dbo.Data0034 AS Data0034_1 ON dbo.Data0034.COST_DEPT_PTR = Data0034_1.RKEY');

       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-5,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-5,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        Form_groupdayout.DBGridEh1.Columns[5].FieldName:='total_sq'
       else
        Form_groupdayout.DBGridEh1.Columns[5].FieldName:='total_sqft';
       Prepared;
//       ShowMessage(SQL.Text);
       open;
      end;

      with Form_groupdayout.aqdate48 do
      begin
       close;
       SQL.Delete(sql.Count-8);
       SQL.Insert(sql.Count-7,' dbo.Data0034 AS Data0034_1 ON dbo.Data0034.COST_DEPT_PTR = Data0034_1.RKEY ');
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-2,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       Prepared;
//       ShowMessage(SQL.Text);
       open;
      end;
      with Form_groupdayout.aqdept48 do
      begin
       close;
       SQL.Delete(sql.Count-9);
       SQL.Insert(sql.Count-8,'dbo.Data0034 AS Data0034_1 ON dbo.Data0034.COST_DEPT_PTR = Data0034_1.RKEY');
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-3,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-3,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       Prepared;
//       ShowMessage(SQL.Text);  
       open;
      end;
      Form_groupdayout.ShowModal;
     finally
      Form_groupdayout.Free;
      screen.Cursor:=crDefault;
     end;
     end;
    2:
     begin
     try
      Form_daytimegroup:=tForm_daytimegroup.Create(application);
      screen.Cursor:=crAppstart;
      with Form_daytimegroup.ADOQuery1 do
      begin
       close;
       SQL.Delete(sql.Count-12);
       SQL.Insert(sql.Count-11,'dbo.Data0034 AS Data0034_1 ON dbo.Data0034.COST_DEPT_PTR = Data0034_1.RKEY ');
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-6,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-6,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       if radiogroup2.ItemIndex=0 then
        Form_daytimegroup.DBGridEh1.Columns[5].FieldName:='total_sq'
       else
        Form_daytimegroup.DBGridEh1.Columns[5].FieldName:='total_sqft';
       Prepared;
       open;
      end;

      with Form_daytimegroup.aqdate48 do
      begin
       close;
       SQL.Delete(sql.Count-11);
       SQL.Insert(sql.Count-10,'dbo.Data0034 AS Data0034_1 ON dbo.Data0034.COST_DEPT_PTR = Data0034_1.RKEY');
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-5,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-5,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       Prepared;
//       ShowMessage(SQL.Text);
       open;
      end;
      with Form_daytimegroup.aqdept48 do
      begin
       close;
       SQL.Delete(sql.Count-9);
       SQL.Insert(sql.Count-8,'dbo.Data0034 AS Data0034_1 ON dbo.Data0034.COST_DEPT_PTR = Data0034_1.RKEY');
       for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-3,sgrid1.Cells[2,i]);
       if radiogroup4.ItemIndex<>2 then
        sql.Insert(sql.Count-3,'and data0025.TTYPE = '+inttostr(radiogroup4.ItemIndex));   
       Parameters.ParamValues['dtpk1']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk1.Date)+
          formatdatetime('hh:nn:ss',self.dtt1.DateTime));
       Parameters.ParamValues['dtpk2']:=strtodatetime(
          formatdatetime('yyyy-mm-dd ',self.dtpk2.Date)+
          formatdatetime('hh:nn:ss',self.dtt2.DateTime));
       Prepared;
//       ShowMessage(SQL.Text); 
       open;
      end;

      Form_daytimegroup.ShowModal;
     finally
      Form_daytimegroup.Free;
      screen.Cursor:=crDefault;
     end;
     end;
  end;
end;

procedure TForm_condition.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if listbox3.ItemIndex= listbox3.Items.IndexOf('层数') then
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure TForm_condition.RadioGroup5Click(Sender: TObject);
begin
 if RadioGroup5.ItemIndex=0 then
  ListBox3.Items.Strings[3]:='班组代码'
 else if RadioGroup5.ItemIndex=1 then
  ListBox3.Items.Strings[3]:='工序代码'
 else if RadioGroup5.ItemIndex=2 then
  ListBox3.Items.Strings[3]:='成本中心代码';

 Self.BitBtn2Click(nil);
end;

end.
