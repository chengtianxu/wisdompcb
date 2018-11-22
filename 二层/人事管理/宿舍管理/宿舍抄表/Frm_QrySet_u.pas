unit Frm_QrySet_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus,Pick_Item_Single,
  DB, ADODB;

type
  TFrm_QrySet = class(TForm)
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    BitBtn7: TBitBtn;
    edtValue: TComboBox;
    RadioGroup3: TRadioGroup;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    rg1: TRadioGroup;
    RadioGroup1: TRadioGroup;
    Label3: TLabel;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    v_Field_List_CN,v_Field_List_EN:Variant;
    frmPick_Item : TfrmPick_Item_Single;
      procedure update_sgrid;
      procedure update2_sgrid(sgrid_row: integer);
  public
    { Public declarations }
  end;

var Frm_QrySet:TFrm_QrySet;
implementation

uses common,DM_u,ConstVar;
{$R *.dfm}

procedure TFrm_QrySet.Button3Click(Sender: TObject);
var
 i:integer;
begin
 update_sgrid;
end;


procedure TFrm_QrySet.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Text:='';
  edtValue.Visible := True;
   Self.bitbtn7.Visible:=True;
  Self.RadioGroup1.Visible := False;
  Self.RadioGroup3.Visible := True;
  Self.rg1.Visible := False;
  Self.DateTimePicker3.Visible := False;
  Self.DateTimePicker4.Visible := False;
  Self.Label3.Visible := False;
  Button3.Enabled := False;
  if ListBox3.ItemIndex = 1 then
  begin
      Self.bitbtn7.Visible:=False;
  end;
  if ListBox3.ItemIndex = 2 then
  begin
      Self.edtValue.Visible := False;
      Self.bitbtn7.Visible:=False;
      Self.RadioGroup3.Visible := False;
      Self.RadioGroup1.Visible := False;
      Self.rg1.Visible := True;
      Self.DateTimePicker3.Visible := False;
      Self.DateTimePicker4.Visible := False;
  end;
   if ListBox3.ItemIndex = 3 then
  begin
      Self.edtValue.Visible := False;
      Self.bitbtn7.Visible:=False;
      Self.RadioGroup3.Visible := False;
      Self.RadioGroup1.Visible := False;
      Self.rg1.Visible := False;
      Self.DateTimePicker3.Visible := True;
      Self.DateTimePicker4.Visible := True;
      Self.Label3.Visible := True;
      Button3.Enabled := True;
  end;
  if ListBox3.ItemIndex = 4 then
  begin
      Self.edtValue.Visible := False;
      Self.bitbtn7.Visible:=False;
      Self.RadioGroup3.Visible := False;
      Self.RadioGroup1.Visible := True;
      Self.rg1.Visible := False;
      Self.DateTimePicker3.Visible := False;
      Self.DateTimePicker4.Visible := False;
      Self.Label3.Visible := False;
  end;
end;

procedure TFrm_QrySet.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if (sgrid1.RowCount <= 2) or (sgrid1.Row=sgrid1.RowCount-1) then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrm_QrySet.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TFrm_QrySet.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['宿舍编号','抄表数','抄表类型', '录入时间', '是否复核']);
  v_Field_List_EN := VarArrayOf(['roomid','record_number','type', 'oper_time','ischecked']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date-30; DateTimePicker2.Date:=date;
  DateTimePicker3.Date:=date-30; DateTimePicker4.Date:=date;
end;

procedure TFrm_QrySet.edtValueChange(Sender: TObject);
begin
  Button3.Enabled := edtValue.Text<>'' ;
end;

procedure TFrm_QrySet.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin

    frmPick_Item := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'R_code/宿舍编号/110,bedcount/床位数量/120,'+
                        'floor/所在楼层/120,type/类型/80';
    InputVar.Sqlstr :=
    'SELECT     rkey, R_code, bedcount, CONVERT(char(2), floor+1) + '''+'楼'+''' AS floor, '+#13+
    ' CASE type WHEN 1 THEN '''+'男宿舍'+''' WHEN 2 THEN '''+'女宿舍'+''' WHEN 3 THEN '''+'夫妻房'+''' END AS type '+#13+
    ' FROM         dbo.Bedroommsg'+#13;
    try
        inputvar.KeyField :='R_code';
        InputVar.AdoConn := dm.ADOCon;
        frmPick_Item.InitForm_New(InputVar);
        if frmPick_Item.ShowModal=mrok then
        begin
            edtValue.Text := trim(frmPick_Item.adsPick.FieldValues['R_code']);
            edtValue.Hint := trim(frmPick_Item.adsPick.FieldValues['rkey']);
            Self.edtValueChange(nil);
        end;
    finally
        frmPick_Item.adsPick.Close;
        frmPick_Item.Free ;
    end;
end;

procedure TFrm_QrySet.update_sgrid;
var
  i:integer;
begin
  //检查是不是已有加在sgrid1中的内容，没有就增加
  for i:=1 to sgrid1.RowCount-2 do
     if (sgrid1.Cells[0,i]=listbox3.Items[listbox3.ItemIndex]) and
        (sgrid1.Cells[1,i]<>listbox3.Items[listbox3.ItemIndex]) then
         begin
             update2_sgrid(i);
             exit;
         end;
  //更新0列记录
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  update2_sgrid(sgrid1.RowCount-1);
  //增加一行空的记录
  sgrid1.RowCount :=sgrid1.RowCount +1;
end;

procedure  TFrm_QrySet.update2_sgrid(sgrid_row: integer);
begin
    sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
    case listbox3.ItemIndex of
         0:
          begin
                sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
                case radiogroup3.ItemIndex of
                      0:sgrid1.Cells[2,sgrid_row]:='and Bedroommsg.R_code = '''+edtValue.Text+'''';
                      1:sgrid1.Cells[2,sgrid_row]:='and Bedroommsg.R_code < '''+edtValue.Text+'''';
                      2:sgrid1.Cells[2,sgrid_row]:='and Bedroommsg.R_code > '''+edtValue.Text+'''';
                      3:sgrid1.Cells[2,sgrid_row]:='and Bedroommsg.R_code like ''%'+edtValue.Text+'%''';
                end;
           end;
         1:
          begin
                 sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
                case radiogroup3.ItemIndex of
                      0:sgrid1.Cells[2,sgrid_row]:='and Bedroom_equipment_record.record_number = '''+edtValue.Text+'''';
                      1:sgrid1.Cells[2,sgrid_row]:='and Bedroom_equipment_record.record_number < '''+edtValue.Text+'''';
                      2:sgrid1.Cells[2,sgrid_row]:='and Bedroom_equipment_record.record_number > '''+edtValue.Text+'''';
                      3:sgrid1.Cells[2,sgrid_row]:='and Bedroom_equipment_record.record_number like ''%'+edtValue.Text+'%''';
                end;
          end;
          2:
          begin
                 sgrid1.Cells[1,sgrid_row] := rg1.Items[rg1.ItemIndex];
                 sgrid1.Cells[2,sgrid_row] := 'and Bedroom_equipment_record.type = '''+inttostr(rg1.ItemIndex)+'''';
          end;
          3:
          begin
                    sgrid1.Cells[1,sgrid_row]:='从 '+datetostr(DateTimePicker3.Date)+' 到 '+datetostr(DateTimePicker4.Date);
                    sgrid1.Cells[2,sgrid_row]:= 'and Bedroom_equipment_record.oper_time >= '''+datetostr(DateTimePicker3.Date)+''' and Bedroom_equipment_record.oper_time <= '''+datetostr(DateTimePicker4.Date)+'''';
          end;
          4:
          begin
               sgrid1.Cells[1,sgrid_row]:=RadioGroup1.Items[RadioGroup1.ItemIndex];
               sgrid1.Cells[2,sgrid_row]:='and Bedroom_equipment_record.ischecked = '''+inttostr(RadioGroup1.ItemIndex)+'''';
          end;
    end;  //end case   }
end;

procedure TFrm_QrySet.FormShow(Sender: TObject);
begin
   Self.ListBox3Click(nil);
end;

procedure TFrm_QrySet.RadioGroup1Click(Sender: TObject);
begin
   Button3.Enabled:=RadioGroup1.ItemIndex<>-1;
end;

procedure TFrm_QrySet.rg1Click(Sender: TObject);
begin
      Button3.Enabled:=rg1.ItemIndex<>-1;
end;

procedure TFrm_QrySet.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

end.
