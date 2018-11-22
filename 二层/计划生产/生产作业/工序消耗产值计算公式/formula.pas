unit formula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,StrUtils,raFunc;

type
  TForm_formula = class(TForm)
    BitSve: TBitBtn;
    BitClose: TBitBtn;
    formula_number: TEdit;
    Label1: TLabel;
    cbb_ttype: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    BitBtn7: TBitBtn;
    Label4: TLabel;
    edt_para0: TEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    Label6: TLabel;
    edt_para1: TEdit;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    edt_para2: TEdit;
    Label9: TLabel;
    BitBtn3: TBitBtn;
    Label10: TLabel;
    edt_para3: TEdit;
    Label11: TLabel;
    BitBtn4: TBitBtn;
    Label12: TLabel;
    edt_para4: TEdit;
    Label13: TLabel;
    BitBtn5: TBitBtn;
    Label14: TLabel;
    edt_para5: TEdit;
    Label15: TLabel;
    BitBtn6: TBitBtn;
    Label16: TLabel;
    edt_para6: TEdit;
    Label17: TLabel;
    BitBtn8: TBitBtn;
    Label18: TLabel;
    edt_para7: TEdit;
    Label19: TLabel;
    BitBtn9: TBitBtn;
    Label20: TLabel;
    edt_para8: TEdit;
    Label21: TLabel;
    BitBtn10: TBitBtn;
    Label22: TLabel;
    edt_para9: TEdit;
    Label23: TLabel;
    BitBtn11: TBitBtn;
    Label24: TLabel;
    ComboBox1: TComboBox;
    Label25: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Label26: TLabel;
    Combobox3: TComboBox;
    SpeedButton14: TSpeedButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    SpeedButton13: TSpeedButton;
    SpeedButton15: TSpeedButton;
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edt_para0Exit(Sender: TObject);
    procedure edt_para1Exit(Sender: TObject);
    procedure edt_para2Exit(Sender: TObject);
    procedure edt_para3Exit(Sender: TObject);
    procedure edt_para4Exit(Sender: TObject);
    procedure edt_para5Exit(Sender: TObject);
    procedure edt_para6Exit(Sender: TObject);
    procedure edt_para7Exit(Sender: TObject);
    procedure edt_para8Exit(Sender: TObject);
    procedure edt_para9Exit(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Combobox3Change(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure BitSveEnter(Sender: TObject);
    procedure BitSveClick(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
  private
    { Private declarations }
   dept_ptr:Integer;
   para_ptr:array[0..9] of Integer;
   para_value:array[0..17] of string;
   procedure edt_paraExit(v_edt: TEdit;v_lab:TLabel;atc_name:TComponentName);
   procedure edt_setforce(rkey278:Integer;v_edt: TEdit;infor:string);
   function find_numbererror(old_number,number:string):boolean;
  public
    { Public declarations }
   ad_ed:Byte;//0:新增;1:编辑;2:检查
  end;

var
  Form_formula: TForm_formula;

implementation

uses common,DAMO,Pick_Item_Single,ConstVar, DB,MyClass;

{$R *.dfm}

procedure TForm_formula.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 try
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'Dept_code/工序代码/100,dept_name/工序名称/150,xz/性质/100';
  InputVar.Sqlstr :='select rkey,dept_code,dept_name,case when ttype=4 '+
  ' then ''部门'' when ttype=5 then ''班组'' else ''工序'' end xz '+
  'from data0034 where ttype =''1'' order by dept_code';
  InputVar.AdoConn := DM.ADOConnection;
  frmPick_Item_Single.InitForm_New(InputVar)  ;
   if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Text := frmPick_Item_Single.adsPick.FieldValues['dept_code'];
      label4.Caption:=frmPick_Item_Single.adsPick.fieldbyname('dept_name').AsString;
      self.dept_ptr:= frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
   else
    Edit1.SetFocus;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end;
end;

procedure TForm_formula.Edit1Exit(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  label4.Caption:='';
  self.dept_ptr:=0;
 end
else
 if ActiveControl.Name<>'BitBtn7' then
 begin
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:= 'select rkey,dept_CODE,dept_name from data0034 '+
    'where dept_CODE='+quotedstr(trim(edit1.Text))+
    ' and ttype =''1''';
    open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
    showmsg('工序代码不正确',1);
    edit1.SetFocus;
   end
   else
    if dm.ADOQuery1.FieldByName('rkey').AsInteger<>self.dept_ptr then
    begin
     edit1.Text:=dm.ADOQuery1.Fieldbyname('DEPT_CODE').AsString;
     dept_ptr:=dm.ADOQuery1.Fieldbyname('rkey').AsInteger;
     label4.Caption:= dm.ADOQuery1.Fieldbyname('DEPT_NAME').AsString;
    end;
 end;
end;

procedure TForm_formula.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
if  ((Sender as TBitBtn).Tag = self.ComboBox1.Items.Count-9) or
    ((Sender as TBitBtn).Tag = self.ComboBox1.Items.Count-8) then
 try
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'PARAMETER_NAME/参数代码/74,PARAMETER_DESC/参数名称/160,'+
  'CATEGORY_NAME/参数类别/74,UNIT_NAME/单位/67,datatype/数据类型/56';
  InputVar.Sqlstr :=
   'SELECT dbo.Data0278.RKEY,'+#13+
    'Data0278.PARAMETER_NAME,Data0278.PARAMETER_DESC,'+#13+
    'Data0002.UNIT_NAME, case data0278.DATA_TYPE'+#13+
    'when 1 then ''数字'' WHEN 2 THEN ''字符'''+#13+
    'end as datatype,data0278.status3,'+#13+
    'case Data0278.CATEGORY_PTR when 2 then ''全部参数'' WHEN 3 THEN ''制程参数'''+#13+
    'end as CATEGORY_NAME'+#13+
    'FROM dbo.Data0002 INNER JOIN'+#13+
    ' Data0278 ON Data0002.RKEY = Data0278.UNIT_PTR '+#13+
    'order by PARAMETER_NAME';
  InputVar.AdoConn := DM.ADOConnection;
  frmPick_Item_Single.InitForm_New(InputVar)  ;
   if frmPick_Item_Single.ShowModal=mrok then
    begin
      self.para_ptr[(Sender as TBitBtn).Tag]:=
       frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsInteger;
      Self.ComboBox1.Items.Delete((Sender as TBitBtn).Tag+8);
      self.ComboBox1.Items.Insert((Sender as TBitBtn).Tag+8,
        trim(frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_DESC').AsString));
      self.para_value[(Sender as TBitBtn).Tag+8]:=
       Trim(frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_NAME').AsString);
      case (Sender as TBitBtn).Tag of
      0:
       begin
        edt_para0.text :=
         Trim(frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_NAME').AsString);
         label6.Caption:=frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_DESC').AsString;
       end;
      1:
       begin
        edt_para1.text :=
         Trim(frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_NAME').AsString);
         label8.Caption:=frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_DESC').AsString;
       end;
      2:
       begin
        edt_para2.text :=
         Trim(frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_NAME').AsString);
        Label10.Caption:=frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_DESC').AsString;
       end;
      3:
       begin
        edt_para3.text :=
         Trim(frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_NAME').AsString);
        Label12.Caption:=frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_DESC').AsString;
       end;
      4:
       begin
        edt_para4.text :=
         Trim(frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_NAME').AsString);
        Label14.Caption:=frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_DESC').AsString;
       end;
      5:
       begin
        edt_para5.text :=
         Trim(frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_NAME').AsString);
         Label16.Caption:=frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_DESC').AsString;
       end;

      6:
       begin
        edt_para6.text :=
         Trim(frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_NAME').AsString);
        label18.Caption:=frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_DESC').AsString;
       end;
      7:
       begin
        edt_para7.text :=
         Trim(frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_NAME').AsString);
        label20.Caption:=frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_DESC').AsString;
       end;
      8:
       begin
        edt_para8.text :=
         Trim(frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_NAME').AsString);
        Label22.Caption:=frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_DESC').AsString;
       end;
      9:
       begin
        edt_para9.text :=
         Trim(frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_NAME').AsString);
         Label24.Caption:=frmPick_Item_Single.adsPick.fieldbyname('PARAMETER_DESC').AsString;
       end;
      end;
    end
   else
    case (Sender as TBitBtn).Tag of
    0:edt_para0.SetFocus;
    1:edt_para1.SetFocus;
    2:edt_para2.SetFocus;
    3:edt_para3.SetFocus;
    4:edt_para4.SetFocus;
    5:edt_para5.SetFocus;
    6:edt_para6.SetFocus;
    7:edt_para7.SetFocus;
    8:edt_para8.SetFocus;
    9:edt_para9.SetFocus;
    end;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end
else
 ShowMsg('参数代码定义必须按顺序进行',1)
end;

procedure TForm_formula.edt_setforce(rkey278: Integer; v_edt: TEdit;infor:string);
begin
with DM.ADOQuery1 do
 begin
   Close;
   sql.Text:='select PARAMETER_NAME from data0278 '+
             'where rkey='+inttostr(rkey278);
   open;
   v_edt.Text:=Trim(fieldbyname('PARAMETER_NAME').AsString);
   v_edt.SetFocus;
   ShowMsg(infor+'必须按顺序进行',1);
 end;
end;

procedure TForm_formula.edt_paraExit(v_edt: TEdit; v_lab: TLabel;
  atc_name: TComponentName);
begin
if trim(v_edt.Text)='' then
 begin
  if v_edt.Tag+9 >= self.ComboBox1.Items.Count then
  begin
   v_lab.Caption:='';
   para_ptr[v_edt.Tag]:=0;
   ComboBox1.Items.Delete(v_edt.Tag+8);
   self.para_value[v_edt.Tag+8]:='';
  end
  else
   self.edt_setforce(para_ptr[v_edt.Tag],v_edt,'参数删除');
 end
else
 if ActiveControl.Name<>atc_name then
 begin
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:=
    'SELECT dbo.Data0278.RKEY,'+#13+
    'Data0278.PARAMETER_NAME,Data0278.PARAMETER_DESC,'+#13+
    'Data0002.UNIT_NAME'+#13+
    'FROM dbo.Data0002 INNER JOIN'+#13+
    ' Data0278 ON Data0002.RKEY = Data0278.UNIT_PTR'+#13+
    'WHERE PARAMETER_NAME='+quotedstr(trim(v_edt.Text));
    open;
   end;
   if not dm.ADOQuery1.IsEmpty then
    begin
     if para_ptr[v_edt.Tag]<>dm.ADOQuery1.Fieldbyname('rkey').AsInteger then
     if  (v_edt.Tag = self.ComboBox1.Items.Count-8) or
         (v_edt.Tag = self.ComboBox1.Items.Count-9) then
      begin
        para_ptr[v_edt.Tag]:=dm.ADOQuery1.Fieldbyname('rkey').AsInteger;
        v_lab.Caption:= Trim(dm.ADOQuery1.Fieldbyname('PARAMETER_DESC').AsString);
        Self.ComboBox1.Items.Delete(v_edt.Tag+8);
        self.ComboBox1.Items.Insert(v_edt.Tag+8,v_lab.Caption);
        self.para_value[v_edt.Tag+8]:=
                        Trim(dm.ADOQuery1.Fieldbyname('PARAMETER_NAME').AsString);
      end
     else
      self.edt_setforce(para_ptr[v_edt.Tag],v_edt,'参数修改');
    end
   else
    begin
     showmsg('参数代码不正确',1);
     v_edt.SetFocus;
    end;
 end;
end;

procedure TForm_formula.edt_para0Exit(Sender: TObject);
begin
self.edt_paraExit(edt_para0,Label6,'BitBtn1');
end;

procedure TForm_formula.edt_para1Exit(Sender: TObject);
begin
self.edt_paraExit(edt_para1,Label8,'BitBtn2');
end;

procedure TForm_formula.edt_para2Exit(Sender: TObject);
begin
self.edt_paraExit(edt_para2,Label10,'BitBtn3');
end;

procedure TForm_formula.edt_para3Exit(Sender: TObject);
begin
self.edt_paraExit(edt_para3,Label12,'BitBtn4');
end;

procedure TForm_formula.edt_para4Exit(Sender: TObject);
begin
self.edt_paraExit(edt_para4,Label14,'BitBtn5');
end;

procedure TForm_formula.edt_para5Exit(Sender: TObject);
begin
self.edt_paraExit(edt_para5,Label16,'BitBtn6');
end;

procedure TForm_formula.edt_para6Exit(Sender: TObject);
begin
self.edt_paraExit(edt_para6,Label18,'BitBtn8');
end;

procedure TForm_formula.edt_para7Exit(Sender: TObject);
begin
self.edt_paraExit(edt_para7,Label20,'BitBtn9');
end;

procedure TForm_formula.edt_para8Exit(Sender: TObject);
begin
self.edt_paraExit(edt_para8,Label22,'BitBtn10');
end;

procedure TForm_formula.edt_para9Exit(Sender: TObject);
begin
self.edt_paraExit(edt_para9,Label24,'BitBtn11');
end;

procedure TForm_formula.rb1Click(Sender: TObject);
begin
  Memo1.Enabled := true;
  Memo1.SetFocus;
  Memo2.Enabled := not rb1.Checked;
  Memo3.Enabled := not rb1.Checked;
  Memo4.Enabled := not rb1.Checked;
end;

procedure TForm_formula.rb2Click(Sender: TObject);
begin
  Memo2.Enabled := true;
  Memo2.SetFocus;
  Memo1.Enabled := not rb2.Checked;
  Memo3.Enabled := not rb2.Checked;
  Memo4.Enabled := not rb2.Checked;
end;

procedure TForm_formula.rb3Click(Sender: TObject);
begin
  Memo3.Enabled := true;
  Memo3.SetFocus;
  Memo1.Enabled := not rb3.Checked;
  Memo2.Enabled := not rb3.Checked;
  Memo4.Enabled := not rb3.Checked;
end;

procedure TForm_formula.rb4Click(Sender: TObject);
begin
  Memo4.Enabled := true;
  Memo4.SetFocus;
  Memo1.Enabled := not rb4.Checked;
  Memo2.Enabled := not rb4.Checked;
  Memo3.Enabled := not rb4.Checked;
end;

procedure TForm_formula.FormActivate(Sender: TObject);
var
  i:integer;
begin
  try
    Get_Eng_Table_Formula_List(dm.ADOQuery1);
    dm.ADOQuery1.First;
    while not dm.ADOQuery1.Eof do begin
      Combobox3.Items.Add(dm.ADOQuery1.fieldbyName('FXY').AsString);
      dm.ADOQuery1.next;
    end;
  finally
    dm.ADOQuery1.close;
  end;
  self.para_value[0]:='PANEL_A_B';
  self.para_value[1]:='pan_qty';
  self.para_value[2]:='set_qty';
  self.para_value[3]:='pcs_qty';
  self.para_value[4]:='pan_sqrt';
  self.para_value[5]:='set_sqrt';
  self.para_value[6]:='pcs_sqrt';
  self.para_value[7]:='LAYERS';

if self.ad_ed<>0 then     //不是新增
 begin
  formula_number.Text:=dm.ADS569formula_number.Value;
  Edit1.Text:=dm.ADS569DEPT_CODE.Value;
  label4.Caption:=dm.ADS569DEPT_NAME.Value;
  self.dept_ptr:=dm.ADS569dept_ptr.Value;
  Memo1.Text:=dm.ADS569theorycalc_meth.Value;
  Memo2.Text:=dm.ADS569measurecalc_meth1.Value;
  Memo3.Text:=dm.ADS569measurecalc_meth2.Value;
  Memo4.Text:=dm.ADS569measurecalc_meth3.Value;
  for i:=0 to 9 do
   if dm.ADS569.FieldByName('PARA_PTR_'+inttostr(i)).Value>0 then
   begin
    para_ptr[i]:=dm.ADS569.FieldByName('PARA_PTR_'+inttostr(i)).Value;
    with dm.ADOQuery1 do
     begin
      close;
      sql.Text:=
      'SELECT dbo.Data0278.RKEY,'+#13+
      'Data0278.PARAMETER_NAME,Data0278.PARAMETER_DESC,'+#13+
      'Data0002.UNIT_NAME'+#13+
      'FROM dbo.Data0002 INNER JOIN'+#13+
      ' Data0278 ON Data0002.RKEY = Data0278.UNIT_PTR '+#13+
      'WHERE Data0278.RKEY='+inttostr(para_ptr[i]);
      open;
     end;
    self.ComboBox1.Items.Add(Trim(dm.ADOQuery1.Fieldbyname('PARAMETER_DESC').AsString));
    self.para_value[8+i]:=Trim(dm.ADOQuery1.Fieldbyname('PARAMETER_NAME').AsString);
    case i of
     0:
     begin
      edt_para0.Text:=dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString;
      Label6.Caption:= dm.ADOQuery1.Fieldbyname('PARAMETER_DESC').AsString;
     end;
     1:
     begin
      edt_para1.Text:=dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString;
      Label8.Caption:= dm.ADOQuery1.Fieldbyname('PARAMETER_DESC').AsString;
     end;
     2:
     begin
      edt_para2.Text:=dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString;
      Label10.Caption:= dm.ADOQuery1.Fieldbyname('PARAMETER_DESC').AsString;
     end;
     3:
     begin
      edt_para3.Text:=dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString;
      Label12.Caption:= dm.ADOQuery1.Fieldbyname('PARAMETER_DESC').AsString;
     end;
     4:
     begin
      edt_para4.Text:=dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString;
      Label14.Caption:= dm.ADOQuery1.Fieldbyname('PARAMETER_DESC').AsString;
     end;
     5:
     begin
      edt_para5.Text:=dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString;
      Label16.Caption:= dm.ADOQuery1.Fieldbyname('PARAMETER_DESC').AsString;
     end;
     6:
     begin
      edt_para6.Text:=dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString;
      Label18.Caption:= dm.ADOQuery1.Fieldbyname('PARAMETER_DESC').AsString;
     end;
     7:
     begin
      edt_para7.Text:=dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString;
      Label20.Caption:= dm.ADOQuery1.Fieldbyname('PARAMETER_DESC').AsString;
     end;
     8:
     begin
      edt_para8.Text:=dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString;
      Label22.Caption:= dm.ADOQuery1.Fieldbyname('PARAMETER_DESC').AsString;
     end;
     9:
     begin
      edt_para9.Text:=dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString;
      Label24.Caption:= dm.ADOQuery1.Fieldbyname('PARAMETER_DESC').AsString;
     end;

    end;
   end;
 end;
end;

procedure TForm_formula.SpeedButton1Click(Sender: TObject);
var
  sp1,sp2:string;
  i,j,selst:integer;
  symbol_txt:string;
begin
  symbol_txt:=(Sender as TSpeedButton).Caption;
  if symbol_txt = 'IF' then  symbol_txt := 'IF( , , )';
  if rb1.Checked then
  begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo1.CaretPos.X;
    j:=Memo1.CaretPos.y;
    selst:= Memo1.SelStart;

    if copy(Memo1.Lines[j],i,1)=' ' then sp1:='';
    if copy(Memo1.Lines[j],i+1,1)=' ' then sp2:='';    //i后面所有值
    symbol_txt :=sp1+symbol_txt+sp2;

    sp1:= Memo1.Lines[j];
    Insert(symbol_txt,sp1,i+1);
    Memo1.Lines[j]:=sp1;
    Memo1.SelStart:=selst+length(symbol_txt);
    Memo1.SetFocus ;
  end else
  if rb2.Checked then
  begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo2.CaretPos.X;
    j:=Memo2.CaretPos.y;
    selst:= Memo2.SelStart;

    if copy(Memo2.Lines[j],i,1)=' ' then sp1:='';
    if copy(Memo2.Lines[j],i+1,1)=' ' then sp2:='';    //i后面所有值
    symbol_txt :=sp1+symbol_txt+sp2;

    sp1:= Memo2.Lines[j];
    Insert(symbol_txt,sp1,i+1);
    Memo2.Lines[j]:=sp1;
    Memo2.SelStart:=selst+length(symbol_txt);
    Memo2.SetFocus ;
  end else
  if rb3.Checked then
  begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo3.CaretPos.X;
    j:=Memo3.CaretPos.y;
    selst:= Memo3.SelStart;

    if copy(Memo3.Lines[j],i,1)=' ' then sp1:='';
    if copy(Memo3.Lines[j],i+1,1)=' ' then sp2:='';    //i后面所有值
    symbol_txt :=sp1+symbol_txt+sp2;

    sp1:= Memo3.Lines[j];
    Insert(symbol_txt,sp1,i+1);
    Memo3.Lines[j]:=sp1;
    Memo3.SelStart:=selst+length(symbol_txt);
    Memo3.SetFocus ;
  end
  else
  if rb4.Checked then
  begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo4.CaretPos.X;
    j:=Memo4.CaretPos.y;
    selst:= Memo1.SelStart;

    if copy(Memo4.Lines[j],i,1)=' ' then sp1:='';
    if copy(Memo4.Lines[j],i+1,1)=' ' then sp2:='';    //i后面所有值
    symbol_txt :=sp1+symbol_txt+sp2;

    sp1:= Memo4.Lines[j];
    Insert(symbol_txt,sp1,i+1);
    Memo4.Lines[j]:=sp1;
    Memo4.SelStart:=selst+length(symbol_txt);
    Memo4.SetFocus ;
  end;

end;

procedure TForm_formula.Combobox3Change(Sender: TObject);
begin
  if rb1.Checked then
   Memo1.SetFocus
  else
   if rb2.Checked then
    Memo2.SetFocus
   else
   if rb3.Checked then
    Memo3.SetFocus
   else
   if rb4.Checked then
    Memo4.SetFocus
end;

procedure TForm_formula.SpeedButton15Click(Sender: TObject);
var
  sp1,sp2:string;
  i,j,selst:integer;
  symbol_txt:string;
begin
if (Sender as TSpeedButton).Tag=0 then    //插入表单
 begin
  if Combobox3.ItemIndex=-1 then exit;
  symbol_txt:=self.Combobox3.Text;
 end
else                                 //插入固定字段
 begin
  if Combobox1.ItemIndex=-1 then exit;
  symbol_txt:=para_value[Combobox1.ItemIndex];  //字段数组
 end;

 if rb1.Checked then
 begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo1.CaretPos.X;
    j:=Memo1.CaretPos.y;
    selst:= Memo1.SelStart;

    if copy(Memo1.Lines[j],i,1)=' ' then sp1:='';
    if copy(Memo1.Lines[j],i+1,1)=' ' then sp2:='';    //i后面所有值
    symbol_txt :=sp1+symbol_txt+sp2;

    sp1:= Memo1.Lines[j];
    Insert(symbol_txt,sp1,i+1);
    Memo1.Lines[j]:=sp1;
    Memo1.SelStart:=selst+length(symbol_txt);
    Memo1.SetFocus ;
 end
else
 if rb2.Checked then
 begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo2.CaretPos.X;
    j:=Memo2.CaretPos.y;
    selst:= Memo2.SelStart;

    if copy(Memo2.Lines[j],i,1)=' ' then sp1:='';
    if copy(Memo2.Lines[j],i+1,1)=' ' then sp2:='';    //i后面所有值
    symbol_txt :=sp1+symbol_txt+sp2;

    sp1:= Memo2.Lines[j];
    Insert(symbol_txt,sp1,i+1);
    Memo2.Lines[j]:=sp1;
    Memo2.SelStart:=selst+length(symbol_txt);
    Memo2.SetFocus ;
 end
 else
 if rb3.Checked then
 begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo3.CaretPos.X;
    j:=Memo3.CaretPos.y;
    selst:= Memo3.SelStart;

    if copy(Memo3.Lines[j],i,1)=' ' then sp1:='';
    if copy(Memo3.Lines[j],i+1,1)=' ' then sp2:='';    //i后面所有值
    symbol_txt :=sp1+symbol_txt+sp2;

    sp1:= Memo3.Lines[j];
    Insert(symbol_txt,sp1,i+1);
    Memo3.Lines[j]:=sp1;
    Memo3.SelStart:=selst+length(symbol_txt);
    Memo3.SetFocus ;
 end
 else
 if rb4.Checked then
 begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo4.CaretPos.X;
    j:=Memo4.CaretPos.y;
    selst:= Memo4.SelStart;

    if copy(Memo4.Lines[j],i,1)=' ' then sp1:='';
    if copy(Memo4.Lines[j],i+1,1)=' ' then sp2:='';    //i后面所有值
    symbol_txt :=sp1+symbol_txt+sp2;

    sp1:= Memo4.Lines[j];
    Insert(symbol_txt,sp1,i+1);
    Memo4.Lines[j]:=sp1;
    Memo4.SelStart:=selst+length(symbol_txt);
    Memo4.SetFocus ;
 end;
end;


procedure TForm_formula.BitSveEnter(Sender: TObject);
begin
if trim(formula_number.Text)='' then
 begin
  showmsg('公式编码不允许为空!',1);
  formula_number.SetFocus;
  exit;
 end;

if trim(Edit1.Text)='' then
 begin
  showmsg('计算工序不允许为空!',1);
  Edit1.SetFocus;
  exit;
 end;
if trim(Memo1.Text)='' then
 begin
  showmsg('计算公式不允许为空!',1);
  exit;
 end;

end;

function TForm_formula.find_numbererror(old_number,number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select formula_number from data0569');
   sql.Add('where formula_number='''+number+'''');
   if old_number<>'' then
   sql.Add('and formula_number<>'''+old_number+'''');
   open;
   if not IsEmpty then  result := true;
  end;
end;

procedure TForm_formula.BitSveClick(Sender: TObject);
var
  i:integer;
  v_sql:string;
begin
 if self.ad_ed=0 then //新增
  if self.find_numbererror('',trim(self.formula_number.Text)) then
  begin
   messagedlg('公式编码重复!',mtError,[mbOK],0);
   formula_number.SetFocus;
   exit;
  end
  else
 else
  if self.find_numbererror(Trim(dm.ADS569formula_number.Value),
        trim(self.formula_number.Text)) then
   begin
    messagedlg('公式编码重复!',mtError,[mbOK],0);
    formula_number.SetFocus;
    exit;
   end;

  dm.ADOConnection.BeginTrans;
  try
  if self.ad_ed=0 then //新增
   v_sql:='where formula_number is null'
  else
   v_sql:='where formula_number ='+quotedstr(Trim(dm.ADS569formula_number.Value));
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select formula_number,ttype,dept_ptr,theorycalc_meth, '+
            'measurecalc_meth1,measurecalc_meth2,measurecalc_meth3, '+
            'PARA_PTR_0,PARA_PTR_1,PARA_PTR_2,PARA_PTR_3, '+
            'PARA_PTR_4,PARA_PTR_5,PARA_PTR_6,PARA_PTR_7, '+
            'PARA_PTR_8,PARA_PTR_9 from data0569 '+ v_sql;
    open;
   end;

  if self.ad_ed=0 then //新增
   dm.ADOQuery1.Append
  else
   dm.ADOQuery1.Edit;


  dm.ADOQuery1.FieldByName('formula_number').Value:=formula_number.Text;
  dm.ADOQuery1.FieldByName('ttype').Value:=self.cbb_ttype.ItemIndex;
  dm.ADOQuery1.FieldByName('dept_ptr').Value:=self.dept_ptr;
  dm.ADOQuery1.FieldByName('theorycalc_meth').Value:=Memo1.Lines.Text;
  dm.ADOQuery1.FieldByName('measurecalc_meth1').Value:=Memo2.Lines.Text;
  dm.ADOQuery1.FieldByName('measurecalc_meth2').Value:=Memo3.Lines.Text;
  dm.ADOQuery1.FieldByName('measurecalc_meth3').Value:=Memo4.Lines.Text;


     
  dm.ADOQuery1.FieldByName('PARA_PTR_0').Value:=para_ptr[( BitBtn1).Tag];
  dm.ADOQuery1.FieldByName('PARA_PTR_1').Value:=para_ptr[( BitBtn2).Tag];;
  dm.ADOQuery1.FieldByName('PARA_PTR_2').Value:=para_ptr[( BitBtn3).Tag];
  dm.ADOQuery1.FieldByName('PARA_PTR_3').Value:=para_ptr[( BitBtn4).Tag];
  dm.ADOQuery1.FieldByName('PARA_PTR_4').Value:=para_ptr[( BitBtn5).Tag];
  dm.ADOQuery1.FieldByName('PARA_PTR_5').Value:=para_ptr[( BitBtn6).Tag];
  dm.ADOQuery1.FieldByName('PARA_PTR_6').Value:=para_ptr[( BitBtn8).Tag];
  dm.ADOQuery1.FieldByName('PARA_PTR_7').Value:=para_ptr[( BitBtn9).Tag];
  dm.ADOQuery1.FieldByName('PARA_PTR_8').Value:=para_ptr[( BitBtn10).Tag];
  dm.ADOQuery1.FieldByName('PARA_PTR_9').Value:=para_ptr[( BitBtn11).Tag];


  for i:=Low(para_ptr) to High(para_ptr) do
   if self.para_ptr[i]>0 then
   dm.ADOQuery1.FieldByName('PARA_PTR_'+inttostr(i)).Value:=para_ptr[i];
  dm.ADOQuery1.Post;

   dm.ADOConnection.CommitTrans;
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     formula_number.SetFocus;
    end;
  end;
end;

procedure TForm_formula.SpeedButton14Click(Sender: TObject);
var
 strExpr:string;
 i:integer;
begin
  if rb1.Checked then
    strExpr:= Memo1.Text
  else
   if rb2.Checked then
    strExpr:= Memo2.Text
  else
   if rb3.Checked then
    strExpr:= Memo3.Text
   else
    strExpr:= Memo4.Text;

   strExpr := StringReplace(strExpr, #$D#$A, '', [rfReplaceAll]);
   strExpr:=uppercase(strExpr);   //一步:替换回车及转换成大写

  try
    Get_Eng_Table_Formula_List(dm.ADOQuery1);  //二步:替换工程表单值
    dm.ADOQuery1.First;
    while not dm.ADOQuery1.Eof do
    begin
     if dm.ADOQuery1.FieldByName('data_type').AsInteger=1 then
      strExpr:= StringReplace(strExpr,' '+trim(uppercase(dm.ADOQuery1.fieldbyname('FXY').asstring))+' ',' 1 ',[rfReplaceAll])
     else
      strExpr:= StringReplace(strExpr,' '+trim(uppercase(dm.ADOQuery1.fieldbyname('FXY').asstring))+' ',' ''X'' ',[rfReplaceAll]);
     dm.ADOQuery1.next;
    end;
  finally
    dm.ADOQuery1.close;
  end;
                               //三步:替换变量
 for i:=0 to ComboBox1.Items.Count-1 do
  if i=0 then
   strExpr:= StringReplace(strExpr,' '+uppercase(para_value[i])+' ',' ''APNL'' ',[rfReplaceAll])
  else
   strExpr:= StringReplace(strExpr,' '+uppercase(para_value[i])+' ',' 1 ',[rfReplaceAll]);
                                //四步:替换IF函数,并计算出结果
  strExpr:= Formula_Verify.Get_If_Expr(strExpr);

 try
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Text :='SELECT convert(float,'+strExpr+') as vqty';
  dm.ADOQuery1.Prepared;
  dm.ADOQuery1.Open;
  ShowMsg('验证通过','提示',1);
 except
   MessageDlg('警告: 公式错误无法正确计算结果!', mtInformation, [mbOK],0);
   exit;
 end;

end;

end.
