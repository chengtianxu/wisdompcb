unit BomBaoJiaQueryFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, Menus, ExtCtrls;

type
  TfrmBomBaoJiaQuery = class(TForm)
    GroupBox6: TGroupBox;
    Label8: TLabel;
    btnadd: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    edt1: TEdit;
    StaticText2: TStaticText;
    sg1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    procedure ListBox3Click(Sender: TObject);
    procedure btnaddClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure sg1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetWhereStr: string;
  end;

implementation

uses
  Pick_Item_Single, DM;

{$R *.dfm}


procedure TfrmBomBaoJiaQuery.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := ListBox3.Items[ListBox3.itemindex];
  edt1.Text := '';
end;

procedure TfrmBomBaoJiaQuery.btnaddClick(Sender: TObject);
var
  I: Integer;
  bHas: Boolean;
begin
  if edt1.Text = '' then Exit;
  bHas := False;
  for I := 0 to sg1.RowCount - 1 do
  begin
    if sg1.Cells[0,I] = ListBox3.Items[ListBox3.itemindex] then
    begin
      bHas := True;
      Break;
    end;
  end;
  if not bHas then
  begin
    sg1.RowCount := sg1.RowCount + 1;
    I := sg1.RowCount;
  end;

  sg1.Cells[0, I-1] := ListBox3.Items[ListBox3.itemindex];
  sg1.Cells[1, I-1] := edt1.Text;
  case ListBox3.itemindex of
    0:
      sg1.Cells[2, I-1] := 'and d25.manu_part_number LIKE ''%' +
        edt1.Text + '%''';
    1:
      sg1.Cells[2, I-1] :=
        'and d25.manu_part_desc LIKE ''%' + edt1.Text + '%''';
    2:
      sg1.Cells[2, I-1] :=
        'and d10.cust_code like ''%' + edt1.Text + '%''';
  end;

end;

procedure TfrmBomBaoJiaQuery.Button1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmBomBaoJiaQuery.PopupMenu1Popup(Sender: TObject);
begin
  if sg1.Row = sg1.RowCount - 1 then
    N1.Enabled := false
  else
    N1.Enabled := true;
end;

procedure TfrmBomBaoJiaQuery.sg1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  column, Row: longint; // 右键选择stringgrid控件的方法
begin
  if Button = mbright then
  begin
    sg1.MouseToCell(X, Y, column, Row);
    if Row <> 0 then
      sg1.Row := Row;
  end;
end;

procedure TfrmBomBaoJiaQuery.N1Click(Sender: TObject);
var
  i: byte;
begin
  for i := sg1.Row to sg1.RowCount - 2 do
    sg1.Rows[i].Text := sg1.Rows[i + 1].Text;
  sg1.RowCount := sg1.RowCount - 1;
end;

procedure TfrmBomBaoJiaQuery.FormActivate(Sender: TObject);
begin
  sg1.Cells[0, 0] := '条件名';
  sg1.Cells[1, 0] := '条件值';
  ListBox3.Selected[0] := true;
  self.ListBox3.OnClick(Sender);
end;

function TfrmBomBaoJiaQuery.GetWhereStr: string;
var
  I: Integer;
begin
  for I := 1 to sg1.RowCount - 1 do
  begin
    Result := Result + sg1.Cells[2, I];
  end;
  Result := '(1=1) ' + Result;
end;

procedure TfrmBomBaoJiaQuery.BitBtn6Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  case self.ListBox3.itemindex of
    0,1:
    begin
      LIn.Fields := 'manu_part_number/本厂编号/150,manu_part_desc/客户型号/150';
      LIn.Sqlstr := 'select manu_part_number,bp06.manu_part_desc from bomprice06 bp06 ' +
                    ' inner join data0025 d25 on d25.rkey = bp06.d25_ptr';
      LIn.AdoConn := dm1.con1;
      LFrm := TfrmPick_Item_Single.Create(Self);
      try
        LFrm.InitForm_New(LIn);
        if LFrm.ShowModal = mrOk then
        begin
          edt1.Text := LFrm.adsPick1.FieldByName('manu_part_number').AsString;
        end;
      finally
        LFrm.Free;
      end;
    end;
    2:
    begin
      LIn.Fields := 'cust_code/客户代码/150,CUSTOMER_NAME/客户名称/150';
      LIn.Sqlstr := 'select cust_code,bp06.CUSTOMER_NAME from bomprice06 bp06 ' +
                    ' inner join data0010 d10 on d10.rkey = bp06.d10_ptr';
      LIn.AdoConn := dm1.con1;
      LFrm := TfrmPick_Item_Single.Create(Self);
      try
        LFrm.InitForm_New(LIn);
        if LFrm.ShowModal = mrOk then
        begin
          edt1.Text := LFrm.adsPick1.FieldByName('cust_code').AsString;
        end;
      finally
        LFrm.Free;
      end;
    end;
  end;
end;

end.
