unit IF_Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Grids,DateUtils, ExtCtrls
  ;

type
  TIf_Form1 = class(TForm)
    StaticText2: TStaticText;
    sgrid1: TStringGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;                   
    BitBtn6: TBitBtn;
    GroupBox2: TGroupBox;
    ListBox2: TListBox;
    StaticText3: TStaticText;
    BitBtn7: TBitBtn;
    Edit2: TEdit;
    Label2: TLabel;
    BitBtn8: TBitBtn;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    RadioGroup4: TRadioGroup;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBox3: TGroupBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn8Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MyCheckBox_Click1(sender:tobject);
    procedure MyCheckBox_Click2(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }

    procedure update2_sgrid(sgrid_row:integer);
  public
    { Public declarations }


  end;

var
  If_Form1: TIf_Form1;

implementation


uses
   DMUnit1,common ,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TIf_Form1.BitBtn5Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
    sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TIf_Form1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
     sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TIf_Form1.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  bitbtn4.Enabled:=not (sgrid1.Row=sgrid1.RowCount-1);
end;

procedure TIf_Form1.sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  column,row:longint;
begin
  if button=mbright then
      begin
          SGrid1.MouseToCell(x,y,column,row);
          if (row>0) and (row<sgrid1.RowCount-1) then SGrid1.Row:=row;
      end;
end;

procedure TIf_Form1.update2_sgrid(sgrid_row: integer);
var
   s,s1:string;
begin
  sgrid1.Cells[0,sgrid_row]:=listbox2.Items[listbox2.itemindex];
  sgrid1.Cells[1,sgrid_row]:=edit2.Text;
  case listbox2.ItemIndex of
     0:begin //本厂编号
        sgrid1.Cells[2,sgrid_row]:=' and data0025.MANU_PART_NUMBER LIKE ''%'+trim(edit2.Text)+'%''' ;
       end;
     1:begin  //订单号
         sgrid1.Cells[2,sgrid_row]:=' and data0492.SO_NO LIKE ''%'+trim(edit2.Text)+'%''';
       end;                           
     2:begin  //配料单号
         sgrid1.Cells[2,sgrid_row]:=' and data0492.cut_no LIKE ''%'+trim(edit2.Text)+'%''';
       end;
     3:begin  //客户代码
        sgrid1.Cells[2,sgrid_row]:=' and Data0010.CUST_CODE = '''+trim(edit2.Text)+'''';
       end;
     4:begin  //客户型号
         sgrid1.Cells[2,sgrid_row]:=' and DATA0025.MANU_PART_DESC LIKE ''%'+trim(edit2.Text)+'%''';
       end;
     5:begin  //内外层
        sgrid1.Cells[1,sgrid_row] := ComboBox1.Text;
        if ComboBox1.ItemIndex = 0 then     //内层
         sgrid1.Cells[2,sgrid_row]:=' and (DATA0025.PARENT_PTR > 0) '
        else if ComboBox1.ItemIndex = 1 then
         sgrid1.Cells[2,sgrid_row]:=' and (DATA0025.PARENT_PTR is null) ';
       end;
     6:begin  //批量类型
        sgrid1.Cells[1,sgrid_row] := ComboBox1.Text;
        sgrid1.Cells[2,sgrid_row]:=' and DATA0025.ttype = '+inttostr(ComboBox1.ItemIndex);
       end;
     7:begin //投产类型
          s1:= '';
          s := '';
          if CheckBox1.Checked then
            begin
              s1 := s1 + CheckBox1.Caption  + ';' ;
              if s = '' then
               s := '0'
              else
               s := s + ',0';
            end;
          if CheckBox2.Checked then
            begin
              s1 := s1 + CheckBox2.Caption + ';'  ;
              if s = '' then
                  s := '1'
              else
                  s := s + ',1';
            end;
          if CheckBox3.Checked then
           begin
            s1 := s1 + CheckBox3.Caption  + ';' ;
            if s = '' then
                s := '2'
            else
                s := s + ',2';
           end;
          if CheckBox4.Checked then
            begin
              s1 := s1 + CheckBox4.Caption + ';'  ;
              if s = '' then
                  s := '3'
              else
                  s := s + ',3';
            end;
          if CheckBox5.Checked then
            begin
              s1 := s1 + CheckBox5.Caption + ';'  ;
              if s = '' then
                  s := '4'
              else
                  s := s + ',4';
            end; {}
          s := '('+s+')';
          sgrid1.Cells[1,sgrid_row] := s1;
          sgrid1.Cells[2,sgrid_row]:=' and data0492.ttype in ' + s;
       end;

     8:begin //审核状态
          s1:= '';
          s := '';
          if CheckBox6.Checked then
              begin
                  s1 := s1 + CheckBox6.Caption + ';'  ;
                  if s = '' then
                      s := '0'
                  else
                      s := s + ',0';
              end;
          if CheckBox7.Checked then
              begin
                  s1 := s1 + CheckBox7.Caption + ';'  ;
                  if s = '' then
                      s := '1'
                  else
                      s := s + ',1';
              end;
          if CheckBox8.Checked then
              begin
                  s1 := s1 + CheckBox8.Caption + ';'  ;
                  if s = '' then
                      s := '2'
                  else
                      s := s + ',2';
              end;
          if CheckBox9.Checked then
              begin
                  s1 := s1 + CheckBox9.Caption + ';'  ;
                  if s = '' then
                      s := '3'
                  else
                      s := s + ',3';
              end;

          s := '('+s+')';
          sgrid1.Cells[1,sgrid_row] := s1;
          sgrid1.Cells[2,sgrid_row]:=' and data0492.TSTATUS in ' + s;
       end;
     9:begin
          dm.tmp.Close;
          dm.tmp.SQL.Text:='select rkey from data0015 where warehouse_code='''+edit2.Text+'''';
          dm.tmp.Open;
          if dm.tmp.IsEmpty then
          begin
            sgrid1.Cells[0,sgrid_row]:='';
            sgrid1.Cells[1,sgrid_row]:='';
            showmessage('工厂代码不存在...');
            edit2.SetFocus;
            exit;
          end ;
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:=' and data0492.whouse_ptr='+dm.tmp.Fields[0].AsString;
       end;
     10:begin  //订单新旧
         sgrid1.Cells[2,sgrid_row]:='and data0060.so_oldnew= '''+combobox1.Text+'''';
         sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
        end;
     11:begin
          sgrid1.Cells[1,sgrid_row] := ComboBox1.Text;
          sgrid1.Cells[2,sgrid_row]:=' and data0060.so_tp = '+inttostr(ComboBox1.ItemIndex);
        end;
     end;
   if (sgrid_row=sgrid1.RowCount-1) then sgrid1.RowCount :=sgrid1.RowCount +1;
end;

procedure TIf_Form1.BitBtn8Click(Sender: TObject);
var
  i:integer;
begin
  for i:=1 to sgrid1.RowCount-2 do
  if (sgrid1.Cells[0,i]=listbox2.Items[listbox2.ItemIndex])  then
  begin
    update2_sgrid(i);
    exit;
  end;

  update2_sgrid(sgrid1.RowCount-1);

end;



procedure TIf_Form1.ListBox2Click(Sender: TObject);
begin

  label2.Caption:=listbox2.Items[listbox2.itemindex];
  label2.Visible := true;
  edit2.Text:='';
  edit2.Visible:=false;
  bitbtn7.Visible:=false;
  bitbtn8.Enabled:=false;


  ComboBox1.Visible := false;

  GroupBox1.Visible := false;
  GroupBox3.Visible := false;
  case listbox2.ItemIndex of
      0,3,9:
          begin
           edit2.Visible := true;
           BitBtn7.Visible :=true;
          end;
      1,2,4:
          begin
           edit2.Visible := true;
          end;
      5:
          begin
            label2.Visible := false;
            ComboBox1.Visible := true;
            combobox1.Items.Clear;
            combobox1.Items.Add('内层');
            combobox1.Items.Add('外层');
            combobox1.ItemIndex:=1;
            bitbtn8.Enabled:=true;
          end;
      6:
          begin
            label2.Visible := false;
            ComboBox1.Visible := true;
            combobox1.Items.Clear;
            combobox1.Items.Add('量产');
            combobox1.Items.Add('样板');
            combobox1.ItemIndex:=0;
            bitbtn8.Enabled :=true;
          end;
      7:
          begin
            label2.Visible := false;
            GroupBox1.Visible := true;
            MyCheckBox_Click1(sender);
          end;
      8:
          begin
            label2.Visible := false;
            GroupBox3.Visible := true;
            MyCheckBox_Click2(sender);
          end;
      10:
          begin
            label2.Visible := false;
            ComboBox1.Visible := true;
            combobox1.Items.Clear;
            combobox1.Items.Add('新单');
            combobox1.Items.Add('返单');
            combobox1.Items.Add('样板转生产');
            combobox1.Items.Add('返单有改');
            combobox1.ItemIndex:=0;
            bitbtn8.Enabled :=true;
          end;
      11:
          begin
            label2.Visible := false;
            ComboBox1.Visible := true;
            combobox1.Items.Clear;
            combobox1.Items.Add('自制');
            combobox1.Items.Add('外发');
            combobox1.Items.Add('半制程');
            combobox1.ItemIndex:=0;
            bitbtn8.Enabled :=true;
          end;
    end;
end;

procedure TIf_Form1.FormShow(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';

  SELF.ListBox2.ItemIndex := 0;
  self.ListBox2Click(SELF.ListBox2);
end;


procedure TIf_Form1.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
//  tmpstr:string;
begin
  case listbox2.ItemIndex of
    9: //Edit2.Text:=Pick_Value(Edit2.Text, dm.ADOConnection1, 2,1);
    begin
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
      try
        InputVar.AdoConn := DM.ADOConnection1 ;
        InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称/277,ABBR_NAME/工厂简称/100,active_flag/是否有效/60';
        InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME,active_flag from data0015';
        frmPick_Item_Single.InitForm_New(InputVar)  ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
          edit2.Text:=frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
        end;
      finally
        frmPick_Item_Single.adsPick.Close;
        frmPick_Item_Single.Free ;
      end;
    end;
      0,3:
         begin
              frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
              try
                  if listbox2.ItemIndex=0 then
                      begin
                          InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/400';
                          InputVar.Sqlstr := 'select RKEY,MANU_PART_NUMBER from data0025';
                      end
                  else if listbox2.ItemIndex=3 then
                      begin
                          InputVar.Fields := 'cust_code/客户代码/300,abbr_name/客户简称/300';
                          InputVar.Sqlstr := 'select cust_code,abbr_name from data0010';
                      end;
                  InputVar.AdoConn := DM.ADOConnection1 ;
                  frmPick_Item_Single.InitForm_New(InputVar)  ;
                  if frmPick_Item_Single.ShowModal=mrok then
                       begin
                            if listbox2.ItemIndex = 0 then
                                edit2.Text := frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']
                            else if listbox2.ItemIndex = 3 then
                                edit2.Text := frmPick_Item_Single.adsPick.FieldValues['cust_code']
                            else
                                begin
                                end;

                            if edit2.Text <>'' then
                                BitBtn8.Enabled := true ;
                       end;
              finally
                  frmPick_Item_Single.adsPick.Close;
                  frmPick_Item_Single.Free ;
              end;
         end;

      end;
end;

procedure TIf_Form1.FormCreate(Sender: TObject);
begin
  self.BorderIcons := self.BorderIcons - [biMinimize] - [biMaximize];
  self.BorderStyle  := bsSingle;
  self.Position := poScreenCenter;
end;

procedure TIf_Form1.MyCheckBox_Click2(sender:tobject);
begin
  if (CheckBox6.Checked) or (CheckBox7.Checked)
  or (CheckBox8.Checked) or (CheckBox9.Checked)
  then
      BitBtn8.Enabled := true
  else
      BitBtn8.Enabled := false ;
end;

procedure TIf_Form1.MyCheckBox_Click1(sender:tobject);
begin
  if (CheckBox1.Checked) or (CheckBox2.Checked)
  or (CheckBox3.Checked) or (CheckBox4.Checked)
  or (CheckBox5.Checked) then
   BitBtn8.Enabled := true
  else
   BitBtn8.Enabled := false ;
end;

procedure TIf_Form1.Edit2Change(Sender: TObject);
begin
  bitbtn8.Enabled:=trim(edit2.Text)<>'' ;
end;





end.









