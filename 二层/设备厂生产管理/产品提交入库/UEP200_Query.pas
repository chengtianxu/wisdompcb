unit UEP200_Query;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, Buttons, Grids,dateutils, ExtCtrls;

type
  TQuery_Form = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    BitBtn7: TBitBtn;
    edtValue: TComboBox;
    Button1: TButton;
    Button2: TButton;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup3: TRadioGroup;
    procedure Button3Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
    procedure update_sgrid;
    procedure update2_sgrid(sgrid_row: integer);
  protected
    procedure WndProc(var Message: TMessage); override;

  public
    { Public declarations }
  end;

var
  Query_Form: TQuery_Form;

implementation

{$R *.dfm}


procedure TQuery_Form.Button3Click(Sender: TObject);
begin
  update_sgrid;
end;

procedure TQuery_Form.update_sgrid;
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

procedure TQuery_Form.update2_sgrid(sgrid_row: integer);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
 case listbox3.ItemIndex of
 0:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0492.CUT_NO = '''+edtValue.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and data0492.CUT_NO > '''+edtValue.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and data0492.CUT_NO <> '''+edtValue.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and data0492.CUT_NO like ''%'+edtValue.Text+'%''';
  end;

 1:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and Data0008.PROD_CODE = '''+edtValue.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and Data0008.PROD_CODE > '''+edtValue.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and Data0008.PROD_CODE <> '''+edtValue.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and Data0008.PROD_CODE like ''%'+edtValue.Text+'%''';
  end;

 2:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and Data0008.PRODUCT_NAME = '''+edtValue.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and Data0008.PRODUCT_NAME > '''+edtValue.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and Data0008.PRODUCT_NAME <> '''+edtValue.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and Data0008.PRODUCT_NAME like ''%'+edtValue.Text+'%''';
  end;

 3:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0492.ISSUED_QTY = '''+edtValue.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and data0492.ISSUED_QTY > '''+edtValue.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and data0492.ISSUED_QTY <> '''+edtValue.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and data0492.ISSUED_QTY ''%'+edtValue.Text+'%''';
  end;

 4:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0492.FG_QTY = '''+edtValue.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and data0492.FG_QTY > '''+edtValue.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and data0492.FG_QTY <> '''+edtValue.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and data0492.FG_QTY like ''%'+edtValue.Text+'%''';
  end;

 5:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0492.WIP_QTY = '''+edtValue.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and data0492.WIP_QTY > '''+edtValue.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and data0492.WIP_QTY <> '''+edtValue.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and data0492.WIP_QTY like ''%'+edtValue.Text+'%''';
  end;

 6:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0492.ORD_REQ_QTY = '''+edtValue.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and data0492.ORD_REQ_QTY > '''+edtValue.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and data0492.ORD_REQ_QTY <> '''+edtValue.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and data0492.ORD_REQ_QTY like ''%'+edtValue.Text+'%''';
  end;

 7:
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0492.SO_NO = '''+edtValue.Text+'''';
  1:sgrid1.Cells[2,sgrid_row]:='and data0492.SO_NO > '''+edtValue.Text+'''';
  2:sgrid1.Cells[2,sgrid_row]:='and data0492.SO_NO <> '''+edtValue.Text+'''';
  3:sgrid1.Cells[2,sgrid_row]:='and data0492.SO_NO like ''%'+edtValue.Text+'%''';
  end;
end;
end;
procedure TQuery_Form.edtValueChange(Sender: TObject);
begin
Button3.Enabled:=edtValue.Text<>'';
end;

procedure TQuery_Form.ListBox3Click(Sender: TObject);
begin
  label8.Caption:=' '+listbox3.Items[listbox3.itemindex]+':  ';
  edtValue.Text:='';
  edtValue.Visible := true;
  bitbtn7.Visible:=false;
end;

procedure TQuery_Form.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if (sgrid1.RowCount <= 2) or (sgrid1.Row=sgrid1.RowCount-1) then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TQuery_Form.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TQuery_Form.Button1Click(Sender: TObject);
begin
// modalresult:=mrok;
end;

procedure TQuery_Form.Button2Click(Sender: TObject);
begin
 // modalresult:=mrCancel;
end;

procedure TQuery_Form.FormActivate(Sender: TObject);
var i: integer;
begin
  v_Field_List_CN := VarArrayOf(['生产单号','产品代码','产品名称','投产数量','完工数量','在线数量','待入库数量','销售订单']);
  v_Field_List_EN := VarArrayOf(['data0492.CUT_NO','Data0008.PROD_CODE','Data0008.PRODUCT_NAME','data0492.ISSUED_QTY','data0492.FG_QTY','data0492.WIP_QTY','data0492.ORD_REQ_QTY','data0492.SO_NO']);
  listbox3.Items.Clear;
  edtValue.Text := '';
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
      listbox3.Items.Add(v_Field_List_CN[i]);
      sgrid1.Cells[0,0]:='条件名';
      sgrid1.Cells[1,0]:='条件值';
      ListBox3.ItemIndex := 0;
end;

procedure TQuery_Form.WndProc(var Message: TMessage);
begin
  if Message.Msg = messages.WM_SYSCOMMAND  then
  begin
    if (Message.WParam = windows.SC_MAXIMIZE) then
    begin
      with Self do
      begin
        Top := 0;
        Left:= 0;
        Width := Screen.Width;
        Height := Screen.Height;
      end;
    end;
  end;
  inherited WndProc(Message);
end;

end.
