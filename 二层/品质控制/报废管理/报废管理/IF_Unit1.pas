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
    Label7: TLabel;
    dtpk4: TDateTimePicker;
    BitBtn7: TBitBtn;
    Edit2: TEdit;
    dtpk3: TDateTimePicker;
    Label2: TLabel;
    Label6: TLabel;
    BitBtn8: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn8Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private

    Fac:array[0..5] of integer;
    FacNm:array[0..5] of string;
    vparametersvalue1:string;
    vparametersvalue2:string;
    vparametersvalue3:string;
    vparametersvalue4:string;
    vparametersvalue5:string;
    vparametersvalue6:string;
    vparametersvalue7:string;
    procedure update2_sgrid(sgrid_row:integer);
    procedure update_sgrid();
    function Get_parametersvalue1: string;
    function Get_parametersvalue2: string;
    function Get_parametersvalue3: string;
    function Get_parametersvalue4: string;
    function Get_parametersvalue5: string;
    function Get_parametersvalue6: string;
    function Get_parametersvalue7: string;

  public
    property parametersvalue1:string read Get_parametersvalue1;
    property parametersvalue2:string read Get_parametersvalue2;
    property parametersvalue3:string read Get_parametersvalue3;
    property parametersvalue4:string read Get_parametersvalue4;
    property parametersvalue5:string read Get_parametersvalue5;
    property parametersvalue6:string read Get_parametersvalue6;
    property parametersvalue7:string read Get_parametersvalue7;
  end;

var
  If_Form1: TIf_Form1;

implementation

uses
   DM_u ,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TIf_Form1.BitBtn5Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do sgrid1.Rows[i].Clear;
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

procedure TIf_Form1.BitBtn6Click(Sender: TObject);
begin
  modalresult:=mrCancel	;
end;

procedure TIf_Form1.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 //只允许删除倒数第一行之前的行
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
begin
 case listbox2.ItemIndex of
     0:begin
          sgrid1.Cells[1,sgrid_row] := edit2.Text;
          sgrid1.Cells[2,sgrid_row] := 'and Data0025.MANU_PART_NUMBER  LIKE ''' + trim(edit2.Text) + '%''' ;

       end;
     1:begin
          sgrid1.Cells[1,sgrid_row] := edit2.Text;
          sgrid1.Cells[2,sgrid_row] := ' and  Data0025.MANU_PART_DESC LIKE ''%' + trim(edit2.Text) + '%''';
       end;
     2:begin
          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
          sgrid1.Cells[2,sgrid_row]:=' and data0006.WORK_ORDER_NUMBER LIKE '''+ trim(edit2.Text)+'%''';
       end;

     3:begin
          if CheckBox1.Checked then
          begin
              sgrid1.Cells[1,sgrid_row] := '已审';
              sgrid1.Cells[2,sgrid_row] := ' and data0058.QTY_REJECT > 0';
          end else begin
              sgrid1.Cells[1,sgrid_row] := '未审';
              sgrid1.Cells[2,sgrid_row] := ' and data0058.QTY_REJECT <= 0';
          end ;
       end;
     4:begin   //报废代码
         sgrid1.Cells[1,sgrid_row] := edit2.Text;
         sgrid1.Cells[2,sgrid_row] := ' and Data0039.REJ_CODE LIKE ''' + trim(edit2.Text) + '%''';
       end;
     5:begin   //申请工序代码
         sgrid1.Cells[1,sgrid_row] := edit2.Text;
         sgrid1.Cells[2,sgrid_row] := ' and Data0034.DEPT_CODE LIKE ''' + trim(edit2.Text) + '%''';
       end;
     6:begin   //责任工序代码
         sgrid1.Cells[1,sgrid_row] := edit2.Text;
         sgrid1.Cells[2,sgrid_row] := ' and b.DEPT_CODE LIKE ''' + trim(edit2.Text) + '%''';
       end;
     7:begin   //申请人
         sgrid1.Cells[1,sgrid_row] := edit2.Text;
         sgrid1.Cells[2,sgrid_row] := ' and Data0005_2.EMPLOYEE_NAME LIKE ''' + trim(edit2.Text) + '%''';
       end;
     8:begin   //缺陷类别
         sgrid1.Cells[1,sgrid_row] := combobox1.Text;
         sgrid1.Cells[2,sgrid_row] := ' and data0039.REJ_TYPE = '+inttostr(combobox1.ItemIndex);
         
       end;
     9:begin   //工厂
         sgrid1.Cells[1,sgrid_row] := combobox1.Text;
         sgrid1.Cells[2,sgrid_row] := ' and data0058.warehouse_ptr = '+inttostr(Fac[combobox1.ItemIndex]);
         
       end;
     end;

end;

procedure TIf_Form1.BitBtn8Click(Sender: TObject);
begin
  update_sgrid; //新增内容
end;

procedure TIf_Form1.update_sgrid;
var
  i:integer;
begin
  //检查是不是已有加在sgrid1中的内容，没有就增加
  for i:=1 to sgrid1.RowCount-2 do
   if (sgrid1.Cells[0,i]=listbox2.Items[listbox2.ItemIndex]) and
      (sgrid1.Cells[1,i]<>listbox2.Items[listbox2.ItemIndex]) then
   begin
     update2_sgrid(i);
     exit;
   end;
  //更新0列记录
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox2.Items[listbox2.itemindex];
  update2_sgrid(sgrid1.RowCount-1);
  //增加一行空的记录
  sgrid1.RowCount :=sgrid1.RowCount +1;
end;

procedure TIf_Form1.ListBox2Click(Sender: TObject);
var i:integer;
begin
  label2.Visible := false;
  label2.Caption:=' '+listbox2.Items[listbox2.itemindex]+':  ';
  label6.Visible:=false;
  label7.Visible:=false;
  dtpk3.Visible:=false;
  dtpk4.Visible:=false;
  edit2.Text:='';
  edit2.Visible:=false;
  bitbtn7.Visible:=false;
  bitbtn8.Enabled:=false;
  edit1.Visible :=false;
  Label1.Visible :=false;
  CheckBox1.Visible := false;
  ComboBox1.Visible:=false;
  case listbox2.ItemIndex of
      0,1,2:
          begin
            label2.Visible := true;
            edit2.Visible := true;
            BitBtn7.Visible :=true;
          end;
      3:
          begin
            CheckBox1.Visible := true;
            BitBtn8.Enabled :=true;
          end;
      4,5,6,7:
          begin
            label2.Visible := true;
            edit2.Visible := true;
            BitBtn7.Visible :=true;
          end;
      8:begin
         ComboBox1.Visible:=true;
         BitBtn8.Enabled:=true;
         combobox1.Items.Clear;
         combobox1.Items.Add('工厂报废');
         combobox1.Items.Add('供应商报废');
         combobox1.Items.Add('客户报废');
         combobox1.Items.Add('市场报废');
         combobox1.Items.Add('其它');
         combobox1.ItemIndex:=0;
        end;
      9:begin
         ComboBox1.Visible:=true;
         BitBtn8.Enabled:=true;
         combobox1.Items.Clear;
         for i:=0 to 5 do
         begin
           if FacNm[i]<>'' then
            combobox1.Items.Add(FacNm[i])
           else
            break;
         end;
         if i>0 then
         combobox1.ItemIndex:=0;
        end;
    end;
end;

procedure TIf_Form1.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  bitbtn8.Enabled:=trim(edit2.Text)<>'' ;
end;

procedure TIf_Form1.FormShow(Sender: TObject);
var i:integer;
begin
  sgrid1.Cells[0,0] := '条件名';
  sgrid1.Cells[1,0] := '条件值';
  vparametersvalue1 := '';
  vparametersvalue2 := '';
  vparametersvalue3 := '';
  vparametersvalue4 := '';
  vparametersvalue5 := '';
  vparametersvalue6 := '';
  vparametersvalue7 := '';

  SELF.ListBox2.ItemIndex := 0;
  self.ListBox2Click(SELF.ListBox2);

  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='select rkey,abbr_name from data0015 order by 1';
  DM.Tmp.Open;
  i:=0;
  while not DM.Tmp.Eof do
  begin
    Fac[i]:=DM.Tmp.fields[0].AsInteger;
    FacNm[i]:=DM.Tmp.fields[1].AsString;
    inc(i);
    DM.Tmp.Next;
  end;
end;

function TIf_Form1.Get_parametersvalue1: string;
begin
  result:=vparametersvalue1;
end;

function TIf_Form1.Get_parametersvalue2: string;
begin
  result:=vparametersvalue2;
end;

function TIf_Form1.Get_parametersvalue3: string;
begin
  result:=vparametersvalue3;
end;

function TIf_Form1.Get_parametersvalue4: string;
begin
  result:=vparametersvalue4;
end;

function TIf_Form1.Get_parametersvalue5: string;
begin
  result:=vparametersvalue5;
end;

function TIf_Form1.Get_parametersvalue6: string;
begin
  result:=vparametersvalue6;
end;

function TIf_Form1.Get_parametersvalue7: string;
begin
  result:=vparametersvalue7;
end;

procedure TIf_Form1.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  case listbox2.ItemIndex of
   0,1,2,3,4,5,6,7:
   begin
        frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
        try
            if listbox2.ItemIndex = 0 then
            begin
              InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/400';
              InputVar.Sqlstr := 'select RKEY,MANU_PART_NUMBER from data0025 where PARENT_PTR = 0 or PARENT_PTR is null';
            end
            else if listbox2.ItemIndex = 1 then
            begin
              InputVar.Fields := 'MANU_PART_DESC/客户型号/400';
              InputVar.Sqlstr := 'select RKEY,MANU_PART_DESC from data0025 where (PARENT_PTR = 0 or PARENT_PTR is null) and MANU_PART_DESC <> ''''';
            end
            else if listbox2.ItemIndex = 2 then
            begin
              InputVar.Fields := 'WORK_ORDER_NUMBER/作业单号/400';
              InputVar.Sqlstr := 'select DISTINCT rkey,WORK_ORDER_NUMBER from data0006';
            end
            else if listbox2.ItemIndex = 4 then
            begin
              InputVar.Fields := 'REJ_CODE/报废代码/400,REJECT_DESCRIPTION/报废描述/400';
              InputVar.Sqlstr := 'select REJ_CODE,REJECT_DESCRIPTION,case rej_type when 0 then ''工厂报废''  when 1 then ''供应商报废'' when 2 then ''客户报废'' when 3 then ''市场报废'' end as MYrej_type from data0039';
            end
            else if listbox2.ItemIndex = 5 then
            begin
              InputVar.Fields := 'DEPT_CODE/工序代码/400,DEPT_NAME/工序名称/400';
              InputVar.Sqlstr := 'select DEPT_CODE,DEPT_NAME from data0034';
            end
            else if listbox2.ItemIndex = 6 then
            begin
              InputVar.Fields := 'DEPT_CODE/工序代码/400,DEPT_NAME/工序名称/400';
              InputVar.Sqlstr := 'select DEPT_CODE,DEPT_NAME from data0034';
            end
            else if listbox2.ItemIndex = 7 then
            begin
              InputVar.Fields := 'EMPL_CODE/雇员代码/400,EMPLOYEE_NAME/雇员代码/400';
              InputVar.Sqlstr := 'select EMPL_CODE,EMPLOYEE_NAME from data0005';
            end;
            InputVar.AdoConn := DM.ADOCon;
            frmPick_Item_Single.InitForm_New(InputVar)  ;
            if frmPick_Item_Single.ShowModal=mrok then
            begin
                if listbox2.ItemIndex = 0 then
                     edit2.Text := frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']
                else if listbox2.ItemIndex = 1 then
                     edit2.Text := frmPick_Item_Single.adsPick.FieldValues['MANU_PART_DESC']
                else if listbox2.ItemIndex = 2 then
                     edit2.Text := frmPick_Item_Single.adsPick.FieldValues['WORK_ORDER_NUMBER']
                else if listbox2.ItemIndex = 4 then
                     edit2.Text := frmPick_Item_Single.adsPick.FieldValues['REJ_CODE']
                else if listbox2.ItemIndex = 5 then
                     edit2.Text := frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE']
                else if listbox2.ItemIndex = 6 then
                     edit2.Text := frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE']
                else if listbox2.ItemIndex = 7 then
                     edit2.Text := frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME'] ;
               BitBtn8.Enabled := true ;
            end;
        finally
            frmPick_Item_Single.adsPick.Close;
            frmPick_Item_Single.Free ;
        end;
   end;

  end;
end;

end.
