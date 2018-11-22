unit IF_Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Grids,DateUtils, ExtCtrls, Menus
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
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup3: TRadioGroup;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn8Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
    procedure update2_sgrid(sgrid_row:integer);
    procedure update_sgrid();
  public
    { Public declarations }
  end;

var
  If_Form1: TIf_Form1;

implementation


uses
   DataModuleUnit, Pick_Item_Single, ConstVar;

{$R *.dfm}

procedure TIf_Form1.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['标准名称','工厂代码','工厂名称','标准产出']);
  v_Field_List_EN := VarArrayOf(['dbo.DATA0136.control_name','dbo.Data0015.WAREHOUSE_CODE','dbo.Data0015.WAREHOUSE_NAME' ,'dbo.DATA0136.stan_consume']);

  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox2.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox2.ItemIndex := 0;
end;

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

procedure TIf_Form1.BitBtn6Click(Sender: TObject);
begin
  modalresult:=mrCancel	;
end;

procedure TIf_Form1.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 //只允许删除倒数第一行之前的行
 if sgrid1.Row=sgrid1.RowCount-1 then
     bitbtn4.Enabled:=false
 else
     bitbtn4.Enabled:=true;
end;

procedure TIf_Form1.update2_sgrid(sgrid_row: integer);
begin
  case listbox2.ItemIndex of
     0:begin //工厂代码
         sgrid1.Cells[1,sgrid_row]:=edit2.Text;
         sgrid1.Cells[2,sgrid_row]:='and dbo.DATA0136.control_name LIKE '''+trim(edit2.Text)+'%''' ;
       end;
     1:begin //工厂代码
         sgrid1.Cells[1,sgrid_row]:=edit2.Text;
         sgrid1.Cells[2,sgrid_row]:='and Data0015.WAREHOUSE_CODE LIKE '''+trim(edit2.Text)+'%''' ;
       end;
     2:begin //工厂名称
         sgrid1.Cells[1,sgrid_row]:=edit2.Text;
         sgrid1.Cells[2,sgrid_row]:='and Data0015.WAREHOUSE_NAME LIKE '''+trim(edit2.Text)+'%''' ;
       end;
     3:
     begin
                sgrid1.Cells[1,sgrid_row]:=trim(Edit2.Text);
                case radiogroup3.ItemIndex of
                    0:sgrid1.Cells[2,sgrid_row]:='and DATA0136.stan_consume = '''+Edit2.Text+'''';
                    1:sgrid1.Cells[2,sgrid_row]:='and DATA0136.stan_consume > '''+Edit2.Text+'''';
                    2:sgrid1.Cells[2,sgrid_row]:='and DATA0136.stan_consume < '''+Edit2.Text+'''';
                    3:sgrid1.Cells[2,sgrid_row]:='and DATA0136.stan_consume like ''%'+Edit2.Text+'%''';
                end;
     end;

    { 1:begin  //工序代码
         sgrid1.Cells[1,sgrid_row]:=edit2.Text;
         sgrid1.Cells[2,sgrid_row]:='and Data0034.DEPT_CODE LIKE ''%'+trim(edit2.Text)+'%''';
       end;
     2:begin  //材料编码
         sgrid1.Cells[1,sgrid_row]:=edit2.Text;
         sgrid1.Cells[2,sgrid_row]:='and Data0017.INV_PART_NUMBER LIKE ''%'+trim(edit2.Text)+'%''';
       end;
     3:begin  //材料组别号
         sgrid1.Cells[1,sgrid_row]:=edit2.Text;
         sgrid1.Cells[2,sgrid_row]:='and DATA0136.group_id LIKE ''%'+trim(edit2.Text)+'%''';
       end; }
  end;

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

procedure TIf_Form1.BitBtn8Click(Sender: TObject);
begin
  update_sgrid; //新增内容
end;

procedure TIf_Form1.ListBox2Click(Sender: TObject);
begin
  label2.Visible := false;
  label2.Caption:=' '+listbox2.Items[listbox2.itemindex]+':  ';

  edit2.Text:='';
  edit2.Visible:=false;
  edit2.ReadOnly:=false;
  bitbtn7.Visible:=false;
  bitbtn8.Enabled:=false;
  RadioGroup3.Visible := False;
  case listbox2.ItemIndex of
    0:
    begin
      label2.Visible := true;
      edit2.Visible := true;
      BitBtn7.Visible :=False;
    end;
    1,2:
    begin
      label2.Visible := true;
      edit2.Visible := true;
      BitBtn7.Visible :=True;
    end;
    3:
    begin
      label2.Visible := true;
      edit2.Visible := true;
      RadioGroup3.Visible := True;
    end;
  end;
end;

procedure TIf_Form1.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edit2.Text)<>'' then
    bitbtn8.Enabled:=true
  else
    bitbtn8.Enabled:=false;
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
begin
  case listbox2.ItemIndex of
    1,2: //工厂
    begin
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
      try
        InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/60,WAREHOUSE_NAME/工厂名称/250,abbr_name/工厂简称/100';
        InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,abbr_name from data0015 '+
                           'order by WAREHOUSE_CODE';
        Inputvar.KeyField:='WAREHOUSE_CODE';
        Inputvar.InPut_value:=edit2.Text;

        InputVar.AdoConn := DM.ADOConnection1 ;
        FrmPick_Item_Single.InitForm_New(InputVar)  ;
        if FrmPick_Item_Single.ShowModal=mrok then
          begin
            Edit2.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
            Edit2.Hint := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_NAME'];
            BitBtn8.Enabled := true ;
            bitbtn8.SetFocus;
          end
        else
          edit2.SetFocus;
      finally
        frmPick_Item_Single.adsPick.Close;
        frmPick_Item_Single.Free ;
      end;
    end;
  end;
end;

procedure TIf_Form1.N1Click(Sender: TObject);
var
 i:byte;
begin
  if (sgrid1.RowCount <= 2) or (sgrid1.Row=sgrid1.RowCount-1) then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TIf_Form1.Edit2Change(Sender: TObject);
begin
  BitBtn8.Enabled:=Edit2.Text<>'';
end;

end.
